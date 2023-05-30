package com.chixing.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;

public class DateUtil {
    public static final String DATETIME_PATTERN="yyyy-MM-dd HH:mm:ss";
    public static final String DATE_PATTERN="yyyy-MM-dd";
    public static final String TIME_PATTERN="HH:mm:ss";



    //String--->LocalDateTime
    public static LocalDateTime stringParse2LocalDateTime(String src) {
        DateTimeFormatter formatter=DateTimeFormatter.ofPattern(DATETIME_PATTERN);
        LocalDateTime dateTime=null;
        try{
            dateTime=LocalDateTime.parse(src,formatter);
        }catch(DateTimeParseException e){
            e.printStackTrace();
            System.out.println("请输入正确的日期格式：yyyy-MM-dd HH:mm:ss");
        }
        return dateTime;
    }

    //String--->LocalDate
    public static LocalDate stringParse2LocalDate(String src) {
        DateTimeFormatter formatter=DateTimeFormatter.ofPattern(DATE_PATTERN);
        LocalDate date=null;
        try{
            date=LocalDate.parse(src,formatter);
        }catch(DateTimeParseException e){
            e.printStackTrace();
            System.out.println("请输入正确的日期格式：yyyy-MM-dd");
        }
        return date;
    }

    //String--->LocalTime
    public static LocalTime stringParse2LocalTime(String src) {
        DateTimeFormatter formatter=DateTimeFormatter.ofPattern(TIME_PATTERN);
        LocalTime time=null;
        try{
            time=LocalTime.parse(src,formatter);
        }catch(DateTimeParseException e){
            e.printStackTrace();
            System.out.println("请输入正确的时间格式：HH:mm:ss");
        }
        return time;
    }

    //String--->Date
    public static Date stringParse2Date(String src) {
        SimpleDateFormat dateFormat=new SimpleDateFormat(DATETIME_PATTERN);
        Date date=null;
        try {
            date=dateFormat.parse(src);
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("请输入正确的日期格式：yyyy-MM-dd HH:mm:ss");
        }

        return date;
    }
}
