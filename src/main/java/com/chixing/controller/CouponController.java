package com.chixing.controller;

import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.service.ICouponReceiveService;
import com.chixing.service.ICouponService;
import com.chixing.service.ICustomerService;
import com.chixing.util.DateUtil;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;

@Controller
public class CouponController {
    @Autowired
    private ICouponReceiveService iCouponReceiveService;
    @Autowired
    private ICouponService couponService;
    @Autowired
    private ICustomerService iCustomerService;

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

    //邀请码页面
    @GetMapping("myInvitation/{id}")
    public ModelAndView getCustInvitation(@PathVariable("id")Integer custId){
        ServerResult result = iCouponReceiveService.getCustInvitation(custId);
        System.out.println(result);
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",result);
        mav.setViewName("customer/miso_invitation");
        return mav;
    }

    //填写好友邀请码
    @GetMapping("/invitation")
    @ResponseBody
    public ServerResult getCouponByInvitation(@RequestParam("invitationNum") String invitationNum,
                                              @RequestParam("custId")Integer custId){
        ServerResult couponResult = iCouponReceiveService.getCouponByInvitation(invitationNum,custId);
        System.out.println(couponResult);
        return couponResult;
    }

    //双方获得分享券
    @PostMapping("saveCoupon")
    @ResponseBody
    public ServerResult saveShareCouponByInvitation(CouponReceive couponReceive,
                                                    @RequestParam("custId")Integer custId1,
                                                    @RequestParam("custId2")Integer custId2){
        ServerResult saveCouponResult = iCouponReceiveService.saveShareCouponByInvitation(couponReceive,custId1,custId2);
        System.out.println(saveCouponResult);
        return saveCouponResult;

    }

    //优惠券平台优惠券列表渲染
    @GetMapping("/coupon/list")
    @ResponseBody
    public ServerResult getAllCouponsByCouId(){
        ServerResult result = couponService.getAllCoupons();
        System.out.println("优惠券结果是：" + result);
        return result;
    }

    //优惠券平台编辑优惠券（根据优惠券Id更新信息）

    //优惠券平台删除优惠券(修改优惠券状态为 2 ：已删除)
    @GetMapping("/coupon/delete/{couId}")
    @ResponseBody
    public ServerResult deleteCoupon(@PathVariable("couId") Integer couId){
        ServerResult result = couponService.deleteCouponByCouId(couId);
        System.out.println("要删除的优惠券为：" + result);
        return result;
    }




}
