package com.chixing.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class InvitationCode {

        // 数据库连接信息
        private static final String DB_URL = "jdbc:mysql://localhost:3307/misodb?serverTimezone=Asia/Shanghai";
        private static final String DB_USER = "root";
        private static final String DB_PASSWORD = "root";


        // 生成邀请码的字符集
        private static final String CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        // 生成指定长度的邀请码
        public static String generate(int length) {
            Random random = new Random();
            StringBuilder inviteCode = new StringBuilder(length);
            for (int i = 0; i < length; i++) {
                inviteCode.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
            }
            return inviteCode.toString();
        }

        // 生成邀请码并保存到数据库中
        public static String create(String custName) {
            String custInviteNum = generate(6); // 生成长度为6的邀请码
            // TODO: 在这里插入将用户信息和邀请码保存到数据库的代码
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO customer (cust_name, cust_invite_num) VALUES (?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, custName);
                    stmt.setString(2, custInviteNum);
                    stmt.executeUpdate();
                }
            } catch (SQLException e) {
                // 处理异常
                e.printStackTrace();
            }
            return custInviteNum;

        }

        /*// 测试生成邀请码的方法
        public static void main(String[] args) {
            System.out.println(generate(6)); // 输出一个长度为6的邀请码
            String inviteCode = create("custName"); // 生成邀请码并保存到数据库中
            System.out.println(inviteCode);
        }*/
    }

