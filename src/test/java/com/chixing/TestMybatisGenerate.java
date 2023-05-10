package com.chixing;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

public class TestMybatisGenerate {
    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://192.168.1.139:3307/misodb?serverTimezone=Asia/Shanghai", "root", "root")
                .globalConfig(builder -> {
                    builder.author("smith") // 设置作者
                            //.enableSwagger() // 开启 swagger 模式
                            .outputDir("D://work//Java_course//mybatis"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.chixing") // 设置父包名
                            .moduleName("") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, "D://work//Java_course//mybatis//com/chixing/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("comment","coupon","coupon_receive","customer","house","message","myorder","myorder_occupy","payment") // 设置需要生成的表名
                            .addTablePrefix("t_", "c_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }


}
