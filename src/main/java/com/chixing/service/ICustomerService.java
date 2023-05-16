package com.chixing.service;

import com.chixing.pojo.Customer;
import com.baomidou.mybatisplus.extension.service.IService;

import com.chixing.pojo.LoginCustomer;
import com.chixing.util.ServerResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
public interface ICustomerService extends IService<Customer> {
    public ServerResult getCustomerByTelnoAndPwd(Long custTelno, String custPwd);
    public ServerResult getCustomerByToken(String token);
    // token解析
    public LoginCustomer checkToken(String token);

    //根据手机号查询用户数是否注册
    public ServerResult isregisterdeBytelno(Long usertelno);

}
