package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.mapper.PaymentMapper;
import com.chixing.pojo.MyOrderPayVO;
import com.chixing.pojo.Myorder;
import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.Payment;
import com.chixing.service.IMyorderService;
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
public class MyorderServiceImpl extends ServiceImpl<MyorderMapper, Myorder> implements IMyorderService {
    @Autowired
    private MyorderMapper myorderMapper;
    @Autowired
    private PaymentMapper paymentMapper;

    //查询我的所有订单
    @Override
    public ServerResult getAllOrdersByCustId(Integer customerId) {
        List<MyOrderPayVO> orderPayVOList=new ArrayList<>();
        QueryWrapper<Myorder> myorderQueryWrapper=new QueryWrapper<>();
        myorderQueryWrapper.eq("cust_id",customerId);
        myorderQueryWrapper.lt("myorder_status",5);
        myorderQueryWrapper.orderByDesc("myorder_create_time");
        List<Myorder> myorderList=myorderMapper.selectList(myorderQueryWrapper);

        if(myorderList.size()==0){
            return ServerResult.fail(201, ResultMsg.no_data,null);
        }
        for (Myorder myorder:myorderList){
            QueryWrapper<Payment> paymentQueryWrapper=new QueryWrapper<>();
            paymentQueryWrapper.eq("myorder_id",myorder.getMyorderId());
            Payment payment=paymentMapper.selectOne(paymentQueryWrapper);
            MyOrderPayVO vo=new MyOrderPayVO();
            vo.setMyorder(myorder);
            vo.setPayment(payment);
            orderPayVOList.add(vo);
        }
        System.out.println("MyorderServiceimpl:"+orderPayVOList);
        return ServerResult.success(200,ResultMsg.success,orderPayVOList);
    }

    //删除订单（更改订单状态为5）
    public ServerResult deleteOrderByOrderId(Integer orderId){
        Myorder myorder = myorderMapper.selectById(orderId);
        if (myorder != null){
            myorder.setMyorderStatus(5);
            myorderMapper.updateById(myorder);
            return ServerResult.success(200,ResultMsg.success,myorder);
        }
        return ServerResult.fail(201,ResultMsg.fail,false);

    }

    //查询订单详情
    @Override
    public ServerResult getOrderDeatilByOrderId(Integer orderId) {
        Myorder myorder = myorderMapper.selectById(orderId);
        if (myorder != null){
            return ServerResult.success(200,ResultMsg.success,myorder);
        }
        return ServerResult.fail(201,ResultMsg.fail,false);
    }
}
