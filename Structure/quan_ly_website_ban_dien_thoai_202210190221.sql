﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.338.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 10/26/2022 9:41:51 PM
-- Server version: 8.0.30
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE quan_ly_website_ban_dien_thoai;

--
-- Drop table `productitem`
--
DROP TABLE IF EXISTS productitem;

--
-- Drop table `importbilldetail`
--
DROP TABLE IF EXISTS importbilldetail;

--
-- Drop table `orderdetail`
--
DROP TABLE IF EXISTS orderdetail;

--
-- Drop table `productconfiguration`
--
DROP TABLE IF EXISTS productconfiguration;

--
-- Drop table `product`
--
DROP TABLE IF EXISTS product;

--
-- Drop table `categoryvariation`
--
DROP TABLE IF EXISTS categoryvariation;

--
-- Drop table `variationoption`
--
DROP TABLE IF EXISTS variationoption;

--
-- Drop table `variation`
--
DROP TABLE IF EXISTS variation;

--
-- Drop table `category`
--
DROP TABLE IF EXISTS category;

--
-- Drop table `importbill`
--
DROP TABLE IF EXISTS importbill;

--
-- Drop table `order`
--
DROP TABLE IF EXISTS `order`;

--
-- Drop table `orderstatus`
--
DROP TABLE IF EXISTS orderstatus;

--
-- Drop table `brand`
--
DROP TABLE IF EXISTS brand;

--
-- Drop table `user`
--
DROP TABLE IF EXISTS user;

--
-- Drop table `role`
--
DROP TABLE IF EXISTS role;

--
-- Set default database
--
USE quan_ly_website_ban_dien_thoai;

--
-- Create table `role`
--
CREATE TABLE role (
  RoleID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  RoleName varchar(255) DEFAULT NULL COMMENT 'Tên vai trò',
  PRIMARY KEY (RoleID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng vai trò người dùng';

--
-- Create table `user`
--
CREATE TABLE user (
  UserID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  UserAccount varchar(255) DEFAULT NULL COMMENT 'Tài khoản người dùng',
  Password varchar(255) DEFAULT NULL COMMENT 'Mật khẩu',
  UserName varchar(255) DEFAULT NULL COMMENT 'Tên người dùng',
  Address varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  Email varchar(255) DEFAULT NULL COMMENT 'Email',
  PhoneNumber varchar(20) DEFAULT NULL COMMENT 'Số điện thoại',
  Image text DEFAULT NULL COMMENT 'Hình ảnh avatar',
  RoleID int DEFAULT NULL COMMENT 'Vai trò người dùng (Khóa ngoại)',
  PRIMARY KEY (UserID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng người dùng';

--
-- Create foreign key
--
ALTER TABLE user
ADD CONSTRAINT FK_user_role_RoleID FOREIGN KEY (RoleID)
REFERENCES role (RoleID);

--
-- Create table `brand`
--
CREATE TABLE brand (
  BrandID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  BrandParentID int DEFAULT NULL COMMENT 'Thương hiệu con (Khóa ngoại)',
  BrandName varchar(255) DEFAULT NULL COMMENT 'Tên thương hiệu',
  PRIMARY KEY (BrandID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng thương hiệu';

--
-- Create foreign key
--
ALTER TABLE brand
ADD CONSTRAINT FK_brand_brand_BrandID FOREIGN KEY (BrandParentID)
REFERENCES brand (BrandID);

--
-- Create table `orderstatus`
--
CREATE TABLE orderstatus (
  OrderStatusID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  OrderStatus varchar(255) DEFAULT NULL COMMENT 'Trạng thái đơn đặt',
  PRIMARY KEY (OrderStatusID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng trạng thái đơn đặt';

--
-- Create table `order`
--
CREATE TABLE `order` (
  OrderID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  CustomerID int DEFAULT NULL COMMENT 'Người đặt (Khóa ngoại)',
  EmployeeID int DEFAULT NULL COMMENT 'Nhân viên xác nhận (Khóa ngoại)',
  OrderDate datetime DEFAULT NULL COMMENT 'Thời gian đặt',
  TotalPrice float DEFAULT NULL COMMENT 'Tổng tiền',
  OrderStatusID int DEFAULT NULL COMMENT 'Trạng thái (Khóa ngoại)',
  PRIMARY KEY (OrderID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng đơn đặt hàng (Hóa đơn bán hàng)';

--
-- Create foreign key
--
ALTER TABLE `order`
ADD CONSTRAINT FK_order_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES user (UserID);

--
-- Create foreign key
--
ALTER TABLE `order`
ADD CONSTRAINT FK_order_orderstatus_OrderStatusID FOREIGN KEY (OrderStatusID)
REFERENCES orderstatus (OrderStatusID);

--
-- Create foreign key
--
ALTER TABLE `order`
ADD CONSTRAINT FK_order_user_UserID FOREIGN KEY (CustomerID)
REFERENCES user (UserID);

--
-- Create table `importbill`
--
CREATE TABLE importbill (
  ImportBillID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  SupplierID int DEFAULT NULL COMMENT 'Nhà cung cấp (Khóa ngoại)',
  EmployeeID int DEFAULT NULL COMMENT 'Nhân viên xác nhận (Khóa ngoại)',
  ImportDate datetime DEFAULT NULL COMMENT 'Ngày nhập',
  TotalPrice float DEFAULT NULL COMMENT 'Tổng tiền',
  StatusID int DEFAULT NULL COMMENT 'Trạng thái hóa đơn (Khóa ngoại)',
  PRIMARY KEY (ImportBillID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng hóa đơn nhập hàng';

--
-- Create foreign key
--
ALTER TABLE importbill
ADD CONSTRAINT FK_importbill_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES user (UserID);

--
-- Create foreign key
--
ALTER TABLE importbill
ADD CONSTRAINT FK_importbill_orderstatus_OrderStatusID FOREIGN KEY (StatusID)
REFERENCES orderstatus (OrderStatusID);

--
-- Create foreign key
--
ALTER TABLE importbill
ADD CONSTRAINT FK_importbill_user_UserID FOREIGN KEY (SupplierID)
REFERENCES user (UserID);

--
-- Create table `category`
--
CREATE TABLE category (
  CategoryID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  ProductCategoryName varchar(255) DEFAULT NULL COMMENT 'Tên loại sản phẩm',
  CategoryParentID int DEFAULT NULL COMMENT 'Loại sản phẩm cha (Khóa ngoại)',
  PRIMARY KEY (CategoryID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng loại sản phẩm';

--
-- Create foreign key
--
ALTER TABLE category
ADD CONSTRAINT FK_category_category_CategoryID FOREIGN KEY (CategoryParentID)
REFERENCES category (CategoryID);

--
-- Create table `variation`
--
CREATE TABLE variation (
  VariationID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  ProductCategoryID int DEFAULT NULL COMMENT 'Loại sản phẩm (Khóa ngoại)',
  VariationName varchar(255) DEFAULT NULL COMMENT 'Tên loại đặc trưng',
  PRIMARY KEY (VariationID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng loại đặc trưng';

--
-- Create foreign key
--
ALTER TABLE variation
ADD CONSTRAINT FK_variation_productcategory_ProductCategoryID FOREIGN KEY (ProductCategoryID)
REFERENCES category (CategoryID);

--
-- Create table `variationoption`
--
CREATE TABLE variationoption (
  VariationOptionID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  VariationID int DEFAULT NULL COMMENT 'Loại đặc trưng (Khóa ngoại)',
  Value varchar(255) DEFAULT NULL COMMENT 'Giá trị',
  PRIMARY KEY (VariationOptionID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 2048,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng đặc trưng';

--
-- Create foreign key
--
ALTER TABLE variationoption
ADD CONSTRAINT FK_variationoption_variation_VariationID FOREIGN KEY (VariationID)
REFERENCES variation (VariationID);

--
-- Create table `categoryvariation`
--
CREATE TABLE categoryvariation (
  CategoryVariationID int NOT NULL AUTO_INCREMENT,
  CategoryID int DEFAULT NULL,
  VariationID int DEFAULT NULL,
  PRIMARY KEY (CategoryVariationID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng trung gian giữa bảng loại sản phẩm và loại đặc trưng';

--
-- Create foreign key
--
ALTER TABLE categoryvariation
ADD CONSTRAINT FK_categoryvariation_category_CategoryID FOREIGN KEY (CategoryID)
REFERENCES category (CategoryID);

--
-- Create foreign key
--
ALTER TABLE categoryvariation
ADD CONSTRAINT FK_categoryvariation_variation_VariationID FOREIGN KEY (VariationID)
REFERENCES variation (VariationID);

--
-- Create table `product`
--
CREATE TABLE product (
  ProductID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  ProductParentID int DEFAULT NULL COMMENT 'Sản phẩm cha (Khóa ngoại)',
  ProductCode varchar(255) DEFAULT NULL COMMENT 'Mã sản phẩm',
  ProductName varchar(255) DEFAULT NULL COMMENT 'Tên sản phẩm',
  CategoryID int DEFAULT NULL COMMENT 'Loại sản phẩm (Khóa ngoại)',
  BrandID int DEFAULT NULL COMMENT 'Thương hiệu (Khóa ngoại)',
  Price float DEFAULT NULL COMMENT 'Giá bán',
  ProductDescription text DEFAULT NULL COMMENT 'Mô tả',
  Amount int DEFAULT NULL COMMENT 'Số lượng',
  Image varchar(255) DEFAULT NULL COMMENT 'Hình ảnh',
  PRIMARY KEY (ProductID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng sản phẩm';

--
-- Create foreign key
--
ALTER TABLE product
ADD CONSTRAINT FK_product_brand_BrandID FOREIGN KEY (BrandID)
REFERENCES brand (BrandID);

--
-- Create foreign key
--
ALTER TABLE product
ADD CONSTRAINT FK_product_product_ProductID FOREIGN KEY (ProductParentID)
REFERENCES product (ProductID);

--
-- Create foreign key
--
ALTER TABLE product
ADD CONSTRAINT FK_product_productcategory_ProductCategoryID FOREIGN KEY (CategoryID)
REFERENCES category (CategoryID);

--
-- Create table `productconfiguration`
--
CREATE TABLE productconfiguration (
  ProductConfigurationID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  ProductID int NOT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  VariationOptionID int NOT NULL COMMENT 'Giá trị đặc trưng (Khóa ngoại)',
  PRIMARY KEY (ProductConfigurationID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng trung gian giữa chi tiết sản phẩm và các đặc trưng sản phẩm';

--
-- Create foreign key
--
ALTER TABLE productconfiguration
ADD CONSTRAINT FK_productconfiguration_product_ProductID FOREIGN KEY (ProductID)
REFERENCES product (ProductID);

--
-- Create foreign key
--
ALTER TABLE productconfiguration
ADD CONSTRAINT FK_productconfiguration_variationoption_VariationOptionID FOREIGN KEY (VariationOptionID)
REFERENCES variationoption (VariationOptionID);

--
-- Create table `orderdetail`
--
CREATE TABLE orderdetail (
  OrderDetailID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  OrderID int DEFAULT NULL COMMENT 'Đơn đặt hàng (Khóa ngoại)',
  ProductID int DEFAULT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  Amount int DEFAULT NULL COMMENT 'Số lượng',
  TotalPrice float DEFAULT NULL COMMENT 'Thành tiền',
  PRIMARY KEY (OrderDetailID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết đơn đặt';

--
-- Create index `FK_orderdetail_productitem_ProductItemID` on table `orderdetail`
--
ALTER TABLE orderdetail
ADD INDEX FK_orderdetail_productitem_ProductItemID (ProductID);

--
-- Create foreign key
--
ALTER TABLE orderdetail
ADD CONSTRAINT FK_orderdetail_order_OrderID FOREIGN KEY (OrderID)
REFERENCES `order` (OrderID);

--
-- Create foreign key
--
ALTER TABLE orderdetail
ADD CONSTRAINT FK_orderdetail_product_ProductID FOREIGN KEY (ProductID)
REFERENCES product (ProductID);

--
-- Create table `importbilldetail`
--
CREATE TABLE importbilldetail (
  ImportBillDetailID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  ImportBillID int DEFAULT NULL COMMENT 'Hóa đơn nhập (Khóa ngoại)',
  ProductID int DEFAULT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  Amount int DEFAULT NULL COMMENT 'Số lượng',
  TotalPrice float DEFAULT NULL COMMENT 'Thành tiền',
  PRIMARY KEY (ImportBillDetailID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết hóa đơn nhập';

--
-- Create foreign key
--
ALTER TABLE importbilldetail
ADD CONSTRAINT FK_importbilldetail_importbill_ImportBillID FOREIGN KEY (ImportBillID)
REFERENCES importbill (ImportBillID);

--
-- Create foreign key
--
ALTER TABLE importbilldetail
ADD CONSTRAINT FK_importbilldetail_product_ProductID FOREIGN KEY (ProductID)
REFERENCES product (ProductID);

--
-- Create table `productitem`
--
CREATE TABLE productitem (
  ProductItemID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa ngoại thông tin chi tiết sản phâm',
  ProductID int NOT NULL COMMENT 'Sản phẩm (Khóa ngoại)',
  OrderDetailID int DEFAULT NULL COMMENT 'Chi tiết đơn đặt (Khóa ngoại)',
  ImportBillDetailID int DEFAULT NULL COMMENT 'Chi tiết đơn nhập (Khóa ngoại)',
  SKU varchar(255) DEFAULT NULL COMMENT 'Số định danh xác định cho từng sản phẩm (VD: IMEI)',
  Status bit(1) DEFAULT NULL COMMENT 'Trạng thái (0: Chưa bán, 1: Đã bán)',
  PRIMARY KEY (ProductItemID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chi tiết từng sản phẩm';

--
-- Create foreign key
--
ALTER TABLE productitem
ADD CONSTRAINT FK_productitem_importbilldetail_ImportBillDetailID FOREIGN KEY (ImportBillDetailID)
REFERENCES importbilldetail (ImportBillDetailID);

--
-- Create foreign key
--
ALTER TABLE productitem
ADD CONSTRAINT FK_productitem_orderdetail_OrderDetailID FOREIGN KEY (OrderDetailID)
REFERENCES orderdetail (OrderDetailID);

--
-- Create foreign key
--
ALTER TABLE productitem
ADD CONSTRAINT FK_productitem_product_ProductID FOREIGN KEY (ProductID)
REFERENCES product (ProductID);

-- 
-- Dumping data for table role
--
INSERT INTO role VALUES
(1, 'admin'),
(2, 'employee'),
(3, 'supplier'),
(4, 'customer');

-- 
-- Dumping data for table brand
--
INSERT INTO brand VALUES
(1, NULL, 'Apple'),
(2, NULL, 'Xiaomi'),
(3, NULL, 'Vivo'),
(4, NULL, 'Nokia'),
(5, NULL, 'Samsung');

-- 
-- Dumping data for table user
--
INSERT INTO user VALUES
(1, 'admin', '1', 'Admin', NULL, NULL, '(164) 892-5959', NULL, 1),
(2, 'hoanganh', '1', 'Nguyễn Hoàng Anh', NULL, NULL, '(381) 452-5384', NULL, 2),
(3, 'minhhieu', '1', 'Trương Minh Hiếu', NULL, NULL, '(209) 617-4179', NULL, 4),
(4, 'quanghuy', '1', 'Ngô Quang Huy', NULL, NULL, '(935) 257-1544', NULL, 2),
(5, 'kimdat', '1', 'Nguyễn Kim Đạt', NULL, NULL, '(587) 045-3880', NULL, 3);

-- 
-- Dumping data for table orderstatus
--
INSERT INTO orderstatus VALUES
(1, 'Đang xử lý'),
(2, 'Thành công'),
(3, 'Đã hủy');

-- 
-- Dumping data for table category
--
INSERT INTO category VALUES
(1, 'Điện thoại', NULL),
(2, 'Đồng hồ', NULL),
(3, 'Máy tính bảng', NULL),
(4, 'Laptop', NULL),
(5, 'Phụ kiện', NULL);

-- 
-- Dumping data for table `order`
--
INSERT INTO `order` VALUES
(1, 3, 4, '2022-10-28 20:47:12', 8586540, 1),
(2, 3, 4, '2022-10-28 09:11:55', 4417350, 2),
(3, 3, 4, '2022-10-24 20:21:03', 4160510, 3),
(4, 3, 4, '2022-10-27 04:21:28', 6263150, 3),
(5, 3, 4, '2022-10-24 23:59:03', 7390660, 2);

-- 
-- Dumping data for table product
--
INSERT INTO product VALUES
(1, NULL, 'SP-001', 'Iphone 11', 1, 1, 16168, 'Điện thoại xịn', 7, NULL),
(2, 1, 'SP-001', 'Iphone 11', 1, 1, 15793, 'Điện thoại xịn', 8, NULL),
(3, 1, 'SP-001', 'Iphone 11', 1, 1, 15078, 'Điện thoại xịn', 10, NULL),
(4, 1, 'SP-001', 'Iphone 11', 1, 1, 12299, 'Điện thoại xịn', 9, NULL),
(5, 1, 'SP-001', 'Iphone 11', 1, 1, 14687, 'Điện thoại xịn', 10, NULL),
(6, 1, 'SP-001', 'Iphone 11', 1, 1, 15431, 'Điện thoại xịn', 2, NULL);

-- 
-- Dumping data for table importbill
--
INSERT INTO importbill VALUES
(1, 5, 2, '2022-10-11 14:39:17', 8716620, 2),
(2, 5, 2, '2022-10-10 00:00:07', 7988210, 2),
(3, 5, 2, '2022-10-10 00:00:09', 2799670, 1),
(4, 5, 2, '2022-10-10 00:31:40', 7797600, 2),
(5, 5, 2, '2022-10-10 00:00:01', 2957040, 1);

-- 
-- Dumping data for table variation
--
INSERT INTO variation VALUES
(1, 1, 'Màu sắc'),
(2, 1, 'Ram'),
(3, 1, 'Rom'),
(4, 1, 'CPU'),
(5, 1, 'Bộ nhớ trong');

-- 
-- Dumping data for table orderdetail
--
INSERT INTO orderdetail VALUES
(1, 3, 5, 1, 327706),
(2, 1, 4, 1, 383612),
(3, 4, 2, 1, 306614),
(4, 2, 3, 1, 326221),
(5, 5, 6, 1, 364758);

-- 
-- Dumping data for table importbilldetail
--
INSERT INTO importbilldetail VALUES
(1, 3, 3, 1, 108209),
(2, 1, 2, 1, 171893),
(3, 4, 6, 1, 107682),
(4, 2, 5, 1, 139625),
(5, 5, 4, 1, 125992);

-- 
-- Dumping data for table variationoption
--
INSERT INTO variationoption VALUES
(1, 1, 'Tím'),
(2, 1, 'Xanh'),
(3, 1, 'Đỏ'),
(4, 1, 'Vàng'),
(5, 1, 'Đen');

-- 
-- Dumping data for table productitem
--
INSERT INTO productitem VALUES
(1, 2, 2, 2, '396278564687', False),
(2, 3, 5, 5, '325096550804', False),
(3, 4, 3, 3, '054490367264', False),
(4, 5, 1, 1, '260405004975', False),
(5, 6, 4, 4, '081946205340', False);

-- 
-- Dumping data for table productconfiguration
--
INSERT INTO productconfiguration VALUES
(1, 2, 4),
(2, 4, 2),
(3, 5, 5),
(4, 3, 3),
(5, 6, 1);

-- 
-- Dumping data for table categoryvariation
--
INSERT INTO categoryvariation VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;