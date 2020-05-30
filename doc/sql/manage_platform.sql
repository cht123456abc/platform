/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : manage_platform

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-05-30 22:13:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1266732609623392258 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1266706477247180801', '123', '123', 'ccc', null, null, null, null, null);
INSERT INTO `account` VALUES ('1266716307047440386', '123', '123', 'ccc', null, null, null, null, null);
INSERT INTO `account` VALUES ('1266716307047440387', '123', '123', '111', null, null, null, null, null);
INSERT INTO `account` VALUES ('1266732609623392257', '123', '123', '111', null, null, null, null, null);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '111', '111', '111', '111');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `intended_occupation` varchar(255) DEFAULT NULL,
  `vocation_collection` varchar(255) DEFAULT NULL,
  `merchant_collection` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `checked` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `registered_capital` varchar(255) DEFAULT NULL,
  `initial_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `registered_address` varchar(255) DEFAULT NULL,
  `business_scope` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of merchant
-- ----------------------------

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) NOT NULL,
  `checked` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `vocation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruitment
-- ----------------------------
