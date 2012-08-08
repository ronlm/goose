/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : goose

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2012-08-08 16:02:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buy_good`
-- ----------------------------
DROP TABLE IF EXISTS `buy_good`;
CREATE TABLE `buy_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存',
  `goodSupplierId` int(11) NOT NULL,
  `goodId` varchar(255) NOT NULL,
  `batchNum` int(11) DEFAULT NULL COMMENT '批号，可选填',
  `unitPrice` double(255,0) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `origin` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of buy_good
-- ----------------------------
INSERT INTO `buy_good` VALUES ('1', '1', '1', '33243', '2', '23', '广州', '2012-07-03', '	');
INSERT INTO `buy_good` VALUES ('2', '3', '2', '3242', '2', '25', '台山', '2012-08-14', '	');
INSERT INTO `buy_good` VALUES ('3', '4', '3', '24324', '34', '34', null, '2012-08-16', '423423423	2342');

-- ----------------------------
-- Table structure for `comm_menu`
-- ----------------------------
DROP TABLE IF EXISTS `comm_menu`;
CREATE TABLE `comm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `resourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_menu
-- ----------------------------
INSERT INTO `comm_menu` VALUES ('1', '系统菜单', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('2', '系统用户管理', '/pages/Comm/userAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('3', '系统资源管理', '/pages/Comm/resourceAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('4', '系统菜单管理', '/pages/Comm/menuAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('5', '系统角色管理', '/pages/Comm/roleAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('6', '农户农场管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('8', '农户信息管理', '/pages/goose/farmerAction!list', '6', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('9', '物资信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('10', '农场信息管理', '/pages/goose/farmAction!listAll', '6', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('11', '物资基本信息', '/pages/goose/goodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('13', '供应商信息', '/pages/goose/goodSupplierAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('14', '物资销售信息', '/pages/goose/tradeGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('15', '鹅只信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('16', '信息搜索', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('17', '物资采购信息', '/pages/goose/buyGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('18', '销售商信息', '/pages/goose/retailerAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('19', '鹅苗交付信息', '/pages/goose/receiveGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('20', '成品鹅收购管理', '/pages/goose/tradeGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('21', '成品鹅销售管理', '/pages/goose/saleGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('22', '鹅只上市统计', '/pages/goose/gooseStatisticAction!market', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('23', '农场存栏鹅只统计', '/pages/goose/gooseStatisticAction!stock', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('24', '鹅只死亡统计', '/pages/goose/gooseStatisticAction!dead', '15', '/images/main/null.png', '3');

-- ----------------------------
-- Table structure for `comm_resource`
-- ----------------------------
DROP TABLE IF EXISTS `comm_resource`;
CREATE TABLE `comm_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_resource
-- ----------------------------
INSERT INTO `comm_resource` VALUES ('1', '系统后台首页', '/pages/main/*', null);
INSERT INTO `comm_resource` VALUES ('2', '系统管理', '/pages/Comm/*', null);
INSERT INTO `comm_resource` VALUES ('3', '用户管理', '/pages/goose/*', '用户管理,供超级管理员管理系统管理员				');

-- ----------------------------
-- Table structure for `comm_role`
-- ----------------------------
DROP TABLE IF EXISTS `comm_role`;
CREATE TABLE `comm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role
-- ----------------------------
INSERT INTO `comm_role` VALUES ('1', '超超级管理员', '			');
INSERT INTO `comm_role` VALUES ('2', '超级管理员', '				超级管理员										');
INSERT INTO `comm_role` VALUES ('3', '普通用户', '普通用户	');

-- ----------------------------
-- Table structure for `comm_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `comm_role_resource`;
CREATE TABLE `comm_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `resourceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `resourceId` (`resourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role_resource
-- ----------------------------
INSERT INTO `comm_role_resource` VALUES ('1', '1', '1');
INSERT INTO `comm_role_resource` VALUES ('2', '1', '2');
INSERT INTO `comm_role_resource` VALUES ('3', '1', '3');
INSERT INTO `comm_role_resource` VALUES ('4', '2', '1');
INSERT INTO `comm_role_resource` VALUES ('5', '2', '3');
INSERT INTO `comm_role_resource` VALUES ('6', '3', '1');
INSERT INTO `comm_role_resource` VALUES ('126', '3', '3');

-- ----------------------------
-- Table structure for `comm_user`
-- ----------------------------
DROP TABLE IF EXISTS `comm_user`;
CREATE TABLE `comm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '户用名',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名即账号，用于登录',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL COMMENT '话电号码',
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_user
-- ----------------------------
INSERT INTO `comm_user` VALUES ('1', 'admin', '引擎小组', 'admin', '123', '123@d.com', '123', '1');
INSERT INTO `comm_user` VALUES ('2', 'engine', '', 'engine', '', '', '', '2');
INSERT INTO `comm_user` VALUES ('3', 'test', null, 'test', null, null, null, '1');
INSERT INTO `comm_user` VALUES ('4', 'user', '', '111111', '', '', '', '3');
INSERT INTO `comm_user` VALUES ('5', 'zjh', '', '111111', '', '', '', '3');

-- ----------------------------
-- Table structure for `farm`
-- ----------------------------
DROP TABLE IF EXISTS `farm`;
CREATE TABLE `farm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `farmerId` varchar(30) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `signDate` date DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of farm
-- ----------------------------
INSERT INTO `farm` VALUES ('1', '1号农场', '1', '广州', '2012-07-04', '3000', '				');
INSERT INTO `farm` VALUES ('2', '牛牛', '1', '南海', '2012-07-01', '2000', '硬件考察中	');
INSERT INTO `farm` VALUES ('3', '猪镇', '2', '南海', null, '1000', null);
INSERT INTO `farm` VALUES ('4', 'testtes', '1', '234', null, '234234', '硬件考察中		');

-- ----------------------------
-- Table structure for `farmer`
-- ----------------------------
DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of farmer
-- ----------------------------
INSERT INTO `farmer` VALUES ('1', '张三', '123456', '广州', '无');
INSERT INTO `farmer` VALUES ('2', '李四', '123456', '南海', '未签约');
INSERT INTO `farmer` VALUES ('3', '朱八', '3345879', '台山', '	');

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存',
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '油麦菜种', '包', '0');
INSERT INTO `good` VALUES ('2', '大叶槐苗', '棵', '0');
INSERT INTO `good` VALUES ('3', 'XX消毒水', '瓶', '0');
INSERT INTO `good` VALUES ('4', '百毒杀', '瓶', '0');

-- ----------------------------
-- Table structure for `goodsupplier`
-- ----------------------------
DROP TABLE IF EXISTS `goodsupplier`;
CREATE TABLE `goodsupplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goodsupplier
-- ----------------------------
INSERT INTO `goodsupplier` VALUES ('1', '张三', '111111', '广州', null);
INSERT INTO `goodsupplier` VALUES ('3', '李四', '222222', '广州', '	');
INSERT INTO `goodsupplier` VALUES ('4', '鑫鑫农资店', '432423', '在砝码城', '	');

-- ----------------------------
-- Table structure for `goose`
-- ----------------------------
DROP TABLE IF EXISTS `goose`;
CREATE TABLE `goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiveId` int(11) NOT NULL,
  `tradeId` int(11) DEFAULT NULL COMMENT '收购批号',
  `saleId` int(11) DEFAULT NULL COMMENT '销售批号',
  `isValid` tinyint(2) DEFAULT '1' COMMENT '0表示鹅只非正常死亡，1 为正在养殖状态，2为已出售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goose
-- ----------------------------
INSERT INTO `goose` VALUES ('1', '1', null, null, '0');
INSERT INTO `goose` VALUES ('2', '1', null, null, '1');
INSERT INTO `goose` VALUES ('3', '1', null, null, '1');
INSERT INTO `goose` VALUES ('4', '1', null, null, '1');
INSERT INTO `goose` VALUES ('5', '1', null, null, '1');
INSERT INTO `goose` VALUES ('6', '1', null, null, '1');
INSERT INTO `goose` VALUES ('7', '1', null, null, '1');
INSERT INTO `goose` VALUES ('8', '1', null, null, '1');
INSERT INTO `goose` VALUES ('9', '1', null, null, '1');
INSERT INTO `goose` VALUES ('10', '1', null, null, '1');
INSERT INTO `goose` VALUES ('11', '2', null, null, '0');
INSERT INTO `goose` VALUES ('12', '2', null, null, '1');
INSERT INTO `goose` VALUES ('13', '2', null, null, '1');
INSERT INTO `goose` VALUES ('14', '2', null, null, '1');
INSERT INTO `goose` VALUES ('15', '2', null, null, '1');
INSERT INTO `goose` VALUES ('16', '2', null, null, '1');
INSERT INTO `goose` VALUES ('17', '2', null, null, '1');
INSERT INTO `goose` VALUES ('18', '2', null, null, '1');
INSERT INTO `goose` VALUES ('19', '2', null, null, '1');
INSERT INTO `goose` VALUES ('20', '2', null, null, '1');
INSERT INTO `goose` VALUES ('21', '2', null, null, '1');
INSERT INTO `goose` VALUES ('22', '2', null, null, '1');
INSERT INTO `goose` VALUES ('23', '2', null, null, '1');
INSERT INTO `goose` VALUES ('24', '2', null, null, '1');
INSERT INTO `goose` VALUES ('25', '2', null, null, '1');
INSERT INTO `goose` VALUES ('26', '2', null, null, '1');
INSERT INTO `goose` VALUES ('27', '2', null, null, '1');
INSERT INTO `goose` VALUES ('28', '2', null, null, '1');
INSERT INTO `goose` VALUES ('29', '2', null, null, '1');
INSERT INTO `goose` VALUES ('30', '2', null, null, '1');
INSERT INTO `goose` VALUES ('56', '1', null, null, '1');
INSERT INTO `goose` VALUES ('57', '1', null, null, '1');
INSERT INTO `goose` VALUES ('58', '1', null, null, '1');
INSERT INTO `goose` VALUES ('59', '1', null, null, '1');
INSERT INTO `goose` VALUES ('60', '1', null, null, '1');
INSERT INTO `goose` VALUES ('61', '1', null, null, '1');
INSERT INTO `goose` VALUES ('62', '1', null, null, '1');
INSERT INTO `goose` VALUES ('63', '1', null, null, '1');
INSERT INTO `goose` VALUES ('64', '1', null, null, '1');
INSERT INTO `goose` VALUES ('65', '1', null, null, '1');
INSERT INTO `goose` VALUES ('66', '1', null, null, '1');
INSERT INTO `goose` VALUES ('67', '1', null, null, '1');
INSERT INTO `goose` VALUES ('68', '1', null, null, '1');
INSERT INTO `goose` VALUES ('69', '1', null, null, '1');
INSERT INTO `goose` VALUES ('70', '1', null, null, '1');
INSERT INTO `goose` VALUES ('71', '2', null, null, '1');
INSERT INTO `goose` VALUES ('72', '2', null, null, '1');
INSERT INTO `goose` VALUES ('73', '2', null, null, '1');
INSERT INTO `goose` VALUES ('74', '2', null, null, '1');
INSERT INTO `goose` VALUES ('75', '2', null, null, '1');
INSERT INTO `goose` VALUES ('76', '2', null, null, '1');
INSERT INTO `goose` VALUES ('77', '2', null, null, '1');
INSERT INTO `goose` VALUES ('78', '2', null, null, '1');
INSERT INTO `goose` VALUES ('79', '2', null, null, '1');
INSERT INTO `goose` VALUES ('80', '2', null, null, '1');

-- ----------------------------
-- Table structure for `receive_goose`
-- ----------------------------
DROP TABLE IF EXISTS `receive_goose`;
CREATE TABLE `receive_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmId` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `receiveDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receive_goose
-- ----------------------------
INSERT INTO `receive_goose` VALUES ('1', '1', '10', '2012-05-06', 'dgsdgf');
INSERT INTO `receive_goose` VALUES ('2', '2', '20', '2012-08-02', 'fdhhdg');
INSERT INTO `receive_goose` VALUES ('16', '1', '15', '2012-06-13', 'adsfasd');
INSERT INTO `receive_goose` VALUES ('17', '2', '10', '2012-07-11', 'fdfa');

-- ----------------------------
-- Table structure for `retailer`
-- ----------------------------
DROP TABLE IF EXISTS `retailer`;
CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of retailer
-- ----------------------------
INSERT INTO `retailer` VALUES ('1', 'XX烧鹅店', '123465', '茜需要', '霏霏 城	');
INSERT INTO `retailer` VALUES ('2', '张三鹅肉加工厂', '9527', '珠海', '鞢夺	桔柑');

-- ----------------------------
-- Table structure for `sale_goose`
-- ----------------------------
DROP TABLE IF EXISTS `sale_goose`;
CREATE TABLE `sale_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retailerId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unitPrice` double DEFAULT NULL,
  `totalWeight` double DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sale_goose
-- ----------------------------
INSERT INTO `sale_goose` VALUES ('1', '1', '1000', '22.35', '6833.55', '2012-08-01', 'dfasfdasf');
INSERT INTO `sale_goose` VALUES ('2', '1', '1200', '25.55', '7028.77', '2012-07-18', 'dfsafdsa');
INSERT INTO `sale_goose` VALUES ('3', '1', '1130', '24.22', '7500.2', '2012-06-27', 'dasfqqqrwe');
INSERT INTO `sale_goose` VALUES ('4', '2', '1000', '23.5', '7350', '2012-08-04', 'adfasdf');

-- ----------------------------
-- Table structure for `trade_good`
-- ----------------------------
DROP TABLE IF EXISTS `trade_good`;
CREATE TABLE `trade_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmerId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `tradeDate` date DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_good
-- ----------------------------
INSERT INTO `trade_good` VALUES ('1', '1', '1', '2012-08-01', '10', '20', '大规模fs	');
INSERT INTO `trade_good` VALUES ('2', '2', '3', '2012-08-07', '20', '434', '	');
INSERT INTO `trade_good` VALUES ('4', '3', '4', null, '15', '13', '131243	');

-- ----------------------------
-- Table structure for `trade_goose`
-- ----------------------------
DROP TABLE IF EXISTS `trade_goose`;
CREATE TABLE `trade_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unitPrice` double DEFAULT NULL,
  `totalWeight` double DEFAULT NULL,
  `tradeDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_goose
-- ----------------------------
INSERT INTO `trade_goose` VALUES ('1', '1', '1000', '15.6', '6000.12', '2012-07-27', '木有');
INSERT INTO `trade_goose` VALUES ('2', '1', '2000', '16.14', '12000.44', '2012-08-02', 'hgjhj');
INSERT INTO `trade_goose` VALUES ('3', '1', '300', '17.24', '18000', '2012-07-18', 'ghjjg');
INSERT INTO `trade_goose` VALUES ('4', '2', '500', '15.4', '3000.44', '2012-07-24', 'ghjhg');
INSERT INTO `trade_goose` VALUES ('5', '1', '500', '15.7', '3144.7', '2012-07-17', 'ghjghf');
INSERT INTO `trade_goose` VALUES ('6', '2', '1000', '16.45', '7000', '2011-06-20', 'jhkqweq');
INSERT INTO `trade_goose` VALUES ('7', '3', '2000', '18.15', '13000.11', '2011-12-29', 'jhgh');
INSERT INTO `trade_goose` VALUES ('8', '1', '1500', '20', '90000', '2012-07-08', 'tgd y');
INSERT INTO `trade_goose` VALUES ('9', '2', '1000', '19.2', '6500', '2012-05-21', 'jkjkhjk');
INSERT INTO `trade_goose` VALUES ('10', '3', '3500', '15.5', '18400', '2012-07-15', 'gfdgfxg');
INSERT INTO `trade_goose` VALUES ('11', '2', '800', '17', '5100', '2012-06-25', 'hhhhhf');

-- ----------------------------
-- View structure for `buygoodview`
-- ----------------------------
DROP VIEW IF EXISTS `buygoodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buygoodview` AS select `buy_good`.`id` AS `id`,`buy_good`.`goodSupplierId` AS `supplierId`,`buy_good`.`goodId` AS `goodId`,`buy_good`.`batchNum` AS `batchNum`,`buy_good`.`unitPrice` AS `unitPrice`,`buy_good`.`amount` AS `amount`,`buy_good`.`origin` AS `origin`,`buy_good`.`date` AS `date`,`buy_good`.`comments` AS `comments`,`good`.`name` AS `goodName`,`good`.`unit` AS `unit`,`goodsupplier`.`name` AS `supplierName`,`goodsupplier`.`phone` AS `supplierPhone` from ((`buy_good` join `good`) join `goodsupplier`) where ((`buy_good`.`goodId` = `good`.`id`) and (`buy_good`.`goodSupplierId` = `goodsupplier`.`id`)) ;

-- ----------------------------
-- View structure for `market`
-- ----------------------------
DROP VIEW IF EXISTS `market`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `market` AS select `farm`.`id` AS `farmId`,`receive_goose`.`id` AS `receiveId`,`farm`.`name` AS `farmName`,`farm`.`farmerId` AS `farmerId`,`farm`.`address` AS `address`,`receive_goose`.`amount` AS `amount`,`receive_goose`.`receiveDate` AS `receiveDate`,`receive_goose`.`comments` AS `comments` from (`farm` join `receive_goose`) where (`farm`.`id` = `receive_goose`.`farmId`) ;

-- ----------------------------
-- View structure for `tradegoodview`
-- ----------------------------
DROP VIEW IF EXISTS `tradegoodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tradegoodview` AS select `farmer`.`id` AS `farmId`,`farmer`.`name` AS `farmerName`,`farmer`.`phone` AS `phone`,`trade_good`.`id` AS `id`,`trade_good`.`goodId` AS `goodId`,`trade_good`.`tradeDate` AS `tradeDate`,`trade_good`.`unitPrice` AS `unitPrice`,`trade_good`.`amount` AS `amount`,`trade_good`.`comments` AS `comments`,`good`.`name` AS `goodName`,`good`.`unit` AS `goodUnit` from ((`farmer` join `trade_good` on(('' = ''))) join `good`) where ((`farmer`.`id` = `trade_good`.`farmerId`) and (`trade_good`.`goodId` = `good`.`id`)) ;
