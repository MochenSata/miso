package com.chixing.controller;

import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.service.ICouponReceiveService;
import com.chixing.service.ICouponService;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class CouponController {
    @Autowired
    private ICouponReceiveService iCouponReceiveService;

    @GetMapping("/coupon/{id}")
    @ResponseBody
    public ServerResult getCustomerCoupon(@PathVariable("id") Integer custId){
        System.out.println("custId:"+custId);
        ServerResult coupon = iCouponReceiveService.getCouponByCustId(custId);
        System.out.println(coupon);
        return coupon;
    }
}
