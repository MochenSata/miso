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

}
