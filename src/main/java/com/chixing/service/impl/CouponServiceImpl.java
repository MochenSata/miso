package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.pojo.Coupon;
import com.chixing.mapper.CouponMapper;
import com.chixing.service.ICouponService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

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

    //查询所有优惠券（状态2以下的，优惠券状态（0：生效中，1：已失效，2：已删除））
    @Override
    public ServerResult getAllCoupons() {
        QueryWrapper<Coupon> couponQueryWrapper = new QueryWrapper<>();
        couponQueryWrapper.lt("cou_status",2);
        List<Coupon> couponList = couponMapper.selectList(couponQueryWrapper);
        System.out.println("优惠券列表是：" + couponList);
        if (couponList.size() > 0)
            return ServerResult.success(200, ResultMsg.success,couponList);
        return ServerResult.fail(201, ResultMsg.no_data,null);
    }

    //删除优惠券（更改优惠券状态为2）
    @Override
    public ServerResult deleteCouponByCouId(Integer couId) {
        Coupon coupon = couponMapper.selectById(couId);
        if(coupon != null){
            coupon.setCouStatus(2);
            couponMapper.updateById(coupon);
            return ServerResult.success(200,ResultMsg.success,coupon);
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
        wrapper.eq("cou_status","0");
        wrapper.eq("cou_category","满减券");
        wrapper.lt("cou_valid_time", LocalDateTime.now());
        wrapper.gt("cou_invalid_time",LocalDateTime.now());
        List<Coupon> couponList=couponMapper.selectList(wrapper);
        System.out.println("couponimpl:"+couponList);
        if (couponList.size()>0)
            return ServerResult.success(200,"优惠券查询成功",couponList);
        return ServerResult.fail(201,"暂无数据",null);
    }
}
