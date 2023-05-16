package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.mapper.CouponMapper;
import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.mapper.CouponReceiveMapper;
import com.chixing.pojo.CouponReceiveVo;
import com.chixing.service.ICouponReceiveService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
public class CouponReceiveServiceImpl extends ServiceImpl<CouponReceiveMapper, CouponReceive> implements ICouponReceiveService {
    @Autowired
    private CouponReceiveMapper couponReceiveMapper;
    @Autowired
    private CouponMapper couponMapper;
    @Override
    public ServerResult getCouponByCustId(Integer custId) {
        List<CouponReceiveVo> couponReceiveVoList = new ArrayList<>();
        QueryWrapper<CouponReceive> wrapper = new QueryWrapper<>();
        wrapper.eq("cust_id",custId);
        List<CouponReceive> couponReceiveList = couponReceiveMapper.selectList(wrapper);
        if(couponReceiveList.size()==0) {
            return ServerResult.fail(201, ResultMsg.no_data, "没有优惠券");
        }
        for (CouponReceive couponReceive:couponReceiveList){
            QueryWrapper<Coupon> couponQueryWrapper = new QueryWrapper<>();
            couponQueryWrapper.eq("cou_id",couponReceive.getCouId());
            System.out.println("couId:"+couponReceive.getCouId());
            Coupon coupon = couponMapper.selectOne(couponQueryWrapper);
            System.out.println("coupon:"+coupon);
            CouponReceiveVo couponReceiveVo = new CouponReceiveVo();
            couponReceiveVo.setCoupon(coupon);
            couponReceiveVo.setCouponReceive(couponReceive);
            couponReceiveVoList.add(couponReceiveVo);

        }
        System.out.println("couponReceiveVoList:"+couponReceiveVoList);
        return ServerResult.success(200,ResultMsg.success,couponReceiveVoList);
    }
}
