package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.chixing.pojo.Customer;
import com.chixing.mapper.CustomerMapper;
import com.chixing.pojo.LoginCustomer;
import com.chixing.service.ICustomerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.JWTUtils;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private RedisTemplate<String,Object> redisTemplate;



    @Override
    public ServerResult getCustomerByTelnoAndPwd(Long custTelno, String custPwd) {
        LambdaQueryWrapper<Customer> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Customer::getCustTelno,custTelno);
        queryWrapper.eq(Customer::getCustPwd,custPwd);
        Customer customer = customerMapper.selectOne(queryWrapper);
        System.out.println("CustomerServiceImpl 根据手机号与密码查询的结果是：" + customer);
        if(customer == null)
            return ServerResult.fail(201, ResultMsg.no_data,null);
        else {
               LoginCustomer loginCustomer = new LoginCustomer(customer.getCustId(),customer.getCustName(),customer.getCustGender(),customer.getCustTelno(),customer.getCustEmail(),customer.getCustDesc(),customer.getCustHeadshort(),customer.getCustInviteNum(),customer.getStatus(),customer.getOther1(),customer.getOther2());
                return ServerResult.success(200,ResultMsg.success,loginCustomer);
        }
    }


    /**
     * 1. 检查token的合法性
     *  是否为空，解析是否成功，redis中是否存在
     *
     * 2. 若检验失败，返回错误
     * 3. 若检验成功，则返回登录用户信息 LoginCustomer
     */
    @Override
    public ServerResult getCustomerByToken(String token) {
        LoginCustomer loginCustomer = checkToken(token);
        if(loginCustomer == null)
            return ServerResult.fail(201,ResultMsg.fail,null);
        return ServerResult.success(200,ResultMsg.success,loginCustomer);
    }

    //1. 检查token是否有效： token 本身 + redis 中是否有效
    @Override
    public LoginCustomer checkToken(String token) {
        if(StringUtils.isBlank(token))
            return null;
        Map<String,Object> stringObjectMap = JWTUtils.checkToken(token);//(1)JWT 验证
        if(stringObjectMap == null){// token 本身无效
            System.out.println("customer service impl, token本身无效");
            return null;
        }
        LoginCustomer loginCustomer = (LoginCustomer) redisTemplate.opsForValue().get("token_" + token);//(2) Redis 验证
        if(loginCustomer ==null){// redis 中 token 失效
            System.out.println("customer service impl, Redis 中的token已经失效");
            return null;
        }else{
            System.out.println("customer service impl 当前登录的用户信息是 ：" + loginCustomer);
            return loginCustomer;
        }
    }

    @Override
    public ServerResult isregisterdeBytelno(Long usertelno) {
        QueryWrapper<Customer> wrapper = new QueryWrapper<>();
        wrapper.eq("cust_telno",usertelno);
        Customer customer = customerMapper.selectOne(wrapper);
        if (customer != null)
            return ServerResult.fail(201, ResultMsg.fail,"该用户已注册");
        return ServerResult.success(200, ResultMsg.success,customer);
    }
}
