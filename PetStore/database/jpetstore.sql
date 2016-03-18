/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : jpetstore

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-03-18 21:17:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `billId` varchar(16) NOT NULL,
  `username` varchar(50) NOT NULL,
  `consignee` varchar(50) NOT NULL,
  `consigneeAddress` varchar(200) NOT NULL,
  `consigneePhone` varchar(11) NOT NULL,
  `money` float(8,2) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`billId`),
  KEY `FK_user_bill` (`username`),
  CONSTRAINT `FK_user_bill` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单实体';

-- ----------------------------
-- Records of bill
-- ----------------------------

-- ----------------------------
-- Table structure for bill_product
-- ----------------------------
DROP TABLE IF EXISTS `bill_product`;
CREATE TABLE `bill_product` (
  `billId` varchar(16) NOT NULL,
  `productId` varchar(8) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float(8,2) NOT NULL,
  PRIMARY KEY (`billId`,`productId`),
  KEY `FK_bill_product2` (`productId`),
  CONSTRAINT `FK_bill_product` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`),
  CONSTRAINT `FK_bill_product2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单-商品';

-- ----------------------------
-- Records of bill_product
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` varchar(5) NOT NULL,
  `categoryName` varchar(20) NOT NULL,
  `fatherId` varchar(2) NOT NULL,
  `fatherName` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类别实体';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BD-FC', '雀', 'BD', '鸟');
INSERT INTO `category` VALUES ('BD-PO', '鹦鹉', 'BD', '鸟');
INSERT INTO `category` VALUES ('CA-MX', '曼岛猫', 'CA', '猫');
INSERT INTO `category` VALUES ('CA-PS', '波斯猫', 'CA', '猫');
INSERT INTO `category` VALUES ('DG-BG', '恶犬', 'DG', '狗');
INSERT INTO `category` VALUES ('DG-DM', '达尔马西亚狗', 'DG', '狗');
INSERT INTO `category` VALUES ('DG-GR', '金毛猎犬', 'DG', '狗');
INSERT INTO `category` VALUES ('DG-HH', '吉娃娃', 'DG', '狗');
INSERT INTO `category` VALUES ('DG-LR', '拉布拉多寻回犬', 'DG', '狗');
INSERT INTO `category` VALUES ('DG-PD', '狮子狗', 'DG', '狗');
INSERT INTO `category` VALUES ('FI-AF', '神仙鱼', 'FI', '鱼');
INSERT INTO `category` VALUES ('FI-GF', '金鱼', 'FI', '鱼');
INSERT INTO `category` VALUES ('FI-KI', '锦鲤', 'FI', '鱼');
INSERT INTO `category` VALUES ('FI-TS', '鼬鲨', 'FI', '鱼');
INSERT INTO `category` VALUES ('RP-IG', '蜥蜴', 'RP', '爬行动物');
INSERT INTO `category` VALUES ('RP-SN', '蛇', 'RP', '爬行动物');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` varchar(8) NOT NULL,
  `categoryId` varchar(5) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float(8,2) NOT NULL,
  `amount` int(11) NOT NULL,
  `sellCount` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_belong` (`categoryId`),
  CONSTRAINT `FK_belong` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品实体';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('BD-FC-01', 'BD-FC', '雀-01', '', '16.50', '5', '1', 'BD-FC');
INSERT INTO `product` VALUES ('BD-FC-02', 'BD-FC', '雀-02', '', '20.50', '5', '1', 'BD-FC');
INSERT INTO `product` VALUES ('BD-FC-03', 'BD-FC', '雀-03', '', '22.50', '10', '2', 'BD-FC');
INSERT INTO `product` VALUES ('BD-PO-01', 'BD-PO', '鹦鹉-01', '', '60.00', '25', '10', 'BD-PO');
INSERT INTO `product` VALUES ('BD-PO-02', 'BD-PO', '鹦鹉-02', '', '70.00', '29', '2', 'BD-PO');
INSERT INTO `product` VALUES ('BD-PO-03', 'BD-PO', '鹦鹉-03', '', '80.00', '25', '4', 'BD-PO');
INSERT INTO `product` VALUES ('CA-MX-01', 'CA-MX', '曼岛猫-01', '', '70.00', '222', '5', 'CA-MX');
INSERT INTO `product` VALUES ('CA-MX-02', 'CA-MX', '曼岛猫-02', '', '60.00', '222', '5', 'CA-MX');
INSERT INTO `product` VALUES ('CA-MX-03', 'CA-MX', '曼岛猫-03', '', '66.60', '222', '5', 'CA-MX');
INSERT INTO `product` VALUES ('CA-MX-04', 'CA-MX', '曼岛猫-04', '', '59.70', '222', '5', 'CA-MX');
INSERT INTO `product` VALUES ('CA-PS-01', 'CA-PS', '波斯猫-01', '', '111.00', '42', '7', 'CA-PS');
INSERT INTO `product` VALUES ('CA-PS-02', 'CA-PS', '波斯猫-02', '', '142.00', '42', '7', 'CA-PS');
INSERT INTO `product` VALUES ('CA-PS-03', 'CA-PS', '波斯猫-03', '', '115.00', '42', '7', 'CA-PS');
INSERT INTO `product` VALUES ('DG-BG-01', 'DG-BG', '恶犬-01', '', '50.00', '10', '0', 'DG-BG');
INSERT INTO `product` VALUES ('DG-BG-02', 'DG-BG', '恶犬-02', '', '40.00', '10', '0', 'DG-BG');
INSERT INTO `product` VALUES ('DG-DM-01', 'DG-DM', '达尔马西亚狗-01', '', '500.00', '20', '5', 'DG-DM');
INSERT INTO `product` VALUES ('DG-DM-02', 'DG-DM', '达尔马西亚狗-02', '', '500.00', '20', '5', 'DG-DM');
INSERT INTO `product` VALUES ('DG-DM-03', 'DG-DM', '达尔马西亚狗-03', '', '666.00', '20', '5', 'DG-DM');
INSERT INTO `product` VALUES ('DG-GR-01', 'DG-GR', '金毛猎犬-01', '', '321.00', '33', '0', 'DG-GR');
INSERT INTO `product` VALUES ('DG-GR-02', 'DG-GR', '金毛猎犬-02', '', '321.00', '33', '0', 'DG-GR');
INSERT INTO `product` VALUES ('DG-HH-01', 'DG-HH', '吉娃娃-01', '', '200.00', '100', '70', 'DG-HH');
INSERT INTO `product` VALUES ('DG-HH-02', 'DG-HH', '吉娃娃-02', '', '200.00', '100', '70', 'DG-HH');
INSERT INTO `product` VALUES ('DG-HH-03', 'DG-HH', '吉娃娃-03', '', '200.00', '100', '70', 'DG-HH');
INSERT INTO `product` VALUES ('DG-HH-04', 'DG-HH', '吉娃娃-04', '', '200.00', '100', '70', 'DG-HH');
INSERT INTO `product` VALUES ('DG-LR-01', 'DG-LR', '拉布拉多寻回犬-01', '', '500.00', '12', '9', 'DG-LR');
INSERT INTO `product` VALUES ('DG-LR-02', 'DG-LR', '拉布拉多寻回犬-02', '', '500.00', '12', '9', 'DG-LR');
INSERT INTO `product` VALUES ('DG-PD-01', 'DG-PD', '狮子狗-01', '', '300.00', '1', '10', 'DG-PD');
INSERT INTO `product` VALUES ('DG-PD-02', 'DG-PD', '狮子狗-02', '', '300.00', '4', '10', 'DG-PD');
INSERT INTO `product` VALUES ('FI-AF-01', 'FI-AF', '神仙鱼-01', '', '100.00', '50', '33', 'FI-AF');
INSERT INTO `product` VALUES ('FI-AF-02', 'FI-AF', '神仙鱼-02', '', '100.00', '50', '33', 'FI-AF');
INSERT INTO `product` VALUES ('FI-AF-03', 'FI-AF', '神仙鱼-03', '', '100.00', '50', '33', 'FI-AF');
INSERT INTO `product` VALUES ('FI-GF-01', 'FI-GF', '金鱼-01', '', '60.00', '400', '33', 'FI-GF');
INSERT INTO `product` VALUES ('FI-KI-01', 'FI-KI', '锦鲤-01', '', '500.00', '12', '4', 'FI-KI');
INSERT INTO `product` VALUES ('FI-TS-01', 'FI-TS', '鼬鲨-01', '', '1000.00', '2', '0', 'FI-TS');
INSERT INTO `product` VALUES ('RP-IG-01', 'RP-IG', '蜥蜴-01', '', '301.00', '5', '2', 'RP-IG');
INSERT INTO `product` VALUES ('RP-IG-02', 'RP-IG', '蜥蜴-02', '', '301.00', '5', '2', 'RP-IG');
INSERT INTO `product` VALUES ('RP-SN-01', 'RP-SN', '蛇-01', '', '99.00', '14', '0', 'RP-SN');

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `username` varchar(50) NOT NULL,
  `productId` varchar(8) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float(8,2) NOT NULL,
  PRIMARY KEY (`username`,`productId`),
  KEY `FK_shoppingCar2` (`productId`),
  CONSTRAINT `FK_shoppingCar` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_shoppingCar2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户实体';

-- ----------------------------
-- Records of user
-- ----------------------------
