package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chixing.mapper.CouponMapper;
import com.chixing.pojo.Comment;
import com.chixing.mapper.CommentMapper;
import com.chixing.pojo.Coupon;
import com.chixing.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private CouponMapper couponMapper;

    @Override
    public ServerResult getByPage(Integer pageNum,Integer houseId) {
        //定义评论列表
        List<Comment> commentList = new ArrayList<>();

        // 创建一个查询条件包装器，查询指定 customerId 的订单
        QueryWrapper<Comment> commentQueryWrapper = new QueryWrapper<>();
        commentQueryWrapper.eq("house_id",houseId);
        commentQueryWrapper.orderByDesc("com_create_time");

        //创建分页对象，指定当前页码为pageNum，每页显示的记录数为5
        Page<Comment> page = new Page<>(pageNum, 5);

        // 执行分页查询，将查询结果赋值给pageInfo对象
        Page<Comment> pageInfo = commentMapper.selectPage(page, commentQueryWrapper);

        if(pageInfo.getRecords().size() > 0){
            // 如果有查询结果，返回成功的响应，状态码为200，消息为"success"，数据部分为pageInfo
            return ServerResult.success(200, ResultMsg.success, pageInfo);
        }else {
            // 如果没有查询结果，返回失败的响应，状态码为400，消息为"fail"，数据部分为null
            return ServerResult.fail(201, ResultMsg.no_data, null);
        }
    }


}
