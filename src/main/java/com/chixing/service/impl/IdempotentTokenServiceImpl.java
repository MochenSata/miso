package com.chixing.service.impl;

import com.chixing.service.IdempotentTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class IdempotentTokenServiceImpl implements IdempotentTokenService {
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    //1. 生成幂等token :(1) 生成唯一的token (2) redis setex token ...
    @Override
    public String createToken() {

        String token = UUID.randomUUID().toString().replace("-","");
        redisTemplate.opsForValue().set(token,token,10, TimeUnit.MINUTES);
        return token;
    }


    //2. 验证 幂等token是否有效
    @Override
    public boolean checkToken(HttpServletRequest request, HttpServletResponse response){
        System.out.println("==========正在验证token===================");
        //(1)获得token
        String token = request.getParameter("token");
        System.out.println("获得到的幂等token的值是：" + token);
        //(2)Redis 验证token是否存在，若存在，说明有效的请求，并Redis 中删除该token
        if(redisTemplate.hasKey(token)){
            redisTemplate.delete(token);
            return true;
        }else{
            // (3) 若token不存在，说明是重复的请求，重定向到指定的失败页面（或抛异常）
            System.out.println("该请求是重复的，token不在Redis中");
            // 使用重定向跳转到失败页面
            try {
                response.sendRedirect("failurePage.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
        }

    }
}
