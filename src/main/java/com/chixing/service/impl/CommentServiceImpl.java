package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chixing.controller.WebSocketProcess;
import com.chixing.mapper.CouponMapper;
import com.chixing.mapper.HouseMapper;
import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.*;
import com.chixing.mapper.CommentMapper;
import com.chixing.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private HouseMapper houseMapper;
    @Autowired
    private MyorderMapper myorderMapper;
    @Autowired
    private WebSocketProcess webSocketProcess;

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

    //评价打分评论
    @Override
    public ServerResult getByCommentHouseId(Integer houseId,Integer custId,Integer myorderId) {
        QueryWrapper<House> wrapper=new QueryWrapper<>();
        wrapper.select("house_id","house_theme","house_name","house_kind","house_score","house_price","house_mainpicture");
        wrapper.eq("house_id",houseId);
        House house=houseMapper.selectOne(wrapper);
        if (house == null)
            return ServerResult.fail(201, ResultMsg.fail,false);
        return ServerResult.success(200, ResultMsg.success,house);
    }

    //去评价
    @Override
    public ServerResult goComment(CommentVo commentVo) {
        Comment comment = new Comment();
        System.out.println(commentVo);
        comment.setCustId(commentVo.getCustId());
        comment.setCustName(commentVo.getCustName());
        comment.setComCreateTime(LocalDateTime.now());
        comment.setHouseId(commentVo.getHouseId());
        comment.setComContent(commentVo.getComContent());
        comment.setComScore(commentVo.getComScore());
        comment.setMyorderId(commentVo.getMyorderId());
        //更改订单状态
        QueryWrapper<Myorder> wrapper = new QueryWrapper<>();
        wrapper.eq("myorder_id",commentVo.getMyorderId());
        Myorder myorder =new Myorder();
        myorder.setMyorderStatus(3);
        myorderMapper.update(myorder,wrapper);
        int rows = commentMapper.insert(comment);
        //更改house评分
        QueryWrapper<Comment> commentQueryWrapper=new QueryWrapper<>();
        commentQueryWrapper.eq("house_id",commentVo.getHouseId());
        Long count = commentMapper.selectCount(commentQueryWrapper);
        commentQueryWrapper.select("SUM(com_score) as score_total");
        // 执行查询并获取结果
        List<Map<String, Object>> resultList = commentMapper.selectMaps(commentQueryWrapper);
        Double totalScore = (Double) resultList.get(0).get("score_total");
        Float totalScoreFloat = totalScore.floatValue(); // 将Double类型的数据转换为Float类型的数据
        System.out.println(resultList);
        int recordCount = resultList.size(); // 获取查询结果的数量
        Float updateHouseScore = totalScoreFloat/(recordCount+1);

        QueryWrapper<House> houseQueryWrapper=new QueryWrapper<>();
        houseQueryWrapper.eq("house_id",commentVo.getHouseId());
        houseQueryWrapper.select("SUM(com_score) as score_total");
        House house=new House();
        house.setHouseScore(updateHouseScore);
        System.out.println(updateHouseScore);
        houseMapper.update(house,houseQueryWrapper);

        if (rows>0)
            return ServerResult.success(200,ResultMsg.success,comment);
        return ServerResult.fail(201,ResultMsg.fail,false);
    }

    //邀请码消息队列
    @RabbitHandler
    @RabbitListener(queues = "CommentwsQueue")
    public void sendMsgByComment(Map map, Channel channel, Message message){
        //1. 接收Queue中的消息
        String myorderNum = (String) map.get("myorderNum");
        Integer custId = (Integer) map.get("custId");
        System.out.println("发送信息");
        String msg = "您好，您的编号为：" + myorderNum + "的订单已完成，请去评论";
        try {
            webSocketProcess.sendMessage(custId, msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
