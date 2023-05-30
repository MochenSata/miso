package com.chixing.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.CustomExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class OrderDelayConfig {
    //延时交换机
    @Bean
    public CustomExchange newOrderDelayExchange(){
        Map<String,Object> args=new HashMap<>();
        args.put("x-delayed-type","direct");
        return new CustomExchange("order-delayed-exchange","x-delayed-message",true,false,args);

    }
    //延时队列
    @Bean
    public Queue newOrderDelayQueue(){
        return new Queue("order-delayed-queue",true);
    }
    //绑定
    @Bean
    public Binding bindingDelayedQueue(){
        return BindingBuilder.bind(newOrderDelayQueue()).to(newOrderDelayExchange()).with("order-key1").noargs();
    }
}
