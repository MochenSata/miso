package com.chixing.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CouponDirectConfig {
    //1. 创建direct交换机
    @Bean
    public DirectExchange newExchange(){
        return new DirectExchange("CouponWsExchange",true,false);
    }

    //2. 创建队列
    @Bean
    public Queue newQueue(){
        return new Queue("CouponWsQueue",true);
    }
    //3. 绑定
    @Bean
    public Binding bind(){
        return BindingBuilder.bind(newQueue()).to(newExchange()).with("CouponWsKey");
    }
}
