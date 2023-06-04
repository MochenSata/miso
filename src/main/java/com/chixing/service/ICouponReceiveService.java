package com.chixing.service;

import com.chixing.pojo.CouponReceive;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chixing.util.ServerResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
public interface ICouponReceiveService extends IService<CouponReceive> {
    //查询用户已领取，可用的优惠券（状态为：0）
    public ServerResult getCouponByCustId(Integer custId);

    //查询通过邀请码获得的优惠券
    public ServerResult getCouponByInvitation(String invitation,Integer custId);

    //渲染邀请码页面
    public ServerResult getCustInvitation(Integer custId);

    //给兑换邀请码双方发送分享券
    public CouponReceive saveShareCouponByInvitation(CouponReceive couponReceive,Integer custId1,Integer custId2);

    //用户领取优惠券
    public ServerResult receiveCoupon(Integer custId,Integer couId);

    //查询用户拥有的所有优惠券（所有状态：0：未使用，1：已使用，2：已过期）
    public ServerResult getAllCouponByCustId(Integer custId);
}
