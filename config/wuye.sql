/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : wuye

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-07-03 06:46:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `build`
-- ----------------------------
DROP TABLE IF EXISTS `build`;
CREATE TABLE `build` (
  `BUILD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUILD_TYPE` varchar(20) NOT NULL,
  `BUILD_AREA` int(10) NOT NULL,
  `BUILD_FEE` float NOT NULL,
  PRIMARY KEY (`BUILD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of build
-- ----------------------------
INSERT INTO `build` VALUES ('1', '门市', '125', '150');
INSERT INTO `build` VALUES ('2', '普通住宅', '60', '40');
INSERT INTO `build` VALUES ('3', '高层住宅', '85', '80');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `DEPT_ID` int(10) NOT NULL AUTO_INCREMENT,
  `DEPT_NAME` varchar(20) NOT NULL,
  `DEPT_LOC` varchar(20) NOT NULL,
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '开发部', '101室');
INSERT INTO `dept` VALUES ('2', '人事部', '102室');
INSERT INTO `dept` VALUES ('3', '服务部', '103室');
INSERT INTO `dept` VALUES ('4', '收费部', '104室');
INSERT INTO `dept` VALUES ('5', '维护部', '105室');
INSERT INTO `dept` VALUES ('6', '财务部', '106室');

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `EMP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_NAME` varchar(20) NOT NULL,
  `EMP_USER` varchar(20) NOT NULL,
  `EMP_PASSWORD` varchar(20) NOT NULL,
  `EMP_SEX` varchar(20) NOT NULL,
  `EMP_BIRTHDATE` datetime NOT NULL,
  `EMP_EMAIL` varchar(40) DEFAULT NULL,
  `EMP_PHONE` varchar(20) DEFAULT NULL,
  `EMP_MOBILE` varchar(20) DEFAULT NULL,
  `EMP_ADDRESS` varchar(80) DEFAULT NULL,
  `EMP_INFO` varchar(255) DEFAULT NULL,
  `DEPT_ID` int(10) NOT NULL,
  `JOB_ID` int(10) NOT NULL,
  PRIMARY KEY (`EMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('2', '周维', 'panda', '123456', '男', '1993-07-04 19:03:25', '610479001@qq.com', '5543223', '18342910801', '辽宁工程技术大学', '开发者', '1', '1');
INSERT INTO `emp` VALUES ('3', '张盼盼', 'zhr1993', '123456', '女', '1993-03-23 19:07:46', '1971941570@qq.com', '543213', '18424324456', '沈阳大学', '人事部员', '2', '2');
INSERT INTO `emp` VALUES ('4', '李筱松', 'lxx', '123456', '男', '1990-02-06 00:00:12', 'xs@163.com', '534345', '17432523423', '沈阳建筑大学', '维护部', '3', '3');
INSERT INTO `emp` VALUES ('5', '于圆圆', 'yy666', '123456', '女', '1990-12-06 19:22:55', 'yynice@hotmail.com', '3453322', '13434245423', '东北财经大学', '财务部', '6', '6');
INSERT INTO `emp` VALUES ('6', '章天天', 'ztt', '123456', '女', '1990-06-05 19:54:47', 'ttgood@qq.com', '553234', '13953452666', '辽宁财贸学院', '收费部', '5', '5');
INSERT INTO `emp` VALUES ('7', '刘海涛', 'LHT', '123456', '男', '1992-12-23 20:00:09', 'haitao@163.com', '5434211', '13953423673', '辽宁林业职业技术学院', '人事部', '4', '4');

-- ----------------------------
-- Table structure for `fee`
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `FEE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_ID` int(11) NOT NULL,
  `FEE_TIME` datetime NOT NULL,
  `FEE_TYPE` varchar(20) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`FEE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fee
-- ----------------------------
INSERT INTO `fee` VALUES ('1', '1', '2016-03-13 00:00:00', 'no');

-- ----------------------------
-- Table structure for `garage`
-- ----------------------------
DROP TABLE IF EXISTS `garage`;
CREATE TABLE `garage` (
  `GARAGE_ID` int(10) NOT NULL,
  `GARAGE_AREA` int(10) NOT NULL,
  `GARAGE_FEE` float NOT NULL,
  PRIMARY KEY (`GARAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of garage
-- ----------------------------
INSERT INTO `garage` VALUES ('1', '16', '10');
INSERT INTO `garage` VALUES ('2', '20', '15');
INSERT INTO `garage` VALUES ('3', '14', '15');
INSERT INTO `garage` VALUES ('4', '20', '20');
INSERT INTO `garage` VALUES ('5', '15', '10');
INSERT INTO `garage` VALUES ('6', '16', '15');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `IMAGE_ID` int(10) NOT NULL AUTO_INCREMENT,
  `IMAGE_TYPE` varchar(20) NOT NULL,
  `IMAGE_REF_ID` int(10) NOT NULL,
  `IMAGE_DATA` blob,
  PRIMARY KEY (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `JOB_ID` int(10) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '开发者');
INSERT INTO `job` VALUES ('2', '服务员');
INSERT INTO `job` VALUES ('3', '水管工');
INSERT INTO `job` VALUES ('4', '经理');
INSERT INTO `job` VALUES ('5', '收费员');
INSERT INTO `job` VALUES ('6', '会计');

-- ----------------------------
-- Table structure for `money`
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `MONEY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ID` int(11) NOT NULL,
  `MONEY_ATT` int(2) NOT NULL DEFAULT '1',
  `MONEY_TIME` datetime NOT NULL,
  PRIMARY KEY (`MONEY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', '1', '1', '2016-06-21 21:59:12');
INSERT INTO `money` VALUES ('2', '2', '1', '2016-06-19 21:59:28');

-- ----------------------------
-- Table structure for `owner`
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `OWNER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_NAME` varchar(20) NOT NULL,
  `OWNER_PERID` varchar(30) NOT NULL,
  `OWNER_SEX` varchar(20) NOT NULL,
  `OWNER_PHONE` varchar(20) DEFAULT NULL,
  `OWNER_MOBILE` varchar(20) DEFAULT NULL,
  `OWNER_EMAIL` varchar(40) DEFAULT NULL,
  `OWNER_INFO` varchar(255) DEFAULT NULL,
  `OWNER_BUILD` int(10) NOT NULL,
  `OWNER_HOME` varchar(6) NOT NULL,
  `OWNER_GARAGE` int(10) NOT NULL,
  `OWNER_PARK` int(10) NOT NULL,
  PRIMARY KEY (`OWNER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES ('1', '刘德华', '210722197006067334', '男', '17728290875', '13888887778', '678657656@qq.com', '妻子与女儿', '1', '001', '1', '1');
INSERT INTO `owner` VALUES ('2', '张涛', '210732319770809234', '男', '13842342384', '13324342343', '123232343@qq.com', '单身', '2', '002', '2', '2');
INSERT INTO `owner` VALUES ('3', '周润发', '210710197607268765', '男', '12288890987', '13487890765', '124454556@qq.com', '单身', '3', '003', '3', '3');
INSERT INTO `owner` VALUES ('4', '薛之谦', '21078919805278976', '男', '22227756626', '15654454455', '232223222@163.com', '单身', '1', 'A16', '4', '4');
INSERT INTO `owner` VALUES ('5', '古丽扎纳', '210789198808239876', '女', '22222112121', '15677878667', '333223323@163.com', '丈夫', '2', 'B23', '5', '5');
INSERT INTO `owner` VALUES ('6', '刘晓庆', '210288196002209876', '女', '22222222222', '18762536267', '434332232@163.com', '丈夫与儿子', '3', 'A12', '6', '6');

-- ----------------------------
-- Table structure for `park`
-- ----------------------------
DROP TABLE IF EXISTS `park`;
CREATE TABLE `park` (
  `PARK_ID` int(10) NOT NULL,
  `PARK_AREA` int(10) NOT NULL,
  `PARK_FEE` float NOT NULL,
  PRIMARY KEY (`PARK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of park
-- ----------------------------
INSERT INTO `park` VALUES ('1', '12', '16');
INSERT INTO `park` VALUES ('2', '7', '10');
INSERT INTO `park` VALUES ('3', '8', '14');
INSERT INTO `park` VALUES ('4', '10', '12');
INSERT INTO `park` VALUES ('5', '13', '14');
INSERT INTO `park` VALUES ('6', '13', '15');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLE_ID` int(10) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) NOT NULL,
  `ROLE_INFO` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'systemadmin', '系统管理员');
INSERT INTO `role` VALUES ('2', 'money', '财务');
INSERT INTO `role` VALUES ('3', 'people', '人事');
INSERT INTO `role` VALUES ('4', '财务部', '111');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `SALARY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ID` int(11) NOT NULL,
  `SALARY_BC` varchar(20) NOT NULL,
  `SALARY_DAY` int(11) NOT NULL,
  `SALARY_SUB` int(11) DEFAULT '0',
  PRIMARY KEY (`SALARY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('1', '1', '6227777789700789654', '150', '80');

-- ----------------------------
-- Table structure for `source`
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `SOURCE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOURCE_ITEM` varchar(20) NOT NULL,
  `SOURCE_NUM` int(11) NOT NULL,
  `SOURCE_COAST` float(20,0) NOT NULL,
  `SOURCE_TIME` datetime NOT NULL,
  `SOURCE_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES ('1', '路灯维护', '2', '300', '2016-02-15 09:02:01', '张涛');
INSERT INTO `source` VALUES ('2', '地砖维修', '100', '600', '2016-06-14 10:03:18', '刘海');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `UR_ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ROLE_ID` int(10) NOT NULL,
  PRIMARY KEY (`UR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '5', '2');
INSERT INTO `user_role` VALUES ('3', '2', '1');
INSERT INTO `user_role` VALUES ('4', '3', '3');
