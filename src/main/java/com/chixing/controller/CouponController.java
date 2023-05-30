package com.chixing.controller;

import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.service.ICouponReceiveService;
import com.chixing.service.ICouponService;
import com.chixing.util.DateUtil;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
public class CouponController {
    @Autowired
    private ICouponReceiveService iCouponReceiveService;
    @Autowired
    private ICouponService couponService;

    @GetMapping("/coupon/{id}")
    @ResponseBody
    public ServerResult getCustomerCoupon(@PathVariable("id") Integer custId){
        System.out.println("custId:"+custId);
        ServerResult coupon = iCouponReceiveService.getCouponByCustId(custId);
        System.out.println(coupon);
        return coupon;
    }
    @PostMapping("/coupon/save")
    @ResponseBody
    public ServerResult saveCoupon(@RequestParam("couName") String couName,
                                   @RequestParam("couCategory")String couCategory,
                                   @RequestParam("couPrice")Float couPrice,
                                   @RequestParam("couCount")Integer couCount,
                                   @RequestParam("couValidTime")String couValidTimeStr,
                                   @RequestParam("couInvalidTime")String couInvalidTimeStr,
                                   @RequestParam("couIntroduction")String couIntroduction,
                                   @RequestParam("couStatus")Integer couStatus){
        Coupon coupon=new Coupon();
        coupon.setCouName(couName);
        coupon.setCouCategory(couCategory);
        coupon.setCouPrice(couPrice);
        coupon.setCouStatus(couStatus);
        coupon.setCouCount(couCount);
        coupon.setCouIntroduction(couIntroduction);

        LocalDateTime couValidTime= DateUtil.stringParse2LocalDateTime(couValidTimeStr);
        LocalDateTime couInvalidTime= DateUtil.stringParse2LocalDateTime(couInvalidTimeStr);
        coupon.setCouValidTime(couValidTime);
        coupon.setCouInvalidTime(couInvalidTime);
        boolean result=couponService.save(coupon);
        if (result)
            return ServerResult.success(200,"新增优惠券成功",true);
        return ServerResult.fail(201,"新增优惠券失败",false);
    }
}
