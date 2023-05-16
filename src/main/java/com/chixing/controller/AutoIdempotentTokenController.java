package com.chixing.controller;

import com.chixing.service.IdempotentTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AutoIdempotentTokenController {
    @Autowired
    private IdempotentTokenService tokenService;
    //获得token
    @GetMapping("getIdempodentToken")
    @ResponseBody
    public String getIdempodentToken(){
        return tokenService.createToken();
    }

}
