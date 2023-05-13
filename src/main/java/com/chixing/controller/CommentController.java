package com.chixing.controller;

import com.chixing.service.ICommentService;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
}

