package com.chixing.interceptor;

import com.chixing.annotation.AutoIdempotent;
import com.chixing.service.IdempotentTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * 幂等性拦截器
 */
@Component
public class AutoIdempotentInterceptor implements HandlerInterceptor {
    @Autowired
    private IdempotentTokenService tokenService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      System.out.println("======AutoIdempotentInterceptor 拦截器正在拦截=======");
        if(!(handler instanceof HandlerMethod))
            return true; // 放行，不拦截
        HandlerMethod handlerMethod = (HandlerMethod)handler;

        Method method = handlerMethod.getMethod();
        AutoIdempotent methodAnnotation =  method.getAnnotation(AutoIdempotent.class);
        if(methodAnnotation !=null){
            // 验证token 是否有效
           return tokenService.checkToken(request,response);
        }
        return true;

    }
}
