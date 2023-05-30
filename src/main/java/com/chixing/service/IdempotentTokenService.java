package com.chixing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 服务器生成幂等token值与验证 幂等token
 */
public interface IdempotentTokenService {
    //1. 生成幂等token
    public String createToken();
    //2. 验证 幂等token是否有效
    public boolean checkToken(HttpServletRequest request, HttpServletResponse response);
}
