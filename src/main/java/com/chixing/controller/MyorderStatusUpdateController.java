package com.chixing.controller;


import com.chixing.mapper.HouseMapper;
import com.chixing.pojo.House;
import com.chixing.pojo.Myorder;
import com.chixing.service.IHouseService;
import com.chixing.service.IMyorderService;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 定义定时任务类
@Component
public class MyorderStatusUpdateController {
    @Autowired
    private IMyorderService myorderService;
    @Autowired
    private AmqpTemplate rabbitTemplate;
    @Autowired
    private IHouseService houseService;
    @Autowired
    private HouseMapper houseMapper;

    @Scheduled(cron = "0 35 14  * * ?")//每天零点执行
    public void updateOrderStatus(){
        List<Myorder> myorderList = myorderService.updateOrderStatusByDate();
        for(Myorder myorder : myorderList){
            if (myorder.getMyorderOutime().isBefore(LocalDate.now())){//已过退房日期
                myorder.setMyorderStatus(2);//更新订单状态为2：已完成未评价
                //订单完成时，出租次数+1
                int houseId = myorder.getHouseId();//获得房屋Id
                House house = houseService.getById(houseId);//获得房屋数据
                int rentNUm = house.getHouseRentnum();//获得之前房屋出租次数
                house.setHouseRentnum(rentNUm+1);//出租次数+1
                houseMapper.updateById(house);//保存到数据库

                boolean result = myorderService.updateById(myorder);//更新订单状态到数据库
                if (result){

                        Map<String ,Object> map = new HashMap<>();
                        map.put("custId",myorder.getCustId());
                        map.put("myorderNum",myorder.getMyorderNum());
                        rabbitTemplate.convertAndSend("CommentwsExchange","Commentkey1",map,message ->{
                            return  message;
                        });

                    System.out.println("退房时间已过，订单状态修改成功！");
                }
            }else {
                System.out.println("未到退房时间，订单状态未修改！");
            }


        }
    }
}
