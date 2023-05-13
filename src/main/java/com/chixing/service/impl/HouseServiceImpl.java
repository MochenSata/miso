package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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

import java.util.List;
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
            queryWrapper.select("house_name","house_kind","house_mainpicture","house_score","house_price","house_rentnum");
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
}
