package com.chixing.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class InvitationDirectConfig {
    //1. 创建direct交换机
    @Bean("invitationWsExchange")
    public DirectExchange newExchange(){
        return new DirectExchange("invitationWsExchange",true,false);
    }

    //2. 创建队列
    @Bean("invitationWsQueue")
    public Queue newQueue(){
        return new Queue("invitationWsQueue",true);
    }

    //3. 绑定
    @Bean("invitationWsBind")
    public Binding bind(){
        return BindingBuilder.bind(newQueue()).to(newExchange()).with("invitation-key1");
    }
}
