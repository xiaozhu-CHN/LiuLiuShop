/*
Navicat MySQL Data Transfer

Source Server         : mysql8
Source Server Version : 80015
Source Host           : localhost:3305
Source Database       : liuliu

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-06-27 00:06:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `alipay_pay`
-- ----------------------------
DROP TABLE IF EXISTS `alipay_pay`;
CREATE TABLE `alipay_pay` (
  `alipay_pay_id` int(10) NOT NULL AUTO_INCREMENT,
  `trade_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `out_trade_no` varchar(100) DEFAULT NULL,
  `seller_id` varchar(100) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `alipay_pay_paydate` datetime DEFAULT NULL,
  PRIMARY KEY (`alipay_pay_id`),
  KEY `out_trade_no` (`out_trade_no`),
  CONSTRAINT `alipay_pay_ibfk_1` FOREIGN KEY (`out_trade_no`) REFERENCES `order` (`o_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alipay_pay
-- ----------------------------
INSERT INTO `alipay_pay` VALUES ('1', 'TRADE_SUCCESS', '2019060122001416401000004311', '2019060116123816467664685', '2088102178005451', '38.22', '2019-06-01 08:12:51');
INSERT INTO `alipay_pay` VALUES ('2', 'TRADE_SUCCESS', '2019060122001416401000004312', '2019060116333118227103373', '2088102178005451', '86.22', '2019-06-01 08:33:51');
INSERT INTO `alipay_pay` VALUES ('3', 'TRADE_SUCCESS', '2019060122001416401000004313', '2019060116374217286543023', '2088102178005451', '86.22', '2019-06-01 16:39:11');
INSERT INTO `alipay_pay` VALUES ('4', 'TRADE_SUCCESS', '2019060222001416401000005629', '2019060210392118528865701', '2088102178005451', '66.22', '2019-06-02 10:40:33');
INSERT INTO `alipay_pay` VALUES ('5', 'TRADE_SUCCESS', '2019060222001416401000007069', '2019060216563318268808572', '2088102178005451', '86.22', '2019-06-02 16:57:17');
INSERT INTO `alipay_pay` VALUES ('6', 'TRADE_SUCCESS', '2019060222001416401000007070', '2019060217350614847350582', '2088102178005451', '172', '2019-06-02 17:35:22');
INSERT INTO `alipay_pay` VALUES ('7', 'TRADE_SUCCESS', '2019062422001416401000008143', '2019060210165810332540237', '2088102178005451', '66.22', '2019-06-24 17:41:17');
INSERT INTO `alipay_pay` VALUES ('8', 'TRADE_SUCCESS', '2019062622001416401000011465', '20190626170147125525822132', '2088102178005451', '5500', '2019-06-26 17:02:54');
INSERT INTO `alipay_pay` VALUES ('9', 'TRADE_SUCCESS', '2019062622001416401000011467', '20190626174407135221306722', '2088102178005451', '4380', '2019-06-26 17:44:23');

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `area_id` int(10) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '玉州区', '3');
INSERT INTO `area` VALUES ('2', '博白县', '3');
INSERT INTO `area` VALUES ('4', '北流市', '3');
INSERT INTO `area` VALUES ('5', '兴宾区', '14');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '普通用户');
INSERT INTO `authority` VALUES ('3', 'VIP1');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(10) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '南宁', '1');
INSERT INTO `city` VALUES ('2', '柳州', '1');
INSERT INTO `city` VALUES ('3', '玉林', '1');
INSERT INTO `city` VALUES ('14', '来宾', '1');
INSERT INTO `city` VALUES ('16', '桂林', '1');
INSERT INTO `city` VALUES ('19', '百色', '1');
INSERT INTO `city` VALUES ('20', '济南', '8');

-- ----------------------------
-- Table structure for `email`
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `email_host` varchar(100) DEFAULT NULL,
  `email_port` int(5) DEFAULT NULL,
  `email_username` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `email_call` varchar(100) DEFAULT NULL,
  `email_power` int(2) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_username` (`email_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES ('1', 'smtp.exmail.qq.com', '465', 'liuliu@666.66', '11111', '溜溜商城<liuliu@666.66>', '1');

-- ----------------------------
-- Table structure for `email_info`
-- ----------------------------
DROP TABLE IF EXISTS `email_info`;
CREATE TABLE `email_info` (
  `email_info_id` int(10) NOT NULL AUTO_INCREMENT,
  `email_info_to` varchar(100) DEFAULT NULL,
  `email_username` varchar(100) DEFAULT NULL,
  `email_info_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_info_time` datetime DEFAULT NULL,
  PRIMARY KEY (`email_info_id`),
  KEY `email_username` (`email_username`),
  CONSTRAINT `email_info_ibfk_1` FOREIGN KEY (`email_username`) REFERENCES `email` (`email_username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_info
-- ----------------------------
INSERT INTO `email_info` VALUES ('1', '1351095072@qq.com', 'liuliu@666.66', '验证码', '2019-06-22 14:57:55');
INSERT INTO `email_info` VALUES ('2', '1351095072@qq.com', 'liuliu@666.66', '验证码', '2019-06-22 14:58:53');
INSERT INTO `email_info` VALUES ('3', '1351095072@qq.com', 'liuliu@666.66', '验证码', '2019-06-22 14:59:57');
INSERT INTO `email_info` VALUES ('4', '1351095072@qq.com', 'liuliu@666.66', '验证码', '2019-06-22 15:40:51');
INSERT INTO `email_info` VALUES ('5', '1351095072@qq.com', 'liuliu@666.66', '尊敬溜溜商城用户您好，您的验证码为【1144】;半个小时内有效。', '2019-06-26 16:24:00');
INSERT INTO `email_info` VALUES ('6', '1351095072@qq.com', 'liuliu@666.66', '尊敬溜溜商城用户您好，您的验证码为【4044】;半个小时内有效。', '2019-06-26 17:40:55');

-- ----------------------------
-- Table structure for `express`
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `express_id` int(10) NOT NULL AUTO_INCREMENT,
  `oi_id` int(10) DEFAULT NULL,
  `express_company_id` int(10) DEFAULT NULL,
  `express_code` bigint(20) DEFAULT NULL,
  `express_deliverydate` datetime DEFAULT NULL,
  PRIMARY KEY (`express_id`) USING BTREE,
  KEY `o_id` (`oi_id`) USING BTREE,
  KEY `express_company_id` (`express_company_id`) USING BTREE,
  CONSTRAINT `express_ibfk_2` FOREIGN KEY (`express_company_id`) REFERENCES `express_company` (`express_company_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `express_ibfk_3` FOREIGN KEY (`oi_id`) REFERENCES `orderitem` (`oi_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES ('1', '11', '1', '2019062466666', '2019-06-24 16:05:44');
INSERT INTO `express` VALUES ('2', '12', '1', '2019062466667', '2019-06-24 16:07:32');
INSERT INTO `express` VALUES ('3', '33', '1', '55645645645456456', '2019-06-26 17:04:08');
INSERT INTO `express` VALUES ('4', '34', '1', '55645645645456456', '2019-06-26 17:45:33');

-- ----------------------------
-- Table structure for `express_company`
-- ----------------------------
DROP TABLE IF EXISTS `express_company`;
CREATE TABLE `express_company` (
  `express_company_id` int(10) NOT NULL AUTO_INCREMENT,
  `express_company_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`express_company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of express_company
-- ----------------------------
INSERT INTO `express_company` VALUES ('1', '顺丰');
INSERT INTO `express_company` VALUES ('2', '圆通');

-- ----------------------------
-- Table structure for `follow_ store`
-- ----------------------------
DROP TABLE IF EXISTS `follow_ store`;
CREATE TABLE `follow_ store` (
  `follow_store_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_store_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`follow_store_id`) USING BTREE,
  KEY `pro_store_id` (`product_store_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `follow_ store_ibfk_1` FOREIGN KEY (`product_store_id`) REFERENCES `product_store` (`product_store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `follow_ store_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of follow_ store
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_product`
-- ----------------------------
DROP TABLE IF EXISTS `follow_product`;
CREATE TABLE `follow_product` (
  `follow_product_id` int(10) NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`follow_product_id`) USING BTREE,
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `follow_product_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `follow_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of follow_product
-- ----------------------------
INSERT INTO `follow_product` VALUES ('2', '3', '1');
INSERT INTO `follow_product` VALUES ('3', '1', '1');

-- ----------------------------
-- Table structure for `integral`
-- ----------------------------
DROP TABLE IF EXISTS `integral`;
CREATE TABLE `integral` (
  `integral_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `integral_number` int(10) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `integral_date` datetime DEFAULT NULL,
  PRIMARY KEY (`integral_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE,
  CONSTRAINT `integral_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `integral_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of integral
-- ----------------------------
INSERT INTO `integral` VALUES ('1', '1', '-2000', '1', '2019-06-02 10:16:58');
INSERT INTO `integral` VALUES ('2', '1', '-2000', '1', '2019-06-02 10:17:00');
INSERT INTO `integral` VALUES ('3', '1', '-2000', '1', '2019-06-02 10:39:22');
INSERT INTO `integral` VALUES ('4', '1', '-2000', '1', '2019-06-02 17:35:06');
INSERT INTO `integral` VALUES ('5', '11', '2000', '2', '2019-06-26 13:08:59');
INSERT INTO `integral` VALUES ('6', '12', '2000', '2', '2019-06-26 16:23:03');
INSERT INTO `integral` VALUES ('7', '12', '-2000', '1', '2019-06-26 16:32:36');
INSERT INTO `integral` VALUES ('8', '13', '2000', '2', '2019-06-26 17:39:07');
INSERT INTO `integral` VALUES ('9', '13', '-2000', '1', '2019-06-26 17:44:07');

-- ----------------------------
-- Table structure for `message_info`
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info` (
  `message_info_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_info_mobile` varchar(100) DEFAULT NULL,
  `message_info_returnstatus` varchar(100) DEFAULT NULL,
  `message_info_message` varchar(100) DEFAULT NULL,
  `message_info_taskid` varchar(100) DEFAULT NULL,
  `message_info_time` datetime DEFAULT NULL,
  PRIMARY KEY (`message_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_info
-- ----------------------------
INSERT INTO `message_info` VALUES ('1', '15278337836', 'Success', 'ok', '112274', '2019-06-23 10:45:50');
INSERT INTO `message_info` VALUES ('2', '17344575564', 'Success', 'ok', '112277', '2019-06-23 11:06:06');
INSERT INTO `message_info` VALUES ('3', '15278337836', 'Success', 'ok', '112344', '2019-06-26 12:55:15');
INSERT INTO `message_info` VALUES ('4', '17344575564', 'Success', 'ok', '112345', '2019-06-26 13:00:26');
INSERT INTO `message_info` VALUES ('5', '15278337836', 'Success', 'ok', '112346', '2019-06-26 13:08:43');
INSERT INTO `message_info` VALUES ('6', '17344575564', 'Success', 'ok', '112365', '2019-06-26 16:22:00');
INSERT INTO `message_info` VALUES ('7', '15278337836', 'Success', 'ok', '112366', '2019-06-26 17:38:44');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT,
  `o_code` varchar(100) DEFAULT NULL,
  `o_createdate` datetime DEFAULT NULL,
  `o_discount_money` double(10,2) DEFAULT NULL,
  `o_money` double(10,2) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `usad_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`o_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `usad_id` (`usad_id`) USING BTREE,
  KEY `o_code` (`o_code`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`usad_id`) REFERENCES `user_adressinfo` (`usad_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('5', '2019053116351318267876833', '2019-05-31 08:35:13', '0.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('8', '2019060115295517278508674', '2019-06-01 07:29:56', '0.00', '38.22', '1', '1');
INSERT INTO `order` VALUES ('9', '2019060115522412265454118', '2019-06-01 07:52:24', '0.00', '38.22', '1', '1');
INSERT INTO `order` VALUES ('10', '2019060116045410031348828', '2019-06-01 08:04:54', '0.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('11', '2019060116123816467664685', '2019-06-01 08:12:38', '0.00', '38.22', '1', '1');
INSERT INTO `order` VALUES ('12', '2019060116333118227103373', '2019-06-01 08:33:32', '0.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('13', '2019060116374217286543023', '2019-06-01 16:37:43', '0.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('14', '2019060210165810332540237', '2019-06-02 10:16:58', '20.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('16', '2019060210392118528865701', '2019-06-02 10:39:22', '20.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('17', '2019060216563318268808572', '2019-06-02 16:56:34', '0.00', '86.22', '1', '1');
INSERT INTO `order` VALUES ('18', '2019060217350614847350582', '2019-06-02 17:35:06', '20.00', '192.00', '1', '1');
INSERT INTO `order` VALUES ('19', '2019062611304313622744358', '2019-06-26 11:30:44', '0.00', '38.22', '1', '2');
INSERT INTO `order` VALUES ('20', '2019062613131812664177005', '2019-06-26 13:13:19', '0.00', '38.22', '1', '2');
INSERT INTO `order` VALUES ('21', '2019062615054910678007742', '2019-06-26 15:05:50', '0.00', '38.22', '1', '2');
INSERT INTO `order` VALUES ('22', '2019062615331514073855063', '2019-06-26 15:33:15', '0.00', '38.22', '1', '2');
INSERT INTO `order` VALUES ('23', '2019062615352217710813632', '2019-06-26 15:35:23', '0.00', '48.00', '1', '2');
INSERT INTO `order` VALUES ('24', '2019062615355116272388418', '2019-06-26 15:35:51', '0.00', '38.22', '1', '2');
INSERT INTO `order` VALUES ('25', '20190626163235121072644750', '2019-06-26 16:32:36', '20.00', '5500.00', '12', '6');
INSERT INTO `order` VALUES ('26', '20190626164326128033458415', '2019-06-26 16:43:27', '0.00', '5500.00', '12', '6');
INSERT INTO `order` VALUES ('27', '20190626164740128707512702', '2019-06-26 16:47:41', '0.00', '5300.00', '12', '6');
INSERT INTO `order` VALUES ('28', '20190626165328120340440254', '2019-06-26 16:53:29', '0.00', '5300.00', '12', '6');
INSERT INTO `order` VALUES ('29', '20190626170147125525822132', '2019-06-26 17:01:47', '0.00', '5500.00', '12', '6');
INSERT INTO `order` VALUES ('30', '20190626174407135221306722', '2019-06-26 17:44:07', '20.00', '4400.00', '13', '7');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oi_id` int(10) NOT NULL AUTO_INCREMENT,
  `propr_id` int(10) DEFAULT NULL,
  `o_code` varchar(100) DEFAULT NULL,
  `oi_num` int(10) DEFAULT NULL,
  `oi_discount_money` double(10,2) DEFAULT NULL,
  `oi_money` double(10,2) DEFAULT NULL,
  `os_id` int(10) DEFAULT NULL,
  `oi_message` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oi_comfirmdate` datetime DEFAULT NULL,
  PRIMARY KEY (`oi_id`) USING BTREE,
  KEY `propr_id` (`propr_id`) USING BTREE,
  KEY `o_id` (`o_code`) USING BTREE,
  KEY `os_id` (`os_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`propr_id`) REFERENCES `pro_property` (`propr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`os_id`) REFERENCES `order_status` (`os_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_4` FOREIGN KEY (`o_code`) REFERENCES `order` (`o_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('3', '1', '2019053116351318267876833', '1', '0.00', '38.22', '5', '测试', null);
INSERT INTO `orderitem` VALUES ('4', '2', '2019053116351318267876833', '1', '0.00', '48.00', '5', null, null);
INSERT INTO `orderitem` VALUES ('7', '1', '2019060115295517278508674', '1', '0.00', '38.22', '5', '尽快发货，谢谢！', null);
INSERT INTO `orderitem` VALUES ('8', '1', '2019060115522412265454118', '1', '0.00', '38.22', '5', '测试2', null);
INSERT INTO `orderitem` VALUES ('9', '1', '2019060116045410031348828', '1', '0.00', '38.22', '5', '测试1', null);
INSERT INTO `orderitem` VALUES ('10', '2', '2019060116045410031348828', '1', '0.00', '48.00', '5', null, null);
INSERT INTO `orderitem` VALUES ('11', '1', '2019060116123816467664685', '1', '0.00', '38.22', '6', '111', null);
INSERT INTO `orderitem` VALUES ('12', '1', '2019060116333118227103373', '1', '0.00', '38.22', '4', '11', null);
INSERT INTO `orderitem` VALUES ('13', '2', '2019060116333118227103373', '1', '0.00', '48.00', '2', '22', null);
INSERT INTO `orderitem` VALUES ('14', '1', '2019060116374217286543023', '1', '0.00', '38.22', '2', '22', null);
INSERT INTO `orderitem` VALUES ('15', '2', '2019060116374217286543023', '1', '0.00', '48.00', '2', '221', null);
INSERT INTO `orderitem` VALUES ('16', '1', '2019060210165810332540237', '1', '8.00', '38.22', '2', null, null);
INSERT INTO `orderitem` VALUES ('17', '2', '2019060210165810332540237', '1', '12.00', '48.00', '2', null, null);
INSERT INTO `orderitem` VALUES ('18', '1', '2019060210392118528865701', '1', '8.00', '38.22', '2', null, null);
INSERT INTO `orderitem` VALUES ('19', '2', '2019060210392118528865701', '1', '12.00', '48.00', '2', null, null);
INSERT INTO `orderitem` VALUES ('20', '1', '2019060216563318268808572', '1', '0.00', '38.22', '2', 'ces', null);
INSERT INTO `orderitem` VALUES ('21', '2', '2019060216563318268808572', '1', '0.00', '48.00', '2', null, null);
INSERT INTO `orderitem` VALUES ('22', '2', '2019060217350614847350582', '4', '20.00', '192.00', '2', null, null);
INSERT INTO `orderitem` VALUES ('23', '1', '2019062611304313622744358', '1', '0.00', '38.22', '5', '测试自动取消订单', null);
INSERT INTO `orderitem` VALUES ('24', '1', '2019062613131812664177005', '1', '0.00', '38.22', '5', '延迟订单测试', null);
INSERT INTO `orderitem` VALUES ('25', '1', '2019062615054910678007742', '1', '0.00', '38.22', '5', '延迟取消订单测试', null);
INSERT INTO `orderitem` VALUES ('26', '1', '2019062615331514073855063', '1', '0.00', '38.22', '5', '测试取消订单', null);
INSERT INTO `orderitem` VALUES ('27', '2', '2019062615352217710813632', '1', '0.00', '48.00', '5', '延迟订单测试', null);
INSERT INTO `orderitem` VALUES ('28', '1', '2019062615355116272388418', '1', '0.00', '38.22', '5', '延迟订单测试', null);
INSERT INTO `orderitem` VALUES ('29', '40', '20190626163235121072644750', '1', '20.00', '5500.00', '1', '测试支付', null);
INSERT INTO `orderitem` VALUES ('30', '40', '20190626164326128033458415', '1', '0.00', '5500.00', '1', '测试', null);
INSERT INTO `orderitem` VALUES ('31', '41', '20190626164740128707512702', '1', '0.00', '5300.00', '1', '测试2', null);
INSERT INTO `orderitem` VALUES ('32', '41', '20190626165328120340440254', '1', '0.00', '5300.00', '1', '测试2', null);
INSERT INTO `orderitem` VALUES ('33', '40', '20190626170147125525822132', '1', '0.00', '5500.00', '6', '测试', null);
INSERT INTO `orderitem` VALUES ('34', '42', '20190626174407135221306722', '1', '20.00', '4400.00', '6', '测试', null);

-- ----------------------------
-- Table structure for `order_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `os_id` int(10) NOT NULL AUTO_INCREMENT,
  `os_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`os_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES ('1', '待付款');
INSERT INTO `order_status` VALUES ('2', '待发货');
INSERT INTO `order_status` VALUES ('3', '待收货');
INSERT INTO `order_status` VALUES ('4', '已收货');
INSERT INTO `order_status` VALUES ('5', '已取消');
INSERT INTO `order_status` VALUES ('6', '已评论');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` int(10) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_introduce` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_subtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proca_id` int(10) DEFAULT NULL,
  `product_store_id` int(10) DEFAULT NULL,
  `pro_createdate` datetime DEFAULT NULL,
  `pro_sell` int(2) DEFAULT NULL,
  `pro_score` int(2) DEFAULT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE,
  KEY `proca_id` (`proca_id`) USING BTREE,
  KEY `pro_store_id` (`product_store_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`proca_id`) REFERENCES `pro_category` (`proca_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_store_id`) REFERENCES `product_store` (`product_store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '2019夏季新款连衣裙', '<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">本商店营业执照：<img src=\"/imgs/introduce/a657466370e0ccacf4045e82344f6177.jpg\" title=\"a657466370e0ccacf4045e82344f6177.jpg\" alt=\"a657466370e0ccacf4045e82344f6177.jpg\" width=\"140\" height=\"179\"/></span></p><p><span style=\"font-family:楷体, 楷体_GB2312, SimKai\">支持支付宝支付：<img src=\"/imgs/introduce/45c58b699573db5936018f6a93cec6ac.jpg\" title=\"45c58b699573db5936018f6a93cec6ac.jpg\" alt=\"45c58b699573db5936018f6a93cec6ac.jpg\" height=\"37\" width=\"110\"/></span></p><p>测试233</p><p><br/></p>', '2019夏新款女装宽松娃娃领荷叶袖淑女中长款裙子女连衣裙', '1', '1', '2019-05-16 15:47:01', '2', '3');
INSERT INTO `product` VALUES ('3', '地素新款时尚金线绣花毛边无袖外套', '<p><img src=\"/imgs/introduce/12ff2cf0adfff3b124935212e3863a59.jpg\" title=\"12ff2cf0adfff3b124935212e3863a59.jpg\" alt=\"12ff2cf0adfff3b124935212e3863a59.jpg\"/></p><p><img src=\"/imgs/introduce/e36fe03ee41f1d20edee138e7968efce.jpg\" title=\"e36fe03ee41f1d20edee138e7968efce.jpg\"/></p><p><img src=\"/imgs/introduce/43b266fa6c120e488c4c4cad9d7f8776.jpg\" title=\"43b266fa6c120e488c4c4cad9d7f8776.jpg\"/></p><p><img src=\"/imgs/introduce/f1ab5763854f3cf18944818c54143c11.jpg\" title=\"f1ab5763854f3cf18944818c54143c11.jpg\"/></p><p><img src=\"/imgs/introduce/66727a80e0b01c77bb10d7c79f20f5ad.jpg\" title=\"66727a80e0b01c77bb10d7c79f20f5ad.jpg\"/></p><p><img src=\"/imgs/introduce/d8638ae89b6cffb89a7da833e3be2f5f.jpg\" title=\"d8638ae89b6cffb89a7da833e3be2f5f.jpg\"/></p><p><br/></p>', '金线绣花 底摆毛边 休闲时髦', '1', '1', '2019-06-25 09:43:24', '2', '5');
INSERT INTO `product` VALUES ('4', 'V领刺绣蝙蝠袖短袖高腰娃娃连衣裙', '<p><img src=\"/imgs/introduce/a8f14a755d605646b7f66817878ca4f7.jpg\" title=\"a8f14a755d605646b7f66817878ca4f7.jpg\"/></p><p><img src=\"/imgs/introduce/b8e44fedce364052ded5907509dd0b3d.jpg\" title=\"b8e44fedce364052ded5907509dd0b3d.jpg\"/></p><p><img src=\"/imgs/introduce/255f33abfccf05992a38df934df6956a.jpg\" title=\"255f33abfccf05992a38df934df6956a.jpg\"/></p><p><img src=\"/imgs/introduce/017ee63409bb1cc1bb96d365a675ec7c.jpg\" title=\"017ee63409bb1cc1bb96d365a675ec7c.jpg\"/></p><p><img src=\"/imgs/introduce/078e0cdfe087aad64ee3a9251588ef3c.jpg\" title=\"078e0cdfe087aad64ee3a9251588ef3c.jpg\"/></p><p><img src=\"/imgs/introduce/9c0745f5025dbff7ac0b7cbc5b148ee1.jpg\" title=\"9c0745f5025dbff7ac0b7cbc5b148ee1.jpg\"/></p><p><br/></p>', '别致刺绣 复古气质 性感优雅', '1', '1', '2019-06-26 11:11:19', '2', '5');
INSERT INTO `product` VALUES ('5', '地素 条纹绣花拼贴收腰连衣裙', '<p><img src=\"/imgs/introduce/8ba386a99d7ed35ddcbb56fef18a801d.jpg\" title=\"8ba386a99d7ed35ddcbb56fef18a801d.jpg\" alt=\"8ba386a99d7ed35ddcbb56fef18a801d.jpg\"/></p><p><img src=\"/imgs/introduce/394f054d648410eb7d625c958c1855a5.jpg\" title=\"394f054d648410eb7d625c958c1855a5.jpg\"/></p><p><img src=\"/imgs/introduce/92f47de74abd69351ad2b7deb7dc12aa.jpg\" title=\"92f47de74abd69351ad2b7deb7dc12aa.jpg\"/></p><p><img src=\"/imgs/introduce/e4e8535bbedabc59b75386963a12c4e1.jpg\" title=\"e4e8535bbedabc59b75386963a12c4e1.jpg\"/></p><p><img src=\"/imgs/introduce/d9183e89d769db06f7d57855d9b9a147.jpg\" title=\"d9183e89d769db06f7d57855d9b9a147.jpg\"/></p><p><img src=\"/imgs/introduce/70d9022bee576026d56012e72d514891.jpg\" title=\"70d9022bee576026d56012e72d514891.jpg\"/></p><p><br/></p>', '别致贴绣纤细条纹包边设计', '1', '1', '2019-06-26 11:15:02', '2', '5');
INSERT INTO `product` VALUES ('6', '地素 睡衣风复古休闲牛仔衬衣', '<p><img src=\"/imgs/introduce/4ee93ad22bd722eba986ec525532aba3.jpg\" title=\"4ee93ad22bd722eba986ec525532aba3.jpg\" alt=\"4ee93ad22bd722eba986ec525532aba3.jpg\"/></p><p><img src=\"/imgs/introduce/c50d6c11c7acea6d384c148cd24fe381.jpg\" title=\"c50d6c11c7acea6d384c148cd24fe381.jpg\"/></p><p><img src=\"/imgs/introduce/e61a272eaeb84a49236d5a4db5f7de05.jpg\" title=\"e61a272eaeb84a49236d5a4db5f7de05.jpg\"/></p><p><img src=\"/imgs/introduce/91f916e44afdd14c777f1ce6157eb28a.jpg\" title=\"91f916e44afdd14c777f1ce6157eb28a.jpg\"/></p><p><img src=\"/imgs/introduce/f42495baefc1af607b1a0b8b0fb6aef6.jpg\" title=\"f42495baefc1af607b1a0b8b0fb6aef6.jpg\"/></p><p><img src=\"/imgs/introduce/5f4cfae604bb41e6221f9e9301ca9c0e.jpg\" title=\"5f4cfae604bb41e6221f9e9301ca9c0e.jpg\"/></p><p><br/></p>', '简单廓形气质翻领舒适面料', '1', '1', '2019-06-26 11:24:37', '2', '5');
INSERT INTO `product` VALUES ('7', '百图镂空刺绣简约百搭女上衣', '<p><img src=\"/imgs/introduce/ee787aa532ccf78a59f753794ab5c0ba.jpg\" title=\"ee787aa532ccf78a59f753794ab5c0ba.jpg\" alt=\"ee787aa532ccf78a59f753794ab5c0ba.jpg\"/></p><p><img src=\"/imgs/introduce/7ca4f38512621aeb9aa5d33fc0d77700.jpg\" title=\"7ca4f38512621aeb9aa5d33fc0d77700.jpg\"/></p><p><img src=\"/imgs/introduce/dfb812ec1e668f355ae440d9710d8b3e.jpg\" title=\"dfb812ec1e668f355ae440d9710d8b3e.jpg\"/></p><p><img src=\"/imgs/introduce/83401582a4115f8665264b72421c7d46.jpg\" title=\"83401582a4115f8665264b72421c7d46.jpg\"/></p><p><img src=\"/imgs/introduce/7c863b0841c6c4d3d28ebbb6e9e0b1dc.jpg\" title=\"7c863b0841c6c4d3d28ebbb6e9e0b1dc.jpg\"/></p><p><img src=\"/imgs/introduce/767e4ba8dfd637261dc7caadbeb8863c.jpg\" title=\"767e4ba8dfd637261dc7caadbeb8863c.jpg\"/></p><p><br/></p>', '前后V领设计 精美仙气刺绣图案', '1', '1', '2019-06-26 11:28:47', '2', '5');
INSERT INTO `product` VALUES ('8', '百图精美印花百搭宽松休闲女上衣', '<p><img src=\"/imgs/introduce/1d9f35154ddee689aafcc61b75e8e6a3.jpg\" title=\"1d9f35154ddee689aafcc61b75e8e6a3.jpg\" alt=\"1d9f35154ddee689aafcc61b75e8e6a3.jpg\"/></p><p><img src=\"/imgs/introduce/cd945b2cf2e252ea475d68d2a21c1be0.jpg\" title=\"cd945b2cf2e252ea475d68d2a21c1be0.jpg\"/></p><p><img src=\"/imgs/introduce/2b09f791b9e3a6c1c14d25348c72f0d0.jpg\" title=\"2b09f791b9e3a6c1c14d25348c72f0d0.jpg\"/></p><p><img src=\"/imgs/introduce/09a66114ac36404c4d9c0c45903e6ebd.jpg\" title=\"09a66114ac36404c4d9c0c45903e6ebd.jpg\"/></p><p><img src=\"/imgs/introduce/8f1d03e5a4d7cf566149f001ffc7da0a.jpg\" title=\"8f1d03e5a4d7cf566149f001ffc7da0a.jpg\"/></p><p><img src=\"/imgs/introduce/e6431843ce4d96842f2bdc3fd342b87c.jpg\" title=\"e6431843ce4d96842f2bdc3fd342b87c.jpg\"/></p><p><br/></p>', '前胸印花图案 宽松舒适的版型', '1', '1', '2019-06-26 11:34:23', '2', '5');
INSERT INTO `product` VALUES ('9', '衣香丽影蕾丝拼接女款衬衫', '<p><img src=\"/imgs/introduce/555d0226002b28b447f28cf56191c9b2.jpg\" title=\"555d0226002b28b447f28cf56191c9b2.jpg\" alt=\"555d0226002b28b447f28cf56191c9b2.jpg\"/></p><p><img src=\"/imgs/introduce/3a905ddf543d5a4ba20a3bbadbb2bd3c.jpg\" title=\"3a905ddf543d5a4ba20a3bbadbb2bd3c.jpg\"/></p><p><img src=\"/imgs/introduce/0ade4133a660a7a85e4af209c47593f6.jpg\" title=\"0ade4133a660a7a85e4af209c47593f6.jpg\"/></p><p><img src=\"/imgs/introduce/6706ff6a6de6a8997730b55a962cd8b4.jpg\" title=\"6706ff6a6de6a8997730b55a962cd8b4.jpg\"/></p><p><img src=\"/imgs/introduce/f7a1ae572e19110a84f56cf88f8668f6.jpg\" title=\"f7a1ae572e19110a84f56cf88f8668f6.jpg\"/></p><p><img src=\"/imgs/introduce/39e4a904d1dc41c27c8f50983b583fae.jpg\" title=\"39e4a904d1dc41c27c8f50983b583fae.jpg\"/></p><p><br/></p>', '衣香丽影', '1', '1', '2019-06-26 11:38:22', '2', '5');
INSERT INTO `product` VALUES ('10', '2019夏季新品撞色拼接无袖印花衬衫领雪纺连衣裙', '<p><img src=\"/imgs/introduce/097ebf0a929858015a527f3c3b565a4f.jpg\" title=\"097ebf0a929858015a527f3c3b565a4f.jpg\" alt=\"097ebf0a929858015a527f3c3b565a4f.jpg\"/></p><p><img src=\"/imgs/introduce/f8cd086108f73be7b710257bfcbd4d18.jpg\" title=\"f8cd086108f73be7b710257bfcbd4d18.jpg\"/></p><p><img src=\"/imgs/introduce/8565d7b9304d47b5f18c1d8b8b23e03b.jpg\" title=\"8565d7b9304d47b5f18c1d8b8b23e03b.jpg\"/></p><p><img src=\"/imgs/introduce/5e652ca5f623f07f5b06736c9de9e15a.jpg\" title=\"5e652ca5f623f07f5b06736c9de9e15a.jpg\"/></p><p><img src=\"/imgs/introduce/89531ad4d877ecb20d3e25a8965f962d.jpg\" title=\"89531ad4d877ecb20d3e25a8965f962d.jpg\"/></p><p><img src=\"/imgs/introduce/360147c19acb6c51e35e17c2bfcbbb31.jpg\" title=\"360147c19acb6c51e35e17c2bfcbbb31.jpg\"/></p><p><br/></p>', 'ELANIERIESE', '1', '1', '2019-06-26 11:41:46', '2', '5');
INSERT INTO `product` VALUES ('11', '夏季新品复古手绘印花飘逸宽松a字裙真丝连衣裙', '<p><img src=\"/imgs/introduce/b4834343682ab7166ad947742164a738.jpg\" title=\"b4834343682ab7166ad947742164a738.jpg\" alt=\"b4834343682ab7166ad947742164a738.jpg\"/></p><p><img src=\"/imgs/introduce/51aa517829cb0b8c748702b726ddc873.jpg\" title=\"51aa517829cb0b8c748702b726ddc873.jpg\"/></p><p><img src=\"/imgs/introduce/cca8b23bfacca4e1ee3b22aa92b9c402.jpg\" title=\"cca8b23bfacca4e1ee3b22aa92b9c402.jpg\"/></p><p><img src=\"/imgs/introduce/c3945cc364f7d2a0a8ebd2d4300ae677.jpg\" title=\"c3945cc364f7d2a0a8ebd2d4300ae677.jpg\"/></p><p><img src=\"/imgs/introduce/da6a9c1fe473a4eb7fd2f8c45ceb68fc.jpg\" title=\"da6a9c1fe473a4eb7fd2f8c45ceb68fc.jpg\"/></p><p><img src=\"/imgs/introduce/3404ed99c267d3482ca517e0bef64411.jpg\" title=\"3404ed99c267d3482ca517e0bef64411.jpg\"/></p><p><br/></p>', '典雅复古手绘植物印花 高腰显瘦', '1', '1', '2019-06-26 11:44:59', '2', '5');
INSERT INTO `product` VALUES ('12', '黑标系列 欧时力春夏装两件套荷叶领钉珠衬衫女宽松', '<p><img src=\"/imgs/introduce/45a2722e37ad3bb36fa1d9c4db8d1d5c.jpg\" title=\"45a2722e37ad3bb36fa1d9c4db8d1d5c.jpg\" alt=\"45a2722e37ad3bb36fa1d9c4db8d1d5c.jpg\"/></p><p><img src=\"/imgs/introduce/867d00e200266fb9f16c77b013dba8fa.jpg\" title=\"867d00e200266fb9f16c77b013dba8fa.jpg\"/></p><p><img src=\"/imgs/introduce/252a7c7e6fb531fe89c232b64c6afd7a.jpg\" title=\"252a7c7e6fb531fe89c232b64c6afd7a.jpg\"/></p><p><img src=\"/imgs/introduce/cef9eeebfa2553543781e76b65b4fd92.jpg\" title=\"cef9eeebfa2553543781e76b65b4fd92.jpg\"/></p><p><img src=\"/imgs/introduce/1a657be2643762b8546dffaa4ae2a2c3.jpg\" title=\"1a657be2643762b8546dffaa4ae2a2c3.jpg\"/></p><p><br/></p>', '气质荷叶立领与钉珠泡泡袖相得益彰，提升甜美浪漫气息', '1', '1', '2019-06-26 11:48:53', '2', '5');
INSERT INTO `product` VALUES ('13', 'iPhone XS Max 双卡双待 256G 全网通', '<p><img src=\"/imgs/introduce/e4174e01d3d1630ec659fb08fa6c3d27.jpg\" title=\"e4174e01d3d1630ec659fb08fa6c3d27.jpg\" alt=\"e4174e01d3d1630ec659fb08fa6c3d27.jpg\"/></p><p><img src=\"/imgs/introduce/e943f5a9616cdd79e912ebdf529cc33b.jpg\" title=\"e943f5a9616cdd79e912ebdf529cc33b.jpg\"/></p><p><img src=\"/imgs/introduce/dda813f9e92ee3c728bbbfa0b18461c9.jpg\" title=\"dda813f9e92ee3c728bbbfa0b18461c9.jpg\"/></p><p><img src=\"/imgs/introduce/b4bcfad7dec502eec5e5e6f4fd17c42a.jpg\" title=\"b4bcfad7dec502eec5e5e6f4fd17c42a.jpg\"/></p><p><img src=\"/imgs/introduce/4d2c02d178f7e43ce073732667888f32.jpg\" title=\"4d2c02d178f7e43ce073732667888f32.jpg\"/></p><p><img src=\"/imgs/introduce/ac53c54a6f485a73c7d20d1999b497a4.jpg\" title=\"ac53c54a6f485a73c7d20d1999b497a4.jpg\"/></p><p><br/></p>', 'iPhone XS Max', '7', '4', '2019-06-26 13:37:57', '2', '5');
INSERT INTO `product` VALUES ('14', '小米9 旗舰拍照手机', '<p><img src=\"/imgs/introduce/db0a18773c4886daff3164f8f980d5e5.jpg\" title=\"db0a18773c4886daff3164f8f980d5e5.jpg\" alt=\"db0a18773c4886daff3164f8f980d5e5.jpg\"/></p><p><img src=\"/imgs/introduce/7781624814facd75c9eef67bf90cebf9.jpg\" title=\"7781624814facd75c9eef67bf90cebf9.jpg\"/></p><p><img src=\"/imgs/introduce/7b2bc647076674674901d4dc3ddd8574.jpg\" title=\"7b2bc647076674674901d4dc3ddd8574.jpg\"/></p><p><img src=\"/imgs/introduce/d15b0e03e14b6e544929c916f7d7d44d.jpg\" title=\"d15b0e03e14b6e544929c916f7d7d44d.jpg\"/></p><p><img src=\"/imgs/introduce/5ea50b0a9bad0520b03870aaa538067b.jpg\" title=\"5ea50b0a9bad0520b03870aaa538067b.jpg\"/></p><p><img src=\"/imgs/introduce/b4d88f6c1e5e35bfd7d3c4645039f8fb.jpg\" title=\"b4d88f6c1e5e35bfd7d3c4645039f8fb.jpg\"/></p><p><br/></p>', '小米9', '7', '4', '2019-06-26 14:04:48', '2', '5');
INSERT INTO `product` VALUES ('15', '新品荣耀20  4800万超广角AI四摄手机', '<p><img src=\"/imgs/introduce/0054fb72f246215851732213c1ab04c4.jpg\" title=\"0054fb72f246215851732213c1ab04c4.jpg\" alt=\"0054fb72f246215851732213c1ab04c4.jpg\"/></p><p><img src=\"/imgs/introduce/0a29551024c6f653252d65bda176af66.jpg\" title=\"0a29551024c6f653252d65bda176af66.jpg\"/></p><p><img src=\"/imgs/introduce/20b7b1ee07b0edc82d7a0ec1ed102511.jpg\" title=\"20b7b1ee07b0edc82d7a0ec1ed102511.jpg\"/></p><p><img src=\"/imgs/introduce/69a9812fbc6be4e09c40ac0749d27c90.jpg\" title=\"69a9812fbc6be4e09c40ac0749d27c90.jpg\"/></p><p><img src=\"/imgs/introduce/934943c68335e13b991e3db9b649eec7.jpg\" title=\"934943c68335e13b991e3db9b649eec7.jpg\"/></p><p><img src=\"/imgs/introduce/67c8c617b71f925fbaeb853c1f996689.jpg\" title=\"67c8c617b71f925fbaeb853c1f996689.jpg\"/></p><p><br/></p>', '4800万超广角AI四摄，麒麟980', '7', '4', '2019-06-26 14:13:20', '2', '5');
INSERT INTO `product` VALUES ('16', 'HUAWEI P30 Pro 全网通 手机', '<p><img src=\"/imgs/introduce/5d7e6fd67112a7a82b598dc50448a4e9.jpg\" title=\"5d7e6fd67112a7a82b598dc50448a4e9.jpg\"/></p><p><img src=\"/imgs/introduce/26a1dcfd6fd5fbc0e96527106ded9a2a.jpg\" title=\"26a1dcfd6fd5fbc0e96527106ded9a2a.jpg\"/></p><p><img src=\"/imgs/introduce/1498178d9583712b4b9de5ac72596cb0.jpg\" title=\"1498178d9583712b4b9de5ac72596cb0.jpg\"/></p><p><img src=\"/imgs/introduce/6d7cba02025dde1e0f69fe6ddb1f6f38.jpg\" title=\"6d7cba02025dde1e0f69fe6ddb1f6f38.jpg\"/></p><p><img src=\"/imgs/introduce/2b88ad6109e35313baffa1c37b23a311.jpg\" title=\"2b88ad6109e35313baffa1c37b23a311.jpg\"/></p><p><img src=\"/imgs/introduce/5bf570c0cca759cbbddcca2c5e99b032.jpg\" title=\"5bf570c0cca759cbbddcca2c5e99b032.jpg\"/></p><p><br/></p>', '6.47英寸OLED曲面屏,麒麟980芯片,后置4000万超感光徕卡四摄,潜望式10倍混合变焦,50倍数码变焦,前置3200万逆光智美自拍,无线充电,双景录影,屏内指纹', '7', '5', '2019-06-26 16:14:46', '2', '5');
INSERT INTO `product` VALUES ('17', 'HUAWEI P30 Pro 全网通', '<p><img src=\"/imgs/introduce/14f07faab499e0aba371bac40da8852a.jpg\" title=\"14f07faab499e0aba371bac40da8852a.jpg\"/></p><p><img src=\"/imgs/introduce/0c1e666e28850a012b0f421f22e626ca.jpg\" title=\"0c1e666e28850a012b0f421f22e626ca.jpg\"/></p><p><img src=\"/imgs/introduce/ce7b612e73930dd663ebd3b98bc4db96.jpg\" title=\"ce7b612e73930dd663ebd3b98bc4db96.jpg\"/></p><p><img src=\"/imgs/introduce/c0a92fd741d58ac64973ca4c62f1bfab.jpg\" title=\"c0a92fd741d58ac64973ca4c62f1bfab.jpg\"/></p><p><img src=\"/imgs/introduce/a74c4eca123ec0fca59cb9313a1523ff.jpg\" title=\"a74c4eca123ec0fca59cb9313a1523ff.jpg\"/></p><p><img src=\"/imgs/introduce/c1fafa5803280a6117d629401682b320.jpg\" title=\"c1fafa5803280a6117d629401682b320.jpg\"/></p><p><br/></p>', '6.47英寸OLED曲面屏,麒麟980芯片,后置4000万超感光徕卡四摄,潜望式10倍混合变焦,50倍数码变焦,前置3200万逆光智美自拍,无线充电,双景录影,屏内指纹', '7', '6', '2019-06-26 17:31:54', '2', '5');

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `proimg_id` int(10) NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) DEFAULT NULL,
  `proimg_link_one` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proimg_link_two` varchar(200) DEFAULT NULL,
  `proimg_link_three` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`proimg_id`) USING BTREE,
  KEY `pro_id` (`pro_id`) USING BTREE,
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('1', '1', 'a1.png', 'a2.png', 'a3.png');
INSERT INTO `product_image` VALUES ('2', '1', 'b1.png', 'b2.png', 'b3.png');
INSERT INTO `product_image` VALUES ('3', '1', 'c1.png', 'c2.png', 'c3.png');
INSERT INTO `product_image` VALUES ('4', '1', 'd1.png', 'd2.png', 'd3.png');
INSERT INTO `product_image` VALUES ('6', '3', 'cc090d14d8d3494cec50e9ba4ae46860.png', '10f0a01915ad624bd2fc08f5b26f0883.png', '583bb9dd69a1c56eda006f00b0debe07.png');
INSERT INTO `product_image` VALUES ('7', '3', 'd05dc827329b29ce68ddb4e3414b37d7.png', 'f31ba6fb946f9aba1328a9d207a65e60.png', '9762cd376b486d436f1614e4c13dd8d5.png');
INSERT INTO `product_image` VALUES ('8', '3', 'aa3289d92e01fdf65e5951c7f134fb28.png', '7e7b721daf0f62082db05195a235b87c.png', 'ce0ea85328e6f2f6f5bf492141bdf437.png');
INSERT INTO `product_image` VALUES ('10', '3', 'a7a1bd2455f4bdc786ebcdb7f7cef225.png', '5c6360d6b46fde569da51cbf3206e21e.png', '722dbbb0957ca493bcabbbca5fdcc717.png');
INSERT INTO `product_image` VALUES ('11', '4', '47ad77be85b6ab045e28673c024eb2a3.png', 'e6e4cc2fedb1c6b98a750ddc2e0069dc.png', 'bbc4ba7dc61f2fb25057d4807239ebd4.png');
INSERT INTO `product_image` VALUES ('12', '4', '1fe46ac2966f70b83b62c649b3cbc97c.png', '31957d0058b6694ca343701cad2a4c92.png', '974ae39c9adb41959a61ce12b6d4f4bc.png');
INSERT INTO `product_image` VALUES ('13', '4', '8cc8080031c4294885a6662edf5a4df0.png', '35735639b0d7e6987ff70a1bb7e94d1c.png', 'd6e441e5ff9d4c390a19f9a7bc789076.png');
INSERT INTO `product_image` VALUES ('14', '4', 'cb095d3a1f9785e7b04b8bc3cc35e34c.png', 'ef1a819331c85030eff0d689ca58b083.png', '871179a35cfcc61612bdd55c18f4e6a9.png');
INSERT INTO `product_image` VALUES ('15', '5', 'ca87431c72fdcbdb4edead85d7218b93.png', '61db2788fb1e306a8aea9260000d858c.png', 'acc1fcbb368f63f7b6b2a8512e3160e9.png');
INSERT INTO `product_image` VALUES ('16', '5', '98c767ef546506f924a56e777e4e28f0.png', '776ba8b63a32a41dc73350559dfcfb5e.png', '9f0a448e1fd9f014b2aaeb52f65ee72a.png');
INSERT INTO `product_image` VALUES ('17', '5', '2d28587b0924145da29366ae25964ca6.png', '8e8710e721b7e2bb437fac6794981a44.png', 'e4c6ef54a25fbc01efa0462323a3186c.png');
INSERT INTO `product_image` VALUES ('18', '5', '2872ee478c84c8947c4b85865d05b7d9.png', '3cec707ce172912de44da98ef4e63336.png', '2713cad402ff6f5c3a3762e6d6e09d65.png');
INSERT INTO `product_image` VALUES ('19', '6', 'fdbc492a98f484168dffb6f0ae911327.png', '6ebea028e09818ce78b26b29e10db460.png', 'bfc96070cca14321aa054784a2d961e7.png');
INSERT INTO `product_image` VALUES ('20', '6', '83c9fe8c7e203989db11b24ed3720a3a.png', '573c6f8d5166d6411af06f5abd3b86fa.png', '2cc26db5ca22f741e960cbe613c889ca.png');
INSERT INTO `product_image` VALUES ('21', '6', 'a0e05f1351dc348d5310b30a7336e5bf.png', '2594ae5b7e215ac073492e765459a4c5.png', 'd02977213f28a210b32fe89e21cbfe66.png');
INSERT INTO `product_image` VALUES ('22', '6', 'd33939cabadf1425ee099c9998408921.png', '644a1433e652ff72cbed0f10887e0a40.png', '2936eadfc6e3dfe7457dcd8747613ea9.png');
INSERT INTO `product_image` VALUES ('23', '7', '338b476df5b46a505a2700ee35e827d3.png', 'd05348eacda1ae7af284ca55df8efc6e.png', '383da4535f9fc3a41b5e0adb07801210.png');
INSERT INTO `product_image` VALUES ('24', '7', '26d82adc31495fc1ff7c6e7bed32252e.png', '0d59c9a578c71d6df4fe1d09a663b5d9.png', '5a6388ee4abc5afe2a75e73ffd1c8a91.png');
INSERT INTO `product_image` VALUES ('25', '7', '7ef43e915742be9171b45703c8bffcc4.png', '62b470ce4191580a80bb2b3d75bca3d2.png', '3605adf640642e6300d2762371f15413.png');
INSERT INTO `product_image` VALUES ('26', '7', '642c7b2293d54a39fa9451862f2e7b8a.png', 'c312f3e599bddc9f853257b9e1b5ed2f.png', '354f474ddc65ee90328e4c6ac22c9b3d.png');
INSERT INTO `product_image` VALUES ('27', '8', 'b989f2a344665f9f6447b7925fa3f00f.png', '385ecc8cf6799322200e94cf1912de08.png', '4faadd22ff80ad9c03dec89fd30e208c.png');
INSERT INTO `product_image` VALUES ('28', '8', '2d305a7055b5919d6cd49a869bf996bd.png', '05cd639a6c94b130a743eed3ed16344a.png', '489dce97399e4f2a9a6b48c0c995400d.png');
INSERT INTO `product_image` VALUES ('29', '8', '0fc7234bda5922577e254adca510965b.png', 'ec335e7ab8d9c944fa2a4be58ed8df2d.png', '6f7fb030b1da019521f2b4506cd714cd.png');
INSERT INTO `product_image` VALUES ('30', '8', 'e8d6f7de8d04cdec1358ce15e7683032.png', '0f99a33fe64b3c1495610fd7d65456a2.png', 'c3bc32e664f3128efb0ff010ece51b43.png');
INSERT INTO `product_image` VALUES ('31', '9', '0091404412287d40a620c554510c19d4.png', 'bc79e6877abec26f08d265a58f555ea5.png', '9e388504247bc691714f9644ee87bf7b.png');
INSERT INTO `product_image` VALUES ('32', '9', '43ff8634e95b42230c52d3abbed290d2.png', '5b1d430b74132063d5eb7c2a2e53c528.png', '18da9fc73917e6fb9593f7d47216054b.png');
INSERT INTO `product_image` VALUES ('33', '9', '69fef588c3b9c85cde8e8e605a331654.png', 'afaf3b818fc32c3d2ab666ff12bdb100.png', '125d9c75a3e75d7479ca946bec2c9f1a.png');
INSERT INTO `product_image` VALUES ('34', '9', '3e70ba89988f8d3488c096dd8f34cd1e.png', 'a557114e143d3f4ad98b89f4ce0f42cd.png', '67312ee6e79f6d11f52230febed045d2.png');
INSERT INTO `product_image` VALUES ('35', '10', 'a9d75bfb880a961d5073088951aea025.png', 'e6aa9de389bb4ff73372ab3a8cc15f82.png', '044596125b9018d7f579662f8df80502.png');
INSERT INTO `product_image` VALUES ('36', '10', '70bad3fbe460c37507dace46dcf2b882.png', 'b4f05d4c63034b943a7270d9b6de5e8d.png', 'a0594608b878ddf839527a8319b54ded.png');
INSERT INTO `product_image` VALUES ('37', '10', 'd84b25f3247e4f6875471ad676968ccf.png', '5c08d04df22a54ac9495971c65473749.png', '5615632ea14c0cf09ac3bd9cda274db0.png');
INSERT INTO `product_image` VALUES ('38', '10', 'ae7e97a70d14c35c2f8c4b7a7f850ade.png', 'fb91e33c4a75d0fb27dd2cbfcd377db5.png', '56b838a4c498e563bc57e3848dd679e7.png');
INSERT INTO `product_image` VALUES ('39', '11', '757f1ae7bd61abf0ac19692867662064.png', 'de1ddda4755332601f42c9dd590b0475.png', 'aec75183025be2282d35df4e881485e9.png');
INSERT INTO `product_image` VALUES ('40', '11', 'd36e2567180acb8c17a64400e77874e6.png', 'bc9b851e66f5d68203c374476ba11a3a.png', '011818a80e385f455a419e1a87a53c5e.png');
INSERT INTO `product_image` VALUES ('41', '11', 'de533a04d6d08299104c0e103b747449.png', '0cd0b4795a0918dc46016a240d2b70c3.png', '8a00a26f3b7e10126d5cc044c1bc5332.png');
INSERT INTO `product_image` VALUES ('42', '11', '33e01a54eb39a5a1ab8c847e994fe04f.png', 'ad7a81678909eca7eaafe7bddbcb5d24.png', '699cb4e066930f5bb789ce0adfd82489.png');
INSERT INTO `product_image` VALUES ('43', '12', '26cd8ab691cd1538417e4c004819235b.png', 'd07c39f8dc2dff037f769516a72d564e.png', 'b6c3e820507511841a160828ac58a2d8.png');
INSERT INTO `product_image` VALUES ('44', '12', 'eab140d3d4f305518465984a442ebb14.png', 'f0386e65bc15813a6a314f7639115592.png', '10569bc100b1e7be6ac4e84cbfc12e5a.png');
INSERT INTO `product_image` VALUES ('45', '12', 'dcc7b8beb99b0f94bc086469e891efd4.png', '2beb02d71d1ed2ee02ce271740ae06bf.png', 'f73a29445e3b92ef4847960808863552.png');
INSERT INTO `product_image` VALUES ('46', '12', 'ca9eb8e94b54e4f259affdd42572f746.png', '34eda95552efe6320143750e9fa5b81a.png', '99336bef6ed78e6e27c615e310ea4d60.png');
INSERT INTO `product_image` VALUES ('47', '13', '45a3b196b6a58294f4dd562e6a324618.png', 'f25b11f3e6ef6667fe22aed045f0903c.png', '278f3d69c666027a9f83c8ad70550acb.png');
INSERT INTO `product_image` VALUES ('48', '13', '4206fd43300614c46a5714afae851fba.png', '489ea06961b3464d65af251d7197270a.png', 'e849e6f46b8e8555b23371a2783d84f4.png');
INSERT INTO `product_image` VALUES ('49', '13', '118280d802a7785dc647bb48ed2175e8.png', 'f36db05aea17c463e960cf8ceb9633c0.png', 'ee4c126d325465df72167a327224d8ad.png');
INSERT INTO `product_image` VALUES ('50', '13', '6ceba503c1d2cfcf88d5e1f4eef7760d.png', '1b6dee0b7c1ad4f8bb2c7499f6f162df.png', '34523692cf2f4e0bd0fc28c98c221e1a.png');
INSERT INTO `product_image` VALUES ('51', '14', '00d62be9cd704e375519998ce94383b6.png', 'ddac4410651480527ae884b6d00aecf7.png', 'f9b9e5fc9b72692ac046bd83ffc72cdb.png');
INSERT INTO `product_image` VALUES ('52', '14', '506e265d93914b5c07c099ce634d6dc0.png', '48ef109f7a61547a271e08e28a629669.png', 'd37941c9f23ddfe71b9f503fe12409fb.png');
INSERT INTO `product_image` VALUES ('53', '14', '7d133ddde3a95b6f082fc23dc55be7f9.png', '345628c45c1179937f13b1a7c5f2a81f.png', '43833080f4f60ca5af5c9091c4650749.png');
INSERT INTO `product_image` VALUES ('54', '14', '169be5a7828958a26bd431f2190f85fe.png', '0a637212035133c7e6ea3ffda9e00335.png', '29663ff8ce31458f72ad42227eddb5e0.png');
INSERT INTO `product_image` VALUES ('55', '15', '52c0071d9f18f68d099eb8b00e063066.png', 'f54350c51d18a7592939704eb87af333.png', '44cfcc6115d4de12469a942edcc554c7.png');
INSERT INTO `product_image` VALUES ('56', '15', 'bdd14cfd68951b8a2a8f1b66ff5f0ff6.png', 'b3b93deed2b4fe795f7662777a6b60a8.png', '528f4fa85a3b2034c57496ca97d6b893.png');
INSERT INTO `product_image` VALUES ('57', '15', '0eb4fd5817ae3881341ea7eef74a20c3.png', '8de91366781af79280517aabcffc68e0.png', '6f518b453ec8c5f4637ce200d6bf6a12.png');
INSERT INTO `product_image` VALUES ('58', '15', '0a471a9dc75bb9beb606f69e74e81bc9.png', 'db2e0d701f9d0f9bdcfda950017b01c5.png', '23378d54e5df1873a2014ac874b86c52.png');
INSERT INTO `product_image` VALUES ('59', '16', 'da581d5a51c63781eebaf14f2a75e4eb.png', 'c938c2d6a7ce55c48b8bb352582f3b6b.png', 'b8fc368d2fd18bb849c8f6c3e46f2680.PNG');
INSERT INTO `product_image` VALUES ('60', '16', '10ecd1d1d3052d2c94017855593d7f9a.png', '63eff64f8f4681128734af0853c2fb0a.png', '0a3edde754d86a21b99c28db84b1d7c7.PNG');
INSERT INTO `product_image` VALUES ('61', '17', 'e6d9506ab9a1b9ae9ac97bc6a070813d.png', 'f823d3303a9f38342adf8cd331d43115.png', 'ace681c441b6f21247afd0beffe603f3.PNG');
INSERT INTO `product_image` VALUES ('62', '17', '62196d50f62150b65639ccb068812cda.png', 'ddebb4eae9d7b58300cf2a63d4f76a42.png', 'ab0fabd8464a028c6364a2602bd055cb.PNG');

-- ----------------------------
-- Table structure for `product_store`
-- ----------------------------
DROP TABLE IF EXISTS `product_store`;
CREATE TABLE `product_store` (
  `product_store_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_store_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_store_pwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_store_bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_store_license` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `product_store_adress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_store_score` int(2) DEFAULT NULL,
  `product_store_examine` int(2) DEFAULT NULL,
  `product_store_call` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`product_store_id`) USING BTREE,
  KEY `area_id` (`area_id`) USING BTREE,
  CONSTRAINT `product_store_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_store
-- ----------------------------
INSERT INTO `product_store` VALUES ('1', '123456', '4165fdd18147f09d91e4813ef8409615', '6666666666666666', 'demo1.jpg', '1', '花旗路666号', '4', '2', '溜溜服装旗舰店');
INSERT INTO `product_store` VALUES ('4', '123456789', '4165fdd18147f09d91e4813ef8409615', '111111111111111111', 'cd58bb0a90cf8fedd967fd5d5e31b859.jpg', '5', '天桥西路86号', '4', '2', '溜溜数码旗舰店');
INSERT INTO `product_store` VALUES ('5', '555555', '4165fdd18147f09d91e4813ef8409615', '555555555555555', 'ac60669b3917d31c9b9751174d5cee44.jpg', '5', '商家测试地址', null, '2', '商家录入测试');
INSERT INTO `product_store` VALUES ('6', '666666', '4165fdd18147f09d91e4813ef8409615', '6666666666666666', '81d0ff667afe71141ac6d2e2eaa25251.jpg', '5', '铁北大道966', null, '2', '华为旗舰店');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '购物抵现');
INSERT INTO `project` VALUES ('2', '注册积分');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `province_id` int(10) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`province_id`),
  KEY `province_id` (`province_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '广西');
INSERT INTO `province` VALUES ('2', '广东');
INSERT INTO `province` VALUES ('3', '北京');
INSERT INTO `province` VALUES ('6', '台湾');
INSERT INTO `province` VALUES ('7', '福建');
INSERT INTO `province` VALUES ('8', '山东');

-- ----------------------------
-- Table structure for `pro_category`
-- ----------------------------
DROP TABLE IF EXISTS `pro_category`;
CREATE TABLE `pro_category` (
  `proca_id` int(10) NOT NULL AUTO_INCREMENT,
  `proca_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`proca_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pro_category
-- ----------------------------
INSERT INTO `pro_category` VALUES ('1', '衣服');
INSERT INTO `pro_category` VALUES ('2', '鞋子');
INSERT INTO `pro_category` VALUES ('3', '数码');
INSERT INTO `pro_category` VALUES ('4', '电器');
INSERT INTO `pro_category` VALUES ('5', '食品');
INSERT INTO `pro_category` VALUES ('6', '电脑');
INSERT INTO `pro_category` VALUES ('7', '手机');

-- ----------------------------
-- Table structure for `pro_property`
-- ----------------------------
DROP TABLE IF EXISTS `pro_property`;
CREATE TABLE `pro_property` (
  `propr_id` int(10) NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) DEFAULT NULL,
  `propr_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `propr_number` int(10) DEFAULT NULL,
  `propr_original_price` double(10,2) DEFAULT NULL,
  `propr_promote_price` double(10,2) DEFAULT NULL,
  `propr_img` varchar(100) DEFAULT NULL,
  `propr_cancel_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`propr_id`) USING BTREE,
  KEY `proca_id` (`pro_id`) USING BTREE,
  CONSTRAINT `pro_property_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pro_property
-- ----------------------------
INSERT INTO `pro_property` VALUES ('1', '1', 'S码', '11', '50.55', '38.22', '7a2a6a64247c9dcd066d2fd7d7f22884.png', '600000');
INSERT INTO `pro_property` VALUES ('2', '1', 'M码', '20', '60.00', '48.00', 'kfafaipfoaofkakfaklfj2f5a4faaf512afwa75.png', '86400000');
INSERT INTO `pro_property` VALUES ('4', '3', 'S', '30', '1499.00', '844.00', '9f07035355d64de67f7200934b65b20f.png', '1800000');
INSERT INTO `pro_property` VALUES ('5', '4', 'S', '100', '1599.00', '808.00', 'a44fe31e4a9e86066a0f2b15e43d0ca4.png', '1800000');
INSERT INTO `pro_property` VALUES ('6', '5', 'S', '100', '1699.00', '850.00', 'f201d9579993acc26651c80a6c968119.png', '1800000');
INSERT INTO `pro_property` VALUES ('7', '6', 'S', '200', '635.00', '318.00', 'b83f654a0995336249f4bc6d03263cdd.png', '1800000');
INSERT INTO `pro_property` VALUES ('8', '7', 'S', '605', '300.00', '145.00', '3117eda51f91f0bc68ed5e2722ccde8b.png', '1800000');
INSERT INTO `pro_property` VALUES ('9', '8', 'S', '655', '340.00', '198.00', 'afe391c62042a531acec5d1655df48a4.png', '1800000');
INSERT INTO `pro_property` VALUES ('10', '9', 'S', '642', '1000.00', '500.00', '49d9919b12c193b2367c918891035786.png', '1800000');
INSERT INTO `pro_property` VALUES ('11', '10', 'S', '356', '682.00', '567.00', '8f731369dc01942d6db674e3233f8c34.png', '1800000');
INSERT INTO `pro_property` VALUES ('12', '11', 'S', '6666', '1500.00', '750.00', '2a335d5fde79c267435ee0200b619578.png', '1800000');
INSERT INTO `pro_property` VALUES ('13', '12', 'S', '700', '645.00', '428.00', '90ba84820529180d3e5c77a04449fe4b.png', '1800000');
INSERT INTO `pro_property` VALUES ('14', '3', 'M', '388', '1499.00', '844.00', 'efbc0289b5c96d6198f20179e263f70d.png', '1800000');
INSERT INTO `pro_property` VALUES ('15', '3', 'L', '632', '1499.00', '844.00', '898086ebee28f297d790c2cf434e7f21.png', '1800000');
INSERT INTO `pro_property` VALUES ('16', '4', 'M', '342', '1599.00', '808.00', 'c3ea2d639150ffe56742b3c33b113f39.png', '1800000');
INSERT INTO `pro_property` VALUES ('17', '4', 'L', '700', '1599.00', '808.00', '5ae1da78ddcbaeec8cb87ec0bede60a2.png', '1800000');
INSERT INTO `pro_property` VALUES ('18', '5', 'M', '354', '1699.00', '850.00', '0cb250215b6e950b84333cb740106e1a.png', '1800000');
INSERT INTO `pro_property` VALUES ('19', '5', 'L', '952', '1699.00', '850.00', '318b6d77d4fde1c0a195f56c66e44561.png', '1800000');
INSERT INTO `pro_property` VALUES ('20', '6', 'M', '675', '635.00', '318.00', 'c38da75d1776482ca8f9eef243d91162.png', '1800000');
INSERT INTO `pro_property` VALUES ('21', '6', 'L', '778', '635.00', '318.00', 'aaa1b4cb2cdda32c7edc855d2c8c1ab6.png', '1800000');
INSERT INTO `pro_property` VALUES ('22', '7', 'M', '6544', '300.00', '145.00', '480b76197ec184973d9f0ab247e22ac6.png', '1800000');
INSERT INTO `pro_property` VALUES ('23', '7', 'L', '653', '300.00', '145.00', '81c9f434a8328bee1d4f413d6f02572a.png', '1800000');
INSERT INTO `pro_property` VALUES ('24', '8', 'M', '6454', '340.00', '198.00', 'b7f22ea04b551f0cf75bae55c25c9ab6.png', '1800000');
INSERT INTO `pro_property` VALUES ('25', '8', 'L', '3456', '340.00', '198.00', 'f879841b624614dd83e9e962674f2e5d.png', '1800000');
INSERT INTO `pro_property` VALUES ('26', '9', 'M', '1111', '1000.00', '500.00', 'c05327b30f3937c45490d2a86187c743.png', '1800000');
INSERT INTO `pro_property` VALUES ('27', '9', 'L', '9999', '1000.00', '500.00', '220c084de464675bde10ac61b3f4e0cc.png', '1800000');
INSERT INTO `pro_property` VALUES ('28', '10', 'M', '9999', '682.00', '567.00', '17c43a2d7ec0ffd901ec2e7b847b1689.png', '1800000');
INSERT INTO `pro_property` VALUES ('29', '10', 'L', '6666', '682.00', '567.00', '733422c68ad2edf6ec8282a402521f74.png', '1800000');
INSERT INTO `pro_property` VALUES ('30', '11', 'M', '987', '1500.00', '750.00', '2e256f5574cbaf250d56d72b92a8c0d6.png', '1800000');
INSERT INTO `pro_property` VALUES ('31', '11', 'L', '689', '1500.00', '750.00', '05ba3379d27fcc17654c7384050a997b.png', '1800000');
INSERT INTO `pro_property` VALUES ('32', '12', 'M', '866', '645.00', '428.00', '7cde86988e342b18463c08f53e44b91d.png', '1800000');
INSERT INTO `pro_property` VALUES ('33', '12', 'L', '654', '648.00', '428.00', '5ffc6d90204038f6d5404853c743eff0.png', '1800000');
INSERT INTO `pro_property` VALUES ('34', '13', '', '999', '10499.00', '8599.00', 'f97a960deb804c8b09fa9d5c93206d82.png', '1800000');
INSERT INTO `pro_property` VALUES ('35', '13', '', '688', '10499.00', '8500.00', '4d0381f7d40d626894daf5e276a21208.png', '1800000');
INSERT INTO `pro_property` VALUES ('36', '14', '蓝色', '8666', '3299.00', '3199.00', 'c5ae793c43ae0a7b66e1b2ba411bccc2.png', '7200000');
INSERT INTO `pro_property` VALUES ('37', '14', '黑色', '655', '3699.00', '3599.00', '60d4de803a94ce7c26112581fddcd7d2.png', '7200000');
INSERT INTO `pro_property` VALUES ('38', '15', '幻影蓝', '999', '2699.00', '2599.00', 'fbcfaca9753bafc62e137a310044447e.png', '7200000');
INSERT INTO `pro_property` VALUES ('39', '15', '暗夜黑', '999', '2699.00', '2599.00', 'd88af32c60e4d4c319676fb2bbf4862c.png', '7200000');
INSERT INTO `pro_property` VALUES ('40', '16', '极光色', '7', '6000.00', '5500.00', 'db715d2417ae0c6fdba4c1a05da56b2f.png', '1800000');
INSERT INTO `pro_property` VALUES ('41', '16', '天空之境', '8', '6000.00', '5300.00', 'ae624804fa69e99f3fdd0757eb3b6d02.png', '1800000');
INSERT INTO `pro_property` VALUES ('42', '17', '天空之境', '9', '5000.00', '4400.00', 'e19aa1b65bad067dc19217ad19cd9b62.png', '1800000');
INSERT INTO `pro_property` VALUES ('43', '17', '极光色', '10', '5000.00', '3600.00', '2b6926f5f3f12513d6023661101e21f3.png', '1800000');

-- ----------------------------
-- Table structure for `rabbit_info`
-- ----------------------------
DROP TABLE IF EXISTS `rabbit_info`;
CREATE TABLE `rabbit_info` (
  `rabbit_info_id` int(10) NOT NULL AUTO_INCREMENT,
  `o_code` varchar(100) DEFAULT NULL,
  `rabbit_info_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rabbit_info_id`),
  KEY `o_code` (`o_code`),
  CONSTRAINT `rabbit_info_ibfk_1` FOREIGN KEY (`o_code`) REFERENCES `order` (`o_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rabbit_info
-- ----------------------------

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `re_id` int(10) NOT NULL AUTO_INCREMENT,
  `re_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `pro_id` int(10) DEFAULT NULL,
  `re_date` datetime DEFAULT NULL,
  `re_logistics` int(2) DEFAULT NULL,
  `re_commodity` int(2) DEFAULT NULL,
  `re_shop` int(2) DEFAULT NULL,
  PRIMARY KEY (`re_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `pro_id` (`pro_id`) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '很不错', '1', '1', '2019-06-19 11:20:31', '3', '4', '4');
INSERT INTO `review` VALUES ('2', '好评呀，质量很不错，用起来也很棒。溜溜商城66666666。', '1', '1', '2019-06-20 15:17:44', '5', '5', '5');
INSERT INTO `review` VALUES ('4', '衣服不错，就是物流太慢了，一般般吧。', '1', '1', '2019-06-24 23:09:57', '3', '5', '5');
INSERT INTO `review` VALUES ('5', '华为 爱国 奈斯', '12', '16', '2019-06-26 17:04:56', '5', '5', '5');
INSERT INTO `review` VALUES ('6', '我爱国 我买华为', '13', '17', '2019-06-26 17:47:12', '5', '5', '5');

-- ----------------------------
-- Table structure for `shopping_cart_info`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_info`;
CREATE TABLE `shopping_cart_info` (
  `sh_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `propr_id` int(10) DEFAULT NULL,
  `sh_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`sh_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `propr_id` (`propr_id`) USING BTREE,
  CONSTRAINT `shopping_cart_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `shopping_cart_info_ibfk_2` FOREIGN KEY (`propr_id`) REFERENCES `pro_property` (`propr_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shopping_cart_info
-- ----------------------------

-- ----------------------------
-- Table structure for `store_type`
-- ----------------------------
DROP TABLE IF EXISTS `store_type`;
CREATE TABLE `store_type` (
  `store_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_store_id` int(10) DEFAULT NULL,
  `proca_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`store_type_id`) USING BTREE,
  KEY `pro_store_id` (`product_store_id`) USING BTREE,
  KEY `proca_id` (`proca_id`) USING BTREE,
  CONSTRAINT `store_type_ibfk_1` FOREIGN KEY (`product_store_id`) REFERENCES `product_store` (`product_store_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `store_type_ibfk_2` FOREIGN KEY (`proca_id`) REFERENCES `pro_category` (`proca_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of store_type
-- ----------------------------
INSERT INTO `store_type` VALUES ('4', '1', '1');
INSERT INTO `store_type` VALUES ('5', '4', '3');
INSERT INTO `store_type` VALUES ('6', '4', '6');
INSERT INTO `store_type` VALUES ('7', '4', '7');
INSERT INTO `store_type` VALUES ('8', '5', '7');
INSERT INTO `store_type` VALUES ('9', '6', '7');

-- ----------------------------
-- Table structure for `system_admin`
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin` (
  `sys_admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `sys_admin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `auth_id` int(10) DEFAULT NULL,
  `sys_admin_pwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sys_admin_call` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sys_admin_id`) USING BTREE,
  KEY `auth_id` (`auth_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES ('1', '163012247', '2', '4165fdd18147f09d91e4813ef8409615', '笨猪');
INSERT INTO `system_admin` VALUES ('2', '163012221', '1', '68cb62ad715a5046fbf62dd209eb4cf1', '李乃超');
INSERT INTO `system_admin` VALUES ('3', '555555', '1', '4165fdd18147f09d91e4813ef8409615', '测试');
INSERT INTO `system_admin` VALUES ('4', '6666666', '1', '4165fdd18147f09d91e4813ef8409615', '溜溜');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_pwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_sex` int(2) DEFAULT NULL,
  `user_phone` bigint(11) DEFAULT NULL,
  `user_integral` int(5) DEFAULT NULL,
  `user_adressinfo_default` int(10) DEFAULT NULL,
  `user_call` varchar(20) DEFAULT NULL,
  `auth_id` int(10) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `auth_id` (`auth_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`auth_id`) REFERENCES `authority` (`auth_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456', 'e3ab1945abf24e1683338f33c2f49e861.jpeg', '4165fdd18147f09d91e4813ef8409615', '1', '17344575564', '2000', null, '购物天堂', '1', '1351095072@qq.com');
INSERT INTO `user` VALUES ('6', null, null, null, null, null, null, null, '验证码', null, null);
INSERT INTO `user` VALUES ('11', '555555', 'default.png', '4165fdd18147f09d91e4813ef8409615', '1', '15278337836', '2000', null, '测试5', '1', null);
INSERT INTO `user` VALUES ('12', '555566', 'default.png', '4165fdd18147f09d91e4813ef8409615', '1', '17344575564', '0', null, '笨猪', '1', '1351095072@qq.com');
INSERT INTO `user` VALUES ('13', '666666', 'default.png', '4165fdd18147f09d91e4813ef8409615', '1', '15278337836', '0', null, '溜溜', '1', '1351095072@qq.com');

-- ----------------------------
-- Table structure for `user_adressinfo`
-- ----------------------------
DROP TABLE IF EXISTS `user_adressinfo`;
CREATE TABLE `user_adressinfo` (
  `usad_id` int(10) NOT NULL AUTO_INCREMENT,
  `usad_phone` bigint(11) DEFAULT NULL,
  `usad_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `usad_adress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `usad_ems` int(10) DEFAULT NULL,
  PRIMARY KEY (`usad_id`) USING BTREE,
  KEY `area_id` (`area_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_adressinfo_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_adressinfo_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_adressinfo
-- ----------------------------
INSERT INTO `user_adressinfo` VALUES ('1', '17344575564', '笨猪', '1', '天桥西路666号', '1', '537000');
INSERT INTO `user_adressinfo` VALUES ('2', '15278337836', '朱子龙', '5', '天桥西路86号', '1', '537600');
INSERT INTO `user_adressinfo` VALUES ('3', '17344575564', '测试', '1', '测试', '1', '537600');
INSERT INTO `user_adressinfo` VALUES ('6', '15278337836', '笨猪', '5', '铁北大道966号', '12', '666666');
INSERT INTO `user_adressinfo` VALUES ('7', '15278337836', '溜溜', '5', '铁北大道966号', '13', '666666');

-- ----------------------------
-- Table structure for `verification`
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification` (
  `vo_id` int(10) NOT NULL AUTO_INCREMENT,
  `vo_verification` varchar(10) DEFAULT NULL,
  `vo_time` datetime DEFAULT NULL,
  `email_power` int(2) DEFAULT NULL,
  `vo_content` varchar(100) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`vo_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `verification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verification
-- ----------------------------
INSERT INTO `verification` VALUES ('3', '2822', '2019-06-21 00:00:00', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('4', '3499', '2019-06-22 00:00:00', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('5', '7126', '2019-06-22 00:00:00', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('6', '9316', '2019-06-22 00:00:00', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('7', '8853', '2019-06-22 10:51:07', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('8', '2176', '2019-06-22 10:51:53', '1', '870414194@qq.com', '1');
INSERT INTO `verification` VALUES ('9', '8178', '2019-06-22 14:55:15', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('10', '9248', '2019-06-22 14:58:52', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('11', '5303', '2019-06-22 14:59:56', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('12', '8902', '2019-06-22 15:02:45', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('13', '9601', '2019-06-22 15:04:56', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('14', '8240', '2019-06-22 15:06:29', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('15', '4399', '2019-06-22 15:40:48', '1', '1351095072@qq.com', '1');
INSERT INTO `verification` VALUES ('19', '1079', '2019-06-26 12:55:14', '2', '15278337836', '6');
INSERT INTO `verification` VALUES ('20', '4685', '2019-06-26 13:00:26', '2', '17344575564', '6');
INSERT INTO `verification` VALUES ('21', '9792', '2019-06-26 13:08:43', '2', '15278337836', '6');
INSERT INTO `verification` VALUES ('22', '7459', '2019-06-26 16:21:59', '2', '17344575564', '6');
INSERT INTO `verification` VALUES ('23', '1144', '2019-06-26 16:23:59', '1', '1351095072@qq.com', '12');
INSERT INTO `verification` VALUES ('24', '8781', '2019-06-26 17:38:43', '2', '15278337836', '6');
INSERT INTO `verification` VALUES ('25', '4044', '2019-06-26 17:40:53', '1', '1351095072@qq.com', '13');
