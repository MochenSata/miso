package com.chixing.service;

import com.chixing.pojo.House;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chixing.util.ServerResult;

import java.util.List;
import java.util.Map;

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
    public ServerResult getHouseByRentNum();
    public ServerResult getHouseByMoreCondition(String search);
    public ServerResult getHouseByType(String type);

    //多条件连续筛选房源（根据房屋类型，价格区间，卧室数量）
    public ServerResult getSearchHouseByType(String houseKind,Float lowPrice,Float highPrice,Integer roomNum);

    // 在ES中查询房源，实现分页
    public Map<String,Object> getHouseListFromEs(String search);

    //// 获取房间号对应不能预约日期集合
    public ServerResult getHouseDate(Integer id);
}
