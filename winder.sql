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

 Date: 10/11/2022 11:51:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createrid` int NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `participantid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sportid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `capacity` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, 'event1', 1, '2022-11-09T05:00:00.000Z', '09:30', 'Downtown Gym', 'user1\'s event', '1,2,3', '6', 10);
INSERT INTO `event` VALUES (2, 'event2', 2, '2022-11-09T05:00:00.000Z', '07:30', 'Bike Camp 11', 'user2\'s event', '2', '5', 5);
INSERT INTO `event` VALUES (3, 'Swimming Event', 1, '2022-11-01T05:00:00.000Z', '06:30', 'Center Swimming Pool', '1', '1', '1', 100);
INSERT INTO `event` VALUES (4, 'test1', 1, '2022-11-09T05:00:00.000Z', '07:30', '1', '1', '1', '2', 23);
INSERT INTO `event` VALUES (5, 'Sunday Girl Basketball', 3, '2022-12-10T05:00:00.000Z', '09:30', '30 Apple St', 'Every girl should come', '3, 4', '1', 50);
INSERT INTO `event` VALUES (6, 'College Football Open Day', 2, '2022-11-01T05:00:00.000Z', '06:30', 'Lane Stadium', 'Open Day, everyone welcome', '2, 3', '4', 500);
INSERT INTO `event` VALUES (7, 'Biking with Amber', 4, '2022-11-28T05:00:00.000Z', '12:30', '103 Fall Lane Avenue', 'Amber find a biking mate', '4', '5', 2);
INSERT INTO `event` VALUES (8, 'Free Tour in Lee\'s Gym', 5, '2022-12-11T05:00:00.000Z', '09:30', 'Downtown Lee\'s Gym', 'Free tour in newly open gym, free 3 days trial', '3, 5', '6', 100);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `experience` VALUES (8, 1, 3, 'Jogging', 'Intermediate');

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
INSERT INTO `user` VALUES (1, 'Mandy', '123456', 'male', 22, 111111, '1@1.com', 'house', '1,4,6', 'I am a college student who want to make more friends with peers. I love sport and want to practice more about my skills.');
INSERT INTO `user` VALUES (2, 'Lily', '123456', 'female', 20, 222222, '2@2.com', 'flat', NULL, NULL);
INSERT INTO `user` VALUES (3, 'John', '123456', 'male', 50, 333333, '3@3.com', '310 cartman st', NULL, 'Actively finding sport mate with me.');
INSERT INTO `user` VALUES (4, 'Amber', '123456', 'female', 19, 444444, '4@4.com', '30 stan st', '1,2,3', NULL);
INSERT INTO `user` VALUES (5, 'Lisa', '123456', 'female', 32, 555555, '5@5.com', '21 clemson st', '5', 'A sport lover.');

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
INSERT INTO `userrelation` VALUES (1, 1, '', '', '5');
INSERT INTO `userrelation` VALUES (2, 2, '3', '', '4,5');
INSERT INTO `userrelation` VALUES (3, 3, '2', '', '4,5');
INSERT INTO `userrelation` VALUES (4, 4, '', '2,3', '5');
INSERT INTO `userrelation` VALUES (5, 5, '', '1,2,3,4', '');

SET FOREIGN_KEY_CHECKS = 1;
