package com.chixing.controller;

import com.chixing.service.IHouseService;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}