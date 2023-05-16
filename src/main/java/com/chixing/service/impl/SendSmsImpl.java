package com.chixing.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.chixing.service.SendSmsService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SendSmsImpl implements SendSmsService {
    @Override
    public boolean send(String usertelno, String templateCode, Map<String, Object> code) {
        //连接阿里云
        DefaultProfile profile = DefaultProfile.getProfile("cn-beijing", "LTAI5tMxbh8UiHTFHphTYreW", "eg7oLJuNZUEljndOne0T80KtNsbN05");
        IAcsClient client = new DefaultAcsClient(profile);

        //构建请求,一般这里不用动
        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");

        //设置发送相关的参数
        request.putQueryParameter("PhoneNumbers",usertelno); //手机号
        request.putQueryParameter("SignName","MISO民宿网"); //申请阿里云 签名名称
        request.putQueryParameter("TemplateCode",templateCode); //申请阿里云 模板code


        request.putQueryParameter("TemplateParam", JSONObject.toJSONString(code));//验证码数据，转换json数据传递,这里要用map

        try{
            CommonResponse response = client.getCommonResponse(request);
            System.out.println("response data:"+response.getData());
            return response.getHttpResponse().isSuccess();  //判断发送是否成功
        } catch (ClientException e){
            e.printStackTrace();
        }
        return false;
    }


}
