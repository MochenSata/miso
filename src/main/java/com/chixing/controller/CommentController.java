package com.chixing.controller;

import com.chixing.pojo.CommentVo;
import com.chixing.service.ICommentService;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CommentController {
    @Autowired
    private ICommentService commentService;

    // 房源详情页的分页评论
    @GetMapping(value = {"comment/house", "comment/house/{pageNum}"})
    public ServerResult getByPage(@PathVariable(required = false) Integer pageNum, @RequestParam(required = false) Integer id) {
        if (pageNum == null) {
            pageNum = 1;
        }
        return commentService.getByPage(pageNum, id);
    }

    //已完成评价
    @GetMapping("discuss/{id}")
    @ResponseBody
    public ModelAndView getHouseId(@PathVariable("id") Integer houseId,
                                   @RequestParam("custId")Integer custId,
                                   @RequestParam("myorderId")Integer myorderId) {
        ServerResult serverResult=commentService.getByCommentHouseId(houseId,custId,myorderId);
        System.out.println(serverResult);
        ModelAndView mav=new ModelAndView();
        mav.addObject("result",serverResult);
        mav.addObject("custId",custId);
        mav.addObject("myorderId",myorderId);
        mav.setViewName("customer/miso_comment");
        return mav;
    }

    //去评价
    @PostMapping("goComment")
    @ResponseBody
    public ModelAndView goComment(CommentVo commentVo){
        ServerResult result = commentService.goComment(commentVo);
        System.out.println(result);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/commentSuccess");
        return mav;
    }
}

