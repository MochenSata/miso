package com.chixing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.chixing.pojo.House;
import com.chixing.mapper.HouseMapper;
import com.chixing.pojo.SearchHouse;
import com.chixing.service.IHouseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chixing.util.ResultMsg;
import com.chixing.util.ServerResult;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import java.util.*;
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
    @Autowired
    private ElasticsearchRestTemplate elasticsearchRestTemplate;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate2;


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

    @Override
    public Map<String, Object> getHouseListFromEs(String search) {
        List<SearchHouse> searchHouseList = new ArrayList<>();
        BoolQueryBuilder boolQueryBuilder = new BoolQueryBuilder();
        if (search!=null){
            boolQueryBuilder.must(QueryBuilders.queryStringQuery(search));
        }
        //构建高亮查询
        NativeSearchQueryBuilder builder =  new NativeSearchQueryBuilder();
        NativeSearchQuery query = builder.withQuery(boolQueryBuilder)
                .withHighlightFields(new HighlightBuilder.Field("houseName"),
                        new HighlightBuilder.Field("houseKind"))
                .withHighlightBuilder(new HighlightBuilder()
                        .preTags("<span style='color:red'>")
                        .postTags("</span>"))
                .build();
        SearchHits<SearchHouse> searches = elasticsearchRestTemplate.search(query,SearchHouse.class);

        for (SearchHit<SearchHouse> searchHit:searches){
            Map<String, List<String>> highlightFields = searchHit.getHighlightFields();
            String highLightName = highlightFields.get("houseName") == null ? searchHit.getContent().getHouseName() : highlightFields.get("houseName").get(0);
            String highLightKind = highlightFields.get("houseKind") == null ? searchHit.getContent().getHouseKind() : highlightFields.get("houseKind").get(0);

            SearchHouse searchHouse = searchHit.getContent();
            searchHouse.setHouseName(highLightName);
            searchHouse.setHouseKind(highLightKind);

            searchHouseList.add(searchHouse);
        }
        Map<String, Object> result = new HashMap<>();
        result.put("searchHouseList",searchHouseList);
        return result;
    }

    // 获取房间号对应不能预约日期集合
    @Override
    public ServerResult getHouseDate(Integer id) {
        //根据房间号查询 所有日期预定的key
        Set<String> keys  = redisTemplate2.keys(id+"*");
        List<String> dates = new ArrayList<>();
        for (String date : keys) {
            String datesStr[] = date.split(id+"\\+");
            try {
                dates.add(datesStr[1]);
            }catch (Exception e){
                continue;
            }

        }
        return ServerResult.success(200, ResultMsg.success, dates);
    }


}
