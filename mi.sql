/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : mi

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-10-27 11:52:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '小米手机');
INSERT INTO `category` VALUES ('2', '红米');
INSERT INTO `category` VALUES ('3', '电视');
INSERT INTO `category` VALUES ('4', '笔记本');
INSERT INTO `category` VALUES ('5', '空调');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_0001` (`pid`),
  KEY `fk_0002` (`oid`),
  CONSTRAINT `fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1A555C85181D4A7EA539428DE3C25392', '1', '1099', '4', 'ECE99579C4404E6FB7595509E012B86D');
INSERT INTO `orderitem` VALUES ('348F5C78251D4F0D83817E113BBFF00C', '1', '1099', '8', '97ED8355318347AD9E87CA2B6026D0DC');
INSERT INTO `orderitem` VALUES ('4092390D5D014387A8F1B54FAAFA2546', '1', '1099', '10', '3CD59CE01C8C4BEEBB661916E1BE4B20');
INSERT INTO `orderitem` VALUES ('87A3EE056F91463282717556998538D2', '3', '3297', '7', 'ECE99579C4404E6FB7595509E012B86D');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3CD59CE01C8C4BEEBB661916E1BE4B20', '2018-08-28 06:25:40', '1099', '3', '66', '66', '66', 'B436989FBBE24E75A0466BCA17361337');
INSERT INTO `orders` VALUES ('97ED8355318347AD9E87CA2B6026D0DC', '2018-09-08 11:09:54', '1099', '1', '123', '11', '11', '0C0680BF7A4841AE8DF8A50E29A89AD5');
INSERT INTO `orders` VALUES ('ECE99579C4404E6FB7595509E012B86D', '2018-08-27 23:50:17', '4396', '3', '123', '123', '123', '0C0680BF7A4841AE8DF8A50E29A89AD5');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT NULL,
  `cid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `sfk_0001` (`cid`),
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小米9', '1599', '1399', 'products/1/3B7A36799E1F49F58601AD5C6333EABE', '2018-09-08', '1', '小米 6c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '1');
INSERT INTO `product` VALUES ('10', '小米MIX2', '1299', '1099', 'products/1/1_002.jpg', '2018-07-04', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '1');
INSERT INTO `product` VALUES ('11', '小米Max3', '1299', '1099', 'products/1/1_003.jpg', '2018-07-12', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '1');
INSERT INTO `product` VALUES ('12', '小米6X', '1299', '1099', 'products/1/1_004.jpg', '2018-07-02', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '1');
INSERT INTO `product` VALUES ('13', '小米MIX 2S', '1399', '1299', 'products/1/1_005.jpg', '2017-11-02', '1', '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '1');
INSERT INTO `product` VALUES ('14', '小米8E', '1299', '1099', 'products/1/1_006.jpg', '2018-07-04', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '1');
INSERT INTO `product` VALUES ('15', '红米6 Pro', '1299', '1099', 'products/2/2_001.jpg', '2018-07-12', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '2');
INSERT INTO `product` VALUES ('16', '红米6', '1299', '1099', 'products/2/2_002.jpg', '2018-07-02', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '2');
INSERT INTO `product` VALUES ('17', '红米6A', '1399', '1299', 'products/2/2_003.jpg', '2017-11-02', '1', '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '2');
INSERT INTO `product` VALUES ('18', '红米Note5', '1299', '1099', 'products/2/2_004.jpg', '2018-07-04', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '2');
INSERT INTO `product` VALUES ('19', '红米S2', '1299', '1099', 'products/2/2_005.jpg', '2018-07-12', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '2');
INSERT INTO `product` VALUES ('2', '红米5 Plus', '1299', '1099', 'products/2/2_006.jpg', '2018-07-04', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '2');
INSERT INTO `product` VALUES ('20', '小米电视4A 55英寸', '1299', '1099', 'products/3/3_001.jpg', '2018-07-02', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '3');
INSERT INTO `product` VALUES ('21', '小米电视4.75英寸', '1399', '1299', 'products/3/3_002.jpg', '2017-11-02', '1', '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '3');
INSERT INTO `product` VALUES ('22', '小米电视4A 32英寸', '1299', '1099', 'products/3/3_003.jpg', '2018-07-04', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '3');
INSERT INTO `product` VALUES ('23', '小米电视4A 43英寸青春版', '1299', '1099', 'products/3/3_004.jpg', '2018-07-12', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '3');
INSERT INTO `product` VALUES ('24', '小米电视4A 50英寸', '1299', '1099', 'products/3/3_005.jpg', '2018-07-02', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '3');
INSERT INTO `product` VALUES ('3', '小米笔记本Pro', '1299', '1099', 'products/4/4_001.jpg', '2018-07-12', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '4');
INSERT INTO `product` VALUES ('4', '小米笔记本 Air 系列', '1299', '1099', 'products/4/4_002.jpg', '2018-07-02', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '4');
INSERT INTO `product` VALUES ('5', '小米游戏本 ', '1399', '1299', 'products/4/4_003.jpg', '2017-11-02', '1', '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '4');
INSERT INTO `product` VALUES ('6', '小米平板', '1299', '1099', 'products/4/4_004.jpg', '2018-07-04', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '4');
INSERT INTO `product` VALUES ('7', '小米笔记本 GTX版', '1299', '1099', 'products/4/4_005.jpg', '2018-07-12', '1', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '4');
INSERT INTO `product` VALUES ('8', '米家互联网空调', '1299', '1099', 'products/5/5_001.jpg', '2018-07-02', '0', '单手可握的8.0\'\'屏幕 / 骁龙660高端处理器 / 超长续航 / AI人脸识别 / 后置1300万 / 前置500万 / 金属机身 / 超窄边框', '0', '5');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(100) NOT NULL,
  `type` int(5) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0C0680BF7A4841AE8DF8A50E29A89AD5', '0', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'dgut@mi.com', '10086', '男', '1', null);
INSERT INTO `user` VALUES ('38DD0433483B47B8ADCD6EAC2D6B24EB', '2', 'lan', 'e10adc3949ba59abbe56e057f20f883e', '刘祝蓝', 'lan@mi.com', '15625700761', '男', '1', null);
INSERT INTO `user` VALUES ('56A12F2ED13F4D61859EF328F875F584', '1', 'tom', 'e10adc3949ba59abbe56e057f20f883e', 'tom', 'tom@mi.com', '15625700761', '男', '1', null);
