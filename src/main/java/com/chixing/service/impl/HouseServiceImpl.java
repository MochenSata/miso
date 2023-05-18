package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.chixing.pojo.House;
import com.chixing.mapper.HouseMapper;
import com.chixing.service.IHouseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
@Service
public class HouseServiceImpl extends ServiceImpl<HouseMapper, House> implements IHouseService {
    @Autowired
    private HouseMapper houseMapper;
    @Autowired
    private RedisTemplate redisTemplate;



    //根据房源评分获得热门推荐数据(前5个)
    public ServerResult getHotHousesByScore(){
        List<House> houseList=null;
        String key="hot_houses";
        ZSetOperations<String,House> zSetOperations =  redisTemplate.opsForZSet();
        if(redisTemplate.hasKey(key)) {// Redis 缓存中存在，则直接返回
            Set<House> houseSet = zSetOperations.range(key,0,-1);
            houseList = houseSet.stream().collect(Collectors.toList());
        }else{
            // 从MySQL 查询出来
            QueryWrapper<House> queryWrapper = new QueryWrapper<>();
            queryWrapper.select("house_id","house_name","house_kind","house_mainpicture","house_price","house_intro","house_score");
            queryWrapper.lt("status",1);
            queryWrapper.orderByDesc("house_score");
            queryWrapper.last("limit 5");
            houseList=houseMapper.selectList(queryWrapper);
            System.out.println("ServiceImpl:"+houseList);
            //保存到Redis中
            for(House house:houseList){
                System.out.println(house);
                zSetOperations.add(key,house,house.getHouseScore());
            }
            redisTemplate.expire(key, 30, TimeUnit.MINUTES);//Redis 热门商品 30mins 过期
        }

        return ServerResult.success(200, ResultMsg.success,houseList);
    }
    //根据出租次数排序获得商品列表（热门商品 前8个）
    @Override
    public ServerResult getHouseByRentNum() {
        List<House> houseList=null;
        String key="hot_houselist";
        ZSetOperations<String,House> zSetOperations=redisTemplate.opsForZSet();
        if (redisTemplate.hasKey(key)){// Redis 缓存中存在，则直接返回
            Set<House> houseSet=zSetOperations.range(key,0,-1);
            houseList=houseSet.stream().collect(Collectors.toList());
        }else {
            // 从MySQL 查询出来
            QueryWrapper<House>queryWrapper=new QueryWrapper<>();
            queryWrapper.select("house_name","house_kind","house_mainpicture","house_score","house_price","house_rentnum","house_id");
            queryWrapper.lt("house_status",3);
            queryWrapper.orderByDesc("house_rentnum");
            queryWrapper.last("limit 8");
            houseList=houseMapper.selectList(queryWrapper);
            System.out.println("fyj:"+houseList);
            //保存到redis中
            for (House house:houseList){
                System.out.println("fyjredis:"+house);
                zSetOperations.add(key,house,house.getHouseRentnum());
            }
            redisTemplate.expire(key,30, TimeUnit.MINUTES);//Redis 热门商品 30mins 过期
        }
        return ServerResult.success(200, ResultMsg.success,houseList);

    }

    @Override
    public ServerResult getHouseByMoreCondition(String search) {
        System.out.println("search:"+search);
        QueryWrapper<House> wrapper = new QueryWrapper<>();
        wrapper.select("house_name","house_kind","house_mainpicture","house_score","house_price","house_rentnum","house_id");
        wrapper.like("house_name","%" + search + "%").or().like("house_kind","%" + search + "%");
        List<House> houseList = houseMapper.selectList(wrapper);
        System.out.println(houseList);
        if (houseList.size()>0)
            return ServerResult.success(200, ResultMsg.success,houseList);
        return ServerResult.fail(201,ResultMsg.fail,false);
    }

    @Override
    public ServerResult getHouseByType(String type) {
        QueryWrapper<House> queryWrapper=new QueryWrapper<>();
        queryWrapper.select("*");
        queryWrapper.lt("house_status",3);
        queryWrapper.eq("house_kind",type);
        System.out.println(queryWrapper);
        List<House> houseList=houseMapper.selectList(queryWrapper);
        return ServerResult.success(200,ResultMsg.success,houseList);

    }

    //多条件连续筛选房源（根据房屋类型，价格区间，卧室数量）
    @Override
    public ServerResult getSearchHouseByType(String houseKind,Float lowPrice,Float highPrice,Integer roomNum) {
        QueryWrapper<House> wrapper = new QueryWrapper<>();
        wrapper.select("house_name","house_kind","house_mainpicture","house_score","house_price","house_rentnum","house_id","bed_count");
        wrapper.eq("house_kind",houseKind).or().eq("house_room_num",roomNum).or().between("house_price",lowPrice,highPrice);
        List<House> houseList = houseMapper.selectList(wrapper);
        System.out.println(houseList);
        if (houseList.size()>0)
            return ServerResult.success(200, ResultMsg.success,houseList);
        return ServerResult.fail(201,ResultMsg.fail,false);
    }

//    @Override
//    public ServerResult getSearchHouseByType(String houseKind,Float lowPrice,Float highPrice,Integer roomNum,String[] conditions) {
//        QueryWrapper<House> wrapper = new QueryWrapper<>();
//        wrapper.select("house_name","house_kind","house_mainpicture","house_score","house_price","house_rentnum","house_id","bed_count");
//        if(conditions[0] != null){
//            wrapper.eq("house_kind",houseKind);
//        }
//        if(conditions[1] != null){
//            wrapper.between("house_price",lowPrice,highPrice);
//        }
//        if(conditions[2] != null){
//            wrapper.eq("house_room_num",roomNum);
//        }
//        //wrapper.eq("house_kind",houseKind).or().eq("house_room_num",roomNum).or().between("house_price",lowPrice,highPrice);
//        List<House> houseList = houseMapper.selectList(wrapper);
//        System.out.println(houseList);
//        if (houseList.size()>0)
//            return ServerResult.success(200, ResultMsg.success,houseList);
//        return ServerResult.fail(201,ResultMsg.fail,false);
//    }



    /*@Override
    public ServerResult getSearchHouseByType(String houseKind, Float lowPrice, Float highPrice, Integer roomNum, List<Integer> lastIds) {
        // 创建 QueryWrapper 对象，并设置查询条件
        QueryWrapper<House> wrapper = new QueryWrapper<>();
        wrapper.select("house_name","house_kind","house_mainpicture","house_score","house_price","house_rentnum","house_id","house_room_num");
        wrapper.eq(StringUtils.isNotBlank(houseKind), "house_kind", houseKind)
                .gt(lowPrice != null, "house_price", lowPrice)
                .lt(highPrice != null, "house_price", highPrice)
                .eq(roomNum != null, "house_room_num", roomNum)
                .notIn(CollectionUtils.isNotEmpty(lastIds), "house_id", lastIds);

        //wrapper.eq("house_kind",houseKind).or().eq("house_room_num",roomNum).or().between("house_price",lowPrice,highPrice);
        // 调用 selectList 方法进行查询
        List<House> houseList = houseMapper.selectList(wrapper);
        System.out.println(houseList);

        // 封装响应结果并返回
        Map<String,Object> resultMap = new HashMap<>();
        if (houseList.size()>0) {
            resultMap.put("houseList", houseList);
            resultMap.put("lastIds",getLsatIds(houseList,lastIds));
            return ServerResult.success(200, ResultMsg.success,resultMap);
        }

        return ServerResult.fail(201,ResultMsg.fail,false);
    }
    //提取最新的房屋列表
    private List<Integer> getLsatIds(List<House> houseList,List<Integer> lastIds){
        if (CollectionUtils.isEmpty(houseList)){
            return lastIds;
        }
        List<Integer> newLastIds = houseList.stream().map(House::getHouseId).collect(Collectors.toList());
        if (CollectionUtils.isNotEmpty(lastIds)){
            newLastIds.addAll(lastIds);
        }
        return newLastIds;
    }*/


}
