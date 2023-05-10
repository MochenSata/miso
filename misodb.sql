/*
 Navicat Premium Data Transfer

 Source Server         : miso
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 192.168.1.139:3307
 Source Schema         : misodb

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 09/05/2023 20:46:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `com_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `cust_id` int(0) NOT NULL COMMENT '用户id\r\n',
  `cust_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户姓名',
  `com_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `com_create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论创建时间',
  `house_id` int(0) NOT NULL COMMENT '房间id',
  `com_score` float NULL DEFAULT NULL COMMENT '房客评分',
  `myorder_id` int(0) NOT NULL COMMENT '订单id',
  `version` int(0) NULL DEFAULT NULL COMMENT '版本',
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`com_id`) USING BTREE,
  INDEX `fk_cust_com_name`(`cust_name`) USING BTREE,
  INDEX `fk_myorder_com`(`myorder_id`) USING BTREE,
  INDEX `fk_cust_com_id`(`cust_id`) USING BTREE,
  INDEX `fk_com_house`(`house_id`) USING BTREE,
  CONSTRAINT `fk_myorder_com` FOREIGN KEY (`myorder_id`) REFERENCES `myorder` (`myorder_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_com_house` FOREIGN KEY (`house_id`) REFERENCES `house` (`house_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cust_com` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2001, 1, '蔡徐坤', '哎呦，你干嘛~', '2023-04-15 14:24:52', 1001, 4.5, 5001, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (2002, 2, '王一博', '早上迷迷糊糊睁眼的时候，就看到了整片橘子海，真的太浪漫太美了\n真的感觉被狠狠治愈到了', '2023-04-15 14:26:16', 1002, 5, 5002, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (2003, 3, '刘晓辉', '好评', '2023-04-15 14:27:48', 1003, 3.5, 5003, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (2004, 4, '王心凌', '爱你', '2023-04-15 14:30:16', 1004, 4.8, 5004, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (2005, 5, '樊大勇', '柠檬', '2023-04-15 14:32:01', 1005, 4.6, 5005, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `cou_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `cou_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '优惠券名称',
  `cou_category` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠券类别',
  `cou_price` float NOT NULL COMMENT '优惠券金额',
  `cou_valid_time` datetime(0) NOT NULL COMMENT '生效时间',
  `cou_invalid_time` datetime(0) NULL DEFAULT NULL COMMENT '失效时间',
  `cou_status` int(0) NOT NULL COMMENT '优惠券状态（0：生效中，1：已失效）',
  `cou_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠券介绍',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '版本',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态',
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  ` cou_count` int(0) NULL DEFAULT NULL COMMENT '优惠券库存',
  PRIMARY KEY (`cou_id`) USING BTREE,
  INDEX `cou_price`(`cou_price`) USING BTREE,
  INDEX `cou_introduction`(`cou_introduction`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES (4001, '新人券_10元', '新人券', 10, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 0, '使用该新人优惠券可抵10元！', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon` VALUES (4002, '满减券_10元', '满减券', 10, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 0, '使用该满减优惠券可抵10元！', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon` VALUES (4003, '假日券_10元', '假日券', 10, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 0, '在假日使用该假日优惠券可抵10元！', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon` VALUES (4004, '分享券_10元', '分享券', 10, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 0, '使用该分享优惠券可抵10元！', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon` VALUES (4005, '满减券_50元', '满减券', 50, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 0, '使用该满减优惠券可抵50元！', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for coupon_receive
-- ----------------------------
DROP TABLE IF EXISTS `coupon_receive`;
CREATE TABLE `coupon_receive`  (
  `cou_detail_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券详情id',
  `cou_num` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '优惠券编号',
  `cou_id` int(0) NULL DEFAULT NULL COMMENT '优惠券id',
  `cust_id` int(0) NOT NULL COMMENT '用户id',
  `cou_price` float NOT NULL COMMENT '优惠券金额',
  `cou_receive_time` datetime(0) NOT NULL COMMENT '优惠券领取时间',
  `cou_use_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券使用时间',
  `cou_end_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券截止时间',
  `cou_usage_status` int(0) NOT NULL COMMENT '优惠券使用状态（0：未使用，1：已使用，2：已失效）',
  `version` int(0) NULL DEFAULT NULL COMMENT '版本',
  `status` int(0) NULL DEFAULT NULL,
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cou_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠券介绍',
  PRIMARY KEY (`cou_detail_id`) USING BTREE,
  INDEX `fk_cou_detail`(`cou_id`) USING BTREE,
  INDEX `fk_cou_cust`(`cust_id`) USING BTREE,
  INDEX `cou_num`(`cou_num`) USING BTREE,
  INDEX `fk_cou_reveice_cou`(`cou_price`) USING BTREE,
  INDEX `fk_cou_intro`(`cou_introduction`) USING BTREE,
  CONSTRAINT `fk_cou_cust` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cou_detail` FOREIGN KEY (`cou_id`) REFERENCES `coupon` (`cou_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cou_intro` FOREIGN KEY (`cou_introduction`) REFERENCES `coupon` (`cou_introduction`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cou_reveice_cou` FOREIGN KEY (`cou_price`) REFERENCES `coupon` (`cou_price`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_receive
-- ----------------------------
INSERT INTO `coupon_receive` VALUES (40001, 'defef345ghfht654g', 4001, 1, 10, '2023-03-01 12:00:00', NULL, '2023-04-01 12:00:00', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon_receive` VALUES (40002, 'ohlg4kgfo6gkf34d', 4002, 2, 10, '2023-03-01 12:30:35', NULL, '2023-03-07 12:30:35', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon_receive` VALUES (40003, 'f49gvocf0cjdr4ng', 4004, 1, 10, '2023-03-01 13:00:00', NULL, '2023-04-01 13:00:00', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon_receive` VALUES (40004, 'pevmd9dvjdu34fn', 4004, 4, 10, '2023-04-14 20:10:18', NULL, '2023-04-21 20:10:26', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `coupon_receive` VALUES (40005, 'vd0fjv9fjv4kvm9v', 4005, 3, 50, '2023-04-14 20:11:01', NULL, '2023-04-21 20:11:04', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cust_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `cust_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `cust_pwd` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `cust_gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别',
  `cust_telno` bigint(0) NOT NULL COMMENT '用户手机号',
  `cust_email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `cust_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cust_create_time` datetime(0) NOT NULL COMMENT '用户创建时间',
  `cust_update_time` datetime(0) NULL DEFAULT NULL COMMENT '用户更新时间',
  `cust_headshort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `version` int(0) NULL DEFAULT NULL COMMENT '版本',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态',
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cust_invite_num` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邀请码',
  PRIMARY KEY (`cust_id`) USING BTREE,
  INDEX `cust_name`(`cust_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '蔡徐坤', '123456', 'M', 18018888888, '18018888888@qq.com', NULL, '2023-03-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (2, '王一博', '123456', 'M', 18019999999, '18019999999@qq.com', NULL, '2023-03-01 12:30:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (3, '刘晓辉', '123456', 'M', 18818880000, NULL, NULL, '2023-01-01 10:30:45', '2023-01-01 10:35:45', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (4, '王心凌', '123456', 'F', 18000008888, '18000008888@163.com', NULL, '2023-01-02 10:00:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (5, '樊大勇', '123456', 'M', 19819990000, NULL, NULL, '2023-01-03 09:00:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `house_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '房屋id',
  `house_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房屋名称',
  `house_kind` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋种类',
  `house_status` int(0) NOT NULL COMMENT '房间出租状态（0：未出租  1：已出租）',
  `house_mainpicture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋主图片',
  `house_score` float NOT NULL COMMENT '房屋评分\r\n房屋评分（0-5,一星号为一分，半星为半分）',
  `house_price` float NOT NULL COMMENT '房屋起步价',
  `bed_count` int(0) NULL DEFAULT NULL COMMENT '床数',
  `house_cust_count` int(0) NULL DEFAULT NULL COMMENT '房屋可住人数',
  `house_toiletcount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋卫生间数',
  `house_rentnum` int(0) NULL DEFAULT NULL COMMENT '房间出租次数',
  `create_time` datetime(0) NOT NULL COMMENT '表创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '表更新时间',
  `version` int(0) NULL DEFAULT NULL COMMENT '表版本',
  `status` int(0) NULL DEFAULT NULL COMMENT '表状态',
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他字段1',
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他字段2',
  `house_intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋详细介绍',
  `house_facility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋设施介绍',
  `house_room_num` int(0) NULL DEFAULT NULL COMMENT '房屋卧室数量',
  `house_pic_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `house_pic_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `house_pic_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `house_pic_four` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `house_theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`house_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1001, '苏州湾欧式船屋', '船屋', 0, '10001', 4.6, 298.9, NULL, NULL, NULL, NULL, '2023-04-14 20:02:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `house` VALUES (1002, '苏州湾豪华海景房', '海景房', 0, NULL, 4.8, 398.5, NULL, NULL, NULL, NULL, '2023-04-14 19:54:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `house` VALUES (1003, '苏州湾特色农家院', '农家院', 0, NULL, 4.7, 368, NULL, NULL, NULL, NULL, '2023-04-14 20:02:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `house` VALUES (1004, '苏州湾特色集装箱', '集装箱', 0, NULL, 4.5, 268, NULL, NULL, NULL, NULL, '2023-04-14 20:03:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `house` VALUES (1005, '苏州湾特色四卧公寓', '公寓', 0, NULL, 4.6, 568, NULL, NULL, NULL, NULL, '2023-04-14 20:04:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `house` VALUES (1006, '苏州湾特色蒙古包', '蒙古包', 0, NULL, 4.7, 488, NULL, NULL, NULL, NULL, '2023-04-14 20:04:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_status` int(0) NULL DEFAULT NULL COMMENT '消息状态',
  `message_create_time` datetime(6) NULL DEFAULT NULL COMMENT '消息创建时间',
  `message_update_time` datetime(6) NULL DEFAULT NULL COMMENT '消息更新时间',
  `cust_id` int(0) NOT NULL COMMENT '用户id',
  `message_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息详情内容',
  `message_sendtime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `version` int(0) NULL DEFAULT NULL,
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `fk_customer_messagedetail`(`cust_id`) USING BTREE,
  CONSTRAINT `fk_customer_messagedetail` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (30001, 1, NULL, NULL, 1, '您在miso上预定的苏州湾欧式船屋从2023/4/16入住1晚已确认，欢迎入住！', '2023-04-15 11:07:11', NULL, NULL, NULL);
INSERT INTO `message` VALUES (30002, 1, NULL, NULL, 2, '您在miso上预定的苏州湾豪华海景房从2023/4/17入住1晚已确认，欢迎入住！', '2023-04-15 11:23:28', NULL, NULL, NULL);
INSERT INTO `message` VALUES (30003, 1, NULL, NULL, 3, '您在miso上预定的苏州湾特色农家院从2023/4/17入住2晚已确认，欢迎入住！', '2023-04-15 11:26:00', NULL, NULL, NULL);
INSERT INTO `message` VALUES (30004, 1, NULL, NULL, 4, '您在miso上预定的苏州湾特色四卧公寓从2023/4/18入住1晚已确认，欢迎入住！', '2023-04-15 11:29:50', NULL, NULL, NULL);
INSERT INTO `message` VALUES (30005, 1, NULL, NULL, 5, '您在miso上预定的苏州湾特色蒙古包从2023/4/19入住1晚已确认，欢迎入住！', '2023-04-15 11:31:20', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for myorder
-- ----------------------------
DROP TABLE IF EXISTS `myorder`;
CREATE TABLE `myorder`  (
  `myorder_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `myorder_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `cust_id` int(0) NOT NULL COMMENT '用户id',
  `house_id` int(0) NOT NULL COMMENT '房屋id',
  `house_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋名称',
  `house_mainpicture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋主图片',
  `house_price` float NOT NULL COMMENT '房屋起步价',
  `myorder_create_time` datetime(0) NOT NULL COMMENT '订单创建时间',
  `myorder_update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改订单时间',
  `myorder_status` int(0) NOT NULL COMMENT '订单状态：0未支付，1已支付，2已完成，3已取消',
  `cou_num` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠券编号',
  `cou_price` float NULL DEFAULT NULL COMMENT '优惠券金额',
  `myorder_price` float NOT NULL COMMENT '订单价格',
  `myorder_day` int(0) NOT NULL COMMENT '预定天数',
  `myorder_intime` date NOT NULL COMMENT '入住日期',
  `myorder_outime` date NOT NULL COMMENT '离房日期',
  `myorder_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单备注',
  `version` int(0) NULL DEFAULT NULL,
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`myorder_id`) USING BTREE,
  UNIQUE INDEX `myorder_num`(`myorder_num`) USING BTREE,
  INDEX `fk_myorder_customer`(`cust_id`) USING BTREE,
  INDEX `fk_myorder_house`(`house_id`) USING BTREE,
  INDEX `fk_myorder_coupon_receive`(`cou_num`) USING BTREE,
  INDEX `fk_myorder_coupon`(`cou_price`) USING BTREE,
  CONSTRAINT `fk_myorder_coupon` FOREIGN KEY (`cou_price`) REFERENCES `coupon_receive` (`cou_price`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_myorder_coupon_receive` FOREIGN KEY (`cou_num`) REFERENCES `coupon_receive` (`cou_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_myorder_customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_myorder_house` FOREIGN KEY (`house_id`) REFERENCES `house` (`house_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myorder
-- ----------------------------
INSERT INTO `myorder` VALUES (5001, 'dd5001', 1, 1001, '苏州湾欧式船屋', NULL, 298.5, '2023-04-15 11:07:10', NULL, 0, 'defef345ghfht654g', 10, 596, 2, '2023-04-16', '2023-04-17', NULL, NULL, NULL, NULL);
INSERT INTO `myorder` VALUES (5002, 'dd5002', 2, 1002, '苏州湾豪华海景房', NULL, 398, '2023-04-15 11:23:26', NULL, 0, 'ohlg4kgfo6gkf34d', 10, 388, 1, '2023-04-17', '2023-04-18', NULL, NULL, NULL, NULL);
INSERT INTO `myorder` VALUES (5003, 'dd5003', 3, 1003, '苏州湾特色农家院', NULL, 368, '2023-04-15 11:25:59', NULL, 0, 'vd0fjv9fjv4kvm9v', 50, 1054, 3, '2023-04-17', '2023-04-19', NULL, NULL, NULL, NULL);
INSERT INTO `myorder` VALUES (5004, 'dd5004', 4, 1004, '苏州湾特色四卧公寓', NULL, 568, '2023-04-15 11:29:48', NULL, 0, 'pevmd9dvjdu34fn', 10, 558, 1, '2023-04-18', '2023-04-19', NULL, NULL, NULL, NULL);
INSERT INTO `myorder` VALUES (5005, 'dd5005', 5, 1005, '苏州湾特色蒙古包', NULL, 488, '2023-04-15 11:31:19', NULL, 0, NULL, NULL, 488, 1, '2023-04-19', '2023-04-20', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for myorder_occupy
-- ----------------------------
DROP TABLE IF EXISTS `myorder_occupy`;
CREATE TABLE `myorder_occupy`  (
  `occ_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单入住人信息Id',
  `myorder_id` int(0) NOT NULL COMMENT '订单Id',
  `cust_id` int(0) NOT NULL COMMENT '下单人',
  `occ_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入住人姓名',
  `occ_telno` bigint(0) NOT NULL COMMENT '入住人手机号',
  `version` int(0) NULL DEFAULT NULL,
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `other2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `occ_identity` bigint(0) NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`occ_id`) USING BTREE,
  INDEX `fk_myorder_occupy_myorder`(`myorder_id`) USING BTREE,
  INDEX `fk_myorder_occupy_customer`(`cust_id`) USING BTREE,
  CONSTRAINT `fk_myorder_occupy_customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_myorder_occupy_myorder` FOREIGN KEY (`myorder_id`) REFERENCES `myorder` (`myorder_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `pay_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '流水信息ID',
  `pay_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流水号',
  `cust_id` int(0) NOT NULL COMMENT '用户id',
  `myorder_id` int(0) NOT NULL COMMENT '订单id',
  `myorder_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `pay_status` int(0) NOT NULL COMMENT '支付状态：0未支付，1已支付，2已取消',
  `pay_amount` float NOT NULL COMMENT '支付金额',
  `pay_createtime` datetime(0) NOT NULL COMMENT '支付创建时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `version` int(0) NULL DEFAULT NULL,
  `other1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oterh2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pay_updatetime` datetime(0) NULL DEFAULT NULL COMMENT '支付表更新时间',
  PRIMARY KEY (`pay_id`) USING BTREE,
  UNIQUE INDEX `pay_num`(`pay_num`) USING BTREE,
  INDEX `fk_pay_customer`(`cust_id`) USING BTREE,
  INDEX `fk_pay_myorder`(`myorder_id`) USING BTREE,
  INDEX `myorder_num`(`myorder_num`) USING BTREE,
  CONSTRAINT `fk_pay_customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pay_myorder` FOREIGN KEY (`myorder_id`) REFERENCES `myorder` (`myorder_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (7001, 'zf7001', 1, 5001, 'dd5001', 1, 1, '2023-04-15 11:42:12', '2023-04-15 11:42:01', NULL, NULL, NULL, NULL);
INSERT INTO `payment` VALUES (7002, 'zf7002', 2, 5002, 'dd5002', 1, 1, '2023-04-15 11:42:49', '2023-04-15 11:42:51', NULL, NULL, NULL, NULL);
INSERT INTO `payment` VALUES (7003, 'zf7003', 3, 5003, 'dd5003', 1, 1, '2023-04-15 11:45:06', '2023-04-15 11:45:08', NULL, NULL, NULL, NULL);
INSERT INTO `payment` VALUES (7004, 'zf7004', 4, 5004, 'dd5004', 1, 1, '2023-04-15 11:46:04', '2023-04-15 11:46:08', NULL, NULL, NULL, NULL);
INSERT INTO `payment` VALUES (7005, 'zf7005', 5, 5005, 'dd5005', 1, 1, '2023-04-15 11:46:29', '2023-04-15 11:46:35', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
