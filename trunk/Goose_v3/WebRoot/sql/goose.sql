/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : goose

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2012-09-18 09:15:36
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
  `batchNum` varchar(11) DEFAULT NULL COMMENT '批号，可选填',
  `unitPrice` double(255,0) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `origin` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of buy_good
-- ----------------------------
INSERT INTO `buy_good` VALUES ('4', '4', '1', '3423fdf', '23', '500', 'TZ', '2012-09-05', 'SDFGSDGSDFG');
INSERT INTO `buy_good` VALUES ('5', '4', '3', '13434', '15', '100', 'TW', '2012-09-12', 'FASFSADF');
INSERT INTO `buy_good` VALUES ('6', '1', '5', '322134fsadf', '50', '100', '广州', '2012-09-05', 'adfasfasdf');
INSERT INTO `buy_good` VALUES ('7', '1', '5', '454', '50', '100', '广州', '2012-09-05', 'adfasfasdf');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_menu
-- ----------------------------
INSERT INTO `comm_menu` VALUES ('1', '系统菜单', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('2', '系统用户管理', '/pages/Comm/userAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('3', '系统资源管理', '/pages/Comm/resourceAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('4', '系统菜单管理', '/pages/Comm/menuAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('5', '系统角色管理', '/pages/Comm/roleAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('6', '农户农场管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('8', '农户信息管理', '/pages/goose/farmerAction!list', '6', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('9', '物资信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('10', '农场信息管理', '/pages/goose/farmAction!listAll', '6', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('11', '物资基本信息', '/pages/good/goodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('13', '供应商信息', '/pages/good/goodSupplierAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('14', '物资销售信息', '/pages/good/tradeGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('15', '鹅只信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('17', '物资采购信息', '/pages/good/buyGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('18', '销售商信息', '/pages/goose/retailerAction!list', '28', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('19', '鹅苗交付信息', '/pages/goose/receiveGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('20', '成品鹅收购管理', '/pages/goose/tradeGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('21', '成品鹅销售管理', '/pages/goose/saleGooseAction!list', '28', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('22', '鹅只上市统计', '/pages/goose/gooseStatisticAction!market', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('23', '农场存栏鹅只统计', '/pages/goose/gooseStatisticAction!stock', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('24', '鹅只死亡统计', '/pages/goose/gooseStatisticAction!dead', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('26', '信息检索', '/pages/goose/search.jsp', '30', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('27', '删除脚环信息', '/pages/goose/deleteAction!list', '30', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('28', '销售信息管理', 'javascript:void(0);', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('29', '销售信息统计', '/pages/goose/gooseStatisticAction!sale', '28', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('30', '附加功能', 'javascript:void(0);', '0', '/images/main/MenuIcon.png', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_resource
-- ----------------------------
INSERT INTO `comm_resource` VALUES ('1', '系统后台首页', '/pages/main/*', null);
INSERT INTO `comm_resource` VALUES ('2', '系统管理', '/pages/Comm/*', null);
INSERT INTO `comm_resource` VALUES ('3', '鹅只管理', '/pages/goose/*', '鹅只管理,供超级管理员，管理系统员和普通用户开放				');
INSERT INTO `comm_resource` VALUES ('4', '物资管理', '/pages/good/*', '用于管理公司的农用物资	');

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
INSERT INTO `comm_role` VALUES ('1', '超超级管理员', '										');
INSERT INTO `comm_role` VALUES ('2', '超级管理员', '超级管理员																																		');
INSERT INTO `comm_role` VALUES ('3', '普通用户', '普通用户			');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role_resource
-- ----------------------------
INSERT INTO `comm_role_resource` VALUES ('1', '1', '1');
INSERT INTO `comm_role_resource` VALUES ('2', '1', '2');
INSERT INTO `comm_role_resource` VALUES ('3', '1', '3');
INSERT INTO `comm_role_resource` VALUES ('4', '1', '4');
INSERT INTO `comm_role_resource` VALUES ('17', '2', '1');
INSERT INTO `comm_role_resource` VALUES ('18', '2', '2');
INSERT INTO `comm_role_resource` VALUES ('19', '2', '3');
INSERT INTO `comm_role_resource` VALUES ('20', '2', '4');
INSERT INTO `comm_role_resource` VALUES ('21', '3', '3');
INSERT INTO `comm_role_resource` VALUES ('22', '3', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_user
-- ----------------------------
INSERT INTO `comm_user` VALUES ('1', 'admin', '引擎小组', 'admin', '123', '123@d.com', '123', '1');
INSERT INTO `comm_user` VALUES ('2', 'engine', '', '123456', '', '', '', '2');
INSERT INTO `comm_user` VALUES ('4', 'user', '', '123456', '', '', '', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of farm
-- ----------------------------
INSERT INTO `farm` VALUES ('1', '1号农场', '1', '广州', '2012-07-04', '3000', 'sgsdffgdsfg	');
INSERT INTO `farm` VALUES ('2', '牛牛', '2', '南海', '2012-07-01', '2000', 'dfyfyh');
INSERT INTO `farm` VALUES ('3', '明德', '3', '南海', '2012-01-02', '1000', 'trdstrt');
INSERT INTO `farm` VALUES ('4', '天天农场', '4', '清远', '2012-01-08', '234234', 'gfhdrr');
INSERT INTO `farm` VALUES ('5', '城在农场', '5', '阳山', '2012-01-26', '3432', 'sdgsdf');
INSERT INTO `farm` VALUES ('6', '为之农场', '6', '韶关', '2012-02-01', '2000', 'fgsdfg');
INSERT INTO `farm` VALUES ('7', '阳光农场', '1', '肇庆', '2012-03-01', '1000', 'hfghfdh');
INSERT INTO `farm` VALUES ('8', '东宝农场', '2', '肇庆', '2012-01-30', '1005', 'fasdfasd');
INSERT INTO `farm` VALUES ('9', '功夫农场', '3', '阳山', '2011-11-30', '200', 'fgdsfg');
INSERT INTO `farm` VALUES ('10', '非 飞农场', '4', '东华', '2011-12-29', '540', 'adsfasd');
INSERT INTO `farm` VALUES ('11', 'gogas', '2', '水边', '2011-05-30', '234', '	');
INSERT INTO `farm` VALUES ('12', '爱热农场', '7', '英德', null, '234', '	莾地');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of farmer
-- ----------------------------
INSERT INTO `farmer` VALUES ('1', '张三', '123456', '广州', '无');
INSERT INTO `farmer` VALUES ('2', '李四', '123456', '南海', '未签约');
INSERT INTO `farmer` VALUES ('3', '朱八', '3345879', '台山', '	');
INSERT INTO `farmer` VALUES ('4', '赵一', '1345545', '英德', '革要');
INSERT INTO `farmer` VALUES ('5', '钱二', '214324134', '清远', '奔城');
INSERT INTO `farmer` VALUES ('6', '吴六', '23423433', '阳山', '厅地');
INSERT INTO `farmer` VALUES ('7', '周七', '234324456667', '阳山', '夺震城');

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存',
  `goodTypeId` int(11) DEFAULT NULL,
  `goodTypeName` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '3', '农药', '油麦菜种', 'bao', '0');
INSERT INTO `good` VALUES ('2', '4', '树苗', '大叶槐苗', '棵', '0');
INSERT INTO `good` VALUES ('3', '3', '农药', '无敌消毒水', '瓶', null);
INSERT INTO `good` VALUES ('4', '3', '农药', '百毒杀', '瓶', '0');
INSERT INTO `good` VALUES ('5', '1', '饲料', '正大饲料', '包', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goodsupplier
-- ----------------------------
INSERT INTO `goodsupplier` VALUES ('1', '张三农药店', '111111', '广州', '	dfsadfsdafasf	');
INSERT INTO `goodsupplier` VALUES ('3', '李四', '222222', '广州', 'fadsfadsfdas		');
INSERT INTO `goodsupplier` VALUES ('4', '鑫鑫农资店', '432423', '在砝码城', '	');
INSERT INTO `goodsupplier` VALUES ('5', '嘻嘻化肥店', '343434', '大规模', '塔顶	');

-- ----------------------------
-- Table structure for `good_type`
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '农用物资的所属种类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES ('1', '饲料');
INSERT INTO `good_type` VALUES ('2', '化肥');
INSERT INTO `good_type` VALUES ('3', '农药');
INSERT INTO `good_type` VALUES ('4', '树苗');
INSERT INTO `good_type` VALUES ('5', '种子');
INSERT INTO `good_type` VALUES ('6', '其他');
INSERT INTO `good_type` VALUES ('7', '暮云春树af');

-- ----------------------------
-- Table structure for `goose`
-- ----------------------------
DROP TABLE IF EXISTS `goose`;
CREATE TABLE `goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ringId` varchar(20) NOT NULL,
  `receiveId` int(11) NOT NULL,
  `tradeId` int(11) DEFAULT NULL COMMENT 'չ',
  `saleId` int(11) DEFAULT NULL COMMENT '',
  `isValid` tinyint(2) DEFAULT '1' COMMENT '0ʾֻ1 Ϊֳ״̬2Ϊѳ',
  PRIMARY KEY (`id`),
  KEY `isValid` (`isValid`) USING BTREE,
  KEY `receiveId` (`receiveId`) USING HASH,
  KEY `ringId` (`ringId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goose
-- ----------------------------

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
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `receiveDate` (`receiveDate`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receive_goose
-- ----------------------------
INSERT INTO `receive_goose` VALUES ('1', '1', '500', '2012-07-05', '');
INSERT INTO `receive_goose` VALUES ('2', '2', '500', '2012-07-01', '');
INSERT INTO `receive_goose` VALUES ('3', '8', '500', '2012-06-29', '');
INSERT INTO `receive_goose` VALUES ('4', '8', '2000', '2012-06-13', '');
INSERT INTO `receive_goose` VALUES ('5', '1', '1', '2012-09-07', ' ');
INSERT INTO `receive_goose` VALUES ('6', '1', '2', '2012-09-07', ' ');
INSERT INTO `receive_goose` VALUES ('7', '1', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('8', '6', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('9', '1', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('10', '11', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('11', '5', '1000', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('12', '5', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('13', '1', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('14', '1', '1', '2012-09-07', ' ');
INSERT INTO `receive_goose` VALUES ('15', '1', '500', '2012-09-07', '');
INSERT INTO `receive_goose` VALUES ('16', '7', '11440', '2012-09-13', null);
INSERT INTO `receive_goose` VALUES ('17', '10', '26656', '2012-09-13', null);
INSERT INTO `receive_goose` VALUES ('18', '7', '23010', '2012-09-13', null);
INSERT INTO `receive_goose` VALUES ('19', '5', '37488', '2012-09-10', null);
INSERT INTO `receive_goose` VALUES ('20', '9', '15402', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('21', '6', '12452', '2012-09-07', null);
INSERT INTO `receive_goose` VALUES ('22', '7', '22110', '2012-09-06', null);
INSERT INTO `receive_goose` VALUES ('23', '5', '24200', '2012-09-04', null);
INSERT INTO `receive_goose` VALUES ('24', '10', '14654', '2012-09-03', null);
INSERT INTO `receive_goose` VALUES ('25', '7', '22264', '2012-09-01', null);
INSERT INTO `receive_goose` VALUES ('26', '1', '27360', '2012-08-30', null);
INSERT INTO `receive_goose` VALUES ('27', '8', '2552', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('28', '7', '9520', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('29', '4', '19536', '2012-08-26', null);
INSERT INTO `receive_goose` VALUES ('30', '4', '5270', '2012-08-24', null);
INSERT INTO `receive_goose` VALUES ('31', '5', '10032', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('32', '8', '16110', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('33', '11', '6380', '2012-08-20', null);
INSERT INTO `receive_goose` VALUES ('34', '6', '28118', '2012-08-19', null);
INSERT INTO `receive_goose` VALUES ('35', '9', '35860', '2012-08-17', null);
INSERT INTO `receive_goose` VALUES ('36', '4', '8370', '2012-08-16', null);
INSERT INTO `receive_goose` VALUES ('37', '3', '16984', '2012-08-14', null);
INSERT INTO `receive_goose` VALUES ('38', '11', '2856', '2012-08-14', null);
INSERT INTO `receive_goose` VALUES ('39', '6', '25256', '2012-08-11', null);
INSERT INTO `receive_goose` VALUES ('40', '7', '25500', '2012-08-09', null);
INSERT INTO `receive_goose` VALUES ('41', '4', '28560', '2012-08-09', null);
INSERT INTO `receive_goose` VALUES ('42', '7', '28380', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('43', '10', '16852', '2012-08-05', null);
INSERT INTO `receive_goose` VALUES ('44', '7', '31960', '2012-08-04', null);
INSERT INTO `receive_goose` VALUES ('45', '2', '27896', '2012-08-02', null);
INSERT INTO `receive_goose` VALUES ('46', '9', '12600', '2012-08-02', null);
INSERT INTO `receive_goose` VALUES ('47', '9', '38676', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('48', '1', '8466', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('49', '5', '17380', '2012-07-27', null);
INSERT INTO `receive_goose` VALUES ('50', '10', '19590', '2012-07-26', null);
INSERT INTO `receive_goose` VALUES ('51', '10', '21352', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('52', '8', '36300', '2012-07-24', null);
INSERT INTO `receive_goose` VALUES ('53', '6', '10340', '2012-07-21', null);
INSERT INTO `receive_goose` VALUES ('54', '1', '27098', '2012-07-20', null);
INSERT INTO `receive_goose` VALUES ('55', '1', '10740', '2012-07-19', null);
INSERT INTO `receive_goose` VALUES ('56', '4', '19184', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('57', '5', '41580', '2012-07-15', null);
INSERT INTO `receive_goose` VALUES ('58', '4', '25092', '2012-07-15', null);
INSERT INTO `receive_goose` VALUES ('59', '5', '3608', '2012-07-12', null);
INSERT INTO `receive_goose` VALUES ('60', '3', '14250', '2012-07-12', null);
INSERT INTO `receive_goose` VALUES ('61', '1', '21012', '2012-07-10', null);
INSERT INTO `receive_goose` VALUES ('62', '8', '3080', '2012-07-09', null);
INSERT INTO `receive_goose` VALUES ('63', '9', '3740', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('64', '7', '15538', '2012-07-05', null);
INSERT INTO `receive_goose` VALUES ('65', '8', '8490', '2012-07-05', null);
INSERT INTO `receive_goose` VALUES ('66', '6', '42460', '2012-07-03', null);
INSERT INTO `receive_goose` VALUES ('67', '10', '32076', '2012-06-30', null);
INSERT INTO `receive_goose` VALUES ('68', '11', '28628', '2012-06-30', null);
INSERT INTO `receive_goose` VALUES ('69', '4', '24570', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('70', '6', '22836', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('71', '11', '30124', '2012-06-25', null);
INSERT INTO `receive_goose` VALUES ('72', '3', '28424', '2012-06-24', null);
INSERT INTO `receive_goose` VALUES ('73', '5', '22132', '2012-06-21', null);
INSERT INTO `receive_goose` VALUES ('74', '4', '4560', '2012-06-21', null);
INSERT INTO `receive_goose` VALUES ('75', '8', '16762', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('76', '1', '29920', '2012-06-18', null);
INSERT INTO `receive_goose` VALUES ('77', '6', '29040', '2012-06-15', null);
INSERT INTO `receive_goose` VALUES ('78', '11', '24718', '2012-06-15', null);
INSERT INTO `receive_goose` VALUES ('79', '7', '2370', '2012-06-14', null);
INSERT INTO `receive_goose` VALUES ('80', '6', '6864', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('81', '2', '19380', '2012-06-10', null);
INSERT INTO `receive_goose` VALUES ('82', '5', '23804', '2012-06-09', null);
INSERT INTO `receive_goose` VALUES ('83', '5', '15150', '2012-06-07', null);
INSERT INTO `receive_goose` VALUES ('84', '9', '15004', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('85', '9', '5712', '2012-06-05', null);
INSERT INTO `receive_goose` VALUES ('86', '5', '23892', '2012-06-03', null);
INSERT INTO `receive_goose` VALUES ('87', '8', '25916', '2012-05-31', null);
INSERT INTO `receive_goose` VALUES ('88', '4', '4046', '2012-05-31', null);
INSERT INTO `receive_goose` VALUES ('89', '7', '25590', '2012-05-31', null);
INSERT INTO `receive_goose` VALUES ('90', '4', '7084', '2012-05-28', null);
INSERT INTO `receive_goose` VALUES ('91', '3', '27506', '2012-05-26', null);
INSERT INTO `receive_goose` VALUES ('92', '6', '2376', '2012-05-25', null);
INSERT INTO `receive_goose` VALUES ('93', '11', '9360', '2012-05-24', null);
INSERT INTO `receive_goose` VALUES ('94', '3', '3212', '2012-05-22', null);
INSERT INTO `receive_goose` VALUES ('95', '6', '26622', '2012-05-21', null);
INSERT INTO `receive_goose` VALUES ('96', '6', '16720', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('97', '9', '19590', '2012-05-17', null);
INSERT INTO `receive_goose` VALUES ('98', '7', '39556', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('99', '7', '25806', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('100', '3', '36388', '2012-05-13', null);
INSERT INTO `receive_goose` VALUES ('101', '1', '2414', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('102', '4', '40656', '2012-05-10', null);
INSERT INTO `receive_goose` VALUES ('103', '6', '24660', '2012-05-10', null);
INSERT INTO `receive_goose` VALUES ('104', '8', '1012', '2012-05-07', null);
INSERT INTO `receive_goose` VALUES ('105', '10', '32742', '2012-05-06', null);
INSERT INTO `receive_goose` VALUES ('106', '4', '23232', '2012-05-04', null);
INSERT INTO `receive_goose` VALUES ('107', '1', '270', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('108', '6', '33572', '2012-05-01', null);
INSERT INTO `receive_goose` VALUES ('109', '11', '33864', '2012-05-01', null);
INSERT INTO `receive_goose` VALUES ('110', '9', '25520', '2012-04-28', null);
INSERT INTO `receive_goose` VALUES ('111', '7', '20060', '2012-04-26', null);
INSERT INTO `receive_goose` VALUES ('112', '8', '3150', '2012-04-26', null);
INSERT INTO `receive_goose` VALUES ('113', '6', '34540', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('114', '1', '36168', '2012-04-22', null);
INSERT INTO `receive_goose` VALUES ('115', '8', '21250', '2012-04-21', null);
INSERT INTO `receive_goose` VALUES ('116', '4', '5192', '2012-04-19', null);
INSERT INTO `receive_goose` VALUES ('117', '3', '26640', '2012-04-19', null);
INSERT INTO `receive_goose` VALUES ('118', '9', '39776', '2012-04-16', null);
INSERT INTO `receive_goose` VALUES ('119', '6', '26724', '2012-04-16', null);
INSERT INTO `receive_goose` VALUES ('120', '6', '41800', '2012-04-13', null);
INSERT INTO `receive_goose` VALUES ('121', '10', '6000', '2012-04-12', null);
INSERT INTO `receive_goose` VALUES ('122', '9', '22202', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('123', '1', '10296', '2012-04-10', null);
INSERT INTO `receive_goose` VALUES ('124', '6', '27984', '2012-04-07', null);
INSERT INTO `receive_goose` VALUES ('125', '11', '9214', '2012-04-06', null);
INSERT INTO `receive_goose` VALUES ('126', '8', '14970', '2012-04-05', null);
INSERT INTO `receive_goose` VALUES ('127', '7', '31504', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('128', '6', '27852', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('129', '6', '33864', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('130', '4', '25036', '2012-03-29', null);
INSERT INTO `receive_goose` VALUES ('131', '4', '10890', '2012-03-29', null);
INSERT INTO `receive_goose` VALUES ('132', '10', '5270', '2012-03-27', null);
INSERT INTO `receive_goose` VALUES ('133', '3', '2244', '2012-03-26', null);
INSERT INTO `receive_goose` VALUES ('134', '9', '1364', '2012-03-23', null);
INSERT INTO `receive_goose` VALUES ('135', '2', '18054', '2012-03-22', null);
INSERT INTO `receive_goose` VALUES ('136', '9', '27240', '2012-03-22', null);
INSERT INTO `receive_goose` VALUES ('137', '7', '2728', '2012-03-20', null);
INSERT INTO `receive_goose` VALUES ('138', '8', '21384', '2012-03-17', null);
INSERT INTO `receive_goose` VALUES ('139', '8', '26486', '2012-03-17', null);
INSERT INTO `receive_goose` VALUES ('140', '7', '12960', '2012-03-15', null);
INSERT INTO `receive_goose` VALUES ('141', '5', '22836', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('142', '1', '15368', '2012-03-12', null);
INSERT INTO `receive_goose` VALUES ('143', '4', '35948', '2012-03-11', null);
INSERT INTO `receive_goose` VALUES ('144', '2', '17160', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('145', '9', '23310', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('146', '7', '19074', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('147', '5', '16236', '2012-03-05', null);
INSERT INTO `receive_goose` VALUES ('148', '7', '26004', '2012-03-02', null);
INSERT INTO `receive_goose` VALUES ('149', '9', '19108', '2012-03-02', null);
INSERT INTO `receive_goose` VALUES ('150', '10', '21120', '2012-03-01', null);
INSERT INTO `receive_goose` VALUES ('151', '3', '18304', '2012-02-28', null);
INSERT INTO `receive_goose` VALUES ('152', '4', '11900', '2012-02-26', null);
INSERT INTO `receive_goose` VALUES ('153', '8', '11924', '2012-02-25', null);
INSERT INTO `receive_goose` VALUES ('154', '11', '6930', '2012-02-23', null);
INSERT INTO `receive_goose` VALUES ('155', '11', '31636', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('156', '8', '9758', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('157', '5', '2860', '2012-02-19', null);
INSERT INTO `receive_goose` VALUES ('158', '6', '19800', '2012-02-16', null);
INSERT INTO `receive_goose` VALUES ('159', '3', '9452', '2012-02-16', null);

-- ----------------------------
-- Table structure for `retailer`
-- ----------------------------
DROP TABLE IF EXISTS `retailer`;
CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `regionId` int(11) DEFAULT NULL,
  `region` varchar(30) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regionId` (`regionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of retailer
-- ----------------------------
INSERT INTO `retailer` VALUES ('1', 'XX烧鹅店', '1', '华南地区', '123465', '茜需要', 'afasdfasdfadsfd					');
INSERT INTO `retailer` VALUES ('2', '张三鹅肉加工厂', '1', '华南地区', '9527', '珠海', '鞢夺	桔柑			');
INSERT INTO `retailer` VALUES ('3', '白水酒店', '1', '华南地区', '13431243', '左膨胀', '			');
INSERT INTO `retailer` VALUES ('4', 'qqShop', '4', '华中区', '123', '广州', '地 模压 			');
INSERT INTO `retailer` VALUES ('5', '鞢在砝码夺', '5', '西南区', '2344', '广州', '无可奈何花落去		');

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
  `totalValue` double DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sale_goose
-- ----------------------------
INSERT INTO `sale_goose` VALUES ('1', '1', '10', '25', '100', '2500', '2012-09-03', 'dafdsafdsf');
INSERT INTO `sale_goose` VALUES ('2', '1', '10', '25', '100', '2500', '2012-08-01', 'fsadfafd');
INSERT INTO `sale_goose` VALUES ('3', '2', '20', '25', '200', '5000', '2012-09-04', 'fsdfasdf	');
INSERT INTO `sale_goose` VALUES ('4', '3', '30', '25', '300', '7500', '2012-08-07', 'poiuytre');
INSERT INTO `sale_goose` VALUES ('5', '4', '40', '25', '160', '10000', '2012-07-03', 'hgfd');
INSERT INTO `sale_goose` VALUES ('6', '2', '50', '25', '200', '50000', '2012-08-23', 'vfgdsfgfdsg');

-- ----------------------------
-- Table structure for `sale_region`
-- ----------------------------
DROP TABLE IF EXISTS `sale_region`;
CREATE TABLE `sale_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(30) NOT NULL COMMENT '销售商所属的地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_region
-- ----------------------------
INSERT INTO `sale_region` VALUES ('1', '华南地区');
INSERT INTO `sale_region` VALUES ('2', '华北区');
INSERT INTO `sale_region` VALUES ('3', '东北区');
INSERT INTO `sale_region` VALUES ('4', '华中区');
INSERT INTO `sale_region` VALUES ('5', '西南区');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_good
-- ----------------------------
INSERT INTO `trade_good` VALUES ('7', '5', '1', '2012-09-06', '44', '100', 'TFHFGHXF	');
INSERT INTO `trade_good` VALUES ('8', '1', '3', '2012-09-17', '30', '10', 'cash	');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_goose
-- ----------------------------
INSERT INTO `trade_goose` VALUES ('1', '1', '15', '26.22', '56', '2012-08-07', '');
INSERT INTO `trade_goose` VALUES ('12', '1', '4', '25.533', '20', '2012-08-25', 'oooooooooooooooo	');
INSERT INTO `trade_goose` VALUES ('13', '0', '500', '5.5', '125', '2012-09-07', 'afdsafasdf	');
INSERT INTO `trade_goose` VALUES ('14', '8', '500', '5.5', '125.6', '2012-09-07', '');
INSERT INTO `trade_goose` VALUES ('15', '11', '500', '5.99', '895.23', '2012-09-07', '');

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
