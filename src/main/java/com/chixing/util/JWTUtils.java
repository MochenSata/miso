package com.chixing.util;


import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JWTUtils {
    // JWT 签名密钥
    private static final String jwtToken = "123456Mszlu!@#$$";

    // 创建 JWT 的方法
    public static String createToken(Integer custId) {
        // 创建一个 Map，用于在 JWT 负载中存储额外的数据
        Map<String, Object> claims = new HashMap<>();
        claims.put("custId", custId);

        // 创建一个 JWT 构建器实例
        JwtBuilder jwtBuilder = Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, jwtToken) // 签名算法（头部），使用指定密钥
                .setClaims(claims) // 负载数据，要唯一，自行设置
                .setIssuedAt(new Date()) // 设置签发时间，保证每次生成的 JWT 不同
                .setExpiration(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 60 * 1000)); // 一天的有效时间

        // 生成 JWT 字符串
        String token = jwtBuilder.compact();
        return token;
    }

    // 验证并解析 JWT 的方法
    public static Map<String, Object> checkToken(String token) {
        try {
            Jwt parse = Jwts.parser().setSigningKey(jwtToken).parse(token);
            return (Map<String, Object>) parse.getBody();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}


