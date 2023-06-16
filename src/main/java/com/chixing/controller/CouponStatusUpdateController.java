package com.chixing.controller;

import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.service.ICouponReceiveService;
import com.chixing.service.ICouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

// 定义定时任务类
@Component
public class CouponStatusUpdateController {
    @Autowired
    private ICouponService couponService;
    @Autowired
    private ICouponReceiveService couponReceiveService;
    @Autowired
    private WebSocketProcess webSocketProcess;

    //优惠券平台的优惠券到期自动失效
    @Scheduled(cron = "0 00 12 * * ?")//每天十二点执行
    public void updateCouponStatus(){
        List<Coupon> couponList = couponService.updateCouponStatusByDate();
        for (Coupon coupon : couponList){
            if(coupon.getCouInvalidTime().isBefore(LocalDateTime.now())){//失效时间已到
                coupon.setCouStatus(1);//更新优惠券状态为1：已失效
                boolean result = couponService.updateById(coupon);//更新优惠券状态到数据库
            }
        }
    }


    //用户领取的优惠券到期自动失效
    @Scheduled(fixedRate = 600000)//每十分钟执行一次
    public void updateReceivedCouponStatus(){
        List<CouponReceive> couponList = couponReceiveService.updateReceivedCouponStatusByDate();
        for (CouponReceive couponReceive : couponList){
            if(couponReceive.getCouEndTime().isBefore(LocalDateTime.now())){//失效时间已到
                couponReceive.setCouUsageStatus(2);//更新优惠券状态为2：已过期
                Integer custId=couponReceive.getCustId();
                String couNum=couponReceive.getCouNum();
                boolean result = couponReceiveService.updateById(couponReceive);//更新优惠券状态到数据库
                String msg="优惠券编号为："+couNum+"的优惠券已过期";
                try {
                    webSocketProcess.sendMessage(custId, msg);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
    }
}


