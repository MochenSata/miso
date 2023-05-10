package com.chixing;

import com.chixing.mapper.HouseMapper;
import com.chixing.mapper.MyorderMapper;
import com.chixing.pojo.House;
import com.chixing.pojo.Myorder;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MisoDemoApplicationTests {

    @Autowired
    private MyorderMapper mapper;
    @Autowired
    private HouseMapper houseMapper;
    @Test
    void contextLoads() {
    }

    @Test
    public void selectById(){
        Myorder myorder = mapper.selectById(5001);
        House house =houseMapper.selectById(1006);
        System.out.println(myorder);
        System.out.println(house);
    }
}
