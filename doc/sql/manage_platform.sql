/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : manage_platform

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-06-10 13:42:54
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
  `phone_number` bigint(20) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('2', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', 'admin', 'admin');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `parent_id` int(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prov_city` (`parent_id`),
  CONSTRAINT `prov_city` FOREIGN KEY (`parent_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '成都市');
INSERT INTO `city` VALUES ('2', '1', '绵阳市');
INSERT INTO `city` VALUES ('3', '1', '自贡市');
INSERT INTO `city` VALUES ('4', '1', '攀枝花市');
INSERT INTO `city` VALUES ('5', '1', '泸州市');
INSERT INTO `city` VALUES ('6', '1', '德阳市');
INSERT INTO `city` VALUES ('7', '1', '广元市');
INSERT INTO `city` VALUES ('8', '1', '遂宁市');
INSERT INTO `city` VALUES ('9', '1', '内江市');
INSERT INTO `city` VALUES ('10', '1', '乐山市');
INSERT INTO `city` VALUES ('11', '1', '资阳市');
INSERT INTO `city` VALUES ('12', '1', '宜宾市');
INSERT INTO `city` VALUES ('13', '1', '南充市');
INSERT INTO `city` VALUES ('14', '1', '达州市');
INSERT INTO `city` VALUES ('15', '1', '雅安市');
INSERT INTO `city` VALUES ('16', '1', '广安市');
INSERT INTO `city` VALUES ('17', '1', '巴中市');
INSERT INTO `city` VALUES ('18', '1', '眉山市');
INSERT INTO `city` VALUES ('19', '2', '贵阳市');
INSERT INTO `city` VALUES ('20', '2', '遵义市');
INSERT INTO `city` VALUES ('21', '2', '安顺市');
INSERT INTO `city` VALUES ('22', '2', '六盘水市');
INSERT INTO `city` VALUES ('23', '2', '毕节市');
INSERT INTO `city` VALUES ('24', '2', '铜仁市');
INSERT INTO `city` VALUES ('25', '2', '清镇市');
INSERT INTO `city` VALUES ('26', '2', '赤水市');
INSERT INTO `city` VALUES ('27', '2', '仁怀市');
INSERT INTO `city` VALUES ('28', '2', '盘州市');
INSERT INTO `city` VALUES ('29', '2', '凯里市');
INSERT INTO `city` VALUES ('30', '2', '都匀市');
INSERT INTO `city` VALUES ('31', '2', '福泉市');
INSERT INTO `city` VALUES ('32', '2', '兴义市');

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `id` int(5) NOT NULL,
  `totalNum` int(5) NOT NULL,
  `position_id` int(2) NOT NULL,
  `position_name` varchar(64) NOT NULL,
  `city_id` int(2) NOT NULL,
  `city_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`position_id`),
  KEY `city` (`city_id`),
  CONSTRAINT `category` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of distribution
-- ----------------------------
INSERT INTO `distribution` VALUES ('1', '34', '12', '视频剪辑', '1', '成都');
INSERT INTO `distribution` VALUES ('2', '9', '12', '视频剪辑', '10', '乐山');
INSERT INTO `distribution` VALUES ('3', '27', '19', '摄影', '1', '成都');
INSERT INTO `distribution` VALUES ('4', '11', '19', '摄影', '10', '乐山');
INSERT INTO `distribution` VALUES ('5', '46', '18', '翻译', '1', '成都');
INSERT INTO `distribution` VALUES ('6', '20', '18', '翻译', '10', '乐山');
INSERT INTO `distribution` VALUES ('7', '42', '13', '网站建设', '1', '成都');
INSERT INTO `distribution` VALUES ('8', '7', '13', '网站建设', '10', '乐山');
INSERT INTO `distribution` VALUES ('9', '35', '6', '健身教练', '1', '成都');
INSERT INTO `distribution` VALUES ('10', '17', '6', '健身教练', '10', '乐山');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
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
  `id` bigint(20) NOT NULL,
  `checked` int(11) DEFAULT NULL,
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
INSERT INTO `merchant` VALUES ('2', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `parent_id` int(2) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `sort` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', null, '服务行业', '1');
INSERT INTO `position` VALUES ('2', null, '设计师', '3');
INSERT INTO `position` VALUES ('3', null, 'IT行业', '4');
INSERT INTO `position` VALUES ('4', null, '专业人才', '2');
INSERT INTO `position` VALUES ('5', '1', '护工', '1');
INSERT INTO `position` VALUES ('6', '1', '健身教练', '3');
INSERT INTO `position` VALUES ('7', '1', '导游', '4');
INSERT INTO `position` VALUES ('8', '1', '化妆师', '2');
INSERT INTO `position` VALUES ('9', '2', '美工', '1');
INSERT INTO `position` VALUES ('10', '2', '平面设计', '3');
INSERT INTO `position` VALUES ('11', '2', '图片处理', '4');
INSERT INTO `position` VALUES ('12', '2', '视频剪辑', '2');
INSERT INTO `position` VALUES ('13', '3', '网站建设', '1');
INSERT INTO `position` VALUES ('14', '3', 'App开发', '3');
INSERT INTO `position` VALUES ('15', '3', 'SEO优化', '4');
INSERT INTO `position` VALUES ('16', '3', '网络维修', '2');
INSERT INTO `position` VALUES ('17', '4', '会计', '1');
INSERT INTO `position` VALUES ('18', '4', '翻译', '3');
INSERT INTO `position` VALUES ('19', '4', '摄影', '4');
INSERT INTO `position` VALUES ('20', '4', '律师', '2');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '四川');
INSERT INTO `province` VALUES ('2', '贵州');

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

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '11', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'pages/sys/user.html', null, '1', 'fa fa-user', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'pages/sys/role.html', null, '1', 'fa fa-user-secret', '2', '1');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'pages/sys/menu.html', null, '1', 'fa fa-folder-open', '4', '0');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'pages/druid/sql.html', null, '1', 'fa fa-linux', '9', '1');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'pages/sys/schedule.html', null, '1', 'fa fa-tasks', '5', '1');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '系统参数', 'pages/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '7', '1');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'pages/sys/generator.htmll', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '10', '1');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'pages/sys/log.htm', 'sys:log:list', '1', 'fa fa-file-text-o', '8', '1');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'pages/sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6', '1');
INSERT INTO `sys_menu` VALUES ('31', '0', '功能测试', null, null, '0', 'fa fa-bug', '11', '1');
INSERT INTO `sys_menu` VALUES ('200', '0', '用户信息管理', null, null, '0', 'fa fa-user-circle-o', '1', '0');
INSERT INTO `sys_menu` VALUES ('201', '200', '用户管理', 'pages/platform/employee.html', null, '1', 'fa fa-user-md', '1', '0');
INSERT INTO `sys_menu` VALUES ('202', '201', '查看', null, 'user:list,user:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('203', '201', '新增', null, 'user:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('204', '201', '修改', null, 'user:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('205', '201', '删除', null, 'user:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('206', '31', 'iviewDemo', 'test/iviewDemo.html', null, '1', 'fa fa-etsy', '0', '0');
INSERT INTO `sys_menu` VALUES ('207', '200', '会员等级', 'pages/shop/userlevel.html', null, '1', 'fa fa-star-o', '0', '1');
INSERT INTO `sys_menu` VALUES ('208', '207', '查看', null, 'userlevel:list,userlevel:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('209', '207', '新增', null, 'userlevel:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('210', '207', '修改', null, 'userlevel:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('211', '207', '删除', null, 'userlevel:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('212', '200', '收货地址管理', 'pages/shop/address.html', null, '1', 'fa fa-map-marker', '6', '0');
INSERT INTO `sys_menu` VALUES ('213', '212', '查看', null, 'address:list,address:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('214', '212', '新增', null, 'address:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('215', '212', '修改', null, 'address:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('216', '212', '删除', null, 'address:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('222', '0', '商户信息管理', null, null, '0', 'fa fa-shopping-cart', '2', '0');
INSERT INTO `sys_menu` VALUES ('223', '222', '商户信息管理', 'pages/platform/merchant.html', null, '1', 'fa fa-sun-o', '0', '0');
INSERT INTO `sys_menu` VALUES ('224', '223', '查看', null, 'attributecategory:list,attributecategory:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('225', '223', '新增', null, 'attributecategory:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('226', '223', '修改', null, 'attributecategory:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('227', '223', '删除', null, 'attributecategory:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('233', '243', '广告列表', 'pages/shop/ad.html', null, '1', 'fa fa-pencil', '1', '0');
INSERT INTO `sys_menu` VALUES ('234', '233', '查看', null, 'ad:list,ad:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('235', '233', '新增', null, 'ad:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('236', '233', '修改', null, 'ad:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('237', '233', '删除', null, 'ad:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('238', '243', '广告位置', 'pages/shop/adposition.html', null, '1', 'fa fa-map-pin', '0', '0');
INSERT INTO `sys_menu` VALUES ('239', '238', '查看', null, 'adposition:list,adposition:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('240', '238', '新增', null, 'adposition:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('241', '238', '修改', null, 'adposition:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('242', '238', '删除', null, 'adposition:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('243', '0', '推广管理', null, null, '0', 'fa fa-hand-paper-o', '5', '1');
INSERT INTO `sys_menu` VALUES ('244', '243', '优惠劵管理', 'pages/shop/coupon.html', null, '1', 'fa fa-cc-visa', '2', '0');
INSERT INTO `sys_menu` VALUES ('245', '244', '查看', null, 'coupon:list,coupon:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('246', '244', '新增', null, 'coupon:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('247', '244', '修改', null, 'coupon:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('248', '244', '删除', null, 'coupon:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('249', '200', '会员优惠劵', 'pages/shop/usercoupon.html', null, '1', 'fa fa-cc-visa', '2', '0');
INSERT INTO `sys_menu` VALUES ('250', '249', '查看', null, 'usercoupon:list,usercoupon:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('251', '249', '新增', null, 'usercoupon:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('252', '249', '修改', null, 'usercoupon:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('253', '249', '删除', null, 'usercoupon:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('254', '222', '品牌制造商', 'pages/shop/brand.html', null, '1', 'fa fa-registered', '5', '0');
INSERT INTO `sys_menu` VALUES ('255', '254', '查看', null, 'brand:list,brand:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('256', '254', '新增', null, 'brand:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('257', '254', '修改', null, 'brand:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('258', '254', '删除', null, 'brand:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('259', '222', '商品规格', 'pages/shop/specification.html', null, '1', 'fa fa-hand-rock-o', '1', '0');
INSERT INTO `sys_menu` VALUES ('260', '259', '查看', null, 'specification:list,specification:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('261', '259', '新增', null, 'specification:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('262', '259', '修改', null, 'specification:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('263', '259', '删除', null, 'specification:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('264', '200', '会员收藏', 'pages/shop/collect.html', null, '1', 'fa fa-star', '3', '0');
INSERT INTO `sys_menu` VALUES ('265', '264', '查看', null, 'collect:list,collect:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('266', '264', '删除', null, 'collect:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('270', '243', '专题管理', 'pages/shop/topic.html', null, '1', 'fa fa-ticket', '5', '1');
INSERT INTO `sys_menu` VALUES ('271', '270', '查看', null, 'topic:list,topic:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('272', '270', '新增', null, 'topic:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('273', '270', '修改', null, 'topic:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('274', '270', '删除', null, 'topic:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('275', '243', '专题分类', 'pages/shop/topiccategory.html', null, '1', 'fa fa-tint', '4', '1');
INSERT INTO `sys_menu` VALUES ('276', '275', '查看', null, 'topiccategory:list,topiccategory:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('277', '275', '新增', null, 'topiccategory:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('278', '275', '修改', null, 'topiccategory:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('279', '275', '删除', null, 'topiccategory:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('280', '200', '会员足迹', 'pages/shop/footprint.html', null, '1', 'fa fa-history', '6', '0');
INSERT INTO `sys_menu` VALUES ('281', '280', '查看', null, 'footprint:list,footprint:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('282', '280', '删除', null, 'footprint:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('283', '200', '搜索历史', 'pages/shop/searchhistory.html', null, '1', 'fa fa-search', '6', '0');
INSERT INTO `sys_menu` VALUES ('284', '283', '查看', null, 'searchhistory:list,searchhistory:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('285', '283', '删除', null, 'searchhistory:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('286', '200', '购物车', 'pages/shop/cart.html', null, '1', 'fa fa-shopping-cart', '6', '0');
INSERT INTO `sys_menu` VALUES ('287', '286', '查看', null, 'cart:list,cart:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('288', '286', '删除', null, 'cart:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('289', '357', '所有商品', 'pages/shop/goods.html', null, '1', 'fa fa-shopping-bag', '1', '0');
INSERT INTO `sys_menu` VALUES ('290', '289', '查看', null, 'goods:list,goods:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('291', '289', '新增', null, 'goods:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('292', '289', '修改', null, 'goods:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('293', '289', '删除', null, 'goods:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('294', '374', '所有管理', 'pages/shop/order.html', null, '1', 'fa fa-sitemap', '6', '0');
INSERT INTO `sys_menu` VALUES ('295', '294', '查看', null, 'order:list,order:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('296', '294', '发货', null, 'order:sendGoods', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('297', '222', '商品类型', 'pages/shop/category.html', null, '1', 'fa fa-ship', '3', '0');
INSERT INTO `sys_menu` VALUES ('298', '297', '查看', null, 'category:list,category:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('299', '297', '新增', null, 'category:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('300', '297', '修改', null, 'category:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('301', '297', '删除', null, 'category:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('302', '1', '通用字典表', 'pages/sys/macro.html', null, '1', 'fa fa-book', '6', '1');
INSERT INTO `sys_menu` VALUES ('303', '302', '查看', null, 'sys:macro:list,sys:macro:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('304', '302', '新增', null, 'sys:macro:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('305', '302', '修改', null, 'sys:macro:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('306', '302', '删除', null, 'sys:macro:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('307', '222', '渠道管理', 'pages/shop/channel.html', null, '1', 'fa fa-road', '2', '1');
INSERT INTO `sys_menu` VALUES ('308', '307', '查看', null, 'channel:list,channel:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('309', '307', '新增', null, 'channel:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('310', '307', '修改', null, 'channel:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('311', '307', '删除', null, 'channel:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('312', '0', '微信公众号', null, null, '0', 'fa fa-weixin', '6', '1');
INSERT INTO `sys_menu` VALUES ('313', '0', '进销存', null, null, '0', 'fa fa-truck', '6', '1');
INSERT INTO `sys_menu` VALUES ('314', '0', '统计报表', null, null, '0', 'fa fa-line-chart', '7', '0');
INSERT INTO `sys_menu` VALUES ('315', '222', '商品问答', 'pages/shop/goodsissue.html', null, '1', 'fa fa-question-circle-o', '6', '0');
INSERT INTO `sys_menu` VALUES ('316', '315', '查看', null, 'goodsissue:list,goodsissue:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('317', '315', '新增', null, 'goodsissue:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('318', '315', '修改', null, 'goodsissue:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('319', '315', '删除', null, 'goodsissue:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('325', '222', '反馈', 'pages/shop/feedback.html', null, '1', 'fa fa-mail-reply-all', '6', '0');
INSERT INTO `sys_menu` VALUES ('326', '325', '查看', null, 'feedback:list,feedback:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('327', '325', '新增', null, 'feedback:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('328', '325', '修改', null, 'feedback:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('329', '325', '删除', null, 'feedback:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('330', '244', '发放', null, 'coupon:publish', '2', null, '4', '0');
INSERT INTO `sys_menu` VALUES ('331', '222', '关键词', 'pages/shop/keywords.html', null, '1', 'fa fa-underline', '6', '0');
INSERT INTO `sys_menu` VALUES ('332', '331', '查看', null, 'keywords:list,keywords:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('333', '331', '新增', null, 'keywords:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('334', '331', '修改', null, 'keywords:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('335', '331', '删除', null, 'keywords:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('336', '357', '用户评论', 'pages/shop/comment.html', null, '1', 'fa fa-commenting', '6', '0');
INSERT INTO `sys_menu` VALUES ('337', '336', '查看', null, 'comment:list,comment:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('338', '336', '新增', null, 'comment:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('339', '336', '修改', null, 'comment:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('340', '336', '删除', null, 'comment:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('341', '336', '修改状态', null, 'comment:toggleStatus', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('342', '357', '产品设置', 'pages/shop/product.html', null, '1', 'fa fa-paypal', '3', '0');
INSERT INTO `sys_menu` VALUES ('343', '342', '查看', null, 'product:list,product:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('344', '342', '新增', null, 'product:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('345', '342', '修改', null, 'product:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('346', '342', '删除', null, 'product:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('352', '357', '商品规格', 'pages/shop/goodsspecification.html', null, '1', 'fa fa-deafness', '2', '0');
INSERT INTO `sys_menu` VALUES ('353', '352', '查看', null, 'goodsspecification:list,goodsspecification:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('354', '352', '新增', null, 'goodsspecification:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('355', '352', '修改', null, 'goodsspecification:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('356', '352', '删除', null, 'goodsspecification:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('357', '0', '编辑商品', null, null, '0', 'fa fa-edit', '3', '1');
INSERT INTO `sys_menu` VALUES ('358', '357', '商品回收站', 'pages/shop/goodshistory.html', '', '1', 'fa fa-history', '12', '0');
INSERT INTO `sys_menu` VALUES ('359', '358', '恢复', null, 'goods:back', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('360', '294', '确认收货', null, 'order:confirm', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('366', '0', 'CMS模块', null, null, '0', 'fa fa-leanpub', '6', '1');
INSERT INTO `sys_menu` VALUES ('368', '1', '部门管理', 'pages/sys/dept.html', null, '1', 'fa fa-sitemap', '3', '1');
INSERT INTO `sys_menu` VALUES ('369', '368', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('370', '368', '新增', null, 'sys:dept:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('371', '368', '修改', null, 'sys:dept:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('372', '368', '删除', null, 'sys:dept:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('373', '368', '选择部门', null, 'sys:dept:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('374', '0', '订单管理', null, null, '0', 'fa fa-first-order', '4', '1');
INSERT INTO `sys_menu` VALUES ('375', '0', '短信平台', null, null, '0', 'fa fa-television', '9', '1');
INSERT INTO `sys_menu` VALUES ('376', '375', '短信配置', 'pages/sys/smslog.html', 'sys:smslog:list,sys:smslog:info', '1', 'fa fa-envelope-open', '1', '0');
INSERT INTO `sys_menu` VALUES ('377', '1', '地区管理', 'pages/sys/region.html', null, '1', 'fa fa-map-pin', '8', '1');
INSERT INTO `sys_menu` VALUES ('378', '377', '删除', null, 'sys:region:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('379', '377', '修改', '', 'sys:region:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('380', '377', '新增', null, 'sys:region:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('381', '377', '查看', null, 'sys:region:list,sys:region:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('382', '31', 'swagger-ui.html', 'swagger-ui.html', '', '1', 'fa fa-code', '0', '0');
INSERT INTO `sys_menu` VALUES ('384', '314', '流量统计', 'pages/platform/position_status.html', null, '1', null, '1', '0');
