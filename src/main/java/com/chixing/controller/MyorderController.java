package com.chixing.controller;


import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.OrderCountAndDataVO;
import com.chixing.service.IMyorderService;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.directory.SearchResult;
import java.time.LocalDate;

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
    public ModelAndView numAndStartDateAndEndDate(@RequestParam("custNum") Integer custNum,
                                                  @RequestParam("custStartDate")@DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate custStartDate,
                                                  @RequestParam("custEndDate")@DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate custEndDate,
                                                  @RequestParam("houseMainpicture")String houseMainpicture,
                                                  @RequestParam("houseTheme")String houseTheme,
                                                  @RequestParam("houseScore")Float houseScore,
                                                  @RequestParam("housePrice")Float housePrice){
        System.out.println("custNum:"+custNum);
        System.out.println("custStartDate:"+custStartDate);
        System.out.println("custEndDate:"+custEndDate);
        OrderCountAndDataVO orderDetail = new OrderCountAndDataVO(custNum,custStartDate,custEndDate,houseMainpicture,houseTheme,houseScore,housePrice);

        ModelAndView mav = new ModelAndView();
        mav.addObject("orderDetail",orderDetail);
        mav.setViewName("myorder/mypay");
        return mav;
    }
}

