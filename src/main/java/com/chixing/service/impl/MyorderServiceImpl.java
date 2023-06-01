package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.controller.WebSocketProcess;
import com.chixing.mapper.PaymentMapper;
import com.chixing.pojo.MyOrderPayVO;
import com.chixing.pojo.Myorder;
import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.Payment;
import com.chixing.service.IMyorderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
}


