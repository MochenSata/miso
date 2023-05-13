package com.chixing.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.chixing.pojo.LoginCustomer;
import com.chixing.service.ICustomerService;
import com.chixing.util.JWTUtils;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author kk
 * @since 2023-05-11
 */
@Controller
@RequestMapping("customer")
public class CustomerController {
    @Autowired
    private ICustomerService service;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    /**
     * 用户登录
     1. 验证用户名与密码是否合格
     2.  MySQL验证用户名与密码正确，用户是否存在
     3. 若不存在，则返回null
     4. 若存在，则生成 token ,返回给客户端，保存在 cookie 或 localStorage中
     5. 服务器保存登录用户的 token到 Redis中,设置过期时间
     用户登录先验证token是否有效，再验证 Redis中的token是否存在
     */
    @PostMapping("login")
    @ResponseBody
    public ServerResult login(Long custTelno, String custPassword){
        System.out.println("custName:" + custTelno);
        System.out.println("password:" + custPassword);
        if(Objects.isNull(custTelno) || custTelno.equals(0L)|| StringUtils.isBlank(custPassword))
            return ServerResult.fail(200, ResultMsg.fail,null);
        //1. MySQL验证 用户名、密码是否有效
        ServerResult result = service.getCustomerByTelnoAndPwd(custTelno,custPassword);
        System.out.println("数据库中查询用户名与密码的结果 是：" + result);

        if(result.getCode() != 200){// 用户不存在
            return ServerResult.fail(201, ResultMsg.no_data, null);
        }else{
            LoginCustomer loginCustomer = (LoginCustomer) result.getData();
            //2. JWT 生成token
            String token = JWTUtils.createToken(loginCustomer.getCustId());
            // 3. token 保存到redis 中
            redisTemplate.opsForValue().set("token_" + token, loginCustomer, 1, TimeUnit.DAYS);
            System.out.println(token);
            return ServerResult.success(200, ResultMsg.success, token);
        }
    }

    @GetMapping("currentCustomer")
    @ResponseBody
    public ServerResult getLoginCustomer(@RequestHeader("token") String token){
        System.out.println("从客户端获得的token是：" + token);
        return  service.getCustomerByToken(token);
    }

}