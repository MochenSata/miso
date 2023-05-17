package com.chixing.controller;


import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.Myorder;
import com.chixing.pojo.MyorderDetailVO;
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
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

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

    //下订单存到数据库中
    @PostMapping("save")
    @ResponseBody
    public ModelAndView saveOrder(MyorderDetailVO myorderDetailVO){
        System.out.println(myorderDetailVO);
        Myorder myorder = new Myorder();
        myorder.setCustId(myorderDetailVO.getCustId());
        String myorderNum= UUID.randomUUID().toString().replace("-", "");
        myorder.setMyorderNum(myorderNum);
        myorder.setHouseId(myorderDetailVO.getOrderCountAndDataVO().getHouseId());
        myorder.setHouseName(myorderDetailVO.getOrderCountAndDataVO().getHouseName());
        myorder.setHouseMainpicture(myorderDetailVO.getOrderCountAndDataVO().getHouseMainpicture());
        myorder.setHousePrice(myorderDetailVO.getOrderCountAndDataVO().getHousePrice());
        myorder.setMyorderCreateTime(LocalDateTime.now());

        if(myorderDetailVO.getCouNum() != null){
            myorder.setCouNum(myorderDetailVO.getCouNum());
            myorder.setCouPrice(myorderDetailVO.getCouPrice());
        }
        if (myorderDetailVO.getCouNum() == null||myorderDetailVO.getCouNum() ==""){
            myorder.setCouNum(null);
            myorder.setCouPrice(null);
        }

        myorder.setMyorderStatus(0);
        myorder.setMyorderPrice(myorderDetailVO.getMyorderPrice());
        myorder.setMyorderDay(myorderDetailVO.getOrderCountAndDataVO().getCustNum());
        myorder.setMyorderIntime(myorderDetailVO.getOrderCountAndDataVO().getCustStartDate());
        myorder.setMyorderOutime(myorderDetailVO.getOrderCountAndDataVO().getCustEndDate());
        System.out.println(myorder);
        myorderService.save(myorder);
        ModelAndView mav = new ModelAndView();
        mav.addObject("myorder",myorder);
        mav.setViewName("myorder/mypay_detail");
        return mav;
    }
}

