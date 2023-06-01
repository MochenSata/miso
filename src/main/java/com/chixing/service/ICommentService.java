package com.chixing.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chixing.pojo.Comment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chixing.util.ServerResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
public interface ICommentService extends IService<Comment> {
    public ServerResult getByPage(Integer pageNum,Integer houseId);

}
