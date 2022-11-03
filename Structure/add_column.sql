ALTER TABLE `order` ADD COLUMN OrderCode varchar(255) DEFAULT NULL COMMENT 'Mã hóa đơn' AFTER OrderID;
ALTER TABLE orderdetail ADD COLUMN Price float DEFAULT NULL COMMENT 'Giá bán' AFTER ProductID;
ALTER TABLE importbill ADD COLUMN ImportBillCode varchar(255) DEFAULT NULL COMMENT 'Mã hóa đơn nhập' AFTER ImportBillID;
ALTER TABLE importbilldetail ADD COLUMN Price float DEFAULT NULL COMMENT 'Giá nhập' AFTER ProductID;