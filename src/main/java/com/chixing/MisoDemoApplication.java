package com.chixing;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.chixing.mapper")
@EnableScheduling
public class MisoDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(MisoDemoApplication.class, args);
    }

}
