package com.chixing.controller;

import com.alibaba.fastjson.JSON;
import com.chixing.pojo.MyorderDetailVO;
import com.chixing.service.IMyorderService;
import com.chixing.util.ServerResult;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.Map;

@Component
public class OrderClippingConsumer {

    @Autowired
    private IMyorderService myorderService;

    @RabbitHandler
    @RabbitListener(queues = "order-queue")
    public void saveOrder(String msg, Channel channel, Message message) throws InterruptedException {
        System.out.println("执行消费者");
        MyorderDetailVO myorderDetailVO= JSON.parseObject(msg,MyorderDetailVO.class);// json string --->object
        System.out.println("消费者：。。。"+myorderDetailVO);
        ServerResult result = myorderService.saveOrder(myorderDetailVO);
        System.out.println("消费者：。。。"+result);
        Thread.sleep(2000L);
        try {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
