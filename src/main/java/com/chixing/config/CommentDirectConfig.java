package com.chixing.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CommentDirectConfig {
    //1. 创建direct交换机
    @Bean("CommentwsExchange")
    public DirectExchange newExchange(){
        return new DirectExchange("CommentwsExchange",true,false);
    }
    //2. 创建队列
    @Bean("CommentwsQueue")
    public Queue newQueue(){
        return new Queue("CommentwsQueue",true);
    }
    //3. 绑定
    @Bean("Commentwsbind")
    public Binding bind(){
        return BindingBuilder.bind(newQueue()).to(newExchange()).with("Commentkey1");
    }

}
