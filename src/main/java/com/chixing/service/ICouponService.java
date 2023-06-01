package com.chixing.service;

import com.chixing.pojo.Coupon;
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
public interface ICouponService extends IService<Coupon> {
    //查询所有优惠券
    public ServerResult getAllCoupons();

    //删除优惠券
    public ServerResult deleteCouponByCouId(Integer couId);

    //编辑优惠券
    public ServerResult updateCouponByCouId(Integer couId);

    public ServerResult getAllValidCoupon();
}
