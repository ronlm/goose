/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : factory

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2012-07-17 10:24:20
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_menu
-- ----------------------------
INSERT INTO `comm_menu` VALUES ('1', '系统菜单', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('2', '系统用户管理', '/Comm/userAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('3', '系统角色管理', '/Comm/roleAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('4', '系统资源管理', '/Comm/resourceAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('5', '系统菜单管理', '/Comm/menuAction!list', '1', '/images/main/null.png', '2');

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
INSERT INTO `comm_resource` VALUES ('2', '系统管理', '/pages/comm/*', null);
INSERT INTO `comm_resource` VALUES ('3', '用户管理', '/pages/comm/user.do*', '用户管理,供超级管理员管理系统管理员				');

-- ----------------------------
-- Table structure for `comm_role`
-- ----------------------------
DROP TABLE IF EXISTS `comm_role`;
CREATE TABLE `comm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role
-- ----------------------------
INSERT INTO `comm_role` VALUES ('1', '超超级管理员', '			');
INSERT INTO `comm_role` VALUES ('2', '超级管理员', '				超级管理员										');

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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role_resource
-- ----------------------------
INSERT INTO `comm_role_resource` VALUES ('108', '1', '1');
INSERT INTO `comm_role_resource` VALUES ('109', '1', '2');
INSERT INTO `comm_role_resource` VALUES ('110', '1', '3');
INSERT INTO `comm_role_resource` VALUES ('111', '1', '4');
INSERT INTO `comm_role_resource` VALUES ('114', '2', '1');
INSERT INTO `comm_role_resource` VALUES ('115', '2', '3');
INSERT INTO `comm_role_resource` VALUES ('116', '2', '4');

-- ----------------------------
-- Table structure for `comm_user`
-- ----------------------------
DROP TABLE IF EXISTS `comm_user`;
CREATE TABLE `comm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '户用名',
  `userName` varchar(20) NOT NULL COMMENT '用户名即账号，用于登录',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(50) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL COMMENT '话电号码',
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_user
-- ----------------------------
INSERT INTO `comm_user` VALUES ('1', 'admin', '引擎小组', 'admin', '123', '123@d.com', '123', '1');
INSERT INTO `comm_user` VALUES ('2', 'engine', '', 'engine', '', '', '', '2');
INSERT INTO `comm_user` VALUES ('3', 'test', null, 'test', null, null, null, '1');
INSERT INTO `comm_user` VALUES ('4', 'test2', null, 'test2', null, null, null, null);
INSERT INTO `comm_user` VALUES ('5', 'test3', 'fuck you', 'test3', null, null, null, null);

-- ----------------------------
-- Table structure for `rule`
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `comment` text,
  `register_date` date NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('1', '料号规则', 'test', '2012-02-25', '1');

-- ----------------------------
-- View structure for `bom`
-- ----------------------------
DROP VIEW IF EXISTS `bom`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bom` AS select `factory`.`bom_material`.`id` AS `id`,`factory`.`bom_material`.`shoe_id` AS `shoe_id`,`factory`.`material`.`material_id` AS `material_id`,`factory`.`material`.`name` AS `name`,`factory`.`material`.`description` AS `description`,`factory`.`bom_material`.`amount` AS `amount`,`factory`.`material`.`unit` AS `unit`,`factory`.`supplier`.`name` AS `supplier`,`factory`.`bom_material`.`comments` AS `comments`,`factory`.`supplier`.`telephone` AS `supplier_telephone`,`factory`.`supplier`.`address` AS `supplier_address` from ((`bom_material` join `material`) join `supplier`) where ((`factory`.`bom_material`.`material_id` = `factory`.`material`.`id`) and (`factory`.`bom_material`.`supplier_id` = `factory`.`supplier`.`id`)) order by `factory`.`bom_material`.`id` desc ;

-- ----------------------------
-- View structure for `order_shoe_view`
-- ----------------------------
DROP VIEW IF EXISTS `order_shoe_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_shoe_view` AS select `factory`.`order_shoe`.`id` AS `id`,`factory`.`order_shoe`.`order_id` AS `order_id`,`factory`.`order_shoe`.`factory_series` AS `factory_series`,`factory`.`order_shoe`.`size_33` AS `size_33`,`factory`.`order_shoe`.`size_34` AS `size_34`,`factory`.`order_shoe`.`size_35` AS `size_35`,`factory`.`order_shoe`.`size_36` AS `size_36`,`factory`.`order_shoe`.`size_37` AS `size_37`,`factory`.`order_shoe`.`size_38` AS `size_38`,`factory`.`order_shoe`.`size_39` AS `size_39`,`factory`.`order_shoe`.`size_40` AS `size_40`,`factory`.`order_shoe`.`order_num` AS `order_num`,`factory`.`shoe`.`product_color` AS `product_color`,`factory`.`shoe`.`style_id` AS `style_id`,`factory`.`order_shoe`.`brand` AS `brand`,`factory`.`model_rule`.`model_id` AS `model_id`,`factory`.`shoe`.`product_id` AS `product_id`,`factory`.`order_shoe`.`transact_status` AS `transact_status` from ((`order_shoe` join `shoe`) join `model_rule`) where ((`factory`.`order_shoe`.`shoe_id` = `factory`.`shoe`.`id`) and (`factory`.`shoe`.`model_id` = `factory`.`model_rule`.`id`)) order by `factory`.`order_shoe`.`id` ;

-- ----------------------------
-- View structure for `order_view`
-- ----------------------------
DROP VIEW IF EXISTS `order_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_view` AS select `factory`.`order_list`.`id` AS `id`,`factory`.`order_list`.`order_id` AS `order_id`,`factory`.`order_list`.`order_date` AS `order_date`,`factory`.`order_list`.`delivery_date` AS `delivery_date`,`factory`.`order_list`.`comments` AS `order_comments`,`factory`.`client`.`name` AS `client_name`,`factory`.`client`.`telephone` AS `client_telephone`,`factory`.`client`.`address` AS `client_address` from (`order_list` join `client`) where (`factory`.`order_list`.`client_id` = `factory`.`client`.`id`) order by `factory`.`order_list`.`id` desc ;

-- ----------------------------
-- View structure for `produce_view`
-- ----------------------------
DROP VIEW IF EXISTS `produce_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produce_view` AS select `factory`.`order_shoe`.`id` AS `id`,`factory`.`order_list`.`order_id` AS `order_id`,`factory`.`client`.`name` AS `client`,`factory`.`order_list`.`order_date` AS `order_date`,`factory`.`order_list`.`delivery_date` AS `delivery_date`,`factory`.`order_shoe`.`factory_series` AS `factory_series`,`factory`.`order_shoe`.`size_33` AS `size_33`,`factory`.`order_shoe`.`size_34` AS `size_34`,`factory`.`order_shoe`.`size_35` AS `size_35`,`factory`.`order_shoe`.`size_36` AS `size_36`,`factory`.`order_shoe`.`size_37` AS `size_37`,`factory`.`order_shoe`.`size_38` AS `size_38`,`factory`.`order_shoe`.`size_39` AS `size_39`,`factory`.`order_shoe`.`size_40` AS `size_40`,`factory`.`order_shoe`.`order_num` AS `order_num`,`factory`.`model_rule`.`model_id` AS `model_id`,`factory`.`model_rule`.`waterproof` AS `waterproof`,`factory`.`model_rule`.`innerheight` AS `innerheight`,`factory`.`model_rule`.`heel` AS `heel`,`factory`.`order_shoe`.`brand` AS `brand`,`factory`.`shoe`.`product_color` AS `product_color`,`factory`.`shoe`.`style_id` AS `style_id`,`factory`.`bom_material`.`amount` AS `amount`,`factory`.`material`.`type` AS `type`,`factory`.`material`.`material_id` AS `material_id`,`factory`.`material`.`name` AS `material_name`,`factory`.`material`.`repertory` AS `repertory`,`factory`.`material`.`unit` AS `unit`,`factory`.`supplier`.`name` AS `supplier`,`factory`.`order_shoe`.`transact_status` AS `status`,`factory`.`order_shoe`.`order_id` AS `order_iid`,`factory`.`material`.`id` AS `material_iid`,`factory`.`supplier`.`telephone` AS `supplier_telephone`,`factory`.`supplier`.`address` AS `supplier_address` from (((((((`order_list` join `order_shoe`) join `model_rule`) join `shoe`) join `bom_material`) join `material`) join `supplier`) join `client`) where ((`factory`.`order_shoe`.`order_id` = `factory`.`order_list`.`id`) and (`factory`.`order_shoe`.`shoe_id` = `factory`.`shoe`.`id`) and (`factory`.`shoe`.`model_id` = `factory`.`model_rule`.`id`) and (`factory`.`bom_material`.`shoe_id` = `factory`.`shoe`.`id`) and (`factory`.`bom_material`.`material_id` = `factory`.`material`.`id`) and (`factory`.`order_list`.`client_id` = `factory`.`client`.`id`) and (`factory`.`bom_material`.`supplier_id` = `factory`.`supplier`.`id`)) order by `factory`.`order_shoe`.`id`,`factory`.`bom_material`.`id` ;

-- ----------------------------
-- View structure for `purchase_detail_view`
-- ----------------------------
DROP VIEW IF EXISTS `purchase_detail_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_detail_view` AS select `factory`.`purchase_detail`.`id` AS `id`,`factory`.`purchase_detail`.`purchase_id` AS `purchase_id`,`factory`.`material`.`material_id` AS `material_id`,`factory`.`material`.`name` AS `material_name`,`factory`.`supplier`.`name` AS `supplier_name`,`factory`.`purchase_detail`.`amount` AS `amount`,`factory`.`material`.`unit` AS `unit`,`factory`.`purchase_detail`.`status` AS `status`,`factory`.`purchase_detail`.`comments` AS `comments`,`factory`.`supplier`.`id` AS `supplier_iid`,`factory`.`material`.`id` AS `material_iid`,`factory`.`supplier`.`telephone` AS `supplier_telephone`,`factory`.`supplier`.`address` AS `supplier_address` from ((`supplier` join `material`) join `purchase_detail`) where ((`factory`.`purchase_detail`.`material_id` = `factory`.`material`.`id`) and (`factory`.`purchase_detail`.`supplier_id` = `factory`.`supplier`.`id`)) ;
