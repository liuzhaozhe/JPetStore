/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : petstore

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-03-10 16:59:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category1
-- ----------------------------
DROP TABLE IF EXISTS `category1`;
CREATE TABLE `category1` (
  `id` varchar(2) NOT NULL COMMENT '总类别编号',
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='总类别';

-- ----------------------------
-- Records of category1
-- ----------------------------
INSERT INTO `category1` VALUES ('BD', '鸟');
INSERT INTO `category1` VALUES ('CA', '猫');
INSERT INTO `category1` VALUES ('DG', '狗');
INSERT INTO `category1` VALUES ('FI', '鱼');
INSERT INTO `category1` VALUES ('RP', '爬行动物');

-- ----------------------------
-- Table structure for category2
-- ----------------------------
DROP TABLE IF EXISTS `category2`;
CREATE TABLE `category2` (
  `id` varchar(5) NOT NULL COMMENT '次类别编号',
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  `pid` varchar(2) NOT NULL COMMENT '父类编号',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `category2_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `category1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='总类别';

-- ----------------------------
-- Records of category2
-- ----------------------------
INSERT INTO `category2` VALUES ('BD-FC', '雀', 'BD');
INSERT INTO `category2` VALUES ('BD-PO', '鹦鹉', 'BD');
INSERT INTO `category2` VALUES ('CA-MX', '曼岛猫', 'CA');
INSERT INTO `category2` VALUES ('CA-PS', '波斯猫', 'CA');
INSERT INTO `category2` VALUES ('DG-BG', '恶犬', 'DG');
INSERT INTO `category2` VALUES ('DG-DM', '达尔马西亚狗', 'DG');
INSERT INTO `category2` VALUES ('DG-GR', '金毛猎犬', 'DG');
INSERT INTO `category2` VALUES ('DG-HH', '吉娃娃', 'DG');
INSERT INTO `category2` VALUES ('DG-LR', '拉布拉多寻回犬', 'DG');
INSERT INTO `category2` VALUES ('DG-PD', '狮子狗', 'DG');
INSERT INTO `category2` VALUES ('FI-AF', '神仙鱼', 'FI');
INSERT INTO `category2` VALUES ('FI-GF', '金鱼', 'FI');
INSERT INTO `category2` VALUES ('FI-KI', '锦鲤', 'FI');
INSERT INTO `category2` VALUES ('FI-TS', '鼬鲨', 'FI');
INSERT INTO `category2` VALUES ('RP-IG', '蜥蜴', 'RP');
INSERT INTO `category2` VALUES ('RP-SN', '蛇', 'RP');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '登陆密码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '俞志云', '12345622', '铁道1舍522', '2723364262@qq.com', '123456');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '订单编号',
  `consignee` varchar(50) NOT NULL COMMENT '收货人',
  `address` varchar(200) NOT NULL COMMENT '送货地址',
  `phone` varchar(11) NOT NULL COMMENT '电话号码',
  `totalPrice` decimal(10,2) NOT NULL COMMENT '总价格',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `paymentWay` varchar(15) NOT NULL COMMENT '支付方式',
  `customerId` int(10) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'fe125364', '俞志云', '铁道522', '12345678911', '10.30', '2016-03-06 19:30:58', '支付宝', '123');
INSERT INTO `order` VALUES ('2', 'fe125364', '何柱君', '铁道522', '12345678911', '10.30', '2016-03-06 19:30:58', '支付宝', '123');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` varchar(10) NOT NULL COMMENT '商品编号',
  `productName` varchar(200) NOT NULL COMMENT '商品名称',
  `productPrice` decimal(10,2) NOT NULL COMMENT '商品价格',
  `amount` int(11) NOT NULL COMMENT '商品数量',
  `orderId` int(10) unsigned DEFAULT NULL COMMENT '订单编号,绑定订单',
  `customerId` int(10) unsigned DEFAULT NULL COMMENT '用户ID,绑定用户购物车',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单条目';

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for productinfo
-- ----------------------------
DROP TABLE IF EXISTS `productinfo`;
CREATE TABLE `productinfo` (
  `id` varchar(10) NOT NULL,
  `name` varchar(200) NOT NULL COMMENT '商品名称',
  `description` text COMMENT '商品描述',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `amount` int(10) unsigned NOT NULL COMMENT '库存',
  `sellCount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售量',
  `uploadFile` varchar(255) NOT NULL COMMENT '上传文件ID',
  `category2` varchar(10) NOT NULL,
  `category` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of productinfo
-- ----------------------------
INSERT INTO `productinfo` VALUES ('BD-FC-01', '雀-01', null, '16.50', '5', '1', 'BD-FC', 'BD-FC', 'BD');
INSERT INTO `productinfo` VALUES ('BD-FC-02', '雀-02', null, '16.50', '5', '1', 'BD-FC', 'BD-FC', 'BD');
INSERT INTO `productinfo` VALUES ('BD-FC-03', '雀-03', null, '16.50', '5', '1', 'BD-FC', 'BD-FC', 'BD');
INSERT INTO `productinfo` VALUES ('BD-FC-04', '雀-04', null, '16.50', '5', '1', 'BD-FC', 'BD-FC', 'BD');
INSERT INTO `productinfo` VALUES ('BD-PO-01', '鹦鹉-01', null, '99.90', '6', '3', 'BD-PO', 'BD-PO', 'BD');
INSERT INTO `productinfo` VALUES ('BD-PO-02', '鹦鹉-02', null, '99.90', '6', '3', 'BD-PO', 'BD-PO', 'BD');
INSERT INTO `productinfo` VALUES ('BD-PO-03', '鹦鹉-03', null, '99.90', '6', '3', 'BD-PO', 'BD-PO', 'BD');
INSERT INTO `productinfo` VALUES ('CA-MX-01', '曼岛猫-01', null, '169.50', '8', '4', 'CA-MX', 'CA-MX', 'CA');
INSERT INTO `productinfo` VALUES ('CA-MX-02', '曼岛猫-02', null, '169.50', '8', '4', 'CA-MX', 'CA-MX', 'CA');
INSERT INTO `productinfo` VALUES ('CA-MX-03', '曼岛猫-03', null, '169.50', '8', '4', 'CA-MX', 'CA-MX', 'CA');
INSERT INTO `productinfo` VALUES ('CA-MX-04', '曼岛猫-04', null, '169.50', '8', '4', 'CA-MX', 'CA-MX', 'CA');
INSERT INTO `productinfo` VALUES ('CA-PS-01', '波斯猫-01', null, '195.00', '10', '5', 'CA-PS', 'CA-PS', 'CA');
INSERT INTO `productinfo` VALUES ('CA-PS-02', '波斯猫-02', null, '195.00', '10', '5', 'CA-PS', 'CA-PS', 'CA');
INSERT INTO `productinfo` VALUES ('CA-PS-03', '波斯猫-03', null, '195.00', '10', '5', 'CA-PS', 'CA-PS', 'CA');
INSERT INTO `productinfo` VALUES ('CA-PS-04', '波斯猫-04', null, '195.00', '10', '5', 'CA-PS', 'CA-PS', 'CA');
INSERT INTO `productinfo` VALUES ('CA-PS-05', '波斯猫-05', null, '195.00', '10', '5', 'CA-PS', 'CA-PS', 'CA');
INSERT INTO `productinfo` VALUES ('DG-BG-01', '恶犬-01', null, '200.50', '6', '1', 'DG-BG', 'DG-BG', 'DG');
INSERT INTO `productinfo` VALUES ('DG-BG-02', '恶犬-02', null, '200.50', '6', '1', 'DG-BG', 'DG-BG', 'DG');
INSERT INTO `productinfo` VALUES ('DG-BG-03', '恶犬-03', null, '200.50', '6', '1', 'DG-BG', 'DG-BG', 'DG');
INSERT INTO `productinfo` VALUES ('DG-BG-04', '恶犬-04', null, '200.50', '6', '1', 'DG-BG', 'DG-BG', 'DG');
INSERT INTO `productinfo` VALUES ('DG-DM-01', '达尔马西亚狗-01', null, '600.00', '8', '5', 'DG-DM', 'DG-DM', 'DG');
INSERT INTO `productinfo` VALUES ('DG-DM-02', '达尔马西亚狗-02', null, '600.00', '8', '5', 'DG-DM', 'DG-DM', 'DG');
INSERT INTO `productinfo` VALUES ('DG-DM-03', '达尔马西亚狗-03', null, '600.00', '8', '5', 'DG-DM', 'DG-DM', 'DG');
INSERT INTO `productinfo` VALUES ('DG-GR-01', '金毛猎犬-01', null, '620.00', '12', '8', 'DG-GR', 'DG-GR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-GR-02', '金毛猎犬-02', null, '620.00', '12', '8', 'DG-GR', 'DG-GR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-GR-03', '金毛猎犬-03', null, '620.00', '12', '8', 'DG-GR', 'DG-GR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-GR-04', '金毛猎犬-04', null, '620.00', '12', '8', 'DG-GR', 'DG-GR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-HH-01', '吉娃娃-01', null, '450.00', '12', '7', 'DG-HH', 'DG-HH', 'DG');
INSERT INTO `productinfo` VALUES ('DG-HH-02', '吉娃娃-02', null, '450.00', '12', '7', 'DG-HH', 'DG-HH', 'DG');
INSERT INTO `productinfo` VALUES ('DG-HH-03', '吉娃娃-03', null, '450.00', '12', '7', 'DG-HH', 'DG-HH', 'DG');
INSERT INTO `productinfo` VALUES ('DG-HH-04', '吉娃娃-04', null, '450.00', '12', '7', 'DG-HH', 'DG-HH', 'DG');
INSERT INTO `productinfo` VALUES ('DG-HH-05', '吉娃娃-05', null, '450.00', '12', '7', 'DG-HH', 'DG-HH', 'DG');
INSERT INTO `productinfo` VALUES ('DG-LR-01', '拉布拉多寻回犬-01', null, '500.00', '10', '5', 'DG-LR', 'DG-LR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-LR-02', '拉布拉多寻回犬-02', null, '500.00', '10', '5', 'DG-LR', 'DG-LR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-LR-03', '拉布拉多寻回犬-03', null, '500.00', '10', '5', 'DG-LR', 'DG-LR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-LR-04', '拉布拉多寻回犬-04', null, '500.00', '10', '5', 'DG-LR', 'DG-LR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-LR-05', '拉布拉多寻回犬-05', null, '500.00', '10', '5', 'DG-LR', 'DG-LR', 'DG');
INSERT INTO `productinfo` VALUES ('DG-PD-01', '狮子狗-01', null, '230.00', '6', '2', 'DG-PD', 'DG-PD', 'DG');
INSERT INTO `productinfo` VALUES ('DG-PD-02', '狮子狗-02', null, '230.00', '6', '2', 'DG-PD', 'DG-PD', 'DG');
INSERT INTO `productinfo` VALUES ('DG-PD-03', '狮子狗-03', null, '230.00', '6', '2', 'DG-PD', 'DG-PD', 'DG');
INSERT INTO `productinfo` VALUES ('DG-PD-04', '狮子狗-04', null, '230.00', '6', '2', 'DG-PD', 'DG-PD', 'DG');
INSERT INTO `productinfo` VALUES ('FI-GF-01', '神仙鱼-01', null, '300.00', '15', '10', 'FI-GF', 'FI-GF', 'FI');
INSERT INTO `productinfo` VALUES ('FI-GF-02', '神仙鱼-02', null, '300.00', '15', '10', 'FI-GF', 'FI-GF', 'FI');
INSERT INTO `productinfo` VALUES ('FI-GF-03', '神仙鱼-03', null, '300.00', '15', '10', 'FI-GF', 'FI-GF', 'FI');
INSERT INTO `productinfo` VALUES ('FI-GF-04', '神仙鱼-04', null, '300.00', '15', '10', 'FI-GF', 'FI-GF', 'FI');
INSERT INTO `productinfo` VALUES ('FI-GF-05', '神仙鱼-05', null, '300.00', '15', '10', 'FI-GF', 'FI-GF', 'FI');
INSERT INTO `productinfo` VALUES ('FI-KI-01', '锦鲤-01', null, '999.00', '4', '0', 'FI-KI', 'FI-KI', 'FI');
INSERT INTO `productinfo` VALUES ('FI-KI-02', '锦鲤-02', null, '999.00', '4', '0', 'FI-KI', 'FI-KI', 'FI');
INSERT INTO `productinfo` VALUES ('FI-KI-03', '锦鲤-03', null, '999.00', '4', '0', 'FI-KI', 'FI-KI', 'FI');
INSERT INTO `productinfo` VALUES ('FI-KI-04', '锦鲤-04', null, '999.00', '4', '0', 'FI-KI', 'FI-KI', 'FI');
INSERT INTO `productinfo` VALUES ('FI-TS-01', '鼬鲨-01', null, '1500.00', '3', '1', 'FI-TS', 'FI-TS', 'FI');
INSERT INTO `productinfo` VALUES ('FI-TS-02', '鼬鲨-02', null, '1500.00', '3', '1', 'FI-TS', 'FI-TS', 'FI');
INSERT INTO `productinfo` VALUES ('RP-IG-01', '蜥蜴-01', null, '233.50', '4', '0', 'RP-IG', 'RP-IG', 'RP');
INSERT INTO `productinfo` VALUES ('RP-IG-02', '蜥蜴-02', null, '233.50', '4', '0', 'RP-IG', 'RP-IG', 'RP');
INSERT INTO `productinfo` VALUES ('RP-IG-03', '蜥蜴-03', null, '233.50', '4', '0', 'RP-IG', 'RP-IG', 'RP');
INSERT INTO `productinfo` VALUES ('RP-IG-04', '蜥蜴-04', null, '233.50', '4', '0', 'RP-IG', 'RP-IG', 'RP');
INSERT INTO `productinfo` VALUES ('RP-SN-01', '蛇-01', null, '199.00', '1', '1', 'RP-SN', 'RP-SN', 'RP');
