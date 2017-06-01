/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : mooc

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-06-01 17:34:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseId` int(11) NOT NULL AUTO_INCREMENT,
  `CourseTeacherId` int(11) DEFAULT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `PicURL` varchar(50) DEFAULT NULL,
  `CourseType` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `FK_Reference_3` (`CourseTeacherId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`CourseTeacherId`) REFERENCES `user_info` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='存放所有课程的表';

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '1', 'css基础', 'css的基础描述,讲的非常好！', '1_css.jpg', '0');
INSERT INTO `course` VALUES ('19', '1', 'java', 'java基础课程', '1_QQ图片.png', '1');
INSERT INTO `course` VALUES ('24', '1', 'HTML入门', '讲解html的基础知识', '1_QQ图片.png', '0');
INSERT INTO `course` VALUES ('25', '1', 'JavaScript从入门到精通', 'JavaScript从入门到精通', '1_QQ图片.png', '0');
INSERT INTO `course` VALUES ('26', '1', 'Jquery从入门到放弃', 'Jquery从入门到放弃', '1_QQ图片.png', '0');
INSERT INTO `course` VALUES ('27', '1', 'Spring In Action', '带你走进Spring的世界', '1_QQ图片.png', '1');
INSERT INTO `course` VALUES ('28', '1', '轻松学JavaWeb开发', '带你轻松学java web', '1_QQ图片.png', '1');
INSERT INTO `course` VALUES ('29', '1', '轻量级java EE企业应用实战', 'Struts2+Spring4+Hibernate', '1_QQ图片.png', '1');
INSERT INTO `course` VALUES ('30', '1', 'andriod开发与入门', 'andriod开发与入门', '1_QQ图片.png', '2');
INSERT INTO `course` VALUES ('31', '1', '疯狂Andriod讲义', '疯狂Andriod讲义', '1_QQ图片.png', '2');
INSERT INTO `course` VALUES ('32', '1', 'andriod开发实战经典', 'andriod开发实战经典', '1_QQ图片.png', '2');
INSERT INTO `course` VALUES ('33', '1', '第一行代码', '第一行代码', '1_QQ图片.png', '2');
INSERT INTO `course` VALUES ('34', '1', 'iOS By Tutorial', 'iOS By Tutorial', '1_QQ图片.png', '3');
INSERT INTO `course` VALUES ('35', '1', 'Swift By Tutorial', 'Swift By Tutorial', '1_QQ图片.png', '3');
INSERT INTO `course` VALUES ('36', '1', 'Objective-C高级编程 iOS与OS X多线程和内存管理', 'Objective-C高级编程 iOS与OS X多线程和内存管理', '1_QQ图片.png', '3');
INSERT INTO `course` VALUES ('37', '1', 'Effective Objective-C 2.0：编写高质量iOS与OS X代码的52个有效方法', 'Effective Objective-C 2.0：编写高质量iOS与OS X代码的52个有效方法', '1_QQ图片.png', '3');

-- ----------------------------
-- Table structure for coursedetails
-- ----------------------------
DROP TABLE IF EXISTS `coursedetails`;
CREATE TABLE `coursedetails` (
  `ClassId` int(11) NOT NULL AUTO_INCREMENT,
  `CourseId` int(11) NOT NULL,
  `Homework` varchar(5000) DEFAULT NULL,
  `VideoURL` varchar(30) DEFAULT NULL,
  `PPTURL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursedetails
-- ----------------------------
INSERT INTO `coursedetails` VALUES ('3', '1', null, 'C:\\fakepath\\zuk.mp4', 'C:\\fakepath\\css.pdf');
INSERT INTO `coursedetails` VALUES ('4', '1', null, '1_zuk.mp4', '1_css.pdf');
INSERT INTO `coursedetails` VALUES ('5', '1', null, '1_zuk.mp4', '1_css.pdf');

-- ----------------------------
-- Table structure for courseselect
-- ----------------------------
DROP TABLE IF EXISTS `courseselect`;
CREATE TABLE `courseselect` (
  `UserId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `Schedule` int(11) DEFAULT NULL,
  `Mark1` int(11) DEFAULT NULL,
  `Mark2` int(11) DEFAULT NULL,
  `Mark3` int(11) DEFAULT NULL,
  KEY `FK_Reference_6` (`CourseId`,`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseselect
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `MessageId` int(11) NOT NULL AUTO_INCREMENT,
  `FromId` int(11) DEFAULT NULL,
  `ToId` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `Column_5` datetime DEFAULT NULL,
  PRIMARY KEY (`MessageId`),
  KEY `FK_Reference_1` (`FromId`),
  KEY `FK_Reference_2` (`ToId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`FromId`) REFERENCES `user_info` (`UserId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`ToId`) REFERENCES `user_info` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言交流记录存放的表';

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(10) DEFAULT NULL,
  `UserPwd` varchar(10) DEFAULT NULL,
  `UserType` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户类型，0表示学生，1表示教师，2表示助教，3表示后台管理员';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'mike', '123', '0');
INSERT INTO `user_info` VALUES ('2', 'tom', '123', '1');
INSERT INTO `user_info` VALUES ('3', 'james', '123', '0');
INSERT INTO `user_info` VALUES ('4', 'jean', '123', '0');
INSERT INTO `user_info` VALUES ('5', 'wade', '123', '0');
INSERT INTO `user_info` VALUES ('11', 'qwer', '123', '0');
INSERT INTO `user_info` VALUES ('13', '123', '123', '1');
