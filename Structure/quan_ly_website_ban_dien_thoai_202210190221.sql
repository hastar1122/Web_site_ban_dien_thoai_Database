CREATE DATABASE  IF NOT EXISTS `quan_ly_website_ban_dien_thoai` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quan_ly_website_ban_dien_thoai`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: quan_ly_website_ban_dien_thoai
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute` (
  `AttributeID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `ProductID` int DEFAULT NULL COMMENT 'Sản phẩm (khóa ngoại)',
  `AttributeName` varchar(255) DEFAULT NULL COMMENT 'Tên loại đặc trưng',
  PRIMARY KEY (`AttributeID`),
  KEY `FK_variation_product_ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=2340 COMMENT='Bảng thuộc tính';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,NULL,'Màu sắc'),(2,NULL,'Ram'),(3,NULL,'Rom'),(4,NULL,'CPU'),(5,NULL,'Bộ nhớ trong'),(10,NULL,'Màn hình'),(11,NULL,'Hệ điều hành');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BrandID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `BrandParentID` int DEFAULT NULL COMMENT 'Thương hiệu con (Khóa ngoại)',
  `BrandName` varchar(255) DEFAULT NULL COMMENT 'Tên thương hiệu',
  PRIMARY KEY (`BrandID`),
  KEY `FK_brand_brand_BrandID` (`BrandParentID`),
  CONSTRAINT `FK_brand_brand_BrandID` FOREIGN KEY (`BrandParentID`) REFERENCES `brand` (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng thương hiệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,NULL,'Apple'),(2,NULL,'Xiaomi'),(3,NULL,'Vivo'),(4,NULL,'Nokia'),(5,NULL,'Samsung');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `ProductCategoryName` varchar(255) DEFAULT NULL COMMENT 'Tên loại sản phẩm',
  `CategoryParentID` int DEFAULT NULL COMMENT 'Loại sản phẩm cha (Khóa ngoại)',
  PRIMARY KEY (`CategoryID`),
  KEY `FK_category_category_CategoryID` (`CategoryParentID`),
  CONSTRAINT `FK_category_category_CategoryID` FOREIGN KEY (`CategoryParentID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng loại sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Điện thoại',NULL),(2,'Đồng hồ',NULL),(3,'Máy tính bảng',NULL),(4,'Laptop',NULL),(5,'Phụ kiện',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryattribute`
--

DROP TABLE IF EXISTS `categoryattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoryattribute` (
  `CategoryVariationID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int DEFAULT NULL,
  `AttributeID` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryVariationID`),
  KEY `FK_categoryvariation_category_CategoryID` (`CategoryID`),
  KEY `FK_categoryvariation_variation_VariationID` (`AttributeID`),
  CONSTRAINT `FK_categoryvariation_category_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `FK_categoryvariation_variation_VariationID` FOREIGN KEY (`AttributeID`) REFERENCES `attribute` (`AttributeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=2340 COMMENT='Bảng trung gian giữa bảng loại sản phẩm và thuộc tính';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryattribute`
--

LOCK TABLES `categoryattribute` WRITE;
/*!40000 ALTER TABLE `categoryattribute` DISABLE KEYS */;
INSERT INTO `categoryattribute` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,10,NULL,NULL),(7,1,11,NULL,NULL);
/*!40000 ALTER TABLE `categoryattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importbill`
--

DROP TABLE IF EXISTS `importbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importbill` (
  `ImportBillID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `ImportBillCode` varchar(255) DEFAULT NULL COMMENT 'Mã đơn nhập',
  `SupplierID` int DEFAULT NULL COMMENT 'Nhà cung cấp (Khóa ngoại)',
  `EmployeeID` int DEFAULT NULL COMMENT 'Nhân viên xác nhận (Khóa ngoại)',
  `ImportDate` datetime DEFAULT NULL COMMENT 'Ngày nhập',
  `TotalPrice` float DEFAULT NULL COMMENT 'Tổng tiền',
  PRIMARY KEY (`ImportBillID`),
  KEY `FK_importbill_EmployeeID` (`EmployeeID`),
  KEY `FK_importbill_user_UserID` (`SupplierID`),
  CONSTRAINT `FK_importbill_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `FK_importbill_user_UserID` FOREIGN KEY (`SupplierID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng hóa đơn nhập hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importbill`
--

LOCK TABLES `importbill` WRITE;
/*!40000 ALTER TABLE `importbill` DISABLE KEYS */;
INSERT INTO `importbill` VALUES (1,NULL,5,2,'2022-10-11 14:39:17',8716620),(2,NULL,5,2,'2022-10-10 00:00:07',7988210),(3,NULL,5,2,'2022-10-10 00:00:09',2799670),(4,NULL,5,2,'2022-10-10 00:31:40',7797600),(5,NULL,5,2,'2022-10-10 00:00:01',2957040);
/*!40000 ALTER TABLE `importbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importbilldetail`
--

DROP TABLE IF EXISTS `importbilldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importbilldetail` (
  `ImportBillDetailID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `ImportBillID` int DEFAULT NULL COMMENT 'Hóa đơn nhập (Khóa ngoại)',
  `ProductID` int DEFAULT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  `Price` float DEFAULT NULL COMMENT 'Đơn giá nhập',
  `Amount` int DEFAULT NULL COMMENT 'Số lượng',
  `TotalPrice` float DEFAULT NULL COMMENT 'Thành tiền',
  PRIMARY KEY (`ImportBillDetailID`),
  KEY `FK_importbilldetail_importbill_ImportBillID` (`ImportBillID`),
  KEY `FK_importbilldetail_product_ProductID` (`ProductID`),
  CONSTRAINT `FK_importbilldetail_importbill_ImportBillID` FOREIGN KEY (`ImportBillID`) REFERENCES `importbill` (`ImportBillID`),
  CONSTRAINT `FK_importbilldetail_product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng chi tiết hóa đơn nhập';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importbilldetail`
--

LOCK TABLES `importbilldetail` WRITE;
/*!40000 ALTER TABLE `importbilldetail` DISABLE KEYS */;
INSERT INTO `importbilldetail` VALUES (1,3,3,NULL,1,108209),(2,1,2,NULL,1,171893),(3,4,6,NULL,1,107682),(4,2,5,NULL,1,139625),(5,5,4,NULL,1,125992);
/*!40000 ALTER TABLE `importbilldetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `OrderCode` varchar(255) DEFAULT NULL COMMENT 'Mã đơn hàng',
  `CustomerID` int DEFAULT NULL COMMENT 'Người đặt (Khóa ngoại)',
  `EmployeeID` int DEFAULT NULL COMMENT 'Nhân viên xác nhận (Khóa ngoại)',
  `OrderDate` datetime DEFAULT NULL COMMENT 'Thời gian đặt',
  `TotalPrice` float DEFAULT NULL COMMENT 'Tổng tiền',
  `OrderStatusID` int DEFAULT NULL COMMENT 'Trạng thái (Khóa ngoại)',
  `Address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ giao hàng',
  PRIMARY KEY (`OrderID`),
  KEY `FK_order_EmployeeID` (`EmployeeID`),
  KEY `FK_order_orderstatus_OrderStatusID` (`OrderStatusID`),
  KEY `FK_order_user_UserID` (`CustomerID`),
  CONSTRAINT `FK_order_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `FK_order_orderstatus_OrderStatusID` FOREIGN KEY (`OrderStatusID`) REFERENCES `orderstatus` (`OrderStatusID`),
  CONSTRAINT `FK_order_user_UserID` FOREIGN KEY (`CustomerID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng đơn đặt hàng (Hóa đơn bán hàng)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,NULL,3,4,'2022-10-28 20:47:12',8586540,3),(2,NULL,3,4,'2022-10-28 09:11:55',4417350,2),(3,NULL,3,4,'2022-10-24 20:21:03',4160510,3),(4,NULL,3,4,'2022-10-27 04:21:28',6263150,3),(5,NULL,3,4,'2022-10-24 23:59:03',7390660,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `OrderID` int DEFAULT NULL COMMENT 'Đơn đặt hàng (Khóa ngoại)',
  `ProductID` int DEFAULT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  `Price` float DEFAULT NULL COMMENT 'Đơn giá bán',
  `Amount` int DEFAULT NULL COMMENT 'Số lượng',
  `TotalPrice` float DEFAULT NULL COMMENT 'Thành tiền',
  PRIMARY KEY (`OrderDetailID`),
  KEY `FK_orderdetail_productitem_ProductItemID` (`ProductID`),
  KEY `FK_orderdetail_order_OrderID` (`OrderID`),
  CONSTRAINT `FK_orderdetail_order_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `FK_orderdetail_product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng chi tiết đơn đặt';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,3,5,NULL,1,327706),(2,1,4,NULL,1,383612),(3,4,2,NULL,1,306614),(4,2,3,NULL,1,326221),(5,5,6,NULL,1,364758);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `OrderStatusID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `OrderStatus` varchar(255) DEFAULT NULL COMMENT 'Trạng thái đơn đặt',
  PRIMARY KEY (`OrderStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=5461 COMMENT='Bảng trạng thái đơn đặt';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'Đang xử lý'),(2,'Thành công'),(3,'Đã hủy');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `ProductParentID` int DEFAULT NULL COMMENT 'Sản phẩm cha (Khóa ngoại)',
  `ProductCode` varchar(255) DEFAULT NULL COMMENT 'Mã sản phẩm',
  `ProductName` varchar(255) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `Type` int DEFAULT NULL COMMENT 'Loại (1: sản phẩm thông thường, 2: sản phẩm có nhiều phân loại)',
  `CategoryID` int DEFAULT NULL COMMENT 'Phân loại sản phẩm (Khóa ngoại)',
  `BrandID` int DEFAULT NULL COMMENT 'Thương hiệu (Khóa ngoại)',
  `Price` float DEFAULT NULL COMMENT 'Giá bán',
  `OutwardPrice` float DEFAULT NULL COMMENT 'Giá nhập',
  `ProductDescription` text COMMENT 'Mô tả',
  `Amount` int DEFAULT NULL COMMENT 'Số lượng',
  `Image` varchar(255) DEFAULT NULL COMMENT 'Hình ảnh',
  `Active` varchar(5) DEFAULT NULL COMMENT 'Trạng thái',
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_product_brand_BrandID` (`BrandID`),
  KEY `FK_product_product_ProductID` (`ProductParentID`),
  KEY `FK_product_productcategory_ProductCategoryID` (`CategoryID`),
  CONSTRAINT `FK_product_brand_BrandID` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`),
  CONSTRAINT `FK_product_product_ProductID` FOREIGN KEY (`ProductParentID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FK_product_productcategory_ProductCategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=2340 COMMENT='Bảng sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'SP-001','Iphone 11',1,1,1,16168,NULL,'Điện thoại xịn',7,'imgParentProduct1667882515-.png',NULL,NULL,NULL),(2,1,'SP-001','Iphone 11',NULL,1,1,15793,NULL,'Điện thoại xịn',8,'imgProduct1668337312-.png',NULL,NULL,NULL),(3,1,'SP-001','Iphone 11',NULL,1,1,15078,NULL,'Điện thoại xịn',10,'imgParentProduct1667882515-.png',NULL,NULL,NULL),(4,1,'SP-001','Iphone 11',NULL,1,1,12299,NULL,'Điện thoại xịn',9,'imgProduct1668337312-.png',NULL,NULL,NULL),(5,1,'SP-001','Iphone 11',NULL,1,1,14687,NULL,'Điện thoại xịn',10,'imgParentProduct1667882515-.png',NULL,NULL,NULL),(6,1,'SP-001','Iphone 11',NULL,1,1,15431,NULL,'Điện thoại xịn',2,'imgProduct1668337312-.png',NULL,NULL,NULL),(17,NULL,'SP-0002','Iphone 12',1,1,1,9000000,7000000,'<h3>Đẳng cấp thiết kế dẫn đầu xu thế</h3>\r\n\r\n<p>Được ho&agrave;n thiện với những vật liệu cao cấp khi mặt lưng l&agrave;m từ k&iacute;nh c&ugrave;ng bộ khung nh&ocirc;m chắc chắn, điều n&agrave;y l&agrave;m cho chiếc m&aacute;y của bạn trở n&ecirc;n sang trọng v&agrave; đẳng cấp hơn.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/289663/iphone-14-256gb-080922-035406.jpg\" onclick=\"return false;\"><img alt=\"Thiết kế cao cấp - iPhone 14 256GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/289663/iphone-14-256gb-080922-035406.jpg\" /></a></p>\r\n\r\n<p>Với kiểu d&aacute;ng thiết kế phẳng nhờ thừa hưởng vẻ đẹp đến từ c&aacute;c thế hệ trước, v&igrave; thế&nbsp;<a href=\"https://www.thegioididong.com/dtdd-apple-iphone-14-series\" target=\"_blank\">iPhone 14</a>&nbsp;vẫn giữ cho m&igrave;nh một n&eacute;t đẹp rất hợp xu hướng v&agrave; dẫn đầu xu thế.</p>',12,'imgProduct1668337312-.png','on','2022-11-13 08:41:12','2022-11-13 11:02:15'),(18,NULL,'SP_1000','Allp',1,1,2,1000000,10000,'<p>&ocirc;</p>',2,'imgProduct1668337312-.png','on','2022-11-13 16:34:08','2022-11-13 16:34:08'),(19,NULL,'SP_10003','2',1,1,1,3333330,3,'<p>2</p>',22,'imgParentProduct1667882688-.png','on','2022-11-13 16:34:41','2022-11-13 16:34:41');

INSERT INTO product (ProductID, ProductParentID, ProductCode, ProductName, Type, CategoryID, BrandID, Price, OutwardPrice, ProductDescription, Amount, Image, Active, CreatedDate, ModifiedDate) VALUES
(20, 2, 'SP-003', 'Đòng hồ 05', 1, 2, 1, 16168, NULL, 'Đồng hồ xịn', 7, 'ho1.png', NULL, NULL, NULL),
(21, 2, 'SP-004', 'Đồng hồ 06', NULL, 2, 1, 15793, NULL, 'Đồng hồ xịn', 8, 'ho2.png', NULL, NULL, NULL),
(22, 3, 'SP-005', 'Chuột', NULL, 5, 2, 15078, NULL, 'Chuột xịn', 10, 'phukien1.png', NULL, NULL, NULL),
(23, 3, 'SP-006', 'Ốp', NULL, 5, 2, 12299, NULL, 'Ốp xịn', 9, 'phukien2.png', NULL, NULL, NULL),
(24, 4, 'SP-007', 'Máy tính bảng 16in', NULL, 3, 3, 14687, NULL, 'Máy tính bảng xịn', 10, 'maytinhbang1.png', NULL, NULL, NULL),
(25, 4, 'SP-008', 'Máy tính bảng 22in', NULL, 3, 3, 15431, NULL, 'Máy tính bản xịn', 2, 'maytinhbang2.png', NULL, NULL, NULL),
(26, 5, 'SP-009', 'laptop dell', 1, 4, 4, 9000000, 7000000, '<h3>Đẳng cấp thiết kế dẫn đầu xu thế</h3>\r\n\r\n<p>Được ho&agrave;n thiện với những vật liệu cao cấp khi mặt lưng l&agrave;m từ k&iacute;nh c&ugrave;ng bộ khung nh&ocirc;m chắc chắn, điều n&agrave;y l&agrave;m cho chiếc m&aacute;y của bạn trở n&ecirc;n sang trọng v&agrave; đẳng cấp hơn.</p>\r\n\r\n<p><a href="https://cdn.tgdd.vn/Products/Images/42/289663/iphone-14-256gb-080922-035406.jpg" onclick="return false;"><img alt="Thiết kế cao cấp - iPhone 14 256GB" src="https://cdn.tgdd.vn/Products/Images/42/289663/iphone-14-256gb-080922-035406.jpg" /></a></p>\r\n\r\n<p>Với kiểu d&aacute;ng thiết kế phẳng nhờ thừa hưởng vẻ đẹp đến từ c&aacute;c thế hệ trước, v&igrave; thế&nbsp;<a href="https://www.thegioididong.com/dtdd-apple-iphone-14-series" target="_blank">iPhone 14</a>&nbsp;vẫn giữ cho m&igrave;nh một n&eacute;t đẹp rất hợp xu hướng v&agrave; dẫn đầu xu thế.</p>', 12, 'lap1.png', 'on', '2022-11-13 08:41:12', '2022-11-13 11:02:15'),
(28, 5, 'SP_010', 'laptop macboook', 1, 4, 4, 1000000, 10000, '<p>Đẳng cấp</p>', 2, 'lap2.png', 'on', '2022-11-13 16:34:08', '2022-11-13 16:34:08');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productattribute`
--

DROP TABLE IF EXISTS `productattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productattribute` (
  `ProductAttributeID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `ProductID` int DEFAULT NULL,
  `AttributeID` int DEFAULT NULL COMMENT 'Loại đặc trưng (Khóa ngoại)',
  `Value` varchar(255) DEFAULT NULL COMMENT 'Giá trị',
  PRIMARY KEY (`ProductAttributeID`),
  KEY `FK_productvariation_product_ProductID` (`ProductID`),
  KEY `FK_variationoption_variation_VariationID` (`AttributeID`),
  CONSTRAINT `FK_productvariation_product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FK_variationoption_variation_VariationID` FOREIGN KEY (`AttributeID`) REFERENCES `attribute` (`AttributeID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=2340 COMMENT='Bảng trung gian giữa bản sản phẩm và thuộc tính';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattribute`
--

LOCK TABLES `productattribute` WRITE;
/*!40000 ALTER TABLE `productattribute` DISABLE KEYS */;
INSERT INTO `productattribute` VALUES (52,17,1,'Đỏ'),(53,17,2,NULL),(54,17,3,NULL),(55,17,4,NULL),(56,17,5,NULL),(57,17,10,NULL),(58,17,11,NULL),(59,18,1,NULL),(60,18,2,NULL),(61,18,3,NULL),(62,18,4,NULL),(63,18,5,NULL),(64,18,10,NULL),(65,18,11,NULL),(66,19,1,NULL),(67,19,2,NULL),(68,19,3,NULL),(69,19,4,NULL),(70,19,5,NULL),(71,19,10,NULL),(72,19,11,NULL);
/*!40000 ALTER TABLE `productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productitem`
--

DROP TABLE IF EXISTS `productitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productitem` (
  `ProductItemID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa ngoại thông tin chi tiết sản phâm',
  `ProductID` int NOT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  `OrderDetailID` int DEFAULT NULL COMMENT 'Chi tiết đơn đặt (Khóa ngoại)',
  `ImportBillDetailID` int DEFAULT NULL COMMENT 'Chi tiết đơn nhập (Khóa ngoại)',
  `SKU` varchar(255) DEFAULT NULL COMMENT 'Số định danh xác định cho từng sản phẩm (VD: IMEI)',
  `Status` bit(1) DEFAULT NULL COMMENT 'Trạng thái (0: Chưa bán, 1: Đã bán)',
  PRIMARY KEY (`ProductItemID`),
  KEY `FK_productitem_importbilldetail_ImportBillDetailID` (`ImportBillDetailID`),
  KEY `FK_productitem_orderdetail_OrderDetailID` (`OrderDetailID`),
  KEY `FK_productitem_product_ProductID` (`ProductID`),
  CONSTRAINT `FK_productitem_importbilldetail_ImportBillDetailID` FOREIGN KEY (`ImportBillDetailID`) REFERENCES `importbilldetail` (`ImportBillDetailID`),
  CONSTRAINT `FK_productitem_orderdetail_OrderDetailID` FOREIGN KEY (`OrderDetailID`) REFERENCES `orderdetail` (`OrderDetailID`),
  CONSTRAINT `FK_productitem_product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Bảng chi tiết từng sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productitem`
--

LOCK TABLES `productitem` WRITE;
/*!40000 ALTER TABLE `productitem` DISABLE KEYS */;
INSERT INTO `productitem` VALUES (1,2,2,2,'396278564687',_binary '\0'),(2,3,5,5,'325096550804',_binary '\0'),(3,4,3,3,'054490367264',_binary '\0'),(4,5,1,1,'260405004975',_binary '\0'),(5,6,4,4,'081946205340',_binary '\0');
/*!40000 ALTER TABLE `productitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `RoleName` varchar(255) DEFAULT NULL COMMENT 'Tên vai trò',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=4096 COMMENT='Bảng vai trò người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'employee'),(3,'supplier'),(4,'customer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `UserAccount` varchar(255) DEFAULT NULL COMMENT 'Tài khoản người dùng',
  `Password` varchar(255) DEFAULT NULL COMMENT 'Mật khẩu',
  `UserName` varchar(255) DEFAULT NULL COMMENT 'Tên người dùng',
  `Address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  `Email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `PhoneNumber` varchar(20) DEFAULT NULL COMMENT 'Số điện thoại',
  `Image` text COMMENT 'Hình ảnh avatar',
  `RoleID` int DEFAULT NULL COMMENT 'Vai trò người dùng (Khóa ngoại)',
  PRIMARY KEY (`UserID`),
  KEY `FK_user_role_RoleID` (`RoleID`),
  CONSTRAINT `FK_user_role_RoleID` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=2730 COMMENT='Bảng người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'hoanganh','1','Nguyễn Hoàng Anh',NULL,NULL,'(381) 452-5384',NULL,2),(3,'minhhieu','1','Trương Minh Hiếu',NULL,NULL,'(209) 617-4179',NULL,4),(4,'quanghuy','1','Ngô Quang Huy',NULL,NULL,'(935) 257-1544',NULL,2),(5,'kimdat','1','Nguyễn Kim Đạt',NULL,NULL,'(587) 045-3880',NULL,3),(6,'admin','$2y$10$SbqJ65tsAuo4xF3r66lhZOB3/NUjY1B5sw9zjd213JSn.zgmQ5qKO','Admin','12','Admin','123','avt.png',1),(7,'hastar','$2y$10$quPCdHN/okAFEidQ4T9eOeioy/6WO9TQBLuZid4Tx9xgJrdxcGH2C','Nguyễn Hoàng Anh',NULL,NULL,NULL,'avt.png',4),(8,'nguoidung8','$2y$10$Jc1S88u7IN7hKigA8xO91uyaOk8TvhnSNHx3GKFPI42V1B4Y5qxLW','nguoidung8',NULL,NULL,NULL,'avt.png',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quan_ly_website_ban_dien_thoai'
--

--
-- Dumping routines for database 'quan_ly_website_ban_dien_thoai'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14 17:51:02
