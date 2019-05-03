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

 Date: 03/05/2019 15:49:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for connection
-- ----------------------------
DROP TABLE IF EXISTS `connection`;
CREATE TABLE `connection`  (
  `pid` int(11) NOT NULL,
  `qid` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of connection
-- ----------------------------
INSERT INTO `connection` VALUES (2, 3);
INSERT INTO `connection` VALUES (2, 4);
INSERT INTO `connection` VALUES (1, 3);
INSERT INTO `connection` VALUES (1, 4);
INSERT INTO `connection` VALUES (4, 3);
INSERT INTO `connection` VALUES (4, 4);
INSERT INTO `connection` VALUES (5, 3);
INSERT INTO `connection` VALUES (5, 4);
INSERT INTO `connection` VALUES (7, 3);
INSERT INTO `connection` VALUES (7, 4);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (14, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionB` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (3, 'sad', 'g', 't', 'j', 'y', 'B');
INSERT INTO `question` VALUES (4, 'dsad', 'a', 'v', 's', 'r', 'A');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `stuno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, 7, 's001', 10, '2019-05-03 14:56:19');
INSERT INTO `score` VALUES (2, 7, 's001', 20, '2019-05-03 14:56:19');
INSERT INTO `score` VALUES (3, 7, 's001', 10, '2019-05-03 14:58:04');
INSERT INTO `score` VALUES (4, 7, 's001', 20, '2019-05-03 14:58:04');
INSERT INTO `score` VALUES (5, 7, 's001', 20, '2019-05-03 15:00:26');
INSERT INTO `score` VALUES (6, 7, 's001', 10, '2019-05-03 15:03:55');
INSERT INTO `score` VALUES (7, 7, 's001', 10, '2019-05-03 15:06:56');
INSERT INTO `score` VALUES (8, 7, 's001', 0, '2019-05-03 15:39:33');
INSERT INTO `score` VALUES (9, 7, 's001', 10, '2019-05-03 15:40:44');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remember` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (19, 's001', 'a', 'f3b9b293fb647cdd11c124ee0cd0ae53', 1, 20, '', NULL);
INSERT INTO `student` VALUES (25, 's002', 'b', 'c802a8614c51d3572ada08df3ab2bbf5', 2, 23, 'mmm', NULL);
INSERT INTO `student` VALUES (34, 'aaaa', 'ssss', '74b87337454200d4d33f80c4663dc5e5', 1, 23, 'sss', NULL);
INSERT INTO `student` VALUES (35, 'sd', '23', '6226f7cbe59e99a90b5cef6f94f966fd', 1, 20, '', NULL);
INSERT INTO `student` VALUES (36, 'fdf', 'sd', 'f0118e9bd2c4fb29c64ee03abce698b8', 2, 23, 'hj', NULL);
INSERT INTO `student` VALUES (37, '45', 'wer', '6c8349cc7260ae62e3b1396831a8398f', 1, 23, '4', NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teano` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2, 't001', 't', '9dfbc2c9b1e17797e55062b21eaba4c3', 2, 28, '');

-- ----------------------------
-- Table structure for testpaper
-- ----------------------------
DROP TABLE IF EXISTS `testpaper`;
CREATE TABLE `testpaper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testpaper
-- ----------------------------
INSERT INTO `testpaper` VALUES (1, 'sdasdasd', '2019-04-30 06:00:00', '2019-04-30 08:52:00');
INSERT INTO `testpaper` VALUES (2, '21212112', '2019-05-01 14:00:00', '2019-05-01 16:00:00');
INSERT INTO `testpaper` VALUES (3, 'asdsadasd', '2019-04-30 21:42:00', '2019-04-30 23:42:00');
INSERT INTO `testpaper` VALUES (4, 'dfasdasdad', '2019-05-01 12:00:00', '2019-05-01 16:00:00');
INSERT INTO `testpaper` VALUES (5, 'adsfgdsd54546', '2019-05-01 19:54:00', '2019-05-01 20:54:00');
INSERT INTO `testpaper` VALUES (6, 'adgjtyuyuj', '2019-05-02 23:11:00', '2019-05-02 23:55:00');
INSERT INTO `testpaper` VALUES (7, '15616fgdgfgdfg', '2019-05-03 14:27:00', '2019-05-03 16:27:00');

SET FOREIGN_KEY_CHECKS = 1;
