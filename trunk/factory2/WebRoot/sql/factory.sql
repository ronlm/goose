/*
MySQL Data Transfer
Source Host: localhost
Source Database: factory
Target Host: localhost
Target Database: factory
Date: 2012-2-25 19:09:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `att_key` varchar(50) NOT NULL,
  `att_value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bom_material
-- ----------------------------
DROP TABLE IF EXISTS `bom_material`;
CREATE TABLE `bom_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoe_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_shoe_id` (`shoe_id`),
  KEY `FK_material_id` (`material_id`),
  KEY `FK_supplier_id_2` (`supplier_id`),
  CONSTRAINT `FK_material_id` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FK_shoe_id` FOREIGN KEY (`shoe_id`) REFERENCES `shoe` (`id`),
  CONSTRAINT `FK_supplier_id_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cancel_out
-- ----------------------------
DROP TABLE IF EXISTS `cancel_out`;
CREATE TABLE `cancel_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoe_id` int(11) NOT NULL,
  `order_shoe_id` int(11) NOT NULL,
  `size_33` int(11) NOT NULL,
  `size_34` int(11) NOT NULL,
  `size_35` int(11) NOT NULL,
  `size_36` int(11) NOT NULL,
  `size_37` int(11) NOT NULL,
  `size_38` int(11) NOT NULL,
  `size_39` int(11) NOT NULL,
  `size_40` int(11) NOT NULL,
  `cancel_out_date` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_cancel_out_order_shoe` (`order_shoe_id`),
  KEY `FK_cancel_out_shoe` (`shoe_id`),
  CONSTRAINT `FK_cancel_out_order_shoe` FOREIGN KEY (`order_shoe_id`) REFERENCES `order_shoe` (`id`),
  CONSTRAINT `FK_cancel_out_shoe` FOREIGN KEY (`shoe_id`) REFERENCES `shoe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cancel_shoe
-- ----------------------------
DROP TABLE IF EXISTS `cancel_shoe`;
CREATE TABLE `cancel_shoe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_shoe_id` int(11) NOT NULL,
  `shoe_id` int(11) NOT NULL,
  `size_33` int(11) NOT NULL,
  `size_34` int(11) NOT NULL,
  `size_35` int(11) NOT NULL,
  `size_36` int(11) NOT NULL,
  `size_37` int(11) NOT NULL,
  `size_38` int(11) NOT NULL,
  `size_39` int(11) NOT NULL,
  `size_40` int(11) NOT NULL,
  `cancel_date` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_cancel_shoe` (`shoe_id`),
  KEY `FK_cancel_order_shoe` (`order_shoe_id`),
  CONSTRAINT `FK_cancel_order_shoe` FOREIGN KEY (`order_shoe_id`) REFERENCES `order_shoe` (`id`),
  CONSTRAINT `FK_cancel_shoe` FOREIGN KEY (`shoe_id`) REFERENCES `shoe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `address` text,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comm_menu
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comm_resource
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
-- Table structure for comm_role
-- ----------------------------
DROP TABLE IF EXISTS `comm_role`;
CREATE TABLE `comm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comm_role_resource
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
-- Table structure for comm_user
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cutting
-- ----------------------------
DROP TABLE IF EXISTS `cutting`;
CREATE TABLE `cutting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_shoe_id` int(11) NOT NULL,
  `size_33` int(11) NOT NULL,
  `size_34` int(11) NOT NULL,
  `size_35` int(11) NOT NULL,
  `size_36` int(11) NOT NULL,
  `size_37` int(11) NOT NULL,
  `size_38` int(11) NOT NULL,
  `size_39` int(11) NOT NULL,
  `size_40` int(11) NOT NULL,
  `date` date NOT NULL,
  `comments` text,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Fk_ordershoe_id` (`order_shoe_id`),
  CONSTRAINT `Fk_ordershoe_id` FOREIGN KEY (`order_shoe_id`) REFERENCES `order_shoe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `material_id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text,
  `type` int(11) NOT NULL,
  `repertory` double NOT NULL,
  `unit` varchar(30) NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_type_id` (`type`),
  CONSTRAINT `FK_type_id` FOREIGN KEY (`type`) REFERENCES `material_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for material_type
-- ----------------------------
DROP TABLE IF EXISTS `material_type`;
CREATE TABLE `material_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for model_rule
-- ----------------------------
DROP TABLE IF EXISTS `model_rule`;
CREATE TABLE `model_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` varchar(30) NOT NULL,
  `waterproof` varchar(80) NOT NULL,
  `innerheight` varchar(80) NOT NULL,
  `heel` varchar(80) NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_list
-- ----------------------------
DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `order_id` varchar(30) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_client_id` (`client_id`),
  CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_shoe
-- ----------------------------
DROP TABLE IF EXISTS `order_shoe`;
CREATE TABLE `order_shoe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `shoe_id` int(11) NOT NULL,
  `factory_series` varchar(30) NOT NULL,
  `size_33` int(11) NOT NULL,
  `size_34` int(11) NOT NULL,
  `size_35` int(11) NOT NULL,
  `size_36` int(11) NOT NULL,
  `size_37` int(11) NOT NULL,
  `size_38` int(11) NOT NULL,
  `size_39` int(11) NOT NULL,
  `size_40` int(11) NOT NULL,
  `order_num` varchar(30) NOT NULL,
  `transact_status` int(6) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_order_id` (`order_id`),
  KEY `FK_shoe_id` (`shoe_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`),
  CONSTRAINT `FK_shoes_id` FOREIGN KEY (`shoe_id`) REFERENCES `shoe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(30) NOT NULL,
  `person` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `material_id` int(30) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` double(11,0) NOT NULL,
  `status` int(11) NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_purchase_Id` (`purchase_id`),
  KEY `FK_supplier_Id` (`supplier_id`),
  KEY `FK_material_Id1` (`material_id`),
  CONSTRAINT `FK_material_Id1` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FK_purchase_Id` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  CONSTRAINT `FK_supplier_Id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rule
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
-- Table structure for shoe
-- ----------------------------
DROP TABLE IF EXISTS `shoe`;
CREATE TABLE `shoe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `product_color` varchar(30) NOT NULL,
  `style_id` varchar(30) NOT NULL,
  `suit_type` varchar(30) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `pic_url` varchar(256) DEFAULT NULL,
  `version` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_model_id` (`model_id`),
  CONSTRAINT `FK_model_id` FOREIGN KEY (`model_id`) REFERENCES `model_rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shoe_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `shoe_warehouse`;
CREATE TABLE `shoe_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoe_id` int(11) DEFAULT NULL,
  `size_33` int(11) DEFAULT NULL,
  `size_34` int(11) DEFAULT NULL,
  `size_35` int(11) DEFAULT NULL,
  `size_36` int(11) DEFAULT NULL,
  `size_37` int(11) DEFAULT NULL,
  `size_38` int(11) DEFAULT NULL,
  `size_39` int(11) DEFAULT NULL,
  `size_40` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shoe_warehouse` (`shoe_id`),
  CONSTRAINT `FK_shoe_warehouse` FOREIGN KEY (`shoe_id`) REFERENCES `shoe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `address` text,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for bom
-- ----------------------------
DROP VIEW IF EXISTS `bom`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bom` AS select `bom_material`.`id` AS `id`,`bom_material`.`shoe_id` AS `shoe_id`,`material`.`material_id` AS `material_id`,`material`.`name` AS `name`,`material`.`description` AS `description`,`bom_material`.`amount` AS `amount`,`material`.`unit` AS `unit`,`supplier`.`name` AS `supplier`,`bom_material`.`comments` AS `comments`,`supplier`.`telephone` AS `supplier_telephone`,`supplier`.`address` AS `supplier_address` from ((`bom_material` join `material`) join `supplier`) where ((`bom_material`.`material_id` = `material`.`id`) and (`bom_material`.`supplier_id` = `supplier`.`id`)) order by `bom_material`.`id` desc;

-- ----------------------------
-- View structure for order_shoe_view
-- ----------------------------
DROP VIEW IF EXISTS `order_shoe_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_shoe_view` AS select `order_shoe`.`id` AS `id`,`order_shoe`.`order_id` AS `order_id`,`order_shoe`.`factory_series` AS `factory_series`,`order_shoe`.`size_33` AS `size_33`,`order_shoe`.`size_34` AS `size_34`,`order_shoe`.`size_35` AS `size_35`,`order_shoe`.`size_36` AS `size_36`,`order_shoe`.`size_37` AS `size_37`,`order_shoe`.`size_38` AS `size_38`,`order_shoe`.`size_39` AS `size_39`,`order_shoe`.`size_40` AS `size_40`,`order_shoe`.`order_num` AS `order_num`,`shoe`.`product_color` AS `product_color`,`shoe`.`style_id` AS `style_id`,`order_shoe`.`brand` AS `brand`,`model_rule`.`model_id` AS `model_id`,`shoe`.`product_id` AS `product_id`,`order_shoe`.`transact_status` AS `transact_status` from ((`order_shoe` join `shoe`) join `model_rule`) where ((`order_shoe`.`shoe_id` = `shoe`.`id`) and (`shoe`.`model_id` = `model_rule`.`id`)) order by `order_shoe`.`id`;

-- ----------------------------
-- View structure for order_view
-- ----------------------------
DROP VIEW IF EXISTS `order_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_view` AS select `order_list`.`id` AS `id`,`order_list`.`order_id` AS `order_id`,`order_list`.`order_date` AS `order_date`,`order_list`.`delivery_date` AS `delivery_date`,`order_list`.`comments` AS `order_comments`,`client`.`name` AS `client_name`,`client`.`telephone` AS `client_telephone`,`client`.`address` AS `client_address` from (`order_list` join `client`) where (`order_list`.`client_id` = `client`.`id`) order by `order_list`.`id` desc;

-- ----------------------------
-- View structure for produce_view
-- ----------------------------
DROP VIEW IF EXISTS `produce_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produce_view` AS select `order_shoe`.`id` AS `id`,`order_list`.`order_id` AS `order_id`,`client`.`name` AS `client`,`order_list`.`order_date` AS `order_date`,`order_list`.`delivery_date` AS `delivery_date`,`order_shoe`.`factory_series` AS `factory_series`,`order_shoe`.`size_33` AS `size_33`,`order_shoe`.`size_34` AS `size_34`,`order_shoe`.`size_35` AS `size_35`,`order_shoe`.`size_36` AS `size_36`,`order_shoe`.`size_37` AS `size_37`,`order_shoe`.`size_38` AS `size_38`,`order_shoe`.`size_39` AS `size_39`,`order_shoe`.`size_40` AS `size_40`,`order_shoe`.`order_num` AS `order_num`,`model_rule`.`model_id` AS `model_id`,`model_rule`.`waterproof` AS `waterproof`,`model_rule`.`innerheight` AS `innerheight`,`model_rule`.`heel` AS `heel`,`order_shoe`.`brand` AS `brand`,`shoe`.`product_color` AS `product_color`,`shoe`.`style_id` AS `style_id`,`bom_material`.`amount` AS `amount`,`material`.`type` AS `type`,`material`.`material_id` AS `material_id`,`material`.`name` AS `material_name`,`material`.`repertory` AS `repertory`,`material`.`unit` AS `unit`,`supplier`.`name` AS `supplier`,`order_shoe`.`transact_status` AS `status`,`order_shoe`.`order_id` AS `order_iid`,`material`.`id` AS `material_iid`,`supplier`.`telephone` AS `supplier_telephone`,`supplier`.`address` AS `supplier_address` from (((((((`order_list` join `order_shoe`) join `model_rule`) join `shoe`) join `bom_material`) join `material`) join `supplier`) join `client`) where ((`order_shoe`.`order_id` = `order_list`.`id`) and (`order_shoe`.`shoe_id` = `shoe`.`id`) and (`shoe`.`model_id` = `model_rule`.`id`) and (`bom_material`.`shoe_id` = `shoe`.`id`) and (`bom_material`.`material_id` = `material`.`id`) and (`order_list`.`client_id` = `client`.`id`) and (`bom_material`.`supplier_id` = `supplier`.`id`)) order by `order_shoe`.`id`,`bom_material`.`id`;

-- ----------------------------
-- View structure for purchase_detail_view
-- ----------------------------
DROP VIEW IF EXISTS `purchase_detail_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_detail_view` AS select `purchase_detail`.`id` AS `id`,`purchase_detail`.`purchase_id` AS `purchase_id`,`material`.`material_id` AS `material_id`,`material`.`name` AS `material_name`,`supplier`.`name` AS `supplier_name`,`purchase_detail`.`amount` AS `amount`,`material`.`unit` AS `unit`,`purchase_detail`.`status` AS `status`,`purchase_detail`.`comments` AS `comments`,`supplier`.`id` AS `supplier_iid`,`material`.`id` AS `material_iid`,`supplier`.`telephone` AS `supplier_telephone`,`supplier`.`address` AS `supplier_address` from ((`supplier` join `material`) join `purchase_detail`) where ((`purchase_detail`.`material_id` = `material`.`id`) and (`purchase_detail`.`supplier_id` = `supplier`.`id`));

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `attribute` VALUES ('1', '1', '猪皮', 'A01');
INSERT INTO `attribute` VALUES ('2', '1', '牛皮', 'A02');
INSERT INTO `attribute` VALUES ('3', '2', '红', 'B001');
INSERT INTO `attribute` VALUES ('4', '2', '白', 'B002');
INSERT INTO `attribute` VALUES ('5', '2', '蓝', 'B003');
INSERT INTO `attribute` VALUES ('6', '3', '大', 'S0001');
INSERT INTO `attribute` VALUES ('7', '3', '中', 'S0002');
INSERT INTO `attribute` VALUES ('8', '3', '小', 'S0003');
INSERT INTO `attribute` VALUES ('9', '4', '优', 'X00');
INSERT INTO `bom_material` VALUES ('1', '2', '1', '1', '20', '阿萨德发生的');
INSERT INTO `bom_material` VALUES ('2', '2', '3', '2', '20', '的发放的');
INSERT INTO `bom_material` VALUES ('3', '1', '3', '1', '12', '发发');
INSERT INTO `bom_material` VALUES ('4', '1', '2', '2', '23', '撒的发生的发');
INSERT INTO `bom_material` VALUES ('5', '1', '1', '1', '43', '艾丝凡大是大非');
INSERT INTO `cancel_shoe` VALUES ('1', '1', '1', '0', '0', '32', '33', '33', '0', '33', '0', '2012-02-25', 'test warehouse');
INSERT INTO `category` VALUES ('1', '1', '原材料');
INSERT INTO `category` VALUES ('2', '1', '颜色');
INSERT INTO `category` VALUES ('3', '1', '尺寸');
INSERT INTO `category` VALUES ('4', '1', '质量');
INSERT INTO `client` VALUES ('1', '工厂', '12212121', '广州市天河区五山路华南农业大学', '撒的发生的发大水');
INSERT INTO `comm_menu` VALUES ('1', '系统菜单', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('2', '系统用户管理', '/pages/comm/user.do?act=list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('3', '系统角色管理', '/pages/comm/role.do?act=list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('4', '系统资源管理', '/pages/comm/resource.do?act=list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('5', '系统菜单管理', '/pages/comm/menu.do?act=list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('9', '销售管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '4');
INSERT INTO `comm_menu` VALUES ('10', '用户管理', '/pages/comm/user.do?act=list', '26', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('13', '材料管理', '/pages/business/material.do?act=list', '21', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('14', '订单管理', '/pages/business/OrderList.do?act=list', '9', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('15', '鞋子管理', '/pages/business/bom.do?act=list', '9', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('16', '楦号管理', '/pages/business/ModelRule.do?act=list', '21', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('17', '采购管理', '/pages/business/Purchase.do?act=list', '25', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('18', '添加或修改物料类型', '/pages/business/materialType.do?act=list', '26', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('19', '供应商管理', '/pages/business/supplier.do?act=list', '21', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('20', '客人管理', '/pages/business/Client.do?act=list', '9', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('21', '物料管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '4');
INSERT INTO `comm_menu` VALUES ('22', '规则制定', '/pages/business/rule.do?act=list', '26', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('23', '冲单(入库)列表', '/pages/business/CancelShoe.do?act=list', '21', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('24', '冲单(出库)', '/pages/business/CancelOut.do?act=list', '21', '/images/main/null.png', '1');
INSERT INTO `comm_menu` VALUES ('25', '采购管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '4');
INSERT INTO `comm_menu` VALUES ('26', '后台管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '4');
INSERT INTO `comm_resource` VALUES ('1', '系统后台首页', '/pages/main/*', null);
INSERT INTO `comm_resource` VALUES ('2', '系统管理', '/pages/comm/*', null);
INSERT INTO `comm_resource` VALUES ('3', '用户管理', '/pages/comm/user.do*', '用户管理,供超级管理员管理系统管理员				');
INSERT INTO `comm_resource` VALUES ('4', '业务管理', '/pages/business/*', '业务管理		');
INSERT INTO `comm_role` VALUES ('1', '超超级管理员', '			');
INSERT INTO `comm_role` VALUES ('2', '超级管理员', '				超级管理员										');
INSERT INTO `comm_role_resource` VALUES ('108', '1', '1');
INSERT INTO `comm_role_resource` VALUES ('109', '1', '2');
INSERT INTO `comm_role_resource` VALUES ('110', '1', '3');
INSERT INTO `comm_role_resource` VALUES ('111', '1', '4');
INSERT INTO `comm_role_resource` VALUES ('114', '2', '1');
INSERT INTO `comm_role_resource` VALUES ('115', '2', '3');
INSERT INTO `comm_role_resource` VALUES ('116', '2', '4');
INSERT INTO `comm_user` VALUES ('1', 'admin', '引擎小组', 'engine', '123', '123@d.com', '123', '1');
INSERT INTO `comm_user` VALUES ('2', 'engine', '', 'engine', '', '', '', '2');
INSERT INTO `cutting` VALUES ('1', '1', '0', '0', '32', '30', '22', '0', '11', '0', '2012-02-24', 'test', '2');
INSERT INTO `cutting` VALUES ('2', '1', '0', '0', '0', '4', '40', '0', '66', '56', '2012-02-25', '567567', '1');
INSERT INTO `material` VALUES ('1', 'A02-B001-S0002-X00-001', '红胎牛', '红胎牛', '1', '-2085', 'sf', '红胎牛');
INSERT INTO `material` VALUES ('2', 'A01-B002-S0002-X00-002', '猪皮', '猪皮', '3', '2939', 'sf', '猪皮');
INSERT INTO `material` VALUES ('3', 'A01-B002-S0002-X00-003', 'test', 'test', '1', '-96', 'sf', 'test');
INSERT INTO `material_type` VALUES ('1', '面料', '面料');
INSERT INTO `material_type` VALUES ('2', '大底', '大底');
INSERT INTO `material_type` VALUES ('3', '内里', '内里');
INSERT INTO `material_type` VALUES ('4', '包中底', '包中底');
INSERT INTO `material_type` VALUES ('5', '垫脚', '垫脚');
INSERT INTO `material_type` VALUES ('6', '包防水台', '包防水台');
INSERT INTO `material_type` VALUES ('7', '饰扣', '饰扣');
INSERT INTO `material_type` VALUES ('8', '包跟', '包跟');
INSERT INTO `material_type` VALUES ('9', '包嘴', '包嘴');
INSERT INTO `model_rule` VALUES ('1', 'test001', '33,34/35,36,37/38,39,40', '33,34,35/36,37/38,39,40', '33/34,35,36,37/38,39,40', 'test1');
INSERT INTO `order_list` VALUES ('1', '1', '0001', '2012-02-25', '2012-03-10', '啊撒的发生的发');
INSERT INTO `order_shoe` VALUES ('1', '1', '回力', '1', '0002', '0', '0', '35', '34', '68', '0', '99', '110', '0002', '1', 'test');
INSERT INTO `purchase` VALUES ('1', '111', 'ma', '2012-02-25', '爱上大声地');
INSERT INTO `purchase_detail` VALUES ('1', '1', '1', '1', '1000', '1', '阿什顿');
INSERT INTO `purchase_detail` VALUES ('2', '1', '2', '1', '4124', '1', '上的撒的');
INSERT INTO `purchase_detail` VALUES ('3', '1', '3', '2', '44', '1', '说的发生的');
INSERT INTO `rule` VALUES ('1', '料号规则', 'test', '2012-02-25', '1');
INSERT INTO `shoe` VALUES ('1', '1', '红胎牛', '0001', '通用', '00002', null, 'v0.0.0', '2012-02-25', 'test');
INSERT INTO `shoe` VALUES ('2', '1', '红胎猪', '0002', '通用', '00003', null, 'v0.0.0', '2012-02-25', '四谛法');
INSERT INTO `shoe_warehouse` VALUES ('1', '1', '0', '0', '32', '33', '33', '0', '33', '0');
INSERT INTO `supplier` VALUES ('1', '华农', '111111111', 'Gz', 'hn\r\n');
INSERT INTO `supplier` VALUES ('2', '华工', '222222', 'Gz', '华工');
