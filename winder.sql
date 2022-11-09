/*
 Navicat Premium Data Transfer

 Source Server         : winder-aws
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : winder.cnrjieonhq1h.us-east-1.rds.amazonaws.com:3306
 Source Schema         : winder

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 08/11/2022 21:08:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for README
-- ----------------------------
DROP TABLE IF EXISTS `README`;
CREATE TABLE `README`  (
  `id` int NOT NULL,
  `readme` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `BTC_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createrid` int NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `participantid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sportid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, 'event1', 1, '2022-10-07 10:44:18', 'Gym', 'user1\'s event', '1,2,3', '6');
INSERT INTO `event` VALUES (2, 'event2', 2, '2022-10-14 10:44:46', 'Biking', 'user2\'s event', '1,2', '5');

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL,
  `sportid` int NULL DEFAULT NULL,
  `sportname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sportlevel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of experience
-- ----------------------------
INSERT INTO `experience` VALUES (1, 4, 1, 'Basketball', 'Beginner');
INSERT INTO `experience` VALUES (2, 4, 2, 'Swimming', 'Intermediate');
INSERT INTO `experience` VALUES (3, 4, 3, 'Jogging', 'Expert');
INSERT INTO `experience` VALUES (4, 5, 5, 'Biking', 'Intermediate');
INSERT INTO `experience` VALUES (5, 1, 1, 'Basketball', 'Expert');
INSERT INTO `experience` VALUES (6, 1, 4, 'Football', 'Beginner');
INSERT INTO `experience` VALUES (7, 1, 6, 'Gym', 'Intermediate');

-- ----------------------------
-- Table structure for sport
-- ----------------------------
DROP TABLE IF EXISTS `sport`;
CREATE TABLE `sport`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sportname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sport
-- ----------------------------
INSERT INTO `sport` VALUES (1, 'Basketball', 'Play basketball');
INSERT INTO `sport` VALUES (2, 'Swimming', 'Swimming in pool/ocean');
INSERT INTO `sport` VALUES (3, 'Jogging', 'Jogging every day/night');
INSERT INTO `sport` VALUES (4, 'Football', 'Team sport with many people');
INSERT INTO `sport` VALUES (5, 'Biking', 'Biking');
INSERT INTO `sport` VALUES (6, 'Gym', 'Workout in a gym');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` int NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sportid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE COMMENT 'username not same'
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user1', '123456', 'male', 22, 111111, '1@1.com', 'house', '1,4,6', 'I am a college student who want to make more friends with peers. I love sport and want to practice more about my skills.');
INSERT INTO `user` VALUES (2, 'user2', '123456', 'female', 20, 222222, '2@2.com', 'flat', NULL, NULL);
INSERT INTO `user` VALUES (3, 'user3', '123456', 'bio', 50, 333333, '3@3.com', 'homeless', NULL, NULL);
INSERT INTO `user` VALUES (4, 'amber', '123456', 'female', 19, 444444, '4@4.com', '30 stan st', '1,2,3', NULL);
INSERT INTO `user` VALUES (5, 'lisa', '123456', 'female', 32, 555555, '5@5.com', '21 clemson st', '5', 'A sport lover.');

-- ----------------------------
-- Table structure for userrelation
-- ----------------------------
DROP TABLE IF EXISTS `userrelation`;
CREATE TABLE `userrelation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL,
  `mateid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `likeid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `maylikeid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userid`(`userid` ASC) USING BTREE COMMENT 'unique user'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userrelation
-- ----------------------------
INSERT INTO `userrelation` VALUES (1, 1, '2,3,4', '', '5');
INSERT INTO `userrelation` VALUES (2, 2, '1,3', '', '4,5');
INSERT INTO `userrelation` VALUES (3, 3, '1,2', '', '4,5');
INSERT INTO `userrelation` VALUES (4, 4, '1', '2,3', '5');
INSERT INTO `userrelation` VALUES (5, 5, '', '1,2,3,4', '');

SET FOREIGN_KEY_CHECKS = 1;
