/*
 Navicat Premium Data Transfer

 Source Server         : ZhangTizo
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : oets

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 28/05/2019 17:28:09
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
  `optionA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionB` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (5, 'What do you think______solve the problem ?', 'you can do', 'can you do', 'you can do to', 'can you do to', 'C', 1);
INSERT INTO `question` VALUES (6, 'In the past he often made his sister______,but now he is often made______by his sister.', 'to cry; to cry', 'cry; cry ', 'to cry; cry', 'cry; to cry', 'D', 1);
INSERT INTO `question` VALUES (7, 'The teacher told us that the sun______in the east.', 'rises', 'rose', 'raises', 'raised', 'A', 1);
INSERT INTO `question` VALUES (8, 'He lives in a village______there are a lot of trees.', 'there', 'where', 'that', 'which', 'B', 1);
INSERT INTO `question` VALUES (9, 'He______Alice for ten years.', 'married to', 'has married to', 'has married', 'has been married to', 'D', 1);
INSERT INTO `question` VALUES (10, 'We need fifteen more people______our team to do the job.', 'but', 'except', 'as well', 'besides', 'D', 1);
INSERT INTO `question` VALUES (11, 'They won`t allow us______at this beach.', 'swimming', 'to swim', 'swam', 'swim', 'B', 1);
INSERT INTO `question` VALUES (12, 'Is this factory______you visited last week?', 'that', 'where', 'the one', 'in which', 'C', 1);
INSERT INTO `question` VALUES (13, 'The reason______he was absent from the meeting was______his car broke down on the way.', 'that; because', 'why; that', 'that; that', 'for; that', 'B', 1);
INSERT INTO `question` VALUES (14, 'Is the river______through that town very large?', 'which flows', 'flows', 'that flowing', 'whose flows', 'A', 1);
INSERT INTO `question` VALUES (15, 'The teacher told me that the students I wanted to see were seen______football on the playground just now.', 'playing', 'to be playing', 'play', 'to play', 'A', 1);
INSERT INTO `question` VALUES (16, 'The red rose is the only one______I real like.', 'which', 'who', 'that', 'whom', 'C', 1);
INSERT INTO `question` VALUES (17, 'All the apples______fell down were eaten by the pigs.', 'those', 'which', 'what', 'that', 'D', 1);
INSERT INTO `question` VALUES (18, 'Don`t forget the day______you were received into the Youth League.', 'when', 'that', 'at which', 'where', 'A', 1);
INSERT INTO `question` VALUES (19, 'I prefer______at home to______outside.', 'staying, playing', 'to stay, play', 'staying, play', 'to stay, playing', 'A', 1);
INSERT INTO `question` VALUES (20, 'The box is______what I saw in the shop.', 'same as', 'the same like', 'the same that', 'the same as', 'D', 1);
INSERT INTO `question` VALUES (21, 'The pen______she writes letters is broken.', 'which', 'that', 'with which', 'by which', 'C', 1);
INSERT INTO `question` VALUES (22, 'Would you like to______us in our discussion.', 'take part in', 'join', 'taking part in', 'joining', 'B', 1);
INSERT INTO `question` VALUES (23, 'I`m sure the red team will______the game.', 'win', 'beat', 'defeat', 'succeed', 'A', 1);
INSERT INTO `question` VALUES (24, 'Ahead of me I saw a woman______I thought was my aunt.', 'who', 'whom', 'of whom', 'whose', 'A', 1);

-- ----------------------------
-- Table structure for reading
-- ----------------------------
DROP TABLE IF EXISTS `reading`;
CREATE TABLE `reading`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (19, 's001', 'ZhangSan', 'f3b9b293fb647cdd11c124ee0cd0ae53', 1, 20, '', NULL);
INSERT INTO `student` VALUES (25, 's002', 'LiSi', 'c802a8614c51d3572ada08df3ab2bbf5', 2, 23, '毕业生', NULL);
INSERT INTO `student` VALUES (38, 's003', '刘东', 'f104032099319bda9e1bd8fbf9a38729', 1, 22, '', NULL);
INSERT INTO `student` VALUES (39, 's004', '张莉', 'ebdfd483c1044d1f8e372a7b6d31080b', 2, 20, '', NULL);
INSERT INTO `student` VALUES (40, 's005', '王武', 'a89ed0e7eca5d29e408fd970104d6634', 1, 25, '', NULL);
INSERT INTO `student` VALUES (41, 's006', '赵四', '2572e3ab3f0bfded114d058f07260f79', 1, 22, '', NULL);
INSERT INTO `student` VALUES (42, 's007', '刘凯', 'eab5fa7518f8d18a5086dabf21b180f1', 1, 23, '', NULL);
INSERT INTO `student` VALUES (43, 's008', '李栋海', '32d93997a16c85a990a8cc2748e44912', 1, 23, '', NULL);
INSERT INTO `student` VALUES (44, 's009', '周天勇', 'fc2c3ddd14a37b0f3087fac39165ecd7', 1, 25, '', NULL);
INSERT INTO `student` VALUES (45, 's010', '吴思远', 'bdc24c4080efb28cfd1a609fe191067f', 1, 21, '', NULL);
INSERT INTO `student` VALUES (46, 's011', '郑浩南', '8b0189287cf21e3bfedc59b8fee3ca4e', 1, 23, '', NULL);
INSERT INTO `student` VALUES (47, 's012', '王冠杰', '7c3982c1129e7fc3df0d1940f3f661af', 1, 24, '', NULL);
INSERT INTO `student` VALUES (48, 's013', '冯鹏飞', 'e344d0ff5c4139822e5f1b4524da0a73', 1, 23, '', NULL);
INSERT INTO `student` VALUES (49, 's014', '陈天佳', 'a5847a231ebce80d5a3d6b7c178fe466', 2, 23, '', NULL);
INSERT INTO `student` VALUES (50, 's015', '魏雨婷', '61288be84a926b3bf8ba0a09303758a8', 2, 25, '', NULL);
INSERT INTO `student` VALUES (51, 's016', '李鹏', '1da8e6ddc9a6872777cb25a7c06721b2', 1, 23, '', NULL);
INSERT INTO `student` VALUES (52, 's017', '姚远凡', '14dfa573f25b9a0bfc5c06185ac18e18', 1, 21, '', NULL);
INSERT INTO `student` VALUES (53, 's018', '张少平', '383af3f7b9053f782d51d8634216a400', 1, 23, '', NULL);
INSERT INTO `student` VALUES (54, 's019', '梁晓燕', '3dec9621bc284d5836e9e6577e649c80', 2, 22, '', NULL);
INSERT INTO `student` VALUES (55, 's020', '段晓莉', 'cd4bce8dfced4d5af7aad36fab2693ef', 2, 22, '', NULL);
INSERT INTO `student` VALUES (56, 's021', '张岩', 'fd93645d4308c473ae2827568d418d4a', 1, 23, '', NULL);
INSERT INTO `student` VALUES (57, 's022', '李永亮', '7fce5ca9758db35ea6f1f826a5e0d0f3', 1, 22, '', NULL);
INSERT INTO `student` VALUES (58, 's023', '黄晓华', 'a1f6502f73beb3302d83e5b75d2da68e', 1, 23, '', NULL);
INSERT INTO `student` VALUES (59, 's024', '张宁', 'd23079d1bcc222dc5158e6ffa157dadd', 1, 24, '', NULL);
INSERT INTO `student` VALUES (60, 's025', '邢晓婷', '7fdb5bb21d8ef0dce86622ea4e62a6b3', 2, 23, '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2, 't001', '徐明亮', '9dfbc2c9b1e17797e55062b21eaba4c3', 1, 32, '');
INSERT INTO `teacher` VALUES (9, 't002', '郭娟萍', 'd4944aa4fe9a16c1afc5c2048a719dcb', 2, 30, '');
INSERT INTO `teacher` VALUES (10, 't003', '赵磊', '653de8d38e383f016345630b19591fb0', 1, 35, '实习教师');
INSERT INTO `teacher` VALUES (11, 't004', '白斌', 'eee4281f10a47f9f7173a75fcedb39a5', 1, 37, '');
INSERT INTO `teacher` VALUES (12, 't005', '刘曼莉', '8f1a42073a667d490e7bd8077ba3e294', 2, 32, '');
INSERT INTO `teacher` VALUES (13, 't006', '周慧芬', '60e9c9c1c3f7790595d3983d862c1a1d', 2, 33, '');

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

SET FOREIGN_KEY_CHECKS = 1;
