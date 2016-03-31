/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : jpetstore

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-03-31 14:07:17
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
  PRIMARY KEY (`billId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单实体';

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('2016032220003811', 'hezhujun', '俞志云', '铁道', '12345678911', '142.00', '2016-03-22 20:00:38');
INSERT INTO `bill` VALUES ('2016032220012012', 'hezhujun', '俞志云', '铁道', '12345678911', '660.00', '2016-03-22 20:01:20');
INSERT INTO `bill` VALUES ('2016032408525867', 'hezhujun', 'hezhujun', '铁道', '12345678911', '200.00', '2016-03-24 08:52:58');
INSERT INTO `bill` VALUES ('2016032619460126', 'hezhujun', 'hezhujun', '铁道', '12345678911', '1138.50', '2016-03-26 19:46:01');
INSERT INTO `bill` VALUES ('2016033020175580', 'yuzhiyun', '余韵', '522', '12346', '400.00', '2016-03-30 20:17:55');
INSERT INTO `bill` VALUES ('2016033020192156', 'yuzhiyun', '余韵', '522', '12346', '802.00', '2016-03-30 20:19:21');

-- ----------------------------
-- Table structure for bill_product
-- ----------------------------
DROP TABLE IF EXISTS `bill_product`;
CREATE TABLE `bill_product` (
  `billId` varchar(16) NOT NULL,
  `productId` varchar(8) NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `price` float(8,2) unsigned NOT NULL,
  PRIMARY KEY (`billId`,`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单-商品';

-- ----------------------------
-- Records of bill_product
-- ----------------------------
INSERT INTO `bill_product` VALUES ('2016032220003811', 'CA-PS-02', '1', '142.00');
INSERT INTO `bill_product` VALUES ('2016032220012012', 'DG-PD-01', '2', '600.00');
INSERT INTO `bill_product` VALUES ('2016032220012012', 'FI-GF-01', '1', '60.00');
INSERT INTO `bill_product` VALUES ('2016032408525867', 'DG-HH-03', '1', '200.00');
INSERT INTO `bill_product` VALUES ('2016032619460126', 'BD-FC-01', '1', '16.50');
INSERT INTO `bill_product` VALUES ('2016032619460126', 'CA-PS-02', '1', '142.00');
INSERT INTO `bill_product` VALUES ('2016032619460126', 'DG-LR-01', '1', '500.00');
INSERT INTO `bill_product` VALUES ('2016032619460126', 'FI-GF-01', '8', '480.00');
INSERT INTO `bill_product` VALUES ('2016033020175580', 'DG-HH-02', '2', '400.00');
INSERT INTO `bill_product` VALUES ('2016033020192156', 'DG-HH-02', '1', '200.00');
INSERT INTO `bill_product` VALUES ('2016033020192156', 'RP-IG-02', '2', '602.00');

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
  `price` float(8,2) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `sellCount` int(11) unsigned NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_belong` (`categoryId`),
  CONSTRAINT `FK_belong` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品实体';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('BD-FC-01', 'BD-FC', '雀-01', '', '16.50', '9', '3', 'BD-FC.gif');
INSERT INTO `product` VALUES ('BD-FC-02', 'BD-FC', '雀-02', '', '20.50', '5', '1', 'BD-FC.gif');
INSERT INTO `product` VALUES ('BD-FC-03', 'BD-FC', '雀-03', '', '22.50', '10', '2', 'BD-FC.gif');
INSERT INTO `product` VALUES ('BD-PO-01', 'BD-PO', '鹦鹉-01', '', '60.00', '25', '10', 'BD-PO.gif');
INSERT INTO `product` VALUES ('BD-PO-02', 'BD-PO', '鹦鹉-02', '', '70.00', '29', '2', 'BD-PO.gif');
INSERT INTO `product` VALUES ('BD-PO-03', 'BD-PO', '鹦鹉-03', '', '80.00', '25', '4', 'BD-PO.gif');
INSERT INTO `product` VALUES ('CA-MX-01', 'CA-MX', '曼岛猫-01', '', '70.00', '222', '5', 'CA-MX.gif');
INSERT INTO `product` VALUES ('CA-MX-02', 'CA-MX', '曼岛猫-02', '', '60.00', '222', '5', 'CA-MX.gif');
INSERT INTO `product` VALUES ('CA-MX-03', 'CA-MX', '曼岛猫-03', '', '66.60', '222', '5', 'CA-MX.gif');
INSERT INTO `product` VALUES ('CA-MX-04', 'CA-MX', '曼岛猫-04', '', '59.70', '222', '5', 'CA-MX.gif');
INSERT INTO `product` VALUES ('CA-PS-01', 'CA-PS', '波斯猫-01', '', '111.00', '42', '7', 'CA-PS.gif');
INSERT INTO `product` VALUES ('CA-PS-02', 'CA-PS', '波斯猫-02', '', '142.00', '41', '8', 'CA-PS.gif');
INSERT INTO `product` VALUES ('CA-PS-03', 'CA-PS', '波斯猫-03', '', '115.00', '42', '7', 'CA-PS.gif');
INSERT INTO `product` VALUES ('DG-BG-01', 'DG-BG', '恶犬-01', '', '50.00', '10', '0', 'DG-BG.gif');
INSERT INTO `product` VALUES ('DG-BG-02', 'DG-BG', '恶犬-02', '', '40.00', '10', '0', 'DG-BG.gif');
INSERT INTO `product` VALUES ('DG-DM-01', 'DG-DM', '达尔马西亚狗-01', '', '500.00', '20', '5', 'DG-DM.gif');
INSERT INTO `product` VALUES ('DG-DM-02', 'DG-DM', '达尔马西亚狗-02', '', '500.00', '20', '5', 'DG-DM.gif');
INSERT INTO `product` VALUES ('DG-DM-03', 'DG-DM', '达尔马西亚狗-03', '', '666.00', '20', '5', 'DG-DM.gif');
INSERT INTO `product` VALUES ('DG-GR-01', 'DG-GR', '金毛猎犬-01', '', '321.00', '33', '0', 'DG-GR.gif');
INSERT INTO `product` VALUES ('DG-GR-02', 'DG-GR', '金毛猎犬-02', '', '321.00', '33', '0', 'DG-GR.gif');
INSERT INTO `product` VALUES ('DG-HH-01', 'DG-HH', '吉娃娃-01', '', '200.00', '100', '70', 'DG-HH.gif');
INSERT INTO `product` VALUES ('DG-HH-02', 'DG-HH', '吉娃娃-02', '', '200.00', '97', '73', 'DG-HH.gif');
INSERT INTO `product` VALUES ('DG-HH-03', 'DG-HH', '吉娃娃-03', '', '200.00', '99', '71', 'DG-HH.gif');
INSERT INTO `product` VALUES ('DG-HH-04', 'DG-HH', '吉娃娃-04', '', '200.00', '100', '70', 'DG-HH.gif');
INSERT INTO `product` VALUES ('DG-LR-01', 'DG-LR', '拉布拉多寻回犬-01', '', '500.00', '11', '10', 'DG-LR.gif');
INSERT INTO `product` VALUES ('DG-LR-02', 'DG-LR', '拉布拉多寻回犬-02', '', '500.00', '12', '9', 'DG-LR.gif');
INSERT INTO `product` VALUES ('DG-PD-01', 'DG-PD', '狮子狗-01', '', '300.00', '10', '10', 'DG-PD.gif');
INSERT INTO `product` VALUES ('DG-PD-02', 'DG-PD', '狮子狗-02', '', '300.00', '4', '10', 'DG-PD.gif');
INSERT INTO `product` VALUES ('FI-AF-01', 'FI-AF', '神仙鱼-01', '', '100.00', '50', '33', 'FI-AF.gif');
INSERT INTO `product` VALUES ('FI-AF-02', 'FI-AF', '神仙鱼-02', '', '100.00', '50', '33', 'FI-AF.gif');
INSERT INTO `product` VALUES ('FI-AF-03', 'FI-AF', '神仙鱼-03', '', '100.00', '50', '33', 'FI-AF.gif');
INSERT INTO `product` VALUES ('FI-GF-01', 'FI-GF', '金鱼-01', '', '60.00', '2', '41', 'FI-GF.gif');
INSERT INTO `product` VALUES ('FI-KI-01', 'FI-KI', '锦鲤-01', '', '500.00', '12', '4', 'FI-KI.gif');
INSERT INTO `product` VALUES ('FI-TS-01', 'FI-TS', '鼬鲨-01', '', '1000.00', '2', '0', 'FI-TS.gif');
INSERT INTO `product` VALUES ('RP-IG-01', 'RP-IG', '蜥蜴-01', '', '301.00', '5', '2', 'RP-IG.gif');
INSERT INTO `product` VALUES ('RP-IG-02', 'RP-IG', '蜥蜴-02', '', '301.00', '3', '4', 'RP-IG.gif');
INSERT INTO `product` VALUES ('RP-SN-01', 'RP-SN', '蛇-01', '', '99.00', '14', '0', 'RP-SN.gif');

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `username` varchar(50) NOT NULL,
  `productId` varchar(8) NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `price` float(8,2) unsigned NOT NULL,
  PRIMARY KEY (`username`,`productId`),
  KEY `FK_shoppingCar2` (`productId`),
  CONSTRAINT `FK_shoppingCar` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_shoppingCar2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES ('hezhujun', 'BD-FC-01', '2', '33.00');
INSERT INTO `shoppingcar` VALUES ('hezhujun', 'CA-PS-02', '1', '142.00');
INSERT INTO `shoppingcar` VALUES ('hezhujun', 'DG-LR-01', '3', '1500.00');
INSERT INTO `shoppingcar` VALUES ('hezhujun', 'FI-GF-01', '1', '60.00');
INSERT INTO `shoppingcar` VALUES ('yuzhiyun', 'DG-HH-02', '1', '200.00');
INSERT INTO `shoppingcar` VALUES ('yuzhiyun', 'RP-IG-02', '2', '602.00');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
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
  `name` varchar(255) DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户实体';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('cus', '202cb962ac59075b964b07152d234b70', '', '', '', '');
INSERT INTO `user` VALUES ('hezhujun', '202cb962ac59075b964b07152d234b70', '铁道', '1214507717@qq.com', '12345678911', '何柱君');
INSERT INTO `user` VALUES ('liuzhen', 'e10adc3949ba59abbe56e057f20f883e', '522', '12353@qq.com', null, '刘振');
INSERT INTO `user` VALUES ('yuzhiyun', '202cb962ac59075b964b07152d234b70', '522', '12353@qq.com', '12346', '余韵');

-- ----------------------------
-- View structure for bill_product_view
-- ----------------------------
DROP VIEW IF EXISTS `bill_product_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bill_product_view` AS select `bill_product`.`billId` AS `账单编号`,`bill_product`.`productId` AS `商品编号`,`product`.`productName` AS `商品名称`,`product`.`price` AS `商品价格`,`bill_product`.`amount` AS `购买数量`,`bill_product`.`price` AS `总价格` from (`bill_product` join `product` on((`bill_product`.`productId` = `product`.`productId`))) ;

-- ----------------------------
-- View structure for shoppingcar_view
-- ----------------------------
DROP VIEW IF EXISTS `shoppingcar_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shoppingcar_view` AS select `user`.`username` AS `用户名`,`product`.`productId` AS `商品编号`,`product`.`productName` AS `商品名称`,`product`.`price` AS `商品价格`,`product`.`amount` AS `商品库存`,`shoppingcar`.`amount` AS `购买数量`,`shoppingcar`.`price` AS `总价格` from ((`user` join `shoppingcar` on((`shoppingcar`.`username` = `user`.`username`))) join `product` on((`shoppingcar`.`productId` = `product`.`productId`))) ;
