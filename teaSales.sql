-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tea_sales
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buy_record`
--

DROP TABLE IF EXISTS `buy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buy_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `productId` int(11) DEFAULT NULL COMMENT '产品id',
  `nums` int(11) DEFAULT NULL COMMENT '数量',
  `status` int(11) DEFAULT NULL COMMENT '状态 1已成功 2 待收货 3 待发货 4 正在退款',
  `time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_record`
--

LOCK TABLES `buy_record` WRITE;
/*!40000 ALTER TABLE `buy_record` DISABLE KEYS */;
INSERT INTO `buy_record` VALUES (1,1,1,1,1,'2019-06-10 14:02:10');
/*!40000 ALTER TABLE `buy_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_buy`
--

DROP TABLE IF EXISTS `group_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `productId` int(11) DEFAULT NULL COMMENT '产品ID',
  `count` int(11) DEFAULT NULL COMMENT '购买人数',
  `promotional` int(11) DEFAULT NULL COMMENT '促销价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_buy`
--

LOCK TABLES `group_buy` WRITE;
/*!40000 ALTER TABLE `group_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integral_get_record`
--

DROP TABLE IF EXISTS `integral_get_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `integral_get_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `time` varchar(30) DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  KEY `integralUseUserNameIndex` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integral_get_record`
--

LOCK TABLES `integral_get_record` WRITE;
/*!40000 ALTER TABLE `integral_get_record` DISABLE KEYS */;
INSERT INTO `integral_get_record` VALUES (1,1,1,199,'2019-06-10'),(3,1,0,10,'2019-06-27 12:36:00'),(4,1,0,10,'2019-06-27 12:43:17');
/*!40000 ALTER TABLE `integral_get_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integral_use_record`
--

DROP TABLE IF EXISTS `integral_use_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `integral_use_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户编号',
  `orderId` int(11) DEFAULT NULL COMMENT '订单编号',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `time` varchar(30) DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integral_use_record`
--

LOCK TABLES `integral_use_record` WRITE;
/*!40000 ALTER TABLE `integral_use_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `integral_use_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票编号',
  `type` varchar(20) DEFAULT NULL COMMENT '发票类型',
  `title` varchar(30) DEFAULT NULL COMMENT '发票抬头',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'增值税专用发票','烟台南山学院',1);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户编号',
  `addressId` int(11) DEFAULT NULL COMMENT '用户收货表id',
  `invoiceId` int(11) DEFAULT NULL COMMENT '发票id',
  `voucherId` varchar(50) DEFAULT NULL COMMENT '抵用券id',
  `express` varchar(20) DEFAULT NULL COMMENT '快递',
  `payment` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `isInvoice` int(11) DEFAULT NULL COMMENT '是否开发票 1表示开 0 表示不开',
  `message` varchar(50) DEFAULT NULL COMMENT '订单留言',
  `total` int(11) DEFAULT NULL COMMENT '商品总价',
  `discount` int(11) DEFAULT NULL COMMENT '优惠金额',
  `delivery` int(11) DEFAULT NULL COMMENT '配送费',
  `actualPay` int(11) DEFAULT NULL COMMENT '实付款（积分）',
  `createTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日期',
  `status` int(255) DEFAULT NULL COMMENT '状态 0 待付款1已成功 2 待收货 3 待发货 4 正在退款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,NULL,NULL,'中通快递','微信支付',0,NULL,199,0,0,199,'2019-06-10 14:02:10',1),(2,1,1,0,'0','圆通快递','支付宝',0,'',321,0,0,321,'2019-06-26 20:22:51',0),(3,1,1,0,'0','圆通快递','余额支付',0,'',889,0,0,889,'2019-06-26 20:26:43',0),(4,1,1,1,'0','圆通快递','余额支付',1,'',889,0,0,889,'2019-06-26 20:31:34',0),(5,1,1,0,NULL,'中通快递','余额支付',0,'',889,5,0,894,'2019-06-26 21:25:54',0),(6,1,1,0,'1b1c5e64-291a-41b3-a848-330d6f927168','中通快递','支付宝',0,'',889,5,0,894,'2019-06-26 21:30:12',0),(7,1,1,0,NULL,'圆通快递','余额支付',0,'',889,0,0,889,'2019-06-26 21:41:15',0),(8,1,1,0,'1b1c5e64-291a-41b3-a848-330d6f927168','中通快递','支付宝',0,'',889,5,0,894,'2019-06-26 21:53:26',0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `orderId` int(11) DEFAULT NULL COMMENT '订单编号',
  `productId` int(11) DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品图片',
  `licenseId` varchar(50) DEFAULT NULL COMMENT '生产许可证号',
  `standardId` varchar(20) DEFAULT NULL COMMENT '产品标准号',
  `dateOfProduction` varchar(20) DEFAULT NULL COMMENT '生产日期',
  `qualityTime` varchar(20) DEFAULT NULL COMMENT '保质期',
  `name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `netWeight` int(11) DEFAULT NULL COMMENT '净含量',
  `packaging` varchar(10) DEFAULT NULL COMMENT '包装',
  `brand` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '品牌',
  `foodTech` varchar(30) DEFAULT NULL COMMENT '食品工艺',
  `level` varchar(10) DEFAULT NULL COMMENT '级别',
  `placeOrigin` varchar(30) DEFAULT NULL COMMENT '产地',
  `marketPrice` int(11) DEFAULT NULL COMMENT '市场价格',
  `ourPrice` int(11) DEFAULT NULL COMMENT '本店价格',
  `clickCount` int(11) DEFAULT '0' COMMENT '点击量',
  `commentCount` int(11) DEFAULT '0' COMMENT '评论条数',
  `addTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'tgy.jpg','QS3301 1401 0973','GB/T 18650','2015年4月','三年','铁观音茶叶',250,'罐装','艺福堂','炒青绿茶','三级','中国大陆杭州',299,199,1,NULL,'2019-06-18 08:10:14'),(2,'xhlj.jpg','QS3301 1401 1010','GB/T 18651','2015年4月','三年','西湖龙井茶叶',300,'罐装','同福堂','炒青绿茶','三级','中国大陆杭州',399,299,1,NULL,'2019-06-15 08:08:14'),(3,'slx.jpg','QS3301 1401 2010','GB/T 14651','2015年4月','三年','杉林溪茶叶',200,'袋装','聚福堂','炒青绿茶','三级','中国大陆杭州',399,299,1,NULL,'2019-06-13 08:08:14'),(4,'ddwl01.jpg','QS3301 1401 3010','GB/T 11651','2015年4月','两年','冻顶乌龙茶叶',200,'盒装','聚福堂','炒青绿茶','三级','中国大陆杭州',499,299,1,NULL,'2019-06-18 08:15:14'),(5,'smlj.jpg','QS3301 1401 5010','GB/T 12651','2015年4月','两年','梅府茗家西湖龙井茶叶',200,'盒装','全福堂','炒青绿茶','三级','中国大陆杭州',599,299,1,NULL,'2019-06-15 08:08:14'),(6,'bdysh01.jpg','QS3301 1401 5010','GB/T 12651','2017年4月','十年','北鼎养生壶',500,'盒装','全福堂','喝茶工具','二级','中国大陆山东',399,299,1,NULL,'2019-06-14 08:08:14'),(7,'xxysh01.jpg','QS3301 1401 5011','GB/T 12657','2017年3月','八年','小熊养生壶',400,'盒装','全福堂','喝茶工具','二级','中国大陆山东',299,150,1,NULL,'2019-06-18 08:08:14'),(8,'blc.jpg','QS3201 1401 5011','GB/T 19657','2015年3月','两年','碧螺春',300,'盒装','全福堂','茶叶','二级','中国大陆云南',399,278,NULL,NULL,'2019-06-13 08:08:14'),(9,'prsc01.jpg','QS3201 1401 5031','GB/T 19557','2014年3月','两年','普洱生茶',600,'盒装','全福堂','茶叶','二级','中国大陆云南',399,268,1,NULL,'2019-06-12 08:08:14'),(10,'twgsc01.jpg','QS3201 1401 5036','GB/T 19587','2014年3月','两年','台湾高山茶',600,'盒装','全福堂','茶叶','二级','中国大陆云南',699,368,1,NULL,'2019-06-15 08:08:14'),(11,'tycjtz01.jpg','QS3201 1401 3036','GB/T 19487','2014年3月','两年','天屿茶具套装',600,'盒装','供福堂','喝茶工具','二级','中国大陆云南',658,328,1,NULL,'2019-06-16 08:08:14'),(12,'cxycjtz01.jpg','QS3201 1401 3036','GB/T 19487','2014年3月','四年','茶相缘茶具套装',600,'盒装','全福堂','喝茶工具','二级','中国大陆山东',1290,889,1,NULL,'2019-06-13 08:08:14'),(13,'jdch01.jpg','QS3201 1401 3036','GB/T 19487','2014年3月','三年','经典茶壶',300,'盒装','全福堂','喝茶工具','二级','中国大陆山东',598,321,1,NULL,'2019-06-18 08:08:14'),(14,'hfcjdz01.jpg','QS3201 1401 3036','GB/T 19487','2014年3月','五年','豪峰茶具底座',100,'盒装','全福堂','喝茶工具','二级','中国大陆山东',120,89,1,NULL,'2019-06-18 08:08:16');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detailed`
--

DROP TABLE IF EXISTS `product_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_detailed` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `productId` int(11) DEFAULT NULL COMMENT '产品编号',
  `bigImg` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '大图',
  `smallImg` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小图',
  `detailedImg` varchar(20) DEFAULT NULL COMMENT '细节图',
  `keyword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关键字',
  `remain` int(11) NOT NULL COMMENT '剩余库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detailed`
--

LOCK TABLES `product_detailed` WRITE;
/*!40000 ALTER TABLE `product_detailed` DISABLE KEYS */;
INSERT INTO `product_detailed` VALUES (1,8,'bblc01.jpg;bblc02.jpg;bblc03.jpg;bblc04.jpg','sblc01.jpg;sblc02.jpg;sblc03.jpg;sblc04.jpg','blc01.jpg','乐品乐茶碧螺春绿茶2019新茶特级茶叶散装明前苏州春茶嫩芽',5000),(2,4,'bddwl01.jpg;bddwl02.jpg;bddwl03.jpg;bddwl04.jpg','sddwl01.jpg;sddwl02.jpg;sddwl03.jpg;sddwl04.jpg','ddwl01.jpg','冻顶乌龙茶 正宗清香型茶叶 天仁系列台茶',3000),(3,5,'bmjlj01.jpg;bmjlj02.jpg;bmjlj03.jpg;bmjlj04.jpg','smjlj01.jpg;smjlj02.jpg;smjlj03.jpg;smjlj04.jpg','mjlj01.jpg','盛茗世家明前西湖龙井茶叶礼盒装 龙井茶2019新茶 绿茶 春茶',5000),(4,3,'bslx01.jpg;bslx02.jpg;bslx03.jpg;bslx04.jpg','sslx01.jpg;sslx02.jpg;sslx03.jpg;sslx04.jpg','slx01.jpg','名池茶业杉林溪清香型乌龙茶原装进口台湾高山茶罐装茶叶',2000),(5,1,'btgy01.jpg;btgy02.jpg;btgy03.jpg;btgy04.jpg','stgy01.jpg;stgy02.jpg;stgy03.jpg;stgy04.jpg','tgy01.jpg','安溪铁观音2019新茶春茶乌龙茶铁观音茶叶 浓香型礼盒装',7000),(6,2,'bxhlj01.jpg;bxhlj02.jpg;bxhlj03.jpg;bxhlj04.jpg','sxhlj01.jpg;sxhlj02.jpg;sxhlj03.jpg;sxhlj04.jpg','xhlj01.jpg','2019新茶上市西湖牌龙井茶叶正宗雨前西湖龙井茶春茶绿茶散装',3000),(7,6,'bbdysh01.jpg;bbdysh02.jpg;bbdysh03.jpg;bbdysh04.jpg','sbdysh01.jpg;sbdysh02.jpg;sbdysh03.jpg;sbdysh04.jpg','bdysh01.jpg','Buydeem/北鼎K102家用养生壶全自动加厚玻璃多功能煮花茶壶养身壶',4000),(8,7,'bxxysh01.jpg;bxxysh02.jpg;bxxysh03.jpg;bxxysh04.jpg','sxxysh01.jpg;sxxysh02.jpg;sxxysh03.jpg;sxxysh04.jpg','xxysh01.jpg','小熊养生壶全自动玻璃一体多功能电热花茶壶家用煮茶器办公室小型',6000),(9,9,'bprsc01.jpg;bprsc02.jpg;bprsc03.jpg;bprsc04.jpg','sprsc01.jpg;sprsc02.jpg;sprsc03.jpg;sprsc04.jpg','prsc01.jpg','2019春茶 乾裕昌冰岛古树茶叶坝歪普洱茶生茶云南七子饼357g包邮',5000),(10,10,'btwgsc01.jpg;btwgsc02.jpg;btwgsc03.jpg;btwgsc04.jpg','stwgsc01.jpg;stwgsc02.jpg;stwgsc03.jpg;stwgsc04.jpg','twgsc01.jpg','吉圃园台湾茶叶阿里山高山茶软枝乌龙茶金萱茶150g袋装清香型',4000),(11,11,'btycjtz01.jpg;btycjtz02.jpg;btycjtz03.jpg;btycjtz04.jpg','stycjtz01.jpg;stycjtz02.jpg;stycjtz03.jpg;stycjtz04.jpg','tycjtz01.jpg','茶具套装黑檀实木茶盘陶瓷紫砂整套功夫茶杯套装全自动快速炉家用',3000),(12,12,'bcxycjtz01.jpg;bcxycjtz02.jpg;bcxycjtz03.jpg;bcxycjtz04.jpg','scxycjtz01.jpg;scxycjtz02.jpg;scxycjtz03.jpg;scxycjtz04.jpg','cxycjtz01.jpg','整块乌金石茶盘泡茶功夫茶具套装家用雾化流水茶台茶海全自动茶道',5000),(13,13,'bjdch01.jpg;bjdch02.jpg;bjdch03.jpg;bjdch04.jpg','sjdch01.jpg;sjdch02.jpg;sjdch03.jpg;sjdch04.jpg','jdch01.jpg','经典 汝窑快客杯一壶一杯 简易办公汝道茶具个人旅行陶瓷便携套装',7000),(14,14,'bhfcjdz01.jpg;bhfcjdz02.jpg;bhfcjdz03.jpg;bhfcjdz04.jpg','shfcjdz01.jpg;shfcjdz02.jpg;shfcjdz03.jpg;shfcjdz04.jpg','hfcjdz01.jpg','豪峰实木茶盘家用功夫茶具茶台茶海排水简约储水式中小号单盘托盘',8000);
/*!40000 ALTER TABLE `product_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_promotion`
--

DROP TABLE IF EXISTS `product_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `productId` int(11) DEFAULT NULL COMMENT '产品编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_promotion`
--

LOCK TABLES `product_promotion` WRITE;
/*!40000 ALTER TABLE `product_promotion` DISABLE KEYS */;
INSERT INTO `product_promotion` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `product_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan_record`
--

DROP TABLE IF EXISTS `scan_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scan_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户编号',
  `productId` int(11) DEFAULT NULL COMMENT '产品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan_record`
--

LOCK TABLES `scan_record` WRITE;
/*!40000 ALTER TABLE `scan_record` DISABLE KEYS */;
INSERT INTO `scan_record` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,9),(6,1,11),(7,1,13),(8,1,14);
/*!40000 ALTER TABLE `scan_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping`
--

DROP TABLE IF EXISTS `shopping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping` (
  `shoppingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`shoppingId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping`
--

LOCK TABLES `shopping` WRITE;
/*!40000 ALTER TABLE `shopping` DISABLE KEYS */;
INSERT INTO `shopping` VALUES (1,1);
/*!40000 ALTER TABLE `shopping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_product`
--

DROP TABLE IF EXISTS `shopping_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shoppingId` int(11) DEFAULT NULL COMMENT '购物车编号',
  `productId` int(11) DEFAULT NULL COMMENT '商品编号',
  `productTotal` int(11) DEFAULT NULL COMMENT '商品个数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_product`
--

LOCK TABLES `shopping_product` WRITE;
/*!40000 ALTER TABLE `shopping_product` DISABLE KEYS */;
INSERT INTO `shopping_product` VALUES (11,1,12,1);
/*!40000 ALTER TABLE `shopping_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `headImg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱地址',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `lastVisit` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上一次访问时间',
  `balance` int(11) unsigned DEFAULT '0' COMMENT '账户余额',
  `userlevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '普通会员' COMMENT '用户等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'yudiancheng.png','yudiancheng','于佃成','男','17852054373','lolcdkey@163.com','zxc123','2019-07-04 10:04:59',0,'白银会员');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `receiverName` varchar(10) DEFAULT NULL COMMENT '收货人姓名',
  `location` varchar(50) DEFAULT NULL COMMENT '大体定位地址',
  `detailedAddress` varchar(50) DEFAULT NULL COMMENT '详细地址',
  `postalCode` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (1,1,'于佃成','山东省烟台市','朝阳区幸福花园15号楼701','370681','17852054373');
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collect`
--

DROP TABLE IF EXISTS `user_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `productId` int(11) DEFAULT NULL COMMENT '产品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collect`
--

LOCK TABLES `user_collect` WRITE;
/*!40000 ALTER TABLE `user_collect` DISABLE KEYS */;
INSERT INTO `user_collect` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14);
/*!40000 ALTER TABLE `user_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `productId` int(11) DEFAULT NULL COMMENT ' 产品编号',
  `content` varchar(50) DEFAULT NULL COMMENT '评论内容',
  `support` int(11) DEFAULT NULL COMMENT '评论赞个数',
  `level` int(11) DEFAULT NULL COMMENT '评论星级 1 非常不满意 2 不满意 3 一般 4 满意 5 非常满意',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment`
--

LOCK TABLES `user_comment` WRITE;
/*!40000 ALTER TABLE `user_comment` DISABLE KEYS */;
INSERT INTO `user_comment` VALUES (5,1,13,'真好',1,2),(6,1,13,'大阿达',1,5),(7,1,14,'阿大大 大大大',1,4),(8,1,14,'打打分',1,3),(9,1,14,'哒哒哒阿达',1,4),(10,1,14,'大大',1,2),(11,1,14,'大大',1,3),(12,1,14,'啊啊大大奥大奥付',1,2),(13,1,14,'哒哒哒阿达啊大',1,5),(15,1,1,'大 大啊阿达  ',1,5),(16,1,1,'hao',1,4);
/*!40000 ALTER TABLE `user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `level` varchar(20) DEFAULT NULL COMMENT '等级描述',
  `low` int(11) DEFAULT NULL COMMENT '等级区间下限',
  `high` int(11) DEFAULT NULL COMMENT '等级区间上限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (1,'普通会员',0,100),(2,'白银会员',101,500),(3,'黄金会员',501,2000),(4,'铂金会员',2001,4000),(5,'钻石会员',4001,2147483647);
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_voucher`
--

DROP TABLE IF EXISTS `user_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户编号',
  `voucherId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '红包编号',
  `total` int(255) DEFAULT '1' COMMENT '持有数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_voucher`
--

LOCK TABLES `user_voucher` WRITE;
/*!40000 ALTER TABLE `user_voucher` DISABLE KEYS */;
INSERT INTO `user_voucher` VALUES (2,1,'1b1c5e64-291a-41b3-a848-330d6f927168',0);
/*!40000 ALTER TABLE `user_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `voucher` (
  `id` varchar(50) NOT NULL COMMENT '抵用券编号',
  `amount` double DEFAULT NULL COMMENT '抵用券金额',
  `limit` double(255,0) DEFAULT '0' COMMENT '抵用券门槛',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES ('1b1c5e64-291a-41b3-a848-330d6f927168',5,0),('4414cb08-fd54-4a9e-828f-446534d9e2cb',15,10),('8f9a81d7-20d7-4a86-8364-3a05e060cc9e',10,0),('f774cbdd-eec2-479c-bd87-778b182e1184',20,15);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_use_record`
--

DROP TABLE IF EXISTS `voucher_use_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `voucher_use_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `voucherId` varchar(50) DEFAULT NULL COMMENT '优惠券编号',
  `useTime` varchar(20) DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_use_record`
--

LOCK TABLES `voucher_use_record` WRITE;
/*!40000 ALTER TABLE `voucher_use_record` DISABLE KEYS */;
INSERT INTO `voucher_use_record` VALUES (1,1,'1b1c5e64-291a-41b3-a848-330d6f927168','2019-06-23 16:36:10');
/*!40000 ALTER TABLE `voucher_use_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 12:59:24
