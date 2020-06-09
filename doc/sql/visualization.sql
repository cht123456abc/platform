/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.17 : Database - manage_platform
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manage_platform` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `manage_platform`;

/*Table structure for table `city` */
INSERT INTO `sys_menu` (parent_id,NAME,TYPE,order_num) VALUE (314,"流量统计",1,1);

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `parent_id` int(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prov_city` (`parent_id`),
  CONSTRAINT `prov_city` FOREIGN KEY (`parent_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

insert  into `city`(`id`,`parent_id`,`name`) values (1,1,'成都市'),(2,1,'绵阳市'),(3,1,'自贡市'),(4,1,'攀枝花市'),(5,1,'泸州市'),(6,1,'德阳市'),(7,1,'广元市'),(8,1,'遂宁市'),(9,1,'内江市'),(10,1,'乐山市'),(11,1,'资阳市'),(12,1,'宜宾市'),(13,1,'南充市'),(14,1,'达州市'),(15,1,'雅安市'),(16,1,'广安市'),(17,1,'巴中市'),(18,1,'眉山市'),(19,2,'贵阳市'),(20,2,'遵义市'),(21,2,'安顺市'),(22,2,'六盘水市'),(23,2,'毕节市'),(24,2,'铜仁市'),(25,2,'清镇市'),(26,2,'赤水市'),(27,2,'仁怀市'),(28,2,'盘州市'),(29,2,'凯里市'),(30,2,'都匀市'),(31,2,'福泉市'),(32,2,'兴义市');

/*Table structure for table `distribution` */

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

/*Data for the table `distribution` */

insert  into `distribution`(`id`,`totalNum`,`position_id`,`position_name`,`city_id`,`city_name`) values (1,34,12,'视频剪辑',1,'成都'),(2,9,12,'视频剪辑',10,'乐山'),(3,27,19,'摄影',1,'成都'),(4,11,19,'摄影',10,'乐山'),(5,46,18,'翻译',1,'成都'),(6,20,18,'翻译',10,'乐山'),(7,42,13,'网站建设',1,'成都'),(8,7,13,'网站建设',10,'乐山'),(9,35,6,'健身教练',1,'成都'),(10,17,6,'健身教练',10,'乐山');

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `parent_id` int(2) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `sort` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `position` */

insert  into `position`(`id`,`parent_id`,`name`,`sort`) values (1,NULL,'服务行业',1),(2,NULL,'设计师',3),(3,NULL,'IT行业',4),(4,NULL,'专业人才',2),(5,1,'护工',1),(6,1,'健身教练',3),(7,1,'导游',4),(8,1,'化妆师',2),(9,2,'美工',1),(10,2,'平面设计',3),(11,2,'图片处理',4),(12,2,'视频剪辑',2),(13,3,'网站建设',1),(14,3,'App开发',3),(15,3,'SEO优化',4),(16,3,'网络维修',2),(17,4,'会计',1),(18,4,'翻译',3),(19,4,'摄影',4),(20,4,'律师',2);

/*Table structure for table `province` */

DROP TABLE IF EXISTS `province`;

CREATE TABLE `province` (
  `id` int(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `province` */

insert  into `province`(`id`,`name`) values (1,'四川'),(2,'贵州');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
