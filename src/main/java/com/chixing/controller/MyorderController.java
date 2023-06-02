package com.chixing.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.Myorder;
import com.chixing.pojo.MyorderDetailVO;
import com.chixing.pojo.MyorderOccupy;
import com.chixing.pojo.OrderCountAndDataVO;
import com.chixing.service.IMyorderOccupyService;
import com.chixing.service.IMyorderService;
import com.chixing.util.LockUtil;
import com.chixing.util.ServerResult;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.directory.SearchResult;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author smith
 * @since 2023-05-09
 */
@Controller
@RequestMapping("/myorder")
public class MyorderController {
    @Autowired
    private IMyorderService myorderService;

    //点击个人中心跳转个人中心并查找我的所有订单
    @GetMapping("/customer/{id}")
    public ModelAndView getOrdersByIdToPersonalCenter(@PathVariable("id") Integer custId){
        ServerResult result=myorderService.getAllOrdersByCustId(custId);
        ModelAndView mav=new ModelAndView("myorder/miso_order_all");
        mav.addObject("result",result);
        return mav;
    }


    @PostMapping("/houseDetail")
    @ResponseBody
    public ModelAndView numAndStartDateAndEndDate(OrderCountAndDataVO orderCountAndDataVO){
        System.out.println(orderCountAndDataVO);

        ModelAndView mav = new ModelAndView();
        mav.addObject("orderCountAndDataVO",orderCountAndDataVO);
        mav.setViewName("myorder/mypay");
        return mav;
    }


    //删除订单（将订单状态修改为5：已删除）
    @GetMapping("delete/{orderId}")
    @ResponseBody
    public ServerResult deleteOrder(@PathVariable("orderId") Integer orderId){
        ServerResult result = myorderService.deleteOrderByOrderId(orderId);
        System.out.println("要删除的订单为：" + result);
//        ModelAndView mav=new ModelAndView("myorder/miso_order_all");
//        mav.addObject("result",result);
//        return mav;
        return result;
    }

    //查询订单详情
    @GetMapping("detail")
    @ResponseBody
    public ModelAndView detailOrder(@RequestParam("orderId") Integer orderId){
        ServerResult result = myorderService.getOrderDeatilByOrderId(orderId);
        System.out.println("要查询的订单为：" + result);
        ModelAndView mav = new ModelAndView();
        mav.addObject("detail",result);
        mav.setViewName("myorder/miso_order_detail");
        return mav;
    }

    //下订单存储到数据库中
    @PostMapping("save")
    @ResponseBody
    public ModelAndView saveOrder(MyorderDetailVO myorderDetailVO){
        ServerResult result = myorderService.saveOrder(myorderDetailVO);
        System.out.println(result);
        ModelAndView mav = new ModelAndView();
        if (result.getCode()==201){
            mav.setViewName("myorder/fail");
        }else {
            mav.addObject("myorderDetailVO", myorderDetailVO);
            mav.setViewName("myorder/mypay_detail");
        }
        return mav;
    }

}

