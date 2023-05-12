package com.chixing.service;

import com.chixing.pojo.House;
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
public interface IHouseService extends IService<House> {


    /**
     * 根据房源评分获得热门推荐数据
     * @return
     */
    public ServerResult getHotHousesByScore();
}
