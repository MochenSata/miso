package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.controller.WebSocketProcess;
import com.chixing.pojo.Coupon;
import com.chixing.mapper.CouponMapper;
import com.chixing.service.ICouponService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
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
public class CouponServiceImpl extends ServiceImpl<CouponMapper, Coupon> implements ICouponService {

    @Autowired
    private CouponMapper couponMapper;

    @Autowired
    private AmqpTemplate rabbitTemplate;

    @Autowired
    private WebSocketProcess webSocketProcess;

    //查询所有优惠券（状态2以下的，优惠券状态（0：生效中，1：已失效，2：已删除））
    @Override
    public ServerResult getAllCoupons() {
        QueryWrapper<Coupon> couponQueryWrapper = new QueryWrapper<>();
        couponQueryWrapper.lt("cou_status", 2);
        List<Coupon> couponList = couponMapper.selectList(couponQueryWrapper);
        System.out.println("优惠券列表是：" + couponList);
        if (couponList.size() > 0)
            return ServerResult.success(200, ResultMsg.success, couponList);
        return ServerResult.fail(201, ResultMsg.no_data, null);
    }

    //删除优惠券（更改优惠券状态为2）
    @Override
    public ServerResult deleteCouponByCouId(Integer couId) {
        Coupon coupon = couponMapper.selectById(couId);
        if (coupon != null) {
            coupon.setCouStatus(2);
            couponMapper.updateById(coupon);
            return ServerResult.success(200, ResultMsg.success, coupon);
        }
        return ServerResult.fail(201, ResultMsg.fail, false);
    }

    //编辑优惠券（更新优惠券信息）
    @Override
    public ServerResult updateCouponByCouId(Integer couId) {

        return null;
    }

    @Override
    public ServerResult getAllValidCoupon() {
        QueryWrapper<Coupon> wrapper = new QueryWrapper<>();
        wrapper.eq("cou_status", "0");
        wrapper.eq("cou_category", "满减券");
        wrapper.lt("cou_valid_time", LocalDateTime.now());
        wrapper.gt("cou_invalid_time", LocalDateTime.now());
        List<Coupon> couponList = couponMapper.selectList(wrapper);
        System.out.println("couponimpl:" + couponList);
        if (couponList.size() > 0)
            return ServerResult.success(200, "优惠券查询成功", couponList);
        return ServerResult.fail(201, "暂无数据", null);
    }

    @Override
    public void saveHolidayCoupons() {
        Coupon coupon=new Coupon();
        coupon.setCouName("假日券_100元");
        coupon.setCouCategory("假日券");
        coupon.setCouPrice(100f);
        coupon.setCouStatus(0);
        coupon.setCouCount(0);
        coupon.setCouIntroduction("周末及节假日发布的优惠券，使用可享优惠！");

        LocalDateTime couValidTime=LocalDateTime.now();
        LocalDateTime couInvalidTime= couValidTime.plusWeeks(2);
        coupon.setCouValidTime(couValidTime);
        coupon.setCouInvalidTime(couInvalidTime);
        int rows = couponMapper.insert(coupon);
        Map<String ,Object> map = new HashMap<>();
        map.put("couName","假日券_100元");
        rabbitTemplate.convertAndSend("CouponWsExchange","CouponWsKey",map,message ->{
            return  message;
        });
        if (rows == 0)
            System.out.println("发布假日优惠券失败");
        System.out.println("发布假日优惠券成功");
    }

    //优惠券自动过期,修改优惠券状态为1：已失效
    @Override
    public List<Coupon> updateCouponStatusByDate() {
        QueryWrapper<Coupon> couponQueryWrapper = new QueryWrapper<>();
        couponQueryWrapper.eq("cou_status", 0);//找到生效中的优惠券
        List<Coupon> couponList = couponMapper.selectList(couponQueryWrapper);
        System.out.println("生效中的优惠券有：" + couponList);
        return couponList;
    }

    //优惠券发布消息队列
    @RabbitHandler
    @RabbitListener(queues = "CouponWsQueue")
    public void sendMsgByInvitation(Map map, Channel channel, Message message){
        //1. 接收Queue中的消息
        String couName = (String) map.get("couName");
        System.out.println("发送信息");
        String msg = "您有机会领取优惠券：" + couName + " 请至个人中心领取该优惠券。";
        try {
            webSocketProcess.sendAllMessage(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
