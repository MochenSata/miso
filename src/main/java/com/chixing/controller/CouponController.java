package com.chixing.controller;

import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.pojo.Customer;
import com.chixing.service.ICouponReceiveService;
import com.chixing.service.ICouponService;
import com.chixing.service.ICustomerService;
import com.chixing.util.DateUtil;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CouponController {
    @Autowired
    private ICouponReceiveService iCouponReceiveService;
    @Autowired
    private ICouponService couponService;
    @Autowired
    private ICustomerService iCustomerService;
    @Autowired
    private AmqpTemplate rabbitTemplate;

    //查询所有可领取的优惠券
    @GetMapping("/coupon/all")
    @ResponseBody
    public ServerResult getAllValidCoupon(){
            return couponService.getAllValidCoupon();
    }

    //用户领取优惠券
    @PostMapping("/coupon/receive")
    @ResponseBody
    public ServerResult receiveCoupon(@RequestParam("couponId") Integer couId,
                                      @RequestParam("custId") Integer custId){
        System.out.println("couId:"+couId);
        System.out.println("custId:"+custId);
        return iCouponReceiveService.receiveCoupon(custId,couId);

    }

    //查询用户已领取，可用的优惠券（状态为：0）
    @GetMapping("/coupon/{id}")
    @ResponseBody
    public ServerResult getCustomerCoupon(@PathVariable("id") Integer custId){
        System.out.println("custId:"+custId);
        ServerResult coupon = iCouponReceiveService.getCouponByCustId(custId);
        System.out.println(coupon);
        return coupon;
    }

    //优惠券平台发布优惠券
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
        if (result){
            Map<String ,Object> map = new HashMap<>();
            map.put("couName",couName);
            rabbitTemplate.convertAndSend("CouponWsExchange","CouponWsKey",map,message ->{
                return  message;
            });
            return ServerResult.success(200,"新增优惠券成功",true);
        }else {
            return ServerResult.fail(201,"新增优惠券失败",false);
        }
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
        CouponReceive couponReceive1= iCouponReceiveService.saveShareCouponByInvitation(couponReceive,custId1,custId2);
        System.out.println(couponReceive1);

        String couNum = couponReceive1.getCouNum();

        String couIntroduction = couponReceive1.getCouIntroduction();
        Map<String ,Object> map = new HashMap<>();
        map.put("couNum",couNum);
        map.put("couIntroduction",couIntroduction);
        map.put("custId",custId1);
        rabbitTemplate.convertAndSend("invitationWsExchange","invitation-key1",map,message ->{
            return  message;
        });
        System.out.println(map);
        return ServerResult.success(200,ResultMsg.success,true);

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

    //查询用户拥有的所有优惠券
    @GetMapping("/coupon/receivedall/{id}")
    @ResponseBody
    public ServerResult getAllCouponByCustId(@PathVariable("id") Integer custId){
        System.out.println("当前用户的custId:"+custId);
        ServerResult coupon = iCouponReceiveService.getAllCouponByCustId(custId);
        System.out.println("用户拥有的所有优惠券为：" + coupon);
        return coupon;

    }




}
