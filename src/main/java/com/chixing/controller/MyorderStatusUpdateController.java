package com.chixing.controller;


import com.chixing.pojo.Myorder;
import com.chixing.service.IMyorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

// 定义定时任务类
@Component
public class MyorderStatusUpdateController {
    @Autowired
    private IMyorderService myorderService;

    @Scheduled(cron = "0 35 14  * * ?")//每天零点执行
    public void updateOrderStatus(){
        List<Myorder> myorderList = myorderService.updateOrderStatusByDate();
        for(Myorder myorder : myorderList){
            if (myorder.getMyorderOutime().isBefore(LocalDate.now())){//已过退房日期
                myorder.setMyorderStatus(2);//更新订单状态为2：已完成未评价
                boolean result = myorderService.updateById(myorder);//更新订单状态到数据库
                if (result){
                    System.out.println("退房时间已过，订单状态修改成功！");
                }
            }


        }
    }
}
