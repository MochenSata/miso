package com.chixing.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.Myorder;
import com.chixing.pojo.MyorderDetailVO;
import com.chixing.pojo.MyorderOccupy;
import com.chixing.pojo.OrderCountAndDataVO;
import com.chixing.service.IMyorderOccupyService;
import com.chixing.service.IMyorderService;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.directory.SearchResult;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
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
    @Autowired
    private IMyorderOccupyService myorderOccupyService;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;
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
        System.out.println(myorderDetailVO.getOrderCountAndDataVO().getOccName());
        Myorder myorder = new Myorder();
        myorder.setCustId(myorderDetailVO.getCustId());
        String myorderNum= UUID.randomUUID().toString().replace("-", "");
        myorderDetailVO.setMyorderNum(myorderNum);

        myorder.setMyorderNum(myorderNum);
        myorder.setHouseId(myorderDetailVO.getOrderCountAndDataVO().getHouseId());
        myorder.setHouseName(myorderDetailVO.getOrderCountAndDataVO().getHouseName());
        myorder.setHouseMainpicture(myorderDetailVO.getOrderCountAndDataVO().getHouseMainpicture());
        myorder.setHousePrice(myorderDetailVO.getOrderCountAndDataVO().getHousePrice());
        myorder.setMyorderCreateTime(LocalDateTime.now());

        if(myorderDetailVO.getCouNum()!=null&&myorderDetailVO.getCouNum()!=""){
            myorder.setCouNum(myorderDetailVO.getCouNum());
            myorder.setCouPrice(myorderDetailVO.getCouPrice());
        }else{
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
        QueryWrapper<Myorder> wrapper=new QueryWrapper<>();
        wrapper.eq("myorder_num",myorderNum);
        Myorder myorder1 = myorderService.getOne(wrapper);
        Integer myorderId = myorder1.getMyorderId();
        myorderDetailVO.setMyorderId(myorderId);
        MyorderOccupy myorderOccupy = new MyorderOccupy();
        myorderOccupy.setMyorderId(myorderId);
        myorderOccupy.setCustId(myorder.getCustId());
        myorderOccupy.setOccIdentity(myorderDetailVO.getOrderCountAndDataVO().getOccIdentity());
        myorderOccupy.setOccName(myorderDetailVO.getOrderCountAndDataVO().getOccName());
        myorderOccupy.setOccTelno(myorderDetailVO.getOrderCountAndDataVO().getOccTelno());

        myorderDetailVO.getOrderCountAndDataVO().getCustStartDate();


        myorderOccupyService.save(myorderOccupy);
        ModelAndView mav = new ModelAndView();
        mav.addObject("myorderDetailVO",myorderDetailVO);
        mav.setViewName("myorder/mypay_detail");
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

    @PostMapping("bookDate")
    //在下订单预订房间时，向 Redis 中添加该房间的预订信息
    public void bookRoomToRedis(Integer roomId,String startDate,String endDate){
        // 把预订日期转换成时间戳
        long startTimestamp = LocalDate.parse(startDate).toEpochDay();
        long endTimestamp = LocalDate.parse(endDate).toEpochDay();

        // 把预订信息添加到 Redis 中
        for(long i = startTimestamp;i<endTimestamp;i++){
            // 向有序集合中添加预订日期和预订时间戳的组合
            redisTemplate.opsForZSet().add("booked:" + roomId ,i+"-"+System.currentTimeMillis(),i);
        }
    }

    @GetMapping("/getbookDates")
    @ResponseBody
    public List<String> getbookDates(Integer roomId){
        // 从 Redis 中获取该房间的预订信息
        Set<Object> set = redisTemplate.opsForZSet().range("booked:" + roomId, 0, -1);
        List<String> bookedDates = new ArrayList<>();
        if(set != null && !set.isEmpty()) {
            for(Object obj : set) {
                String[] arr = obj.toString().split("-");
                String dateStr = LocalDate.ofEpochDay(Long.parseLong(arr[0])).toString();
                bookedDates.add(dateStr);
            }
        }
        return bookedDates;
    }
}

