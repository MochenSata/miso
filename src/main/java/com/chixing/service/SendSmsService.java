package com.chixing.service;

import java.util.Map;

public interface SendSmsService {
    //手机号、模板代码、验证码
    public boolean send(String usertelno, String templateCode, Map<String, Object> code);
}
