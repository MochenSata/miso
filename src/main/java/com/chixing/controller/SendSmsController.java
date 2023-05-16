package com.chixing.controller;


import com.aliyuncs.utils.StringUtils;
import com.chixing.service.SendSmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@RestController
@CrossOrigin
public class SendSmsController {
    @Autowired
    private SendSmsService sendSms;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @PostMapping("/send/{usertelno}")
    public String code(String usertelno){
        //调用方法模拟真实业务
        //如果redis缓存中存在手机号的验证码，说明验证码还未过期，可继续使用
        System.out.println("要注册的手机号：："+usertelno);
        String code = redisTemplate.opsForValue().get(usertelno);
        System.out.println("验证码：" + code);
        if(!StringUtils.isEmpty(code)){
            return usertelno + ":" + code + "已存在，还没有过期，可继续使用！";
        }

        //如果没有，则生成验证码并保存到redis
        //生成验证码并存储到redis中
        //生成验证码(包含数字和字母)
        //code = UUID.randomUUID().toString().substring(0, 4);

        //生成纯数字
        int uuid = UUID.randomUUID().toString().replaceAll("-","").hashCode();
        uuid = uuid < 0 ? -uuid : uuid;//String.hashCode() 值会为空
        code = String.valueOf(uuid).substring(0, 4);

        HashMap<String, Object> param = new HashMap<>();
        param.put("code", code);

        boolean isSend = sendSms.send(usertelno, "SMS_460750415", param);  //发送验证码

        if(isSend){ //发送成功
            System.out.println("验证码发送成功");
            redisTemplate.opsForValue().set(usertelno, code, 5, TimeUnit.MINUTES);  //将验证码存到redis，设置5分钟过期
            return usertelno + ":" + code + "发送成功！";
        }else {
            return "发送失败";
        }

    }

}
