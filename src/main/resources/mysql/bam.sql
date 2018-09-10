/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : bam

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 10/09/2018 20:13:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(1) NULL DEFAULT 1,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_accountname`(`accountname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', 'admin', 1, '12345678910');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_price` double(5, 1) NULL DEFAULT NULL,
  `book_publish` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_number` int(11) NOT NULL,
  `book_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `books_name`(`book_name`) USING BTREE,
  INDEX `books_type`(`book_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'MySQL', 'tool', 11.0, 'guangdonghighedu', 1, 'guide');
INSERT INTO `books` VALUES (2, 'wordguide', 'tool', 11.0, 'guangdong', 6, 'guide');
INSERT INTO `books` VALUES (3, '就业指导', '工具书', 11.0, '广东高等教育出版社', 4, '就业指导');
INSERT INTO `books` VALUES (4, '无限传感网', '工具书', 31.0, '清华大学出版社', 4, '无限传感网络技术原理及应用');
INSERT INTO `books` VALUES (5, 'Java程序设计教程', '工具书', 21.0, '清华大学出版社', 2, 'Java');
INSERT INTO `books` VALUES (6, 'Linux实用教程', '工具书', 6.0, '人民邮电出版社', 3, 'Linux');
INSERT INTO `books` VALUES (7, '计算机英语', 'English', 36.0, '人民邮电出版社', 3, '计算机的英语专业英语');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` int(5) NOT NULL,
  `user_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_id` int(5) NOT NULL,
  `book_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starttime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finishtime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 7, '我是测试', 2, 'wordguide', '2018-09-10', '2018-09-17', 1);
INSERT INTO `orders` VALUES (2, 7, '我是测试', 5, 'Java程序设计教程', '2018-09-10', '2018-09-15', 1);
INSERT INTO `orders` VALUES (3, 7, '我是测试', 4, '无限传感网', '2018-09-10', '2018-09-15', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(2) NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idnumber` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_accountname`(`username`) USING BTREE,
  INDEX `user_idnumber`(`idnumber`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', '000000', '用户', 1, '1234567891', '445466596587456321');
INSERT INTO `user` VALUES (2, 'user01', '123456', '用户01', 1, '12345678910', '449566596587456320');
INSERT INTO `user` VALUES (3, 'test', '666666', '测试', 0, '14563524125', '440516199810185635');
INSERT INTO `user` VALUES (7, '我是测试', '1234', '我叫测试', 1, '12345678911', '444566596587456321');

SET FOREIGN_KEY_CHECKS = 1;
