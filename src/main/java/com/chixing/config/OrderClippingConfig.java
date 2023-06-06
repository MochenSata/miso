package com.chixing.config;

import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OrderClippingConfig {
    //1. 创建direct交换机
    @Bean("order-Clipping-exchange")
    public DirectExchange newExchange(){
        return new DirectExchange("order-Clipping-exchange",true,false);
    }
    //2. 创建队列
    @Bean("order-queue")
    public Queue newQueue(){
        return new Queue("order-queue",true);
    }
    //3. 绑定
    @Bean("orderClippingbind")
    public Binding bind(){
        return BindingBuilder.bind(newQueue()).to(newExchange()).with("orderClippingkey1");
    }
}
