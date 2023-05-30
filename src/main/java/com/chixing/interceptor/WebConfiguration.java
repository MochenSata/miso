package com.chixing.interceptor;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfiguration implements WebMvcConfigurer {
@Autowired
private  AutoIdempotentInterceptor autoIdempotentInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(autoIdempotentInterceptor).addPathPatterns("/myorder/save")
                .excludePathPatterns("/member/getcode", "/member/login",
                        "/member/regist","/css/**",
                        "/js/**","/images/**","/layui/**","/dist/**");;

        System.out.println("注入拦截器成功");
    }
}
