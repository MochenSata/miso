package com.chixing.controller;

import com.chixing.service.ICouponService;
import com.chixing.util.HolidayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class CouponScheduledTask {

    @Autowired
    private  ICouponService couponService;
    private static final List<LocalDate> holidayList =new ArrayList<>(); // 节假日日期列表，可以从数据库或静态数据中获取

    static {
        // 添加假期日期到列表中
        holidayList.add(LocalDate.parse("2023-01-01"));
        holidayList.add(LocalDate.parse("2023-01-02"));
        holidayList.add(LocalDate.parse("2023-01-03"));
        holidayList.add(LocalDate.parse("2023-04-04"));
        holidayList.add(LocalDate.parse("2023-04-05"));
        holidayList.add(LocalDate.parse("2023-04-06"));
        holidayList.add(LocalDate.parse("2023-05-01"));
        holidayList.add(LocalDate.parse("2023-05-02"));
        holidayList.add(LocalDate.parse("2023-05-03"));
        holidayList.add(LocalDate.parse("2023-04-29"));
        holidayList.add(LocalDate.parse("2023-04-30"));
        holidayList.add(LocalDate.parse("2023-06-01"));
        holidayList.add(LocalDate.parse("2023-06-05"));
        holidayList.add(LocalDate.parse("2023-09-29"));
        holidayList.add(LocalDate.parse("2023-09-30"));
        holidayList.add(LocalDate.parse("2023-10-01"));
        holidayList.add(LocalDate.parse("2023-10-02"));
        holidayList.add(LocalDate.parse("2023-10-03"));
        holidayList.add(LocalDate.parse("2023-10-04"));
        holidayList.add(LocalDate.parse("2023-10-05"));
        holidayList.add(LocalDate.parse("2023-10-06"));
    }



    @Scheduled(cron = "0 0 9 * * ?") // 每天早上9点执行一次
    public void publishCouponTask() {
        LocalDate currentDate = LocalDate.now();
        System.out.println(currentDate);
        if (HolidayUtils.isWeekend(currentDate) || HolidayUtils.isHoliday(currentDate, holidayList)) {
            // 如果是周末或节假日，则发布优惠券
            couponService.saveHolidayCoupons();
        }
    }
}

