package com.chixing.controller;

import com.chixing.pojo.House;
import com.chixing.pojo.SearchHouse;
import com.chixing.service.IHouseService;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/house")
public class HouseController {
    @Autowired
    private IHouseService houseService;

    //根据房源评分获得热门推荐数据
    @GetMapping("hot")
    @ResponseBody
    public ServerResult getHotHouses(){
        return houseService.getHotHousesByScore();
    }

    //根据销量获得商品列表（热门商品 前8个）
    @GetMapping("hotlist")
    @ResponseBody
    public ServerResult getHotHouselist(){
        System.out.println("abc");
        return houseService.getHouseByRentNum();
    }

    //房源详情页的房源查询
    @GetMapping("{id}")
    public ModelAndView getHouseAllmsg(@PathVariable("id") Integer houseId){
        House house = houseService.getById(houseId);
        ModelAndView mav = new ModelAndView();
        if(house == null)
            mav.addObject("serverResult",ServerResult.fail(201,ResultMsg.no_data,null));
        mav .addObject("serverResult",ServerResult.success(200,ResultMsg.success,house));
        mav.setViewName("house/house");
        return mav;
    }

    //按房屋类别筛选
    @GetMapping("list")
    @ResponseBody
    public ServerResult getHouseList(@RequestParam(value = "type",defaultValue = "全部")String type){
        if ("全部".equals(type)){
            System.out.println("fyj111");

            return houseService.getHouseByRentNum();

        }else{
            System.out.println("fyj222");
            return houseService.getHouseByType(type);
        }
    }

    //搜索栏搜索房源
//    @GetMapping("search")
//    public ModelAndView getHouseByMoreCondition(@RequestParam(value = "search",required = false)String search){
//       ServerResult serverResult = houseService.getHouseByMoreCondition(search);
//       ModelAndView mav = new ModelAndView();
//       mav.addObject("serverResult",serverResult);
//       mav.setViewName("house/search");
//       return mav;
//    }

    //搜索页面条件查询房源
    @GetMapping("searchByType")
    @ResponseBody
    public ServerResult getSearchHouseByType(@RequestParam(value = "houseKind",required = false)String houseKind,
                                             @RequestParam(value = "lowPrice",required = false)Float lowPrice,
                                             @RequestParam(value = "highPrice",required = false)Float highPrice,
                                             @RequestParam(value = "roomNum",required = false)Integer roomNum
                                             /*@RequestParam(value = "lastIds",required = false,defaultValue = "[]")String[] lastconditions*/){
        System.out.println("选择的类型：" + houseKind + ",选择的价格范围："+ lowPrice + "~" + highPrice + ",选择的卧室数量：" + roomNum);
        ServerResult house = houseService.getSearchHouseByType(houseKind,lowPrice,highPrice,roomNum);
        System.out.println("查询到的房屋：" + house);
        return house;
    }

    //ES查询房源
    @GetMapping("search")
    public ModelAndView getHouseListFromEs(@RequestParam(value = "search",required = false)String search){
        Map<String ,Object> map =  houseService.getHouseListFromEs(search);
        ModelAndView mav = new ModelAndView("house/search");
        List<SearchHouse> searchHouseList = (List<SearchHouse>) map.get("searchHouseList");
        mav.addObject("searchHouseList",searchHouseList);
        System.out.println("搜索到的房源数据是："+searchHouseList);
        return mav;
    }
}
