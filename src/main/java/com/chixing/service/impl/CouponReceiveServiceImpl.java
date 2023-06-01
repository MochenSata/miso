package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.mapper.CouponMapper;
import com.chixing.mapper.CustomerMapper;
import com.chixing.pojo.Coupon;
import com.chixing.pojo.CouponReceive;
import com.chixing.mapper.CouponReceiveMapper;
import com.chixing.pojo.CouponReceiveVo;
import com.chixing.pojo.Customer;
import com.chixing.service.ICouponReceiveService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
    @Autowired
    private CustomerMapper customerMapper;

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

    //渲染邀请码页面
    @Override
    public ServerResult getCustInvitation(Integer custId) {
        QueryWrapper<Customer> wrapper = new QueryWrapper<>();
        wrapper.select("cust_id","cust_invite_num");
        wrapper.eq("cust_id",custId);
        Customer customer = customerMapper.selectOne(wrapper);
        System.out.println(customer);
        if (customer!=null){
            return ServerResult.success(200,ResultMsg.success,customer);
        }else {
            return ServerResult.fail(201,ResultMsg.fail,"邀请码已失效");
        }
    }



    //通过邀请码获得分享券
    @Override
    public ServerResult getCouponByInvitation(String invitationNum,Integer custId) {

        QueryWrapper<Customer> wrapper = new QueryWrapper<>();
        wrapper.select("cust_id","cust_invite_num","status");
        wrapper.eq("cust_invite_num",invitationNum);
        wrapper.eq("status",1);
        wrapper.ne("cust_id", custId); // 添加该条件，限制查询结果不包含当前用户
        Customer customer = customerMapper.selectOne(wrapper);
        System.out.println("用户邀请码信息是："+customer);
        if (customer!=null){
            customer.setStatus(0);
            customerMapper.updateById(customer);
            return ServerResult.success(200,ResultMsg.success,customer);
        }else {
            return ServerResult.fail(201,ResultMsg.fail,"该邀请码不可使用");
        }
    }

    //给兑换邀请码双方发送分享券
    @Override
    public ServerResult saveShareCouponByInvitation(CouponReceive couponReceive,Integer custId1,Integer custId2) {
        List<CouponReceive> couponReceiveList = new ArrayList<>();

        // 给第一个用户存储
        CouponReceive couponReceive1 = new CouponReceive();
        String couNum1 = UUID.randomUUID().toString().replace("-","");
        couponReceive1.setCouNum(couNum1);
        couponReceive1.setCouReceiveTime(LocalDateTime.now());
        couponReceive1.setCouId(4004);
        couponReceive1.setCouPrice(10f);
        couponReceive1.setCouEndTime(LocalDateTime.now().plusYears(1));
        couponReceive1.setCouUsageStatus(0);
        couponReceive1.setCouIntroduction("使用该分享优惠券可抵10元！");
        couponReceive1.setCustId(custId1); // 设置第一个用户的 ID
        couponReceiveList.add(couponReceive1);

        // 给第二个用户存储
        CouponReceive couponReceive2 = new CouponReceive();
        String couNum2 = UUID.randomUUID().toString().replace("-","");
        couponReceive2.setCouNum(couNum2);
        couponReceive2.setCouReceiveTime(LocalDateTime.now());
        couponReceive2.setCouId(4004);
        couponReceive2.setCouPrice(10f);
        couponReceive2.setCouEndTime(LocalDateTime.now().plusYears(1));
        couponReceive2.setCouUsageStatus(0);
        couponReceive2.setCouIntroduction("使用该分享优惠券可抵10元！");
        couponReceive2.setCustId(custId2); // 设置第二个用户的 ID
        couponReceiveList.add(couponReceive2);

        if (couponReceiveList.size() > 0) {
            for (CouponReceive couponReceivedata : couponReceiveList) {
                couponReceiveMapper.insert(couponReceivedata);
            }
        }

        return ServerResult.success(200,ResultMsg.success,couponReceiveList);
    }


}
