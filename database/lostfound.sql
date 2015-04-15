/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : lostfound

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-15 20:06:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `adminlastloginIP` varchar(20) DEFAULT NULL,
  `adminlastloginarea` varchar(50) DEFAULT NULL,
  `adminlastlogintime` datetime DEFAULT NULL,
  `adminname` varchar(32) DEFAULT NULL,
  `adminpassword` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', null, null, null, '123', '123');
INSERT INTO `t_admin` VALUES ('123', null, null, null, '123', '123');
INSERT INTO `t_admin` VALUES ('124', null, null, null, 'phn', '123456');

-- ----------------------------
-- Table structure for `t_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `t_announcement`;
CREATE TABLE `t_announcement` (
  `id` int(11) NOT NULL,
  `announceinfo` longtext,
  `announcetitle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_announcement
-- ----------------------------
INSERT INTO `t_announcement` VALUES ('1', '网站最近在维护中。。。。。。', '网站维护');
INSERT INTO `t_announcement` VALUES ('2', '网站目前正在测试中，网站于测试完毕后即对全校开放测试', '网站开放');

-- ----------------------------
-- Table structure for `t_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` int(11) NOT NULL,
  `areaname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('2', '理科楼');
INSERT INTO `t_area` VALUES ('4', '文科楼');
INSERT INTO `t_area` VALUES ('5', '综合教学楼');
INSERT INTO `t_area` VALUES ('6', '综合实验楼');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL,
  `commentcontent` longtext,
  `commenttime` datetime DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF437E194739CD254` (`goods_id`),
  KEY `FKF437E194D5DEBE40` (`user_id`),
  CONSTRAINT `FKF437E194739CD254` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`),
  CONSTRAINT `FKF437E194D5DEBE40` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '上次在理科楼有人捡到一个', '2014-10-18 13:38:34', '3', '1');
INSERT INTO `t_comment` VALUES ('2', '请文明留言,不得违反国家法律法规！', '2014-10-18 13:38:54', '3', '1');
INSERT INTO `t_comment` VALUES ('4', '不会跟着那个女生走了吧', '2014-10-18 13:41:26', '5', '1');
INSERT INTO `t_comment` VALUES ('5', 'dssdf', '2014-10-31 20:46:11', '8', '1');
INSERT INTO `t_comment` VALUES ('6', '', '2014-11-01 13:04:28', '7', '2');
INSERT INTO `t_comment` VALUES ('7', '这就丢手机了啊，以后的注意了', '2014-11-01 13:09:29', '11', '2');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL,
  `goodsdescribe` longtext,
  `goodsname` varchar(30) DEFAULT NULL,
  `goodspictures` varchar(50) DEFAULT NULL,
  `goodsstatus` int(11) NOT NULL,
  `goodstime` datetime DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA04ED3CBB21C6F00` (`area_id`),
  KEY `FKA04ED3CBD5DEBE40` (`user_id`),
  KEY `FKA04ED3CBABCA53E0` (`type_id`),
  CONSTRAINT `FKA04ED3CBABCA53E0` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `FKA04ED3CBB21C6F00` FOREIGN KEY (`area_id`) REFERENCES `t_area` (`id`),
  CONSTRAINT `FKA04ED3CBD5DEBE40` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '今天在综合教学楼上自习，期间我上了个厕所，回到座位时我桌子上的书已经不见了', '丢了一本书', '/LostFound/img-lost/20141017-06-49-13-IP配置.PNG', '1', '2014-10-17 00:00:00', '5', '9', '1');
INSERT INTO `t_goods` VALUES ('3', '钱包丢失了钱包丢失了钱包丢失了', '钱包丢失了', '/LostFound/img-lost/20141018-01-38-10-234.jpg', '1', '2014-10-18 00:00:00', '6', '10', '1');
INSERT INTO `t_goods` VALUES ('5', '宠物在文科楼丢了', '宠物丢了', '/LostFound/img-lost/20141018-01-40-56-werw.jpg', '1', '2014-10-18 00:00:00', '4', '7', '1');
INSERT INTO `t_goods` VALUES ('6', '做实验的时候丢了', '钱包丢失了', '/LostFound/img-lost/20141018-01-41-55-234.jpg', '1', '2014-10-18 00:00:00', '6', '10', '1');
INSERT INTO `t_goods` VALUES ('7', '在理科楼实验室的书丢了', '丢了一本书', '/LostFound/img-lost/20141018-01-42-22-Koala.jpg', '1', '2014-10-18 00:00:00', '2', '9', '1');
INSERT INTO `t_goods` VALUES ('8', '今天在上机课的时候钱包放桌上，出去上个厕所回来就没有了啊', '我的钱包丢了呢', '/LostFound/img-lost/20141030-10-45-59-123.jpg', '1', '2014-10-30 00:00:00', '6', '10', '1');
INSERT INTO `t_goods` VALUES ('11', '几天实验课手机放桌上，出去上了个厕所回来手机就丢了呢', '实验课手机丢了', '/LostFound/img-lost/20141030-10-50-25-43.jpg', '1', '2014-10-30 00:00:00', '6', '11', '1');

-- ----------------------------
-- Table structure for `t_help`
-- ----------------------------
DROP TABLE IF EXISTS `t_help`;
CREATE TABLE `t_help` (
  `id` int(11) NOT NULL,
  `helpInfo` longtext,
  `helpTitle` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_help
-- ----------------------------
INSERT INTO `t_help` VALUES ('1', '该网站只针对长沙理工大学师生使用，长沙理工大学师生只需使用网络教学平台的账号和密码登录即可使用', '如何登录网站');
INSERT INTO `t_help` VALUES ('2', '用户登录后点击免费发布信息即可进入到发布信息的界面，用户根据自己想要发布的失物信息或者招领信息选择相应的模块，然后填写相应的信息，之后点击发布按钮即可进行发布信息，发布完成后会跳转到相应的界面', '如何发布信息');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL,
  `typename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('7', '宠物');
INSERT INTO `t_type` VALUES ('8', '卡');
INSERT INTO `t_type` VALUES ('9', '书籍');
INSERT INTO `t_type` VALUES ('10', '钱包');
INSERT INTO `t_type` VALUES ('11', '手机');
INSERT INTO `t_type` VALUES ('12', '书包');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `username` varchar(16) DEFAULT NULL,
  `usernickname` varchar(30) DEFAULT NULL,
  `userpassword` varchar(16) DEFAULT NULL,
  `userphone` varchar(20) DEFAULT NULL,
  `userqq` varchar(20) DEFAULT NULL,
  `userstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '201250080423', 'ert', '234', '13319557866', '123', '0');
INSERT INTO `t_user` VALUES ('2', '201250080428', '201250080428', '234', '15574897427', '', '0');
