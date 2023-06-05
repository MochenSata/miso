package com.chixing.util;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class HolidayUtils {


    // 判断日期是否为周末
    public static boolean isWeekend(LocalDate date) {
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        return dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY;
    }

    // 判断日期是否为节假日
    public static boolean isHoliday(LocalDate date, List<LocalDate> holidayList) {
        return holidayList.contains(date);
    }

}
