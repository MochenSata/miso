package com.chixing.pojo;

public class CouponReceiveVo {
    private Coupon coupon;
    private CouponReceive couponReceive;
    public CouponReceiveVo(){}
    public CouponReceiveVo(Coupon coupon, CouponReceive couponReceive) {
        this.coupon = coupon;
        this.couponReceive = couponReceive;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public CouponReceive getCouponReceive() {
        return couponReceive;
    }

    public void setCouponReceive(CouponReceive couponReceive) {
        this.couponReceive = couponReceive;
    }

    @Override
    public String toString() {
        return "CouponReceiveVo{" +
                "coupon=" + coupon +
                ", couponReceive=" + couponReceive +
                '}';
    }
}
