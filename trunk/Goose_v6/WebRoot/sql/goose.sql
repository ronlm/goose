/*
Navicat MySQL Data Transfer

Source Server         : Mysql5.0
Source Server Version : 50142
Source Host           : localhost:3306
Source Database       : goose

Target Server Type    : MYSQL
Target Server Version : 50142
File Encoding         : 65001

Date: 2012-10-10 14:33:49
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of buy_good
-- ----------------------------
INSERT INTO `buy_good` VALUES ('4', '4', '1', '3423fdf', '23', '500', 'TZ', '2012-09-05', 'SDFGSDGSDFG');
INSERT INTO `buy_good` VALUES ('5', '4', '3', '13434', '15', '100', 'TW', '2012-09-12', 'FASFSADF');
INSERT INTO `buy_good` VALUES ('6', '1', '5', '322134fsadf', '50', '100', '广州', '2012-08-30', 'adfasfasdf');
INSERT INTO `buy_good` VALUES ('7', '1', '5', '454', '50', '100', '广州', '2012-09-05', 'adfasfasdf');
INSERT INTO `buy_good` VALUES ('8', '4', '5', '3143', '100', '100', '珠海', '2012-09-04', '霏霏ffdfdfd');
INSERT INTO `buy_good` VALUES ('9', '1', '1', '431232', '34', '434', 'fsadf', '2012-09-25', '34343');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_menu
-- ----------------------------
INSERT INTO `comm_menu` VALUES ('1', '系统菜单', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('2', '系统用户管理', '/pages/Comm/userAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('3', '系统资源管理', '/pages/Comm/resourceAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('4', '系统菜单管理', '/pages/Comm/menuAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('5', '系统角色管理', '/pages/Comm/roleAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('6', '农户农场管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '5');
INSERT INTO `comm_menu` VALUES ('8', '农户信息管理', '/pages/farmerFarm/farmerAction!list', '6', '/images/main/null.png', '5');
INSERT INTO `comm_menu` VALUES ('9', '物资信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('10', '农场信息管理', '/pages/farmerFarm/farmAction!listAll', '6', '/images/main/null.png', '5');
INSERT INTO `comm_menu` VALUES ('11', '物资基本信息', '/pages/good/goodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('13', '供应商信息', '/pages/good/goodSupplierAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('14', '物资销售信息', '/pages/good/tradeGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('15', '鹅只信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('17', '物资采购信息', '/pages/good/buyGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('18', '销售商信息', '/pages/saleGoose/retailerAction!list', '28', '/images/main/null.png', '6');
INSERT INTO `comm_menu` VALUES ('19', '鹅苗交付信息', '/pages/goose/receiveGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('20', '成品鹅收购管理', '/pages/goose/tradeGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('21', '成品鹅销售管理', '/pages/saleGoose/saleGooseAction!list', '28', '/images/main/null.png', '6');
INSERT INTO `comm_menu` VALUES ('22', '鹅只上市统计', '/pages/goose/gooseStatisticAction!market', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('23', '农场存栏鹅只统计', '/pages/goose/gooseStatisticAction!stock', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('24', '鹅只死亡统计', '/pages/goose/deadGooseStatisticAction!dead', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('26', '信息检索', '/pages/goose/search.jsp', '30', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('27', '删除脚环信息', '/pages/goose/deleteAction!list', '30', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('28', '销售信息管理', 'javascript:void(0);', '0', '/images/main/MenuIcon.png', '6');
INSERT INTO `comm_menu` VALUES ('29', '销售信息统计', '/pages/saleGoose/gooseStatisticAction!sale', '28', '/images/main/null.png', '6');
INSERT INTO `comm_menu` VALUES ('30', '附加功能', 'javascript:void(0);', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('31', '物资与存栏对比', '/pages/goose/gooseStatisticAction!stockAndGood', '30', '/images/main/null.png', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_resource
-- ----------------------------
INSERT INTO `comm_resource` VALUES ('1', '系统后台首页', '/pages/main/*', null);
INSERT INTO `comm_resource` VALUES ('2', '系统管理', '/pages/Comm/*', null);
INSERT INTO `comm_resource` VALUES ('3', '鹅只管理', '/pages/goose/*', '鹅只管理,供超级管理员，管理系统员和普通用户开放				');
INSERT INTO `comm_resource` VALUES ('4', '物资管理', '/pages/good/*', '用于管理公司的农用物资	');
INSERT INTO `comm_resource` VALUES ('5', '农户农场管理', '/pages/farmerFarm/*', '用于管理农户农场	');
INSERT INTO `comm_resource` VALUES ('6', '鹅只销售管理', '/pages/saleGoose/*', '鹅只销售管理			');

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
INSERT INTO `comm_role` VALUES ('1', '超超级管理员', '												');
INSERT INTO `comm_role` VALUES ('2', '超级管理员', '超级管理员																																					');
INSERT INTO `comm_role` VALUES ('3', '普通用户', '普通用户										');

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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role_resource
-- ----------------------------
INSERT INTO `comm_role_resource` VALUES ('41', '1', '1');
INSERT INTO `comm_role_resource` VALUES ('42', '1', '2');
INSERT INTO `comm_role_resource` VALUES ('43', '1', '3');
INSERT INTO `comm_role_resource` VALUES ('44', '1', '4');
INSERT INTO `comm_role_resource` VALUES ('45', '1', '5');
INSERT INTO `comm_role_resource` VALUES ('46', '1', '6');
INSERT INTO `comm_role_resource` VALUES ('65', '2', '1');
INSERT INTO `comm_role_resource` VALUES ('66', '2', '2');
INSERT INTO `comm_role_resource` VALUES ('67', '2', '3');
INSERT INTO `comm_role_resource` VALUES ('68', '2', '4');
INSERT INTO `comm_role_resource` VALUES ('69', '2', '5');
INSERT INTO `comm_role_resource` VALUES ('70', '2', '6');
INSERT INTO `comm_role_resource` VALUES ('71', '3', '1');
INSERT INTO `comm_role_resource` VALUES ('72', '3', '3');
INSERT INTO `comm_role_resource` VALUES ('73', '3', '4');
INSERT INTO `comm_role_resource` VALUES ('74', '3', '5');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodTypeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '5', '油麦菜种', 'bao', null);
INSERT INTO `good` VALUES ('2', '4', '大叶槐苗', '棵', '0');
INSERT INTO `good` VALUES ('3', '3', '无敌消毒水', '瓶', null);
INSERT INTO `good` VALUES ('4', '3', '百毒杀', '瓶', '0');
INSERT INTO `good` VALUES ('5', '1', '正大饲料', '包', null);
INSERT INTO `good` VALUES ('6', '1', '幸福饲料', '包', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES ('1', '饲料');
INSERT INTO `good_type` VALUES ('2', '化肥');
INSERT INTO `good_type` VALUES ('3', '农药');
INSERT INTO `good_type` VALUES ('4', '树苗');
INSERT INTO `good_type` VALUES ('5', '种子');
INSERT INTO `good_type` VALUES ('6', '其他');

-- ----------------------------
-- Table structure for `goose`
-- ----------------------------
DROP TABLE IF EXISTS `goose`;
CREATE TABLE `goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ringId` varchar(20) NOT NULL,
  `receiveId` int(11) NOT NULL,
  `tradeId` int(11) DEFAULT NULL COMMENT 'չ',
  `saleId` int(11) DEFAULT NULL,
  `isValid` tinyint(2) DEFAULT '1' COMMENT '0ʾֻ1 Ϊֳ״̬2Ϊѳ',
  `deadDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiveId` (`receiveId`) USING BTREE,
  KEY `ringId` (`ringId`)
) ENGINE=InnoDB AUTO_INCREMENT=1070159 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=2693 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receive_goose
-- ----------------------------
INSERT INTO `receive_goose` VALUES ('139', '12', '80', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('140', '11', '329', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('141', '7', '238', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('142', '8', '64', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('143', '9', '70', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('144', '5', '8', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('145', '0', '0', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('146', '10', '511', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('147', '4', '434', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('148', '3', '77', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('149', '2', '576', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('150', '6', '440', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('151', '1', '216', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('152', '12', '189', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('153', '0', '112', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('154', '8', '768', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('155', '3', '462', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('156', '9', '104', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('157', '1', '532', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('158', '12', '98', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('159', '7', '696', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('160', '9', '112', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('161', '0', '252', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('162', '11', '238', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('163', '12', '40', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('164', '5', '448', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('165', '9', '196', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('166', '4', '497', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('167', '6', '720', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('168', '10', '147', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('169', '9', '574', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('170', '3', '552', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('171', '11', '648', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('172', '10', '32', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('173', '12', '504', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('174', '2', '378', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('175', '5', '232', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('176', '10', '344', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('177', '9', '256', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('178', '5', '343', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('179', '3', '378', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('180', '4', '84', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('181', '12', '528', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('182', '1', '784', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('183', '9', '7', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('184', '8', '686', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('185', '2', '120', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('186', '9', '392', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('187', '0', '648', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('188', '4', '168', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('189', '11', '488', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('190', '2', '328', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('191', '6', '504', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('192', '5', '189', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('193', '10', '364', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('194', '7', '266', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('195', '12', '296', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('196', '8', '136', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('197', '2', '70', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('198', '7', '680', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('199', '3', '760', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('200', '5', '553', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('201', '6', '294', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('202', '11', '308', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('203', '4', '630', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('204', '10', '630', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('205', '8', '264', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('206', '1', '272', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('207', '9', '464', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('208', '11', '8', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('209', '8', '406', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('210', '5', '456', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('211', '1', '322', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('212', '11', '301', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('213', '7', '294', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('214', '6', '56', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('215', '0', '304', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('216', '2', '168', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('217', '12', '525', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('218', '3', '21', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('219', '1', '608', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('220', '4', '511', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('221', '5', '399', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('222', '7', '656', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('223', '8', '768', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('224', '3', '144', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('225', '6', '648', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('226', '2', '553', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('227', '0', '679', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('228', '5', '63', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('229', '11', '432', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('230', '12', '567', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('231', '10', '602', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('232', '9', '456', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('233', '1', '147', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('234', '5', '161', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('235', '4', '496', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('236', '11', '462', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('237', '5', '168', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('238', '6', '693', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('239', '1', '600', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('240', '7', '623', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('241', '0', '32', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('242', '5', '560', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('243', '8', '301', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('244', '2', '696', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('245', '0', '224', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('246', '9', '511', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('247', '12', '392', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('248', '3', '553', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('249', '8', '364', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('250', '1', '427', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('251', '11', '56', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('252', '10', '525', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('253', '4', '539', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('254', '11', '77', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('255', '6', '595', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('256', '7', '72', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('257', '12', '56', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('258', '11', '688', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('259', '3', '320', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('260', '9', '744', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('261', '2', '105', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('262', '8', '168', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('263', '5', '497', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('264', '10', '658', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('265', '0', '427', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('266', '1', '544', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('267', '12', '88', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('268', '3', '210', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('269', '2', '456', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('270', '6', '336', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('271', '8', '294', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('272', '12', '480', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('273', '11', '217', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('274', '9', '560', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('275', '7', '440', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('276', '5', '658', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('277', '4', '287', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('278', '0', '616', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('279', '3', '448', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('280', '11', '98', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('281', '8', '136', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('282', '6', '161', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('283', '11', '512', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('284', '2', '490', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('285', '7', '112', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('286', '1', '210', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('287', '8', '350', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('288', '5', '616', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('289', '6', '352', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('290', '7', '392', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('291', '12', '0', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('292', '3', '368', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('293', '9', '0', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('294', '12', '21', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('295', '10', '385', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('296', '9', '357', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('297', '4', '248', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('298', '6', '595', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('299', '1', '455', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('300', '4', '768', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('301', '12', '600', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('302', '2', '752', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('303', '11', '112', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('304', '8', '56', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('305', '7', '328', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('306', '11', '371', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('307', '3', '427', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('308', '0', '696', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('309', '5', '693', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('310', '7', '776', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('311', '10', '98', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('312', '9', '304', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('313', '6', '40', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('314', '3', '656', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('315', '11', '384', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('316', '4', '208', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('317', '12', '546', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('318', '8', '56', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('319', '6', '434', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('320', '9', '343', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('321', '1', '360', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('322', '2', '189', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('323', '11', '88', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('324', '0', '648', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('325', '8', '266', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('326', '4', '720', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('327', '12', '168', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('328', '11', '413', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('329', '5', '376', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('330', '7', '189', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('331', '1', '210', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('332', '9', '252', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('333', '10', '553', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('334', '8', '140', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('335', '3', '455', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('336', '12', '216', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('337', '8', '196', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('338', '2', '672', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('339', '11', '624', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('340', '9', '189', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('341', '5', '217', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('342', '6', '144', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('343', '7', '658', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('344', '0', '320', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('345', '8', '352', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('346', '12', '413', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('347', '4', '80', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('348', '6', '518', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('349', '1', '511', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('350', '4', '224', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('351', '10', '408', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('352', '0', '464', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('353', '5', '588', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('354', '8', '624', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('355', '3', '544', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('356', '9', '440', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('357', '7', '0', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('358', '12', '392', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('359', '6', '416', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('360', '4', '160', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('361', '1', '440', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('362', '11', '496', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('363', '7', '63', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('364', '2', '8', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('365', '9', '476', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('366', '12', '560', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('367', '10', '483', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('368', '5', '609', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('369', '8', '496', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('370', '3', '546', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('371', '2', '8', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('372', '6', '322', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('373', '0', '504', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('374', '1', '0', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('375', '7', '126', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('376', '4', '288', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('377', '11', '154', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('378', '1', '574', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('379', '9', '616', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('380', '10', '320', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('381', '12', '368', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('382', '3', '784', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('383', '5', '440', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('384', '7', '456', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('385', '4', '532', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('386', '6', '144', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('387', '11', '440', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('388', '0', '70', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('389', '8', '728', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('390', '0', '136', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('391', '6', '168', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('392', '5', '77', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('393', '9', '14', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('394', '7', '693', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('395', '12', '413', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('396', '2', '490', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('397', '1', '273', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('398', '9', '256', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('399', '0', '252', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('400', '6', '672', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('401', '4', '160', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('402', '10', '357', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('403', '3', '273', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('404', '0', '616', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('405', '5', '664', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('406', '11', '232', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('407', '4', '21', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('408', '1', '312', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('409', '8', '259', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('410', '2', '200', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('411', '11', '378', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('412', '12', '776', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('413', '1', '480', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('414', '8', '728', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('415', '3', '343', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('416', '6', '448', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('417', '4', '581', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('418', '7', '336', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('419', '10', '312', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('420', '9', '104', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('421', '2', '0', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('422', '11', '352', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('423', '9', '154', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('424', '5', '104', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('425', '0', '105', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('426', '3', '552', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('427', '1', '357', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('428', '6', '623', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('429', '5', '567', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('430', '0', '196', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('431', '7', '32', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('432', '0', '432', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('433', '2', '736', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('434', '1', '616', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('435', '4', '406', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('436', '11', '63', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('437', '8', '196', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('438', '9', '192', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('439', '3', '49', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('440', '5', '168', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('441', '7', '504', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('442', '12', '112', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('443', '11', '688', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('444', '0', '133', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('445', '6', '259', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('446', '12', '64', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('447', '12', '385', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('448', '9', '320', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('449', '10', '8', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('450', '8', '266', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('451', '2', '736', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('452', '5', '588', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('453', '1', '357', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('454', '0', '259', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('455', '3', '525', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('456', '6', '616', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('457', '4', '280', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('458', '7', '616', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('459', '12', '252', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('460', '9', '686', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('461', '8', '441', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('462', '0', '168', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('463', '4', '364', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('464', '11', '456', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('465', '3', '488', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('466', '10', '488', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('467', '5', '640', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('468', '8', '49', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('469', '2', '77', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('470', '12', '392', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('471', '1', '364', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('472', '6', '624', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('473', '4', '96', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('474', '7', '40', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('475', '9', '7', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('476', '7', '196', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('477', '0', '532', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('478', '2', '287', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('479', '8', '32', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('480', '8', '49', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('481', '9', '392', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('482', '4', '343', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('483', '11', '630', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('484', '5', '648', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('485', '3', '364', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('486', '2', '712', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('487', '8', '96', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('488', '6', '304', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('489', '10', '56', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('490', '1', '72', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('491', '12', '584', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('492', '8', '480', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('493', '10', '624', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('494', '7', '720', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('495', '9', '0', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('496', '1', '440', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('497', '9', '462', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('498', '4', '154', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('499', '6', '140', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('500', '0', '469', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('501', '5', '63', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('502', '11', '320', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('503', '5', '336', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('504', '12', '301', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('505', '4', '376', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('506', '1', '480', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('507', '2', '536', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('508', '6', '42', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('509', '10', '483', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('510', '7', '648', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('511', '8', '203', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('512', '11', '371', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('513', '12', '504', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('514', '3', '147', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('515', '5', '21', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('516', '6', '104', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('517', '9', '320', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('518', '8', '455', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('519', '4', '35', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('520', '5', '704', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('521', '3', '96', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('522', '6', '14', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('523', '11', '488', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('524', '2', '216', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('525', '10', '792', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('526', '0', '217', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('527', '3', '744', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('528', '12', '184', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('529', '1', '595', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('530', '9', '256', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('531', '6', '96', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('532', '0', '287', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('533', '4', '192', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('534', '8', '184', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('535', '4', '568', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('536', '11', '224', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('537', '7', '8', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('538', '12', '56', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('539', '5', '21', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('540', '0', '720', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('541', '9', '133', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('542', '6', '656', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('543', '5', '200', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('544', '1', '133', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('545', '7', '252', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('546', '12', '511', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('547', '5', '189', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('548', '11', '665', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('549', '8', '560', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('550', '9', '648', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('551', '7', '712', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('552', '10', '273', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('553', '3', '760', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('554', '2', '616', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('555', '1', '175', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('556', '10', '152', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('557', '4', '497', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('558', '6', '91', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('559', '12', '168', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('560', '1', '720', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('561', '8', '200', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('562', '5', '546', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('563', '0', '14', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('564', '6', '602', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('565', '12', '98', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('566', '9', '70', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('567', '10', '133', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('568', '11', '441', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('569', '12', '308', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('570', '8', '336', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('571', '0', '280', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('572', '9', '424', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('573', '4', '574', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('574', '7', '665', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('575', '8', '736', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('576', '5', '344', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('577', '11', '343', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('578', '0', '483', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('579', '2', '63', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('580', '1', '413', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('581', '3', '368', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('582', '12', '280', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('583', '9', '287', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('584', '6', '182', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('585', '10', '280', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('586', '5', '693', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('587', '4', '592', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('588', '12', '288', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('589', '0', '128', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('590', '2', '119', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('591', '7', '308', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('592', '6', '456', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('593', '9', '637', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('594', '11', '693', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('595', '1', '42', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('596', '0', '252', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('597', '8', '72', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('598', '12', '200', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('599', '10', '343', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('600', '7', '560', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('601', '1', '64', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('602', '8', '440', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('603', '3', '35', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('604', '0', '192', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('605', '5', '413', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('606', '12', '406', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('607', '2', '672', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('608', '1', '424', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('609', '6', '658', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('610', '3', '80', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('611', '10', '792', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('612', '3', '119', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('613', '9', '133', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('614', '4', '672', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('615', '5', '154', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('616', '12', '312', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('617', '0', '350', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('618', '11', '88', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('619', '7', '544', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('620', '9', '160', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('621', '5', '176', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('622', '3', '252', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('623', '11', '504', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('624', '12', '371', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('625', '1', '296', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('626', '2', '736', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('627', '6', '536', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('628', '8', '252', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('629', '0', '40', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('630', '3', '728', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('631', '9', '182', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('632', '7', '294', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('633', '1', '483', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('634', '0', '490', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('635', '11', '424', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('636', '4', '182', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('637', '5', '21', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('638', '8', '120', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('639', '9', '245', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('640', '6', '350', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('641', '7', '600', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('642', '2', '630', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('643', '4', '424', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('644', '3', '528', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('645', '9', '432', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('646', '12', '192', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('647', '10', '154', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('648', '1', '312', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('649', '5', '168', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('650', '11', '280', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('651', '8', '518', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('652', '0', '24', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('653', '10', '455', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('654', '12', '546', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('655', '1', '63', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('656', '4', '539', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('657', '6', '406', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('658', '0', '21', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('659', '7', '672', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('660', '2', '581', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('661', '11', '72', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('662', '9', '581', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('663', '10', '357', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('664', '0', '736', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('665', '1', '168', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('666', '8', '112', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('667', '4', '120', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('668', '5', '21', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('669', '12', '696', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('670', '5', '72', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('671', '3', '126', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('672', '11', '133', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('673', '8', '104', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('674', '6', '576', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('675', '5', '609', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('676', '1', '574', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('677', '2', '232', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('678', '3', '352', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('679', '7', '152', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('680', '4', '640', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('681', '8', '427', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('682', '9', '455', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('683', '0', '273', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('684', '7', '175', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('685', '10', '469', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('686', '2', '704', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('687', '11', '80', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('688', '7', '368', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('689', '12', '644', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('690', '0', '792', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('691', '6', '203', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('692', '8', '322', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('693', '9', '656', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('694', '6', '712', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('695', '4', '680', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('696', '10', '399', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('697', '1', '624', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('698', '3', '616', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('699', '5', '77', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('700', '11', '602', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('701', '7', '497', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('702', '12', '696', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('703', '8', '112', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('704', '9', '21', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('705', '0', '287', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('706', '1', '56', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('707', '9', '448', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('708', '4', '91', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('709', '2', '182', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('710', '5', '168', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('711', '10', '608', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('712', '8', '168', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('713', '6', '728', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('714', '1', '256', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('715', '4', '70', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('716', '0', '248', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('717', '8', '608', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('718', '9', '408', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('719', '11', '616', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('720', '5', '70', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('721', '7', '16', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('722', '2', '560', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('723', '4', '224', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('724', '0', '497', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('725', '3', '712', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('726', '5', '308', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('727', '9', '266', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('728', '1', '224', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('729', '12', '420', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('730', '10', '161', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('731', '6', '329', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('732', '11', '231', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('733', '7', '196', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('734', '5', '488', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('735', '4', '736', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('736', '8', '154', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('737', '2', '210', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('738', '9', '441', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('739', '6', '600', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('740', '12', '256', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('741', '0', '665', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('742', '11', '560', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('743', '1', '630', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('744', '7', '343', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('745', '8', '400', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('746', '3', '147', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('747', '2', '350', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('748', '9', '364', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('749', '10', '744', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('750', '4', '672', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('751', '5', '336', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('752', '11', '588', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('753', '3', '609', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('754', '1', '336', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('755', '12', '301', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('756', '6', '595', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('757', '9', '488', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('758', '5', '119', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('759', '12', '14', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('760', '0', '406', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('761', '11', '304', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('762', '8', '56', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('763', '4', '336', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('764', '12', '624', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('765', '8', '581', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('766', '2', '63', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('767', '10', '240', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('768', '5', '248', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('769', '1', '584', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('770', '6', '581', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('771', '3', '472', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('772', '11', '595', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('773', '7', '588', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('774', '2', '592', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('775', '9', '413', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('776', '4', '280', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('777', '5', '49', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('778', '0', '497', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('779', '12', '112', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('780', '5', '328', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('781', '8', '385', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('782', '4', '315', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('783', '3', '238', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('784', '1', '630', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('785', '11', '392', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('786', '10', '480', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('787', '9', '48', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('788', '12', '760', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('789', '5', '420', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('790', '7', '0', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('791', '9', '490', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('792', '6', '483', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('793', '3', '736', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('794', '11', '208', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('795', '7', '469', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('796', '10', '637', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('797', '0', '152', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('798', '2', '532', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('799', '5', '712', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('800', '9', '238', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('801', '12', '144', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('802', '11', '483', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('803', '8', '84', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('804', '6', '104', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('805', '1', '658', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('806', '12', '497', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('807', '3', '104', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('808', '9', '84', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('809', '7', '357', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('810', '6', '432', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('811', '8', '264', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('812', '10', '483', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('813', '9', '378', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('814', '2', '189', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('815', '3', '448', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('816', '8', '608', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('817', '12', '248', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('818', '7', '322', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('819', '11', '98', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('820', '1', '588', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('821', '5', '16', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('822', '0', '679', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('823', '4', '712', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('824', '10', '329', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('825', '2', '88', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('826', '9', '728', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('827', '11', '248', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('828', '2', '560', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('829', '6', '539', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('830', '5', '77', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('831', '3', '497', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('832', '12', '21', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('833', '8', '536', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('834', '7', '0', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('835', '5', '360', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('836', '10', '630', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('837', '4', '497', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('838', '1', '224', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('839', '6', '680', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('840', '11', '16', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('841', '0', '496', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('842', '9', '259', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('843', '12', '371', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('844', '5', '544', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('845', '2', '462', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('846', '3', '192', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('847', '8', '469', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('848', '1', '420', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('849', '9', '651', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('850', '3', '392', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('851', '0', '72', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('852', '4', '693', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('853', '2', '104', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('854', '10', '232', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('855', '11', '352', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('856', '6', '518', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('857', '5', '440', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('858', '0', '294', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('859', '7', '144', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('860', '2', '532', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('861', '12', '567', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('862', '10', '182', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('863', '1', '696', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('864', '11', '400', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('865', '7', '497', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('866', '10', '525', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('867', '4', '259', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('868', '6', '520', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('869', '8', '168', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('870', '5', '16', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('871', '0', '616', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('872', '3', '273', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('873', '12', '480', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('874', '2', '432', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('875', '9', '203', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('876', '5', '72', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('877', '7', '488', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('878', '1', '581', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('879', '10', '64', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('880', '8', '42', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('881', '4', '400', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('882', '11', '497', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('883', '10', '56', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('884', '3', '301', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('885', '10', '112', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('886', '8', '245', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('887', '6', '308', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('888', '9', '360', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('889', '5', '266', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('890', '12', '665', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('891', '7', '42', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('892', '4', '686', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('893', '2', '238', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('894', '3', '488', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('895', '8', '160', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('896', '6', '248', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('897', '5', '648', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('898', '1', '72', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('899', '10', '416', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('900', '8', '469', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('901', '0', '357', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('902', '9', '392', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('903', '2', '424', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('904', '11', '497', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('905', '7', '595', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('906', '4', '552', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('907', '1', '126', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('908', '12', '600', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('909', '0', '301', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('910', '9', '175', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('911', '5', '413', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('912', '10', '532', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('913', '9', '287', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('914', '1', '644', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('915', '2', '77', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('916', '7', '32', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('917', '6', '574', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('918', '3', '644', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('919', '4', '385', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('920', '5', '168', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('921', '0', '192', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('922', '2', '712', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('923', '5', '200', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('924', '11', '224', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('925', '12', '651', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('926', '8', '8', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('927', '0', '686', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('928', '9', '376', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('929', '10', '288', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('930', '7', '119', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('931', '5', '126', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('932', '8', '280', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('933', '6', '480', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('934', '4', '640', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('935', '3', '315', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('936', '5', '416', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('937', '9', '595', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('938', '1', '504', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('939', '10', '392', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('940', '12', '712', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('941', '7', '792', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('942', '8', '441', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('943', '11', '432', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('944', '2', '119', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('945', '4', '203', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('946', '3', '42', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('947', '2', '336', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('948', '0', '462', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('949', '6', '184', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('950', '1', '42', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('951', '4', '273', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('952', '5', '196', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('953', '3', '693', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('954', '9', '315', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('955', '7', '462', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('956', '10', '696', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('957', '1', '264', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('958', '12', '588', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('959', '6', '287', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('960', '11', '21', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('961', '8', '567', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('962', '5', '371', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('963', '0', '424', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('964', '4', '434', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('965', '9', '720', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('966', '7', '416', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('967', '2', '406', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('968', '11', '424', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('969', '1', '760', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('970', '4', '512', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('971', '10', '448', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('972', '3', '464', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('973', '12', '252', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('974', '0', '112', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('975', '12', '287', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('976', '8', '84', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('977', '5', '104', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('978', '6', '413', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('979', '7', '392', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('980', '0', '56', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('981', '9', '384', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('982', '4', '476', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('983', '2', '360', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('984', '0', '154', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('985', '12', '432', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('986', '0', '686', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('987', '3', '49', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('988', '11', '119', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('989', '6', '400', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('990', '3', '368', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('991', '7', '600', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('992', '10', '651', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('993', '4', '16', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('994', '5', '686', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('995', '11', '328', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('996', '2', '8', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('997', '12', '126', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('998', '2', '63', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('999', '3', '128', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('1000', '6', '238', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('1001', '11', '497', '2011-06-08', null);
INSERT INTO `receive_goose` VALUES ('1002', '0', '168', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('1003', '1', '644', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('1004', '12', '420', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1005', '8', '360', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('1006', '3', '532', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('1007', '7', '592', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1008', '6', '665', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('1009', '2', '147', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('1010', '5', '483', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('1011', '0', '168', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('1012', '4', '584', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1013', '10', '49', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('1014', '9', '189', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('1015', '12', '392', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1016', '0', '294', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('1017', '2', '664', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('1018', '1', '112', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('1019', '11', '248', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('1020', '7', '511', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('1021', '10', '210', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('1022', '5', '496', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('1023', '8', '315', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1024', '6', '42', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('1025', '0', '140', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('1026', '4', '581', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('1027', '1', '371', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('1028', '11', '413', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1029', '3', '272', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('1030', '6', '546', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('1031', '9', '288', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('1032', '12', '14', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('1033', '0', '175', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('1034', '8', '784', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1035', '2', '680', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('1036', '10', '624', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('1037', '7', '432', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1038', '5', '532', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('1039', '1', '128', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('1040', '0', '693', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('1041', '12', '248', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('1042', '3', '630', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('1043', '1', '406', '2011-06-08', null);
INSERT INTO `receive_goose` VALUES ('1044', '11', '792', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1045', '9', '63', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1046', '2', '483', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('1047', '6', '200', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('1048', '8', '245', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1049', '5', '602', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('1050', '4', '440', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('1051', '6', '154', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('1052', '9', '512', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1053', '0', '744', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1054', '3', '216', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('1055', '8', '280', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('1056', '10', '294', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('1057', '6', '280', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('1058', '12', '287', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('1059', '11', '238', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('1060', '3', '168', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('1061', '1', '472', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('1062', '2', '476', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('1063', '10', '378', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('1064', '7', '280', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('1065', '4', '712', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1066', '8', '0', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('1067', '0', '488', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1068', '3', '352', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('1069', '12', '280', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('1070', '6', '344', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('1071', '8', '760', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1072', '9', '637', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('1073', '5', '496', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1074', '11', '136', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('1075', '10', '665', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('1076', '7', '392', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1077', '1', '126', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('1078', '6', '455', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1079', '11', '352', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('1080', '12', '536', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('1081', '3', '544', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('1082', '0', '280', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('1083', '4', '588', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('1084', '7', '49', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1085', '5', '32', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1086', '8', '28', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1087', '9', '84', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1088', '8', '693', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1089', '12', '504', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('1090', '0', '488', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('1091', '9', '264', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('1092', '10', '322', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('1093', '2', '616', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('1094', '3', '588', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('1095', '7', '525', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('1096', '11', '441', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('1097', '4', '658', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('1098', '9', '406', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('1099', '5', '385', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('1100', '10', '315', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('1101', '12', '427', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1102', '7', '296', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('1103', '6', '182', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('1104', '11', '600', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1105', '8', '574', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1106', '9', '464', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('1107', '2', '490', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('1108', '3', '8', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('1109', '1', '196', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1110', '3', '104', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('1111', '5', '406', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1112', '4', '624', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('1113', '6', '504', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1114', '7', '357', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1115', '0', '776', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1116', '10', '632', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('1117', '12', '560', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('1118', '11', '518', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('1119', '9', '469', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1120', '3', '637', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('1121', '1', '0', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('1122', '8', '200', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1123', '4', '392', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1124', '5', '553', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('1125', '1', '469', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('1126', '2', '301', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('1127', '8', '105', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1128', '12', '736', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('1129', '10', '7', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('1130', '6', '385', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('1131', '7', '672', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('1132', '9', '32', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1133', '8', '656', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1134', '4', '147', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1135', '3', '28', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('1136', '9', '224', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1137', '4', '245', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('1138', '3', '296', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('1139', '11', '371', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1140', '2', '427', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('1141', '10', '105', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('1142', '5', '128', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('1143', '0', '154', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('1144', '5', '441', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('1145', '1', '632', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('1146', '9', '294', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1147', '10', '600', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('1148', '7', '432', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1149', '11', '136', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1150', '0', '168', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('1151', '4', '552', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('1152', '12', '203', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('1153', '8', '488', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1154', '9', '296', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1155', '2', '272', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('1156', '6', '651', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('1157', '12', '21', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('1158', '11', '704', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('1159', '9', '315', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1160', '5', '152', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('1161', '3', '434', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('1162', '12', '48', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1163', '0', '304', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('1164', '7', '406', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('1165', '10', '574', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('1166', '5', '630', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('1167', '2', '136', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('1168', '8', '288', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('1169', '0', '16', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1170', '6', '693', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('1171', '2', '384', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('1172', '1', '378', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('1173', '8', '672', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1174', '3', '91', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1175', '9', '0', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1176', '11', '600', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('1177', '10', '784', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('1178', '4', '448', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('1179', '12', '462', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1180', '3', '84', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('1181', '0', '168', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('1182', '9', '336', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('1183', '1', '416', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1184', '7', '472', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1185', '0', '434', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('1186', '5', '32', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1187', '12', '72', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1188', '6', '693', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('1189', '9', '147', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('1190', '5', '630', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1191', '2', '152', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1192', '12', '588', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1193', '4', '672', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1194', '7', '336', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('1195', '0', '536', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1196', '2', '679', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('1197', '1', '248', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('1198', '9', '752', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('1199', '11', '238', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('1200', '10', '144', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('1201', '12', '104', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('1202', '7', '128', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('1203', '6', '432', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1204', '3', '304', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1205', '0', '686', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('1206', '1', '539', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('1207', '5', '536', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1208', '10', '434', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('1209', '7', '560', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('1210', '12', '119', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('1211', '3', '343', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('1212', '2', '648', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('1213', '4', '399', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('1214', '12', '399', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1215', '1', '720', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('1216', '5', '413', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1217', '10', '760', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('1218', '0', '154', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1219', '6', '416', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('1220', '11', '728', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('1221', '7', '352', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1222', '3', '200', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1223', '4', '693', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('1224', '2', '364', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('1225', '5', '592', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1226', '0', '168', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('1227', '12', '427', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1228', '3', '679', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('1229', '1', '119', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1230', '7', '413', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1231', '6', '672', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1232', '0', '469', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('1233', '2', '8', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1234', '11', '280', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('1235', '2', '232', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('1236', '4', '553', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1237', '10', '476', '2011-06-08', null);
INSERT INTO `receive_goose` VALUES ('1238', '1', '112', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1239', '0', '568', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('1240', '5', '648', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1241', '2', '472', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('1242', '1', '595', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('1243', '11', '140', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1244', '7', '368', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1245', '3', '432', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('1246', '6', '336', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1247', '4', '208', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('1248', '7', '217', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1249', '10', '392', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('1250', '0', '315', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('1251', '11', '736', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1252', '2', '420', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1253', '1', '216', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('1254', '6', '357', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('1255', '5', '252', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('1256', '4', '456', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('1257', '3', '224', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1258', '7', '752', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1259', '0', '0', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1260', '0', '35', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1261', '5', '456', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1262', '1', '266', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('1263', '0', '472', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1264', '2', '406', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('1265', '6', '665', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1266', '3', '392', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1267', '10', '648', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('1268', '4', '357', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('1269', '1', '312', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('1270', '11', '472', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1271', '5', '624', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1272', '2', '98', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('1273', '3', '238', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('1274', '0', '448', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1275', '4', '712', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1276', '7', '217', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1277', '1', '511', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('1278', '6', '616', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('1279', '2', '168', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('1280', '10', '776', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('1281', '2', '322', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('1282', '7', '744', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1283', '11', '256', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1284', '0', '592', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('1285', '3', '343', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('1286', '1', '168', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1287', '11', '792', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('1288', '2', '432', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('1289', '4', '217', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1290', '6', '434', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('1291', '1', '704', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1292', '3', '576', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1293', '4', '656', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1294', '10', '595', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('1295', '0', '256', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1296', '2', '744', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1297', '7', '168', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1298', '6', '182', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1299', '7', '152', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('1300', '0', '304', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1301', '11', '696', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('1302', '7', '637', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('1303', '6', '105', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1304', '3', '784', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1305', '1', '416', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1306', '6', '96', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('1307', '4', '588', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1308', '0', '357', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1309', '10', '175', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('1310', '6', '35', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('1311', '10', '200', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('1312', '2', '256', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1313', '1', '70', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('1314', '6', '553', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1315', '0', '424', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1316', '1', '238', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1317', '10', '217', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('1318', '11', '238', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('1319', '7', '294', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('1320', '4', '84', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1321', '2', '168', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('1322', '4', '245', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1323', '1', '21', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('1324', '3', '245', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('1325', '11', '792', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1326', '10', '630', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('1327', '1', '602', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('1328', '2', '672', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('1329', '0', '664', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1330', '4', '322', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1331', '6', '280', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1332', '3', '304', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('1333', '4', '504', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('1334', '6', '760', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1335', '3', '133', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('1336', '1', '408', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1337', '3', '352', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1338', '10', '7', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('1339', '10', '483', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('1340', '11', '252', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1341', '0', '525', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('1342', '2', '120', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('1343', '4', '696', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1344', '2', '632', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('1345', '1', '8', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1346', '11', '720', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1347', '1', '77', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('1348', '3', '490', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1349', '1', '413', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('1350', '10', '210', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('1351', '0', '119', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('1352', '6', '64', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1353', '6', '189', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('1354', '0', '96', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1355', '10', '360', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('1356', '1', '72', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1357', '0', '413', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('1358', '1', '413', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1359', '4', '196', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('1360', '3', '64', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('1361', '6', '376', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1362', '2', '520', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1363', '3', '336', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('1364', '11', '434', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1365', '4', '49', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('1366', '10', '581', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('1367', '4', '104', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1368', '4', '56', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('1369', '1', '368', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1370', '3', '696', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1371', '11', '456', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1372', '2', '28', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1373', '2', '112', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1374', '1', '744', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1375', '10', '280', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('1376', '2', '40', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1377', '2', '406', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('1378', '11', '231', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1379', '10', '273', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('1380', '3', '357', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('1381', '11', '232', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1382', '2', '304', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('1383', '10', '112', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('1384', '11', '624', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('1385', '10', '91', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('1386', '3', '704', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1387', '1', '511', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('1388', '2', '72', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('1389', '10', '528', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('1390', '1', '623', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('1391', '11', '273', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('1392', '10', '133', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('1393', '3', '384', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1394', '10', '456', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('1395', '3', '602', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('1396', '1', '384', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1397', '10', '160', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('1398', '10', '574', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('1399', '3', '399', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('1400', '10', '576', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('1401', '3', '147', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('1402', '3', '56', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('1403', '3', '483', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('1404', '10', '568', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('1405', '10', '680', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('1406', '10', '455', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('1407', '10', '168', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('1408', '10', '48', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('1409', '10', '294', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('1410', '7', '744', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1411', '5', '584', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1412', '3', '752', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1413', '6', '567', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1414', '4', '630', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1415', '1', '416', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1416', '10', '528', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1417', '0', '448', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1418', '2', '301', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1419', '12', '208', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1420', '8', '84', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1421', '9', '595', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1422', '11', '231', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('1423', '8', '273', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1424', '8', '490', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1425', '12', '504', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1426', '2', '28', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1427', '0', '96', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1428', '1', '637', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1429', '9', '28', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1430', '6', '679', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1431', '11', '280', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1432', '7', '294', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1433', '2', '32', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1434', '4', '168', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1435', '8', '704', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1436', '5', '455', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1437', '0', '168', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1438', '10', '420', '2012-10-03', null);
INSERT INTO `receive_goose` VALUES ('1439', '2', '476', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1440', '4', '420', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1441', '9', '0', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1442', '11', '248', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1443', '9', '658', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1444', '0', '616', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1445', '3', '600', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1446', '7', '744', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1447', '4', '672', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1448', '8', '469', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1449', '5', '616', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1450', '12', '336', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1451', '10', '384', '2012-10-02', null);
INSERT INTO `receive_goose` VALUES ('1452', '11', '644', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1453', '6', '304', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1454', '2', '560', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1455', '1', '532', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('1456', '9', '784', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1457', '8', '48', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1458', '5', '175', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1459', '3', '644', '2012-09-26', null);
INSERT INTO `receive_goose` VALUES ('1460', '11', '448', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1461', '8', '264', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1462', '0', '120', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1463', '4', '77', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1464', '7', '136', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1465', '1', '336', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('1466', '6', '98', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('1467', '12', '656', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1468', '5', '760', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1469', '7', '126', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1470', '8', '568', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1471', '0', '0', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('1472', '0', '784', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1473', '10', '328', '2012-09-24', null);
INSERT INTO `receive_goose` VALUES ('1474', '11', '736', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1475', '6', '133', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1476', '4', '312', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1477', '3', '80', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1478', '1', '16', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1479', '7', '624', '2012-09-16', null);
INSERT INTO `receive_goose` VALUES ('1480', '2', '126', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('1481', '1', '688', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('1482', '12', '352', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('1483', '8', '352', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1484', '3', '119', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('1485', '9', '84', '2012-09-19', null);
INSERT INTO `receive_goose` VALUES ('1486', '6', '168', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1487', '5', '0', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1488', '4', '456', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('1489', '6', '630', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('1490', '0', '539', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('1491', '10', '728', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1492', '8', '104', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1493', '5', '328', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1494', '12', '364', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1495', '3', '84', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1496', '9', '581', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1497', '2', '784', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('1498', '7', '56', '2012-09-12', null);
INSERT INTO `receive_goose` VALUES ('1499', '5', '448', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('1500', '11', '161', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1501', '4', '119', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1502', '1', '322', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1503', '0', '322', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1504', '11', '259', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1505', '8', '462', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1506', '3', '308', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1507', '6', '147', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1508', '12', '472', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1509', '7', '744', '2012-09-08', null);
INSERT INTO `receive_goose` VALUES ('1510', '10', '637', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1511', '1', '728', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1512', '5', '210', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1513', '11', '539', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('1514', '6', '56', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1515', '8', '371', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1516', '2', '378', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1517', '9', '240', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1518', '4', '792', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1519', '0', '175', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1520', '3', '266', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1521', '10', '312', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1522', '2', '168', '2012-08-31', null);
INSERT INTO `receive_goose` VALUES ('1523', '5', '104', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1524', '11', '679', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1525', '7', '259', '2012-09-05', null);
INSERT INTO `receive_goose` VALUES ('1526', '6', '280', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('1527', '0', '406', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1528', '1', '623', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('1529', '9', '35', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('1530', '2', '624', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('1531', '3', '441', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('1532', '5', '592', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('1533', '9', '408', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('1534', '12', '392', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('1535', '8', '224', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1536', '10', '294', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('1537', '0', '144', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1538', '7', '490', '2012-08-29', null);
INSERT INTO `receive_goose` VALUES ('1539', '6', '336', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1540', '11', '344', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1541', '8', '712', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('1542', '4', '245', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1543', '1', '432', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1544', '0', '784', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1545', '3', '182', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1546', '2', '567', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1547', '12', '224', '2012-08-23', null);
INSERT INTO `receive_goose` VALUES ('1548', '5', '416', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1549', '6', '539', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('1550', '7', '315', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1551', '11', '665', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('1552', '6', '336', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1553', '12', '280', '2012-08-22', null);
INSERT INTO `receive_goose` VALUES ('1554', '0', '432', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('1555', '7', '385', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1556', '3', '196', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('1557', '8', '112', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1558', '10', '126', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1559', '4', '441', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('1560', '1', '252', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1561', '10', '360', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1562', '6', '210', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1563', '9', '105', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1564', '7', '539', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('1565', '12', '21', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1566', '5', '133', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1567', '2', '560', '2012-08-15', null);
INSERT INTO `receive_goose` VALUES ('1568', '4', '128', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('1569', '0', '320', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1570', '3', '440', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1571', '10', '217', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1572', '9', '532', '2012-08-08', null);
INSERT INTO `receive_goose` VALUES ('1573', '12', '546', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1574', '8', '24', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1575', '1', '8', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1576', '5', '64', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1577', '11', '408', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1578', '6', '216', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1579', '1', '308', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('1580', '7', '384', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('1581', '0', '70', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1582', '10', '217', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1583', '3', '736', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1584', '9', '112', '2012-08-07', null);
INSERT INTO `receive_goose` VALUES ('1585', '6', '696', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1586', '4', '28', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1587', '2', '357', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1588', '4', '679', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('1589', '1', '88', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1590', '8', '42', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1591', '9', '144', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1592', '1', '160', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1593', '5', '42', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1594', '7', '371', '2012-08-01', null);
INSERT INTO `receive_goose` VALUES ('1595', '10', '280', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('1596', '8', '640', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1597', '11', '35', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1598', '0', '231', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1599', '9', '105', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('1600', '5', '196', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1601', '9', '96', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('1602', '12', '568', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1603', '1', '574', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1604', '2', '488', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1605', '10', '168', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1606', '11', '248', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1607', '5', '231', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('1608', '3', '696', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('1609', '10', '462', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1610', '4', '328', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1611', '6', '56', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1612', '6', '112', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1613', '11', '427', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('1614', '12', '416', '2012-07-22', null);
INSERT INTO `receive_goose` VALUES ('1615', '1', '16', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('1616', '6', '784', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('1617', '7', '520', '2012-07-30', null);
INSERT INTO `receive_goose` VALUES ('1618', '10', '776', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('1619', '5', '14', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1620', '4', '784', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1621', '1', '119', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1622', '8', '266', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('1623', '2', '546', '2012-07-25', null);
INSERT INTO `receive_goose` VALUES ('1624', '12', '126', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1625', '11', '520', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('1626', '0', '420', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1627', '3', '266', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1628', '12', '630', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('1629', '7', '574', '2012-07-18', null);
INSERT INTO `receive_goose` VALUES ('1630', '3', '245', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1631', '1', '352', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1632', '0', '288', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1633', '9', '224', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('1634', '11', '231', '2012-07-04', null);
INSERT INTO `receive_goose` VALUES ('1635', '2', '364', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('1636', '5', '56', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1637', '10', '399', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1638', '6', '287', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1639', '4', '644', '2012-07-11', null);
INSERT INTO `receive_goose` VALUES ('1640', '11', '288', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1641', '12', '680', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1642', '2', '616', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('1643', '5', '322', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1644', '8', '119', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('1645', '9', '312', '2012-06-28', null);
INSERT INTO `receive_goose` VALUES ('1646', '7', '576', '2012-07-14', null);
INSERT INTO `receive_goose` VALUES ('1647', '6', '272', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('1648', '1', '371', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1649', '10', '592', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('1650', '11', '600', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1651', '9', '200', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1652', '8', '744', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1653', '6', '553', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1654', '0', '200', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('1655', '12', '584', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1656', '1', '176', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1657', '7', '64', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('1658', '0', '511', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1659', '2', '378', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1660', '7', '216', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1661', '5', '360', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('1662', '3', '536', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1663', '4', '424', '2012-07-06', null);
INSERT INTO `receive_goose` VALUES ('1664', '7', '364', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1665', '6', '518', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1666', '12', '126', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1667', '10', '245', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1668', '2', '203', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1669', '12', '232', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('1670', '11', '588', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1671', '0', '406', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1672', '1', '217', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1673', '9', '448', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1674', '7', '272', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1675', '4', '308', '2012-06-27', null);
INSERT INTO `receive_goose` VALUES ('1676', '12', '7', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1677', '5', '16', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1678', '1', '320', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1679', '7', '280', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1680', '12', '784', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('1681', '0', '400', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1682', '4', '672', '2012-06-20', null);
INSERT INTO `receive_goose` VALUES ('1683', '5', '189', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1684', '6', '456', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1685', '11', '24', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1686', '1', '497', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('1687', '11', '483', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1688', '3', '455', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1689', '8', '294', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1690', '10', '287', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('1691', '7', '24', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('1692', '6', '217', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('1693', '8', '112', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('1694', '9', '424', '2012-06-12', null);
INSERT INTO `receive_goose` VALUES ('1695', '5', '448', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('1696', '11', '7', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('1697', '1', '273', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1698', '7', '546', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('1699', '0', '539', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('1700', '3', '440', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('1701', '2', '147', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1702', '12', '147', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1703', '8', '448', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('1704', '4', '266', '2012-06-13', null);
INSERT INTO `receive_goose` VALUES ('1705', '1', '7', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('1706', '6', '680', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1707', '12', '408', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1708', '1', '432', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('1709', '9', '72', '2012-06-04', null);
INSERT INTO `receive_goose` VALUES ('1710', '10', '744', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('1711', '5', '175', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1712', '3', '651', '2012-05-23', null);
INSERT INTO `receive_goose` VALUES ('1713', '9', '294', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1714', '7', '462', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1715', '8', '24', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1716', '4', '203', '2012-06-06', null);
INSERT INTO `receive_goose` VALUES ('1717', '8', '497', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('1718', '11', '88', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('1719', '12', '304', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1720', '2', '168', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1721', '11', '637', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1722', '6', '240', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('1723', '4', '672', '2012-05-30', null);
INSERT INTO `receive_goose` VALUES ('1724', '0', '0', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1725', '2', '640', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1726', '7', '184', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1727', '10', '91', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1728', '0', '273', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1729', '8', '64', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1730', '12', '64', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1731', '3', '624', '2012-05-19', null);
INSERT INTO `receive_goose` VALUES ('1732', '7', '203', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1733', '9', '8', '2012-05-27', null);
INSERT INTO `receive_goose` VALUES ('1734', '6', '98', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1735', '12', '77', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1736', '0', '136', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('1737', '9', '744', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1738', '8', '672', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('1739', '6', '658', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('1740', '10', '532', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1741', '11', '88', '2012-05-11', null);
INSERT INTO `receive_goose` VALUES ('1742', '4', '546', '2012-05-16', null);
INSERT INTO `receive_goose` VALUES ('1743', '12', '656', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('1744', '0', '56', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1745', '11', '483', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1746', '5', '528', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1747', '0', '360', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('1748', '2', '256', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1749', '1', '448', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1750', '7', '568', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1751', '3', '427', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1752', '0', '77', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1753', '1', '416', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1754', '11', '658', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('1755', '8', '440', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1756', '0', '328', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('1757', '6', '560', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1758', '5', '560', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1759', '3', '616', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1760', '12', '385', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1761', '1', '200', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1762', '9', '70', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1763', '7', '536', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1764', '0', '48', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1765', '6', '384', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('1766', '8', '588', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1767', '9', '434', '2012-05-02', null);
INSERT INTO `receive_goose` VALUES ('1768', '4', '231', '2012-05-09', null);
INSERT INTO `receive_goose` VALUES ('1769', '1', '686', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1770', '0', '7', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1771', '5', '56', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('1772', '6', '0', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('1773', '7', '343', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('1774', '2', '42', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1775', '10', '728', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('1776', '0', '581', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('1777', '3', '476', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1778', '11', '240', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1779', '6', '203', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1780', '9', '544', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1781', '5', '490', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1782', '2', '196', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1783', '11', '240', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('1784', '4', '600', '2012-05-03', null);
INSERT INTO `receive_goose` VALUES ('1785', '7', '672', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1786', '12', '287', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('1787', '8', '448', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1788', '2', '312', '2012-04-09', null);
INSERT INTO `receive_goose` VALUES ('1789', '1', '656', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('1790', '0', '616', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1791', '6', '413', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('1792', '5', '176', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1793', '11', '266', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('1794', '12', '568', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1795', '9', '256', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('1796', '5', '525', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1797', '10', '32', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1798', '4', '28', '2012-04-25', null);
INSERT INTO `receive_goose` VALUES ('1799', '2', '280', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1800', '10', '77', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1801', '4', '245', '2012-04-18', null);
INSERT INTO `receive_goose` VALUES ('1802', '6', '48', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('1803', '8', '35', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('1804', '7', '154', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1805', '10', '602', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1806', '6', '616', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('1807', '11', '648', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1808', '3', '448', '2012-04-17', null);
INSERT INTO `receive_goose` VALUES ('1809', '9', '392', '2012-04-04', null);
INSERT INTO `receive_goose` VALUES ('1810', '1', '224', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('1811', '7', '552', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('1812', '2', '35', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('1813', '8', '252', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1814', '5', '72', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('1815', '4', '539', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1816', '0', '476', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1817', '9', '400', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1818', '2', '336', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('1819', '8', '399', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1820', '6', '528', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1821', '3', '637', '2012-04-11', null);
INSERT INTO `receive_goose` VALUES ('1822', '5', '637', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('1823', '12', '154', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1824', '7', '196', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('1825', '11', '98', '2012-03-28', null);
INSERT INTO `receive_goose` VALUES ('1826', '12', '280', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('1827', '4', '736', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1828', '1', '496', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1829', '8', '216', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('1830', '10', '760', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1831', '2', '792', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1832', '11', '176', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('1833', '7', '200', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1834', '6', '216', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1835', '5', '320', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1836', '0', '434', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1837', '12', '147', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1838', '11', '496', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1839', '9', '532', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('1840', '1', '385', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('1841', '7', '651', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('1842', '8', '455', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('1843', '12', '581', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('1844', '6', '49', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1845', '4', '0', '2012-03-24', null);
INSERT INTO `receive_goose` VALUES ('1846', '5', '368', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('1847', '3', '216', '2012-04-01', null);
INSERT INTO `receive_goose` VALUES ('1848', '4', '126', '2012-03-21', null);
INSERT INTO `receive_goose` VALUES ('1849', '10', '175', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('1850', '0', '609', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1851', '8', '512', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1852', '4', '536', '2012-03-16', null);
INSERT INTO `receive_goose` VALUES ('1853', '1', '608', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1854', '6', '245', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1855', '9', '350', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1856', '5', '434', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('1857', '10', '520', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('1858', '11', '296', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1859', '3', '693', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('1860', '2', '350', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('1861', '12', '609', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1862', '9', '497', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('1863', '4', '595', '2012-03-14', null);
INSERT INTO `receive_goose` VALUES ('1864', '6', '497', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('1865', '8', '560', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('1866', '10', '440', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('1867', '5', '48', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('1868', '0', '592', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('1869', '7', '688', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('1870', '2', '536', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1871', '11', '616', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1872', '4', '608', '2012-03-08', null);
INSERT INTO `receive_goose` VALUES ('1873', '9', '152', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('1874', '6', '240', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('1875', '12', '368', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1876', '1', '272', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1877', '3', '637', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('1878', '0', '784', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1879', '8', '272', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('1880', '1', '7', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1881', '9', '21', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1882', '5', '259', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('1883', '10', '623', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('1884', '12', '21', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1885', '6', '664', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('1886', '2', '476', '2012-02-22', null);
INSERT INTO `receive_goose` VALUES ('1887', '9', '392', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1888', '11', '512', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('1889', '5', '744', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('1890', '8', '679', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('1891', '12', '378', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1892', '3', '336', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1893', '4', '147', '2012-03-07', null);
INSERT INTO `receive_goose` VALUES ('1894', '1', '88', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1895', '0', '98', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('1896', '7', '264', '2012-02-13', null);
INSERT INTO `receive_goose` VALUES ('1897', '2', '544', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('1898', '11', '644', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('1899', '0', '7', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('1900', '10', '161', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('1901', '6', '88', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('1902', '1', '784', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('1903', '0', '224', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('1904', '6', '469', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('1905', '9', '72', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('1906', '8', '720', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('1907', '4', '144', '2012-02-29', null);
INSERT INTO `receive_goose` VALUES ('1908', '10', '608', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1909', '7', '644', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1910', '12', '728', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('1911', '5', '490', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('1912', '3', '210', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1913', '3', '399', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1914', '9', '28', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('1915', '4', '512', '2012-02-21', null);
INSERT INTO `receive_goose` VALUES ('1916', '10', '544', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('1917', '6', '640', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1918', '1', '588', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('1919', '0', '704', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('1920', '8', '546', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1921', '9', '567', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1922', '2', '231', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1923', '3', '469', '2012-02-01', null);
INSERT INTO `receive_goose` VALUES ('1924', '5', '584', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('1925', '12', '301', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('1926', '4', '0', '2012-02-15', null);
INSERT INTO `receive_goose` VALUES ('1927', '7', '552', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1928', '1', '456', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('1929', '11', '434', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1930', '4', '496', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('1931', '12', '320', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1932', '8', '14', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('1933', '9', '200', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1934', '6', '408', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('1935', '3', '480', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1936', '8', '208', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('1937', '7', '144', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1938', '9', '440', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1939', '2', '140', '2012-02-08', null);
INSERT INTO `receive_goose` VALUES ('1940', '1', '455', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('1941', '0', '539', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1942', '10', '630', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('1943', '5', '686', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('1944', '6', '280', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('1945', '2', '624', '2012-02-05', null);
INSERT INTO `receive_goose` VALUES ('1946', '4', '560', '2012-01-28', null);
INSERT INTO `receive_goose` VALUES ('1947', '8', '224', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('1948', '12', '384', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('1949', '7', '432', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('1950', '9', '560', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1951', '3', '462', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1952', '11', '360', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1953', '8', '336', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('1954', '6', '408', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('1955', '12', '357', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('1956', '5', '264', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1957', '10', '8', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('1958', '1', '518', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1959', '3', '364', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1960', '11', '63', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('1961', '9', '350', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1962', '2', '392', '2012-01-25', null);
INSERT INTO `receive_goose` VALUES ('1963', '10', '120', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('1964', '5', '266', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('1965', '12', '488', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('1966', '6', '462', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('1967', '3', '497', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1968', '10', '736', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('1969', '9', '630', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1970', '1', '80', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('1971', '4', '192', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1972', '11', '623', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('1973', '5', '504', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('1974', '7', '581', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('1975', '8', '8', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('1976', '1', '476', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('1977', '0', '588', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('1978', '2', '680', '2012-01-20', null);
INSERT INTO `receive_goose` VALUES ('1979', '8', '48', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('1980', '6', '760', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('1981', '8', '488', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('1982', '12', '420', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('1983', '4', '420', '2012-01-18', null);
INSERT INTO `receive_goose` VALUES ('1984', '5', '119', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('1985', '9', '776', '2011-12-19', null);
INSERT INTO `receive_goose` VALUES ('1986', '7', '154', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('1987', '0', '216', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('1988', '5', '512', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('1989', '1', '184', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('1990', '12', '152', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('1991', '3', '434', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('1992', '7', '105', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('1993', '11', '287', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('1994', '1', '488', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('1995', '12', '315', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('1996', '10', '280', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('1997', '2', '760', '2012-01-12', null);
INSERT INTO `receive_goose` VALUES ('1998', '6', '224', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('1999', '8', '630', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2000', '4', '196', '2012-01-11', null);
INSERT INTO `receive_goose` VALUES ('2001', '11', '536', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('2002', '7', '560', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('2003', '9', '70', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('2004', '3', '464', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('2005', '6', '200', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('2006', '12', '360', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('2007', '0', '48', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('2008', '5', '168', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('2009', '10', '736', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('2010', '0', '312', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('2011', '5', '504', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('2012', '1', '664', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2013', '7', '595', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('2014', '6', '483', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('2015', '4', '576', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('2016', '8', '248', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2017', '3', '792', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('2018', '5', '704', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2019', '12', '264', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('2020', '8', '56', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2021', '2', '408', '2012-01-04', null);
INSERT INTO `receive_goose` VALUES ('2022', '9', '168', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('2023', '12', '520', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('2024', '11', '490', '2011-12-21', null);
INSERT INTO `receive_goose` VALUES ('2025', '0', '42', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('2026', '8', '104', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('2027', '4', '120', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('2028', '10', '441', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('2029', '6', '144', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2030', '0', '680', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('2031', '4', '301', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('2032', '2', '63', '2011-12-28', null);
INSERT INTO `receive_goose` VALUES ('2033', '8', '464', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2034', '1', '640', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2035', '9', '384', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('2036', '5', '224', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2037', '7', '14', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('2038', '11', '546', '2011-12-14', null);
INSERT INTO `receive_goose` VALUES ('2039', '6', '296', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2040', '12', '16', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('2041', '2', '40', '2011-12-27', null);
INSERT INTO `receive_goose` VALUES ('2042', '3', '644', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('2043', '10', '182', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2044', '2', '320', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('2045', '7', '105', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('2046', '4', '112', '2011-12-11', null);
INSERT INTO `receive_goose` VALUES ('2047', '12', '560', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('2048', '8', '520', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2049', '9', '595', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('2050', '5', '63', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('2051', '4', '238', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('2052', '0', '704', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2053', '1', '329', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2054', '5', '672', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('2055', '4', '21', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('2056', '6', '658', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2057', '11', '651', '2011-12-07', null);
INSERT INTO `receive_goose` VALUES ('2058', '10', '240', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2059', '1', '552', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('2060', '2', '792', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('2061', '3', '520', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('2062', '7', '371', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('2063', '9', '630', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('2064', '12', '256', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2065', '5', '651', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('2066', '8', '455', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('2067', '0', '210', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('2068', '7', '648', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('2069', '4', '64', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('2070', '11', '696', '2011-12-03', null);
INSERT INTO `receive_goose` VALUES ('2071', '6', '80', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2072', '4', '665', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('2073', '6', '63', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2074', '1', '525', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('2075', '3', '217', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('2076', '9', '546', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('2077', '12', '112', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('2078', '6', '568', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('2079', '2', '567', '2011-11-30', null);
INSERT INTO `receive_goose` VALUES ('2080', '0', '712', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2081', '5', '616', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('2082', '7', '192', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('2083', '9', '525', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('2084', '10', '196', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2085', '11', '176', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('2086', '1', '280', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2087', '4', '322', '2011-11-02', null);
INSERT INTO `receive_goose` VALUES ('2088', '8', '488', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2089', '12', '296', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2090', '6', '175', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('2091', '3', '24', '2011-11-17', null);
INSERT INTO `receive_goose` VALUES ('2092', '2', '248', '2011-11-25', null);
INSERT INTO `receive_goose` VALUES ('2093', '7', '424', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('2094', '11', '656', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('2095', '1', '210', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('2096', '0', '441', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('2097', '9', '384', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('2098', '5', '680', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2099', '10', '616', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2100', '4', '637', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('2101', '12', '280', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2102', '8', '308', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('2103', '1', '424', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2104', '6', '224', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('2105', '8', '0', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2106', '2', '609', '2011-11-23', null);
INSERT INTO `receive_goose` VALUES ('2107', '0', '392', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('2108', '7', '152', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('2109', '3', '518', '2011-11-16', null);
INSERT INTO `receive_goose` VALUES ('2110', '12', '637', '2011-08-10', null);
INSERT INTO `receive_goose` VALUES ('2111', '8', '287', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2112', '4', '245', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('2113', '6', '252', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2114', '7', '119', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('2115', '9', '175', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('2116', '10', '56', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2117', '11', '70', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('2118', '1', '35', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2119', '8', '315', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2120', '5', '49', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('2121', '4', '480', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('2122', '6', '532', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('2123', '7', '8', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2124', '10', '720', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2125', '11', '376', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('2126', '5', '448', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2127', '0', '720', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2128', '9', '252', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('2129', '1', '464', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2130', '7', '112', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('2131', '2', '630', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('2132', '3', '656', '2011-11-09', null);
INSERT INTO `receive_goose` VALUES ('2133', '9', '441', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2134', '12', '264', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2135', '4', '329', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('2136', '8', '88', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('2137', '5', '392', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2138', '8', '77', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2139', '11', '528', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('2140', '10', '7', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2141', '7', '128', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2142', '1', '584', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2143', '0', '152', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2144', '9', '322', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('2145', '12', '196', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('2146', '10', '644', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('2147', '5', '553', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2148', '2', '584', '2011-11-01', null);
INSERT INTO `receive_goose` VALUES ('2149', '12', '119', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2150', '6', '679', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2151', '0', '553', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('2152', '8', '413', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('2153', '9', '40', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2154', '3', '175', '2011-10-26', null);
INSERT INTO `receive_goose` VALUES ('2155', '12', '567', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2156', '11', '679', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('2157', '9', '490', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2158', '3', '560', '2011-10-19', null);
INSERT INTO `receive_goose` VALUES ('2159', '1', '432', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('2160', '8', '672', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2161', '4', '384', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('2162', '5', '40', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2163', '10', '632', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2164', '2', '376', '2011-10-24', null);
INSERT INTO `receive_goose` VALUES ('2165', '5', '544', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2166', '0', '216', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2167', '12', '512', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2168', '7', '35', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2169', '6', '784', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2170', '4', '378', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2171', '3', '472', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('2172', '2', '360', '2011-10-16', null);
INSERT INTO `receive_goose` VALUES ('2173', '0', '49', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('2174', '8', '384', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('2175', '10', '0', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2176', '1', '105', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2177', '5', '112', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2178', '7', '536', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('2179', '10', '448', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2180', '9', '448', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('2181', '5', '322', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2182', '8', '480', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('2183', '0', '232', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2184', '12', '440', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2185', '2', '161', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('2186', '1', '648', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2187', '6', '371', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2188', '3', '462', '2011-10-12', null);
INSERT INTO `receive_goose` VALUES ('2189', '11', '248', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('2190', '0', '455', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2191', '9', '154', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('2192', '5', '672', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('2193', '7', '608', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2194', '8', '406', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2195', '4', '343', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2196', '12', '0', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2197', '2', '624', '2011-10-08', null);
INSERT INTO `receive_goose` VALUES ('2198', '10', '609', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2199', '9', '352', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2200', '3', '210', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('2201', '11', '203', '2011-10-05', null);
INSERT INTO `receive_goose` VALUES ('2202', '12', '224', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('2203', '6', '567', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2204', '11', '432', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('2205', '0', '696', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2206', '8', '119', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('2207', '1', '560', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2208', '9', '595', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('2209', '12', '720', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2210', '8', '350', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('2211', '7', '322', '2011-08-03', null);
INSERT INTO `receive_goose` VALUES ('2212', '4', '256', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2213', '11', '105', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('2214', '3', '144', '2011-09-30', null);
INSERT INTO `receive_goose` VALUES ('2215', '1', '455', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('2216', '11', '184', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('2217', '9', '480', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2218', '3', '385', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('2219', '2', '665', '2011-09-28', null);
INSERT INTO `receive_goose` VALUES ('2220', '10', '536', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('2221', '7', '8', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2222', '8', '518', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2223', '0', '315', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('2224', '12', '88', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2225', '4', '424', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('2226', '11', '42', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('2227', '5', '792', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2228', '9', '480', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2229', '1', '224', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('2230', '12', '352', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('2231', '6', '161', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('2232', '11', '672', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2233', '3', '488', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2234', '0', '56', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('2235', '8', '624', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2236', '1', '424', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('2237', '10', '147', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2238', '6', '378', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2239', '2', '672', '2011-09-22', null);
INSERT INTO `receive_goose` VALUES ('2240', '4', '644', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('2241', '0', '119', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2242', '10', '184', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('2243', '12', '592', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('2244', '7', '736', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2245', '9', '184', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2246', '1', '656', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('2247', '3', '680', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2248', '0', '360', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('2249', '11', '378', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('2250', '9', '273', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('2251', '0', '196', '2011-06-08', null);
INSERT INTO `receive_goose` VALUES ('2252', '2', '217', '2011-09-21', null);
INSERT INTO `receive_goose` VALUES ('2253', '8', '616', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2254', '12', '266', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2255', '5', '232', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2256', '7', '136', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2257', '11', '704', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2258', '9', '392', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2259', '6', '364', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2260', '0', '119', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2261', '3', '315', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2262', '7', '0', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2263', '4', '80', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2264', '10', '567', '2011-06-08', null);
INSERT INTO `receive_goose` VALUES ('2265', '5', '245', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2266', '12', '406', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2267', '0', '488', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2268', '1', '413', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('2269', '4', '672', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('2270', '2', '496', '2011-09-14', null);
INSERT INTO `receive_goose` VALUES ('2271', '5', '644', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('2272', '3', '784', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2273', '7', '568', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2274', '9', '441', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2275', '6', '400', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('2276', '11', '175', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2277', '0', '664', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('2278', '8', '496', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('2279', '12', '644', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2280', '1', '744', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2281', '11', '496', '2011-08-29', null);
INSERT INTO `receive_goose` VALUES ('2282', '4', '679', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2283', '9', '32', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2284', '10', '704', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('2285', '5', '416', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('2286', '7', '259', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2287', '3', '441', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2288', '9', '630', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('2289', '0', '656', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('2290', '6', '28', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('2291', '12', '184', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2292', '8', '574', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2293', '7', '238', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2294', '5', '400', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('2295', '1', '245', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2296', '10', '637', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2297', '4', '378', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2298', '12', '595', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2299', '3', '360', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('2300', '6', '7', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2301', '9', '328', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2302', '0', '736', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('2303', '2', '119', '2011-09-07', null);
INSERT INTO `receive_goose` VALUES ('2304', '6', '776', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('2305', '8', '182', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2306', '5', '287', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('2307', '11', '416', '2011-08-21', null);
INSERT INTO `receive_goose` VALUES ('2308', '1', '0', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('2309', '4', '536', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2310', '1', '84', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2311', '12', '744', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2312', '3', '434', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('2313', '2', '496', '2011-09-06', null);
INSERT INTO `receive_goose` VALUES ('2314', '7', '520', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('2315', '11', '35', '2011-08-17', null);
INSERT INTO `receive_goose` VALUES ('2316', '10', '378', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2317', '1', '232', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2318', '9', '168', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('2319', '5', '496', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2320', '0', '768', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('2321', '3', '154', '2011-07-27', null);
INSERT INTO `receive_goose` VALUES ('2322', '8', '496', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2323', '4', '0', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2324', '6', '448', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2325', '4', '664', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('2326', '11', '504', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('2327', '7', '427', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2328', '1', '266', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2329', '12', '161', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2330', '9', '574', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2331', '2', '77', '2011-08-31', null);
INSERT INTO `receive_goose` VALUES ('2332', '10', '259', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('2333', '11', '120', '2011-08-05', null);
INSERT INTO `receive_goose` VALUES ('2334', '5', '546', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2335', '8', '288', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2336', '1', '224', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2337', '12', '518', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2338', '6', '216', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2339', '7', '272', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2340', '2', '560', '2011-08-24', null);
INSERT INTO `receive_goose` VALUES ('2341', '3', '584', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2342', '0', '441', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('2343', '11', '152', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2344', '4', '14', '2011-06-01', null);
INSERT INTO `receive_goose` VALUES ('2345', '11', '784', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2346', '10', '104', '2011-05-01', null);
INSERT INTO `receive_goose` VALUES ('2347', '6', '448', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2348', '1', '168', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('2349', '10', '712', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('2350', '8', '630', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('2351', '9', '304', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('2352', '0', '608', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2353', '7', '126', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2354', '5', '320', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2355', '4', '161', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2356', '7', '304', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('2357', '12', '552', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('2358', '6', '399', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2359', '1', '623', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2360', '9', '161', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2361', '5', '441', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2362', '7', '98', '2011-05-04', null);
INSERT INTO `receive_goose` VALUES ('2363', '3', '483', '2011-07-13', null);
INSERT INTO `receive_goose` VALUES ('2364', '9', '399', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2365', '0', '175', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2366', '12', '406', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2367', '11', '176', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2368', '7', '686', '2011-04-27', null);
INSERT INTO `receive_goose` VALUES ('2369', '4', '592', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('2370', '11', '119', '2011-07-06', null);
INSERT INTO `receive_goose` VALUES ('2371', '8', '400', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2372', '1', '147', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2373', '2', '728', '2011-08-13', null);
INSERT INTO `receive_goose` VALUES ('2374', '1', '48', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2375', '9', '96', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2376', '5', '8', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('2377', '11', '232', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2378', '0', '616', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2379', '10', '336', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2380', '6', '644', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2381', '1', '40', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2382', '12', '287', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2383', '5', '640', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('2384', '3', '264', '2011-07-04', null);
INSERT INTO `receive_goose` VALUES ('2385', '7', '147', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('2386', '8', '350', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2387', '9', '497', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2388', '12', '152', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2389', '4', '581', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2390', '10', '364', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2391', '3', '448', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('2392', '11', '70', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('2393', '7', '287', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('2394', '1', '21', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2395', '0', '360', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('2396', '12', '385', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('2397', '8', '364', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2398', '5', '126', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2399', '5', '368', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2400', '11', '248', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2401', '7', '288', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2402', '4', '464', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('2403', '6', '144', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2404', '9', '792', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('2405', '12', '413', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2406', '11', '472', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('2407', '2', '256', '2011-07-28', null);
INSERT INTO `receive_goose` VALUES ('2408', '1', '728', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2409', '0', '350', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2410', '6', '768', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2411', '3', '232', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2412', '7', '266', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2413', '8', '231', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2414', '4', '532', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('2415', '10', '88', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2416', '5', '168', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2417', '3', '552', '2011-06-18', null);
INSERT INTO `receive_goose` VALUES ('2418', '0', '448', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2419', '7', '40', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2420', '12', '480', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2421', '8', '536', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2422', '9', '581', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2423', '11', '392', '2011-06-15', null);
INSERT INTO `receive_goose` VALUES ('2424', '2', '476', '2011-07-20', null);
INSERT INTO `receive_goose` VALUES ('2425', '10', '336', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2426', '7', '648', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2427', '6', '768', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2428', '0', '98', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2429', '4', '232', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('2430', '5', '472', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2431', '1', '133', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2432', '10', '32', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('2433', '8', '136', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2434', '3', '536', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('2435', '9', '472', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2436', '10', '511', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2437', '2', '152', '2011-07-12', null);
INSERT INTO `receive_goose` VALUES ('2438', '8', '259', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2439', '4', '525', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('2440', '0', '328', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2441', '12', '567', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2442', '7', '588', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('2443', '2', '616', '2011-06-29', null);
INSERT INTO `receive_goose` VALUES ('2444', '8', '392', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2445', '11', '24', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('2446', '3', '329', '2011-06-08', null);
INSERT INTO `receive_goose` VALUES ('2447', '6', '49', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2448', '0', '400', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2449', '5', '462', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2450', '9', '336', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2451', '1', '312', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2452', '4', '568', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2453', '6', '744', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('2454', '12', '176', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2455', '7', '544', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2456', '8', '368', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2457', '0', '392', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('2458', '3', '440', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2459', '10', '294', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2460', '11', '399', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2461', '5', '432', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('2462', '4', '196', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2463', '12', '40', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('2464', '9', '469', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('2465', '8', '595', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('2466', '1', '189', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2467', '2', '32', '2011-06-26', null);
INSERT INTO `receive_goose` VALUES ('2468', '10', '616', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2469', '2', '539', '2011-06-22', null);
INSERT INTO `receive_goose` VALUES ('2470', '0', '592', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2471', '3', '70', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('2472', '11', '623', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('2473', '12', '672', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('2474', '1', '392', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2475', '3', '112', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2476', '5', '304', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2477', '6', '385', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2478', '9', '364', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2479', '4', '462', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2480', '1', '686', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2481', '2', '432', '2011-06-10', null);
INSERT INTO `receive_goose` VALUES ('2482', '10', '32', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2483', '5', '624', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2484', '0', '672', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2485', '3', '632', '2011-05-09', null);
INSERT INTO `receive_goose` VALUES ('2486', '7', '266', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('2487', '6', '560', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2488', '8', '64', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2489', '9', '126', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2490', '4', '368', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2491', '2', '752', '2011-06-02', null);
INSERT INTO `receive_goose` VALUES ('2492', '10', '528', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2493', '11', '476', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2494', '8', '360', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2495', '5', '378', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2496', '4', '504', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2497', '7', '720', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2498', '0', '16', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2499', '10', '196', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2500', '9', '480', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2501', '0', '399', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2502', '3', '768', '2011-04-15', null);
INSERT INTO `receive_goose` VALUES ('2503', '8', '343', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2504', '6', '63', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('2505', '11', '462', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('2506', '2', '136', '2011-05-25', null);
INSERT INTO `receive_goose` VALUES ('2507', '5', '469', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2508', '4', '704', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2509', '10', '64', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2510', '2', '504', '2011-05-18', null);
INSERT INTO `receive_goose` VALUES ('2511', '6', '280', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2512', '8', '776', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2513', '7', '406', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2514', '9', '399', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2515', '10', '280', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2516', '0', '232', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('2517', '5', '329', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('2518', '3', '161', '2011-04-13', null);
INSERT INTO `receive_goose` VALUES ('2519', '6', '84', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('2520', '9', '350', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2521', '0', '420', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2522', '2', '488', '2011-05-17', null);
INSERT INTO `receive_goose` VALUES ('2523', '7', '315', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2524', '6', '624', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2525', '11', '168', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2526', '10', '679', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2527', '3', '176', '2011-04-07', null);
INSERT INTO `receive_goose` VALUES ('2528', '4', '616', '2011-02-10', null);
INSERT INTO `receive_goose` VALUES ('2529', '11', '189', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2530', '9', '344', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2531', '3', '357', '2011-04-06', null);
INSERT INTO `receive_goose` VALUES ('2532', '11', '776', '2011-03-14', null);
INSERT INTO `receive_goose` VALUES ('2533', '5', '336', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2534', '7', '624', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('2535', '8', '24', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2536', '2', '518', '2011-05-11', null);
INSERT INTO `receive_goose` VALUES ('2537', '6', '98', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2538', '5', '301', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2539', '0', '371', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('2540', '9', '32', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2541', '10', '752', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2542', '6', '24', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2543', '4', '728', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2544', '8', '532', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2545', '0', '640', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2546', '9', '434', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2547', '5', '147', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2548', '11', '602', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2549', '6', '266', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2550', '7', '240', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2551', '2', '704', '2011-04-23', null);
INSERT INTO `receive_goose` VALUES ('2552', '5', '28', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2553', '3', '88', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2554', '6', '35', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2555', '6', '568', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2556', '3', '112', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2557', '9', '497', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2558', '8', '600', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2559', '5', '432', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2560', '7', '679', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('2561', '11', '40', '2011-03-06', null);
INSERT INTO `receive_goose` VALUES ('2562', '10', '70', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('2563', '0', '464', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2564', '3', '35', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2565', '4', '574', '2011-01-26', null);
INSERT INTO `receive_goose` VALUES ('2566', '10', '160', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2567', '11', '245', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2568', '3', '483', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2569', '9', '160', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2570', '5', '322', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('2571', '2', '14', '2011-04-20', null);
INSERT INTO `receive_goose` VALUES ('2572', '10', '512', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2573', '2', '80', '2011-03-30', null);
INSERT INTO `receive_goose` VALUES ('2574', '8', '182', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('2575', '11', '192', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2576', '7', '512', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2577', '2', '378', '2011-03-23', null);
INSERT INTO `receive_goose` VALUES ('2578', '9', '665', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2579', '11', '560', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2580', '3', '616', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2581', '4', '420', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2582', '0', '192', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2583', '10', '736', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2584', '0', '63', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2585', '7', '644', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2586', '2', '128', '2011-03-22', null);
INSERT INTO `receive_goose` VALUES ('2587', '0', '364', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2588', '2', '147', '2011-03-16', null);
INSERT INTO `receive_goose` VALUES ('2589', '11', '136', '2011-02-18', null);
INSERT INTO `receive_goose` VALUES ('2590', '4', '483', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('2591', '9', '7', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('2592', '9', '664', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2593', '2', '413', '2011-03-09', null);
INSERT INTO `receive_goose` VALUES ('2594', '3', '77', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('2595', '11', '63', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('2596', '11', '48', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2597', '3', '560', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('2598', '11', '712', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2599', '7', '595', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2600', '10', '696', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2601', '2', '14', '2011-03-02', null);
INSERT INTO `receive_goose` VALUES ('2602', '9', '294', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2603', '4', '528', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2604', '3', '280', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2605', '2', '688', '2011-02-26', null);
INSERT INTO `receive_goose` VALUES ('2606', '7', '637', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('2607', '3', '64', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2608', '9', '776', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2609', '3', '259', '2011-01-19', null);
INSERT INTO `receive_goose` VALUES ('2610', '11', '456', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2611', '4', '399', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2612', '3', '360', '2011-01-17', null);
INSERT INTO `receive_goose` VALUES ('2613', '7', '496', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2614', '10', '679', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2615', '2', '70', '2011-02-23', null);
INSERT INTO `receive_goose` VALUES ('2616', '2', '511', '2011-02-16', null);
INSERT INTO `receive_goose` VALUES ('2617', '4', '216', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2618', '11', '462', '2011-01-05', null);
INSERT INTO `receive_goose` VALUES ('2619', '3', '128', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2620', '9', '546', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2621', '3', '686', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2622', '4', '168', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2623', '7', '497', '2010-12-01', null);
INSERT INTO `receive_goose` VALUES ('2624', '4', '462', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('2625', '2', '455', '2011-02-09', null);
INSERT INTO `receive_goose` VALUES ('2626', '10', '96', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2627', '11', '392', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2628', '10', '644', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2629', '7', '539', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2630', '9', '210', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2631', '4', '672', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2632', '2', '736', '2011-02-02', null);
INSERT INTO `receive_goose` VALUES ('2633', '3', '232', '2010-12-24', null);
INSERT INTO `receive_goose` VALUES ('2634', '11', '49', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2635', '11', '497', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2636', '9', '608', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2637', '3', '637', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2638', '7', '182', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2639', '10', '616', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('2640', '7', '240', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2641', '11', '384', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2642', '4', '126', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2643', '4', '712', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2644', '2', '104', '2011-01-25', null);
INSERT INTO `receive_goose` VALUES ('2645', '7', '448', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2646', '2', '609', '2011-01-12', null);
INSERT INTO `receive_goose` VALUES ('2647', '3', '304', '2010-12-16', null);
INSERT INTO `receive_goose` VALUES ('2648', '10', '176', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2649', '11', '427', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2650', '3', '70', '2010-12-15', null);
INSERT INTO `receive_goose` VALUES ('2651', '10', '476', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('2652', '7', '154', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2653', '3', '392', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2654', '7', '776', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2655', '11', '525', '2010-11-10', null);
INSERT INTO `receive_goose` VALUES ('2656', '2', '480', '2011-01-09', null);
INSERT INTO `receive_goose` VALUES ('2657', '4', '256', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('2658', '3', '744', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2659', '4', '480', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2660', '2', '160', '2011-01-01', null);
INSERT INTO `receive_goose` VALUES ('2661', '11', '296', '2010-11-06', null);
INSERT INTO `receive_goose` VALUES ('2662', '2', '322', '2010-12-29', null);
INSERT INTO `receive_goose` VALUES ('2663', '7', '588', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('2664', '11', '189', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2665', '3', '574', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2666', '2', '154', '2010-12-22', null);
INSERT INTO `receive_goose` VALUES ('2667', '11', '696', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2668', '2', '91', '2010-12-08', null);
INSERT INTO `receive_goose` VALUES ('2669', '2', '448', '2010-11-30', null);
INSERT INTO `receive_goose` VALUES ('2670', '3', '32', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2671', '3', '238', '2010-11-17', null);
INSERT INTO `receive_goose` VALUES ('2672', '2', '28', '2010-11-24', null);
INSERT INTO `receive_goose` VALUES ('2673', '11', '168', '2010-10-27', null);
INSERT INTO `receive_goose` VALUES ('2674', '2', '40', '2010-11-22', null);
INSERT INTO `receive_goose` VALUES ('2675', '2', '136', '2010-11-14', null);
INSERT INTO `receive_goose` VALUES ('2676', '3', '252', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2677', '2', '511', '2010-11-03', null);
INSERT INTO `receive_goose` VALUES ('2678', '3', '688', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2679', '2', '648', '2010-10-29', null);
INSERT INTO `receive_goose` VALUES ('2680', '11', '856', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2681', '10', '1295', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2682', '3', '1092', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2683', '9', '721', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2684', '4', '826', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2685', '12', '770', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2686', '0', '1000', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2687', '2', '938', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2688', '6', '1197', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2689', '1', '903', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2690', '8', '992', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2691', '5', '1022', '2012-10-10', null);
INSERT INTO `receive_goose` VALUES ('2692', '7', '920', '2012-10-10', null);

-- ----------------------------
-- Table structure for `retailer`
-- ----------------------------
DROP TABLE IF EXISTS `retailer`;
CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `regionId` int(11) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regionId` (`regionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of retailer
-- ----------------------------
INSERT INTO `retailer` VALUES ('1', 'XX烧鹅店', '1', '123465', '茜需要', 'afasdfasdfadsfd							');
INSERT INTO `retailer` VALUES ('2', '张三鹅肉加工厂', '1', '9527', '珠海', '鞢夺	桔柑			');
INSERT INTO `retailer` VALUES ('3', '白水酒店', '1', '13431243', '左膨胀', '			');
INSERT INTO `retailer` VALUES ('4', 'qqShop', '4', '123', '广州', '地 模压 			');
INSERT INTO `retailer` VALUES ('5', '天鹅门店', '5', '2344', '广州', '无可奈何花落去			');
INSERT INTO `retailer` VALUES ('6', '鹅专门店', '1', '2343', '地城', '	塔顶栽植');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sale_goose
-- ----------------------------
INSERT INTO `sale_goose` VALUES ('1', '1', '100', '22', '650', '7000', '2012-10-07', 'fdfdf');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_good
-- ----------------------------
INSERT INTO `trade_good` VALUES ('7', '5', '1', '2012-09-06', '44', '100', 'TFHFGHXF	');
INSERT INTO `trade_good` VALUES ('8', '1', '3', '2012-09-17', '30', '10', 'cash	');
INSERT INTO `trade_good` VALUES ('9', '1', '1', '2012-09-16', '123', '3', '	');
INSERT INTO `trade_good` VALUES ('10', '7', '5', '2012-09-08', '100', '10', '	');
INSERT INTO `trade_good` VALUES ('11', '2', '5', '2012-09-17', '100', '15', 'fdfdfdf	');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_goose
-- ----------------------------

-- ----------------------------
-- View structure for `buygoodview`
-- ----------------------------
DROP VIEW IF EXISTS `buygoodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buygoodview` AS select `buy_good`.`id` AS `id`,`buy_good`.`goodSupplierId` AS `supplierId`,`buy_good`.`goodId` AS `goodId`,`buy_good`.`batchNum` AS `batchNum`,`buy_good`.`unitPrice` AS `unitPrice`,`buy_good`.`amount` AS `amount`,`buy_good`.`origin` AS `origin`,`buy_good`.`date` AS `date`,`buy_good`.`comments` AS `comments`,`good`.`name` AS `goodName`,`good`.`unit` AS `unit`,`goodsupplier`.`name` AS `supplierName`,`goodsupplier`.`phone` AS `supplierPhone`,`good`.`goodTypeId` AS `goodTypeId` from ((`buy_good` join `good`) join `goodsupplier`) where ((`buy_good`.`goodId` = `good`.`id`) and (`buy_good`.`goodSupplierId` = `goodsupplier`.`id`)) ;

-- ----------------------------
-- View structure for `goodview`
-- ----------------------------
DROP VIEW IF EXISTS `goodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `goodview` AS select `good`.`id` AS `id`,`good`.`goodTypeId` AS `goodTypeId`,`good`.`name` AS `name`,`good`.`unit` AS `unit`,`good`.`stock` AS `stock`,`good_type`.`name` AS `goodTypeName` from (`good` join `good_type`) where (`good`.`goodTypeId` = `good_type`.`id`) ;

-- ----------------------------
-- View structure for `market`
-- ----------------------------
DROP VIEW IF EXISTS `market`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `market` AS select `farm`.`id` AS `farmId`,`receive_goose`.`id` AS `receiveId`,`farm`.`name` AS `farmName`,`farm`.`farmerId` AS `farmerId`,`farm`.`address` AS `address`,`receive_goose`.`amount` AS `amount`,`receive_goose`.`receiveDate` AS `receiveDate`,`receive_goose`.`comments` AS `comments` from (`farm` join `receive_goose`) where (`farm`.`id` = `receive_goose`.`farmId`) ;

-- ----------------------------
-- View structure for `retailerview`
-- ----------------------------
DROP VIEW IF EXISTS `retailerview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `retailerview` AS select `retailer`.`id` AS `id`,`retailer`.`name` AS `name`,`retailer`.`regionId` AS `regionId`,`retailer`.`phone` AS `phone`,`retailer`.`address` AS `address`,`retailer`.`comments` AS `comments`,`sale_region`.`region` AS `region` from (`retailer` join `sale_region`) where (`retailer`.`regionId` = `sale_region`.`id`) ;

-- ----------------------------
-- View structure for `tradegoodview`
-- ----------------------------
DROP VIEW IF EXISTS `tradegoodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tradegoodview` AS select `farmer`.`id` AS `farmerId`,`farmer`.`name` AS `farmerName`,`farmer`.`phone` AS `phone`,`trade_good`.`id` AS `id`,`trade_good`.`goodId` AS `goodId`,`trade_good`.`tradeDate` AS `tradeDate`,`trade_good`.`unitPrice` AS `unitPrice`,`trade_good`.`amount` AS `amount`,`trade_good`.`comments` AS `comments`,`good`.`name` AS `goodName`,`good`.`unit` AS `goodUnit`,`good`.`goodTypeId` AS `goodTypeId` from ((`farmer` join `trade_good` on(('' = ''))) join `good`) where ((`farmer`.`id` = `trade_good`.`farmerId`) and (`trade_good`.`goodId` = `good`.`id`)) ;
