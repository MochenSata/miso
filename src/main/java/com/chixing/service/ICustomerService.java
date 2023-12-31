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
    //登录时验证 用户名、密码是否有效
    public ServerResult getCustomerByTelnoAndPwd(Long custTelno, String custPwd);

    //获得当前用户的token
    public ServerResult getCustomerByToken(String token);

    // token解析
    public LoginCustomer checkToken(String token);

    //根据手机号查询用户数是否注册
    public ServerResult isregisterdeBytelno(Long usertelno);

    //查看个人信息
    public ServerResult getCustInfo(Integer custId);

    //修改个人信息
    public ServerResult updateCustInfo(Customer customer);

    //退出登录（清除对应用户的token）
    public ServerResult deleteToken(String token);
}
