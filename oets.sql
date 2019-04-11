/*
 Navicat Premium Data Transfer

 Source Server         : TizoZhang
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : oets

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 29/01/2019 10:25:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, '001', '数据结构', '001', '');
INSERT INTO `classes` VALUES (2, '002', '高等数学', '002', '');
INSERT INTO `classes` VALUES (3, '003', '大学英语', '001', NULL);
INSERT INTO `classes` VALUES (4, '004', 'jsp程序设计', '002', '');
INSERT INTO `classes` VALUES (5, '005', '编译原理', '003', NULL);
INSERT INTO `classes` VALUES (8, '006', '软件工程', '004', NULL);
INSERT INTO `classes` VALUES (16, '007', '大学物理', '001', NULL);
INSERT INTO `classes` VALUES (18, '008', '计算机导论', '004', NULL);
INSERT INTO `classes` VALUES (19, '009', '概率论', '005', NULL);
INSERT INTO `classes` VALUES (20, '010', '离散数学', '005', 'a');
INSERT INTO `classes` VALUES (21, '011', 'java程序设计', '003', NULL);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '001', '001', 38, '不及格');
INSERT INTO `grade` VALUES (2, '001', '002', 66, '');
INSERT INTO `grade` VALUES (3, '001', '003', 33, '不及格');
INSERT INTO `grade` VALUES (4, '001', '004', 67, NULL);
INSERT INTO `grade` VALUES (5, '002', '001', 78, NULL);
INSERT INTO `grade` VALUES (6, '002', '002', 89, NULL);
INSERT INTO `grade` VALUES (7, '002', '003', 56, '不及格');
INSERT INTO `grade` VALUES (8, '002', '004', 99, '优秀');
INSERT INTO `grade` VALUES (10, '001', '005', 55, '不及格');
INSERT INTO `grade` VALUES (11, '002', '005', 77, NULL);
INSERT INTO `grade` VALUES (15, '001', '006', 55, '');
INSERT INTO `grade` VALUES (17, '003', '001', 66, NULL);
INSERT INTO `grade` VALUES (18, '003', '002', 56, '不及格');
INSERT INTO `grade` VALUES (19, '003', '003', 87, NULL);
INSERT INTO `grade` VALUES (20, '003', '004', 99, '优秀');
INSERT INTO `grade` VALUES (21, '003', '005', 72, NULL);
INSERT INTO `grade` VALUES (22, '004', '001', 34, '不及格');
INSERT INTO `grade` VALUES (23, '004', '002', 56, '不及格');
INSERT INTO `grade` VALUES (24, '004', '003', 98, '优秀');
INSERT INTO `grade` VALUES (25, '004', '004', 88, NULL);
INSERT INTO `grade` VALUES (26, '004', '005', 67, NULL);
INSERT INTO `grade` VALUES (27, '006', '001', 33, '不及格');
INSERT INTO `grade` VALUES (28, '006', '002', 44, '不及格');
INSERT INTO `grade` VALUES (29, '006', '003', 65, NULL);
INSERT INTO `grade` VALUES (30, '006', '004', 59, '');
INSERT INTO `grade` VALUES (31, '006', '005', 51, '不及格');
INSERT INTO `grade` VALUES (32, '006', '006', 43, '不及格');
INSERT INTO `grade` VALUES (35, '001', '007', 62, NULL);
INSERT INTO `grade` VALUES (36, '001', '008', 88, NULL);
INSERT INTO `grade` VALUES (37, '001', '009', 77, NULL);
INSERT INTO `grade` VALUES (38, '002', '005', 66, NULL);
INSERT INTO `grade` VALUES (39, '002', '006', 87, NULL);
INSERT INTO `grade` VALUES (40, '002', '007', 77, NULL);
INSERT INTO `grade` VALUES (41, '003', '006', 99, NULL);
INSERT INTO `grade` VALUES (42, '003', '007', 88, NULL);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` int(1) NOT NULL,
  `user_age` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (14, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 35, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_sex` int(1) NOT NULL,
  `s_age` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '001', '张三', 1, 22, '');
INSERT INTO `student` VALUES (2, '002', '李四', 2, 21, NULL);
INSERT INTO `student` VALUES (4, '003', '王二', 1, 23, NULL);
INSERT INTO `student` VALUES (5, '004', '赵四', 1, 22, NULL);
INSERT INTO `student` VALUES (9, '005', '李华', 2, 22, NULL);
INSERT INTO `student` VALUES (10, '006', '计全', 1, 23, NULL);
INSERT INTO `student` VALUES (12, '007', '刘伟', 1, 22, NULL);
INSERT INTO `student` VALUES (13, '008', '张伟', 1, 23, NULL);
INSERT INTO `student` VALUES (14, '009', '张敏', 2, 21, NULL);
INSERT INTO `student` VALUES (15, '010', '李静', 2, 22, NULL);
INSERT INTO `student` VALUES (16, '011', '刘涛', 1, 23, NULL);
INSERT INTO `student` VALUES (17, '012', '刘洋', 1, 22, NULL);
INSERT INTO `student` VALUES (18, '013', '张磊', 1, 24, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_sex` int(1) NOT NULL,
  `t_age` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '001', '张曼曼', 1, 22, '');
INSERT INTO `teacher` VALUES (2, '002', '张天泽', 1, 23, '');
INSERT INTO `teacher` VALUES (3, '003', '王政', 1, 22, NULL);
INSERT INTO `teacher` VALUES (4, '004', '高嘉忆', 2, 22, '');
INSERT INTO `teacher` VALUES (5, '005', '陈家辉', 1, 23, '');
INSERT INTO `teacher` VALUES (7, '006', '代紫葳', 2, 21, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` int(1) NOT NULL,
  `user_age` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (16, '10001', '827ccb0eea8a706c4c34a16891f84e7b', 1, 18, '');

SET FOREIGN_KEY_CHECKS = 1;
