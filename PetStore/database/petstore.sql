/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : petstore

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-03-06 21:33:36
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单条目';

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
