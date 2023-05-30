package com.chixing.service;

import com.chixing.pojo.Myorder;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chixing.util.ServerResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author smith
 * @since 2023-05-09
 */
public interface IMyorderService extends IService<Myorder> {
    //查询我的所有订单
    public ServerResult getAllOrdersByCustId(Integer customerId);

    //删除订单
    public ServerResult deleteOrderByOrderId(Integer orderId);

    //查询订单详情
    public ServerResult getOrderDeatilByOrderId(Integer orderId);

}
