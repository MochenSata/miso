package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.controller.WebSocketProcess;
import com.chixing.mapper.CouponReceiveMapper;
import com.chixing.mapper.MyorderOccupyMapper;
import com.chixing.mapper.PaymentMapper;
import com.chixing.pojo.*;
import com.chixing.mapper.MyorderMapper;
import com.chixing.service.IMyorderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.LockUtil;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
@Service
public class MyorderServiceImpl extends ServiceImpl<MyorderMapper, Myorder> implements IMyorderService {
    @Autowired
    private MyorderMapper myorderMapper;
    @Autowired
    private PaymentMapper paymentMapper;
    @Autowired
    private WebSocketProcess webSocketProcess;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private MyorderOccupyMapper myorderOccupyMapper;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private AmqpTemplate rabbitTemplate;
    @Autowired
    private CouponReceiveMapper couponReceiveMapper;

    @Override
    public ServerResult getAllOrdersByCustId(Integer customerId) {
        List<MyOrderPayVO> orderPayVOList = new ArrayList<>();
        QueryWrapper<Myorder> myorderQueryWrapper = new QueryWrapper<>();
        myorderQueryWrapper.eq("cust_id", customerId);
        myorderQueryWrapper.lt("myorder_status", 5);
        myorderQueryWrapper.orderByDesc("myorder_create_time");
        List<Myorder> myorderList = myorderMapper.selectList(myorderQueryWrapper);

        if (myorderList.size() == 0) {
            return ServerResult.fail(201, ResultMsg.no_data, null);
        }
        for (Myorder myorder : myorderList) {
            QueryWrapper<Payment> paymentQueryWrapper = new QueryWrapper<>();
            paymentQueryWrapper.eq("myorder_id", myorder.getMyorderId());
            Payment payment = paymentMapper.selectOne(paymentQueryWrapper);
            MyOrderPayVO vo = new MyOrderPayVO();
            vo.setMyorder(myorder);
            vo.setPayment(payment);
            orderPayVOList.add(vo);
        }
        System.out.println("MyorderServiceimpl:" + orderPayVOList);
        return ServerResult.success(200, ResultMsg.success, orderPayVOList);
    }

    /**
     * 延时队列超时自动取消订单
     */
    @RabbitListener(queues = "order-delayed-queue")
    public void getMsg(Message message, Channel channel, Map map) {
        Integer myorderId = (Integer) map.get("myorderId");
        Integer custId = (Integer) map.get("custId");
        String myorderNum = (String) map.get("myorderNum");
        List<String> keyList=(List<String>)map.get("keyList");
        Myorder myorder = myorderMapper.selectById(myorderId);
        Integer status = myorder.getMyorderStatus();
        if (status == 0) {//未支付，自动取消
            System.out.println("正在进入自动取消订单>>>>");
            myorder.setMyorderStatus(4);
            myorderMapper.updateById(myorder);
            redisTemplate.delete(keyList);

            String msg = "您好，订单编号为：" + myorderNum + "的订单已超时，已为您自动取消。";
            try {
                webSocketProcess.sendMessage(custId, msg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //删除订单（更改订单状态为5）
    public ServerResult deleteOrderByOrderId(Integer orderId) {
        Myorder myorder = myorderMapper.selectById(orderId);
        if (myorder != null) {
            myorder.setMyorderStatus(5);
            myorderMapper.updateById(myorder);
            return ServerResult.success(200, ResultMsg.success, myorder);
        }
        return ServerResult.fail(201, ResultMsg.fail, false);

    }

    //查询订单详情
    @Override
    public ServerResult getOrderDeatilByOrderId(Integer orderId) {
        Myorder myorder = myorderMapper.selectById(orderId);
        if (myorder != null) {
            return ServerResult.success(200, ResultMsg.success, myorder);
        }
        return ServerResult.fail(201, ResultMsg.fail, false);
    }

    //根据退房日期，修改订单状态
    @Override
    public List<Myorder> updateOrderStatusByDate() {
        QueryWrapper<Myorder> myorderQueryWrapper = new QueryWrapper<>();
        myorderQueryWrapper.eq("myorder_status",1);//找到已支付且未完成的订单
        List<Myorder> myorderList = myorderMapper.selectList(myorderQueryWrapper);
        System.out.println("未完成的订单有：" + myorderList);
        return myorderList;

    }


    //下订单存到数据库中
    @Override
    public ServerResult saveOrder(MyorderDetailVO myorderDetailVO) {
        int rows = 0;
        int rows2 = 0;
        OrderResult orderResult = new OrderResult();
//        获取线程id
        String thread = String.valueOf(Thread.currentThread().getId());
        //初始化
        LockUtil lockUtil = new LockUtil(stringRedisTemplate);
        String houseId = myorderDetailVO.getOrderCountAndDataVO().getHouseId().toString();
        LocalDate custStartDate = myorderDetailVO.getOrderCountAndDataVO().getCustStartDate();
        LocalDate custEndDate = myorderDetailVO.getOrderCountAndDataVO().getCustEndDate();
        //计算两个日期相差天数
        long betweenDay = ChronoUnit.DAYS.between(custStartDate, custEndDate);

        List<String> keyList = new ArrayList<>();
        while (custStartDate.isBefore(custEndDate)) {
            // 遍历起始日期到结束日期之间的所有日期放入list
            keyList.add(houseId+"+"+custStartDate);
            custStartDate = custStartDate.plusDays(1);  // 将日期加1天
        }
        //批量加锁
        boolean b = lockUtil.lockBatch(keyList, thread, betweenDay * 86400);
        if (!b){
            //如果加锁失败
            System.out.println("该日期已被预定");
            return ServerResult.fail(201,"该日期已被预定",false);
        }else{
            System.out.println("预定成功");
        }
        try {
            //存储到订单表
            Myorder myorder = new Myorder();
            myorder.setCustId(myorderDetailVO.getCustId());
            String myorderNum =myorderDetailVO.getMyorderNum();
            myorder.setMyorderNum(myorderNum);
            myorder.setHouseId(myorderDetailVO.getOrderCountAndDataVO().getHouseId());
            myorder.setHouseName(myorderDetailVO.getOrderCountAndDataVO().getHouseName());
            myorder.setHouseMainpicture(myorderDetailVO.getOrderCountAndDataVO().getHouseMainpicture());
            myorder.setHousePrice(myorderDetailVO.getOrderCountAndDataVO().getHousePrice());
            myorder.setMyorderCreateTime(LocalDateTime.now());
            if (myorderDetailVO.getCouNum() != null && !(myorderDetailVO.getCouNum().isEmpty())) {
                myorder.setCouNum(myorderDetailVO.getCouNum());
                myorder.setCouPrice(myorderDetailVO.getCouPrice());
                QueryWrapper<CouponReceive> wrapper = new QueryWrapper<>();
                wrapper.eq("cou_num",myorderDetailVO.getCouNum());
                CouponReceive couponReceive = new CouponReceive();
                couponReceive.setCouUsageStatus(1);
                couponReceive.setCouUseTime(LocalDateTime.now());
                couponReceiveMapper.update(couponReceive,wrapper);
                System.out.println("优惠券状态："+couponReceive.getCouUsageStatus());
            } else {
                myorder.setCouNum(null);
                myorder.setCouPrice(null);
            }
            myorder.setMyorderStatus(0);
            myorder.setMyorderPrice(myorderDetailVO.getMyorderPrice());
            myorder.setMyorderDay(myorderDetailVO.getOrderCountAndDataVO().getCustNum());
            myorder.setMyorderIntime(myorderDetailVO.getOrderCountAndDataVO().getCustStartDate());
            myorder.setMyorderOutime(myorderDetailVO.getOrderCountAndDataVO().getCustEndDate());
            System.out.println(myorder);
            rows = myorderMapper.insert(myorder);
            //存储到入住人表
            QueryWrapper<Myorder> wrapper = new QueryWrapper<>();
            wrapper.eq("myorder_num", myorderNum);
            Myorder myorder1 = myorderMapper.selectOne(wrapper);
            Integer myorderId = myorder1.getMyorderId();
            myorderDetailVO.setMyorderId(myorderId);
            MyorderOccupy myorderOccupy = new MyorderOccupy();
            myorderOccupy.setMyorderId(myorderId);
            myorderOccupy.setCustId(myorder.getCustId());
            myorderOccupy.setOccIdentity(myorderDetailVO.getOrderCountAndDataVO().getOccIdentity());
            myorderOccupy.setOccName(myorderDetailVO.getOrderCountAndDataVO().getOccName());
            myorderOccupy.setOccTelno(myorderDetailVO.getOrderCountAndDataVO().getOccTelno());
            rows2 = myorderOccupyMapper.insert(myorderOccupy);
            orderResult = new OrderResult(myorder, myorderOccupy);
            Map<String ,Object> map = new HashMap<>();
            map.put("myorderId",myorderId);
            map.put("custId",myorder.getCustId());
            map.put("myorderNum",myorderNum);
            map.put("keyList",keyList);
            rabbitTemplate.convertAndSend("order-delayed-exchange","order-key1",map,message ->{
                message.getMessageProperties().setDelay(60000);
                return  message;
            });
        }catch (Exception ex){
            ex.printStackTrace();
            //如果发生异常则解锁
            boolean b1 = lockUtil.unlockBatch(keyList, thread);
            if (b1){
                System.out.println("解锁成功");
            }
        }
        if (rows > 0 && rows2 > 0)
            return ServerResult.success(200, ResultMsg.success, orderResult);
        return ServerResult.fail(201, ResultMsg.fail, false);
    }



}


