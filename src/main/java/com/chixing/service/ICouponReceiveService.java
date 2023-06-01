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
    public ServerResult getCouponByCustId(Integer custId);
    public ServerResult getCouponByInvitation(String invitation,Integer custId);
    public ServerResult getCustInvitation(Integer custId);
    public CouponReceive saveShareCouponByInvitation(CouponReceive couponReceive,Integer custId1,Integer custId2);
    public ServerResult receiveCoupon(Integer custId,Integer couId);
}
