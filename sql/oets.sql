/*
 Navicat Premium Data Transfer

 Source Server         : ZhangTizo
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : oets

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 01/06/2019 00:34:42
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
INSERT INTO `connection` VALUES (8, 5);
INSERT INTO `connection` VALUES (8, 6);
INSERT INTO `connection` VALUES (8, 7);
INSERT INTO `connection` VALUES (8, 8);
INSERT INTO `connection` VALUES (8, 9);
INSERT INTO `connection` VALUES (8, 10);
INSERT INTO `connection` VALUES (8, 11);
INSERT INTO `connection` VALUES (8, 13);
INSERT INTO `connection` VALUES (8, 14);
INSERT INTO `connection` VALUES (8, 15);
INSERT INTO `connection` VALUES (8, 28);
INSERT INTO `connection` VALUES (8, 29);
INSERT INTO `connection` VALUES (8, 30);
INSERT INTO `connection` VALUES (8, 31);
INSERT INTO `connection` VALUES (8, 32);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `question` VALUES (27, 'A user interface we said here is______.', 'a text-based user interface or GUI', 'an interface between a computer and its peripheral device', 'an interaction between an operating system and a user', 'an interaction between an application program and a user', 'ABC', 2);
INSERT INTO `question` VALUES (28, 'Many viruses do harmful things such as______.', 'deleting files', 'slowing your PC down', 'simulating typos', 'changing random data on your disk', 'ABCD', 2);
INSERT INTO `question` VALUES (29, 'We can classify programming languages under two types:______languages and______languages.', 'high-level', 'low-level', 'advanced-level', 'basic-level', 'AB', 2);
INSERT INTO `question` VALUES (30, 'With an Internet connection you can get some of the basic services available are:______.', 'E-mail', 'Telnet', 'FTP', 'Usenet news', 'ABCD', 2);
INSERT INTO `question` VALUES (31, 'Windows 2000 has the key technologies, they are______.', 'security', 'active directory', 'flat directory', 'enterprise management', 'ABCD', 2);
INSERT INTO `question` VALUES (32, 'The register file is______.', 'addressed by much shorter addresses', 'physically large', 'physically small', 'one the same chip as the CPU', 'ACD', 2);
INSERT INTO `question` VALUES (33, 'The end equipment in a communication system includes______.', 'printers', 'computers', 'CRTs', 'keyboards', 'ABCD', 2);
INSERT INTO `question` VALUES (34, 'Microsoft Office Professional 2000 include______.', 'Excel 2000', 'PowerPoint 2000', 'Word 2000', 'Outlook 2000', 'ABCD', 2);
INSERT INTO `question` VALUES (35, 'Some viruses use______and______techniques to hide their existence.', 'quickly spread', 'replace a part of system software', 'stealth', 'polymorphic', 'CD', 2);
INSERT INTO `question` VALUES (36, 'The Windows 2000 product line includes______.', 'Windows 2000 Datacenter Server', 'Windows 2000 Professional', 'Windows 2000 Server', 'Windows 2000 Advanced Server', 'ABCD', 2);
INSERT INTO `question` VALUES (37, 'Similar to viruses, you can also find malicious code in ______.', 'Trojan Horses', 'logic bombs', 'worms', 'Microsoft Word Documents', 'ABC', 2);
INSERT INTO `question` VALUES (38, 'Active Directory can help you______.', 'get off the limits of down level networks', 'deliver complete enterprise security by itself', 'build a complex international network', 'manage every resource with a single logon', 'ACD', 2);
INSERT INTO `question` VALUES (39, '______maybe a certain cause that some viruses infect upon.', 'an external event on your PC', 'a day', 'a counter within the virus', 'a time', 'ABCD', 2);
INSERT INTO `question` VALUES (40, '______is a type of executable file.', 'TXT file', 'EXE file', 'COM file', 'JPG file', 'BC', 2);
INSERT INTO `question` VALUES (41, 'Modem is______.', 'a modulator/demodulator', 'a data set', 'a demodulator', 'a modulator', 'ACD', 2);
INSERT INTO `question` VALUES (42, 'The World Wide Web also subsumes previous Internet information system such as______.', 'Gopher', 'Ftp', 'FTP', 'Telnet', 'AC', 2);
INSERT INTO `question` VALUES (49, 'Jack brought the couple their food very fast because ______.', 'the manager asked him to do so', 'he respected the elderly', 'the couple wanted him to do so', 'he wanted more pay', 'B', 3);
INSERT INTO `question` VALUES (50, 'When Jack called the couple “elderly”, they became ______.', 'nervous', 'satisfied', 'unhappy', 'excited', 'C', 3);
INSERT INTO `question` VALUES (51, 'In Jack’s hometown, ______.', 'people dislike being called “old”', 'people are proud of being old', 'many people reach the age of seventy or eighty', 'the elderly are the first to get food in restaurants', 'B', 3);
INSERT INTO `question` VALUES (52, 'After this experience, Jack ______.', 'lost his job in the restaurant', 'made friends with the couple', 'no longer respected the elderly', 'changed his way with older people', 'D', 3);
INSERT INTO `question` VALUES (53, 'Which of the following is TRUE?', 'The more Jack explained, the angrier the couple got.', 'Jack wanted to show his feelings through words after his experience.', 'The manager went back to the table and apologized to the couple.', 'From this experience, Jack learned more about American culture.', 'D', 3);
INSERT INTO `question` VALUES (54, 'Jack brought the couple their food very fast because ______.', 'the manager asked him to do so', 'he respected the elderly', 'the couple wanted him to do so', 'he wanted more pay', 'B', 3);
INSERT INTO `question` VALUES (55, 'When Jack called the couple \"elderly\", they became ______.', 'nervous', 'satisfied', 'unhappy', 'excited', 'C', 3);
INSERT INTO `question` VALUES (56, 'In Jack’s hometown, ______.', 'people dislike being called \"old\"', 'people are proud of being old', 'many people reach the age of seventy or eighty', 'the elderly are the first to get food in restaurants', 'B', 3);
INSERT INTO `question` VALUES (57, 'After this experience, Jack ______.', 'lost his job in the restaurant', 'made friends with the couple', 'no longer respected the elderly', 'changed his way with older people', 'D', 3);
INSERT INTO `question` VALUES (58, 'Which of the following is TRUE?', 'The more Jack explained, the angrier the couple got.', 'Jack wanted to show his feelings through words after his experience.', 'The manager went back to the table and apologized to the couple.', 'From this experience, Jack learned more about American culture.', 'D', 3);
INSERT INTO `question` VALUES (59, 'The writer went to piano lessons with Linda Evans ______.', 'at the age of 13', 'before she got married', 'after they moved to new homes', 'before the writer’s family moved away', 'D', 3);
INSERT INTO `question` VALUES (60, 'They didn’t often write to each other because they ______.', 'got married', 'had little time to do so', 'didn’t like writing letters', 'could see each other on special time', 'B', 3);
INSERT INTO `question` VALUES (61, 'Jack brought the couple their food very fast because ______.', 'the manager asked him to do so', 'he respected the elderly', 'the couple wanted him to do so', 'he wanted more pay', 'B', 3);
INSERT INTO `question` VALUES (62, 'When Jack called the couple \"elderly\", they became ______.', 'nervous', 'satisfied', 'unhappy', 'excited', 'C', 3);
INSERT INTO `question` VALUES (63, 'In Jack\'s hometown, ______.', 'people dislike being called \"old\"', 'people are proud of being old', 'many people reach the age of seventy or eighty', 'the elderly are the first to get food in restaurants', 'B', 3);
INSERT INTO `question` VALUES (64, 'After this experience, Jack ______.', 'lost his job in the restaurant', 'made friends with the couple', 'no longer respected the elderly', 'changed his way with older people', 'D', 3);
INSERT INTO `question` VALUES (65, 'Which of the following is TRUE?', 'The more Jack explained, the angrier the couple got.', 'Jack wanted to show his feelings through words after his experience.', 'The manager went back to the table and apologized to the couple.', 'From this experience, Jack learned more about American culture.', 'D', 3);
INSERT INTO `question` VALUES (66, 'The writer went to piano lessons with Linda Evans ______.', 'at the age of 13', 'before she got married', 'after they moved to new homes', 'before the writer\'s family moved away', 'D', 3);
INSERT INTO `question` VALUES (67, 'They didn\'t often write to each other because they ______.', 'got married', 'had little time to do so', 'didn\'t like writing letters', 'could see each other on special time', 'B', 3);
INSERT INTO `question` VALUES (68, 'There was an empty place in the writer\'s heart because she ______.', 'was in trouble', 'didn\'t know Linda\'s address', 'received the card that she sent', 'didn\'t have a friend like Linda to share her happiness or sadness', 'D', 3);
INSERT INTO `question` VALUES (69, 'The writer was happy when she ______.', 'read the newspaper', 'heard Linda\'s voice on the phone', 'met a young woman who looked a lot like Linda', 'wrote to the woman whose last name was Wagman', 'B', 3);
INSERT INTO `question` VALUES (70, 'They haven\'t kept in touch ______.', 'for about 40 years', 'for about 27 years', 'since they got married', 'since the writer\'s family moved away', 'A', 3);
INSERT INTO `question` VALUES (71, 'The writer began to love her mother\'s desk ______.', 'after Mother died', 'before she became a writer', 'when she was a child', 'when Mother gave it to her', 'C', 3);
INSERT INTO `question` VALUES (72, 'The passage shows that ______.', 'mother was cold on the surface but kind in her heart to her daughter', 'mother was too serious about everything her daughter had done', 'mother cared much about her daughter in words', 'mother wrote to her daughter in careful words', 'A', 3);
INSERT INTO `question` VALUES (73, 'The word \"gulf\" in the passage means ______.', 'deep understanding between the old and the young', 'different ideas between the mother and the daughter', 'free talks between mother and daughter', 'part of the sea going far in land', 'B', 3);
INSERT INTO `question` VALUES (74, 'What did mother do with her daughter\'s letter asking forgiveness?', 'She had never received the letter.', 'For years, she often talked about the letter.', 'She didn\'t forgive her daughter at all in all her life.', 'She read the letter again and again till she died.', 'D', 3);
INSERT INTO `question` VALUES (75, 'What\'s the best title of the passage?', 'My letter to Mother', 'Mother and Children', 'My mother\'s Desk', 'Talks between other and Me', 'C', 3);

-- ----------------------------
-- Table structure for reading
-- ----------------------------
DROP TABLE IF EXISTS `reading`;
CREATE TABLE `reading`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reading
-- ----------------------------
INSERT INTO `reading` VALUES (23, 'When my family moved to America in 2010 from a small village in Guangdong, China, we brought not only our luggage, but also our village rules, customs and culture. One of the rules is that young people should always respect(尊敬) elders. Unluckily, this rule led to my very first embarrassment in the United States.\r\nI had a part-time job as a waiter in a Chinese restaurant. One time, when I was serving food to a middle-aged couple, the wife asked me how the food could be served so quickly. I told her that I had made sure they got their food quickly because I always respect the elderly. As soon as I said that, her face showed great displeasure. My manager, who happened to hear what I said, took me aside and gave me a long lecture about how sensitive(敏感) Americans are and how they dislike the description \"old\". I then walked back to the table and apologized to the wife. After the couple heard my reason, they understood that the problem was caused by cultural differences, so they laughed and were no longer angry.\r\nIn my village in China, people are proud of being old. Not so many people live to be seventy or eighty, and people who reach such an age have the most knowledge and experience. Young people always respect older people because they know they can learn from their rich experience.\r\nHowever, in the United States, people think \"growing old\" is a problem since \"old\" shows that a person is going to retire or that the body is not working well. Here many people try to keep themselves away from growing old by doing exercises or jogging, and women put on makeup, hoping to look young. When I told the couple in the restaurant that I respect the elderly, they got angry because this caused them to feel they had failed to stay young. I had told them something they didn\'t want to hear.\r\nAfter that, I changed the way I had been with older people. It is not that I don\'t respect them any more; I still respect them, but now I don\'t show my feelings through words.\r\nBy Jack');
INSERT INTO `reading` VALUES (24, 'Linda Evans was my best friend—like the sister I never had. We did everything together: piano lessons, movies, swimming, horseback riding. \r\nWhen I was 13, my family moved away. Linda and I kept in touch through letters, and we saw each other on special time—like my wedding (婚礼) and Linda\'s. Soon we were busy with children and moving to new homes, and we wrote less often. One day a card that I sent came back, stamped \"Address (地址) Unknown. \" I had no idea how to find Linda. \r\nOver the years, I missed Linda very much. I wanted to share (分享) happiness of my children and then grandchildren. And I needed to share my sadness when my brother and then mother died. There was an empty place in my heart that only a friend like Linda could fill. \r\nOne day I was reading a newspaper when I noticed a photo of a young woman who looked very much like Linda and whose last name was Wagman — Linda\'s married name. \"There must be thousands of Wagmans,\" I thought, but J still wrote to her.\r\nShe called as soon as she got my letter. \"Mrs Tobin!\" she said excitedly, \"Linda Evans Wagman is my mother. \" Minutes later I heard a voice that I knew very much, even after 40 years, laughed and cried and caught up on each other\'s lives. Now the empty place in my heart is filled. And there\'s one thing that Linda and I know for sure: We won\'t lose each other again!');
INSERT INTO `reading` VALUES (25, 'I\'ve loved my mother\'s desk since I was just tall enough to see above the top of it as mother sat doing letters. Standing by her chair, looking at the ink bottle, pens, and white paper,I decided that the act of writing must be the more wonderful thing in the world.\r\nYears later, during her final illness, mother kept different things for my sister and brother. \"But the desk,\" she\'d said again, \"it\'s for Elizabeth. \"\r\nI never saw her angry, never saw her cry. I knew she loved me; she showed it in action. But as a young girl, I wanted heart-to-heart talks between mother and daughter.\r\nThey never happened. And a gulf opened between us. I was \"too emotional(易动感情的)\". But she lived \"on the surface(表面)\".\r\nAs years passed I had my own family. I loved my mother and thanked her for our happy family. I wrote to her in careful words and asked her to let me know in any way she chose that she did forgive(原谅) me.\r\nI posted the letter and waited for her answer. None came.\r\nMy hope turned to disappointment(失望), then little interest and, finally, peace— it seemed that nothing happened. I couldn\'t be sure that the letter had even got to mother. I only knew that I had written it, and I could stop trying to make her into someone she was not.\r\nNow the present of her desk told, as she\'d never been able to, that she was pleased that writing was my chosen work. I cleaned the desk carefully and found some papers inside —a photo of my father and a one-page letter, folded(折叠) and refolded many times.\r\nGive me an answer, my letter asks, in any way you choose. Mother, you always chose the act that speaks louder than words.');

-- ----------------------------
-- Table structure for rquestion
-- ----------------------------
DROP TABLE IF EXISTS `rquestion`;
CREATE TABLE `rquestion`  (
  `rid` int(11) NOT NULL,
  `qid` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rquestion
-- ----------------------------
INSERT INTO `rquestion` VALUES (23, 61);
INSERT INTO `rquestion` VALUES (23, 62);
INSERT INTO `rquestion` VALUES (23, 63);
INSERT INTO `rquestion` VALUES (23, 64);
INSERT INTO `rquestion` VALUES (23, 65);
INSERT INTO `rquestion` VALUES (24, 66);
INSERT INTO `rquestion` VALUES (24, 67);
INSERT INTO `rquestion` VALUES (24, 68);
INSERT INTO `rquestion` VALUES (24, 69);
INSERT INTO `rquestion` VALUES (24, 70);
INSERT INTO `rquestion` VALUES (25, 71);
INSERT INTO `rquestion` VALUES (25, 72);
INSERT INTO `rquestion` VALUES (25, 73);
INSERT INTO `rquestion` VALUES (25, 74);
INSERT INTO `rquestion` VALUES (25, 75);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testpaper
-- ----------------------------
INSERT INTO `testpaper` VALUES (8, 'English Test One', '2019-06-01 00:01:00', '2019-06-01 02:55:06');

-- ----------------------------
-- Table structure for treading
-- ----------------------------
DROP TABLE IF EXISTS `treading`;
CREATE TABLE `treading`  (
  `pid` int(11) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of treading
-- ----------------------------
INSERT INTO `treading` VALUES (8, 24);

SET FOREIGN_KEY_CHECKS = 1;
