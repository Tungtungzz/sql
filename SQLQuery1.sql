USE Orderhistory
GO
ALTER TABLE Customer1
DROP CONSTRAINT customerID;
DROP TABLE IF EXISTS Order1
DROP TABLE IF EXISTS Customer1
DROP TABLE IF EXISTS Product1
DROP TABLE IF EXISTS Product1
CREATE TABLE Customer1 (
     customerID int primary key,
	 name Nvarchar(255),
	 address Nvarchar(255),
	 tel bigint,
     status Nvarchar(255)
)
INSERT INTO Customer1(customerID,name,address,tel,status) VALUES 
              (10,N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội',987654321,N'Level 1')
GO
CREATE TABLE Order1 (
     orderID int primary key,
	 customerID int ,
	 orderDate datetime,
	 status Nvarchar(255)
	 FOREIGN KEY (customerID) REFERENCES Customer1(customerID)
)
INSERT INTO Order1(orderID,customerID,orderDate,status) VALUES
          (123,10,'09/18/11','ON')
GO
CREATE TABLE Product1 (
   productID int primary key,
   name Nvarchar(255),
   description Nvarchar(25),
   unit Nvarchar(25),
   price money,
   qty int,
   status Nvarchar(255)
)
INSERT INTO Product1(productID,name,description,unit,price,qty,status) VALUES
          (1,N'Máy tính T450',N'Máy nhập mới',N'Chiếc',1000,1,N'Còn Hàng'),
		  (2,N'Điện thoại Nokia5670',N'Điện thoại đang hot',N'Chiếc',200,2,N'Còn Hàng'),
		  (3,N'Máy In Samsung 450',N'Máy in đang ế',N'Chiếc',100,1,N'Còn Hàng')
CREATE TABLE OrdersDetails (
     orderID int,
	 productID int,
	 price money,
	 qty int,
	 FOREIGN KEY (orderID) REFERENCES Order1(orderID),
	 FOREIGN KEY (productID) REFERENCES Product1(productID)
)
INSERT INTO OrdersDetails(orderID,productID,price,qty) VALUES
          (123,1,1000,1),
		  (123,2,200,2),
		  (123,3,100,1)
GO
--Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng
SELECT * FROM Customer1
--Liệt kê danh sách sản phẩm của của hàng 
SELECT * FROM Product1
--Liệt kê danh sách các đơn đặt hàng của cửa hàng
SELECT * FROM Order1
--Liệt kê danh sách khách hàng theo thứ thự alphabet.
SELECT * FROM Customer1
ORDER BY name ASC
--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần
SELECT * FROM Product1
ORDER BY price DESC
--Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua.
SELECT * FROM Product1
--Số khách hàng đã mua ở cửa hàng
SELECT COUNT(customerID)
FROM Customer1;
--Số mặt hàng mà cửa hàng bán.
SELECT COUNT(productID)
FROM Product1;
--Tổng tiền của từng đơn hàng.
SELECT sum(price*qty) FROM Product1
--Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0)
ALTER TABLE Productss
ADD CONSTRAINT CHK_PricePositive CHECK (price > 0);
--Viết câu lệnh để thay đổi ngày đặt hàng của khách hàng phải nhỏ hơn ngày hiện tại.
ALTER TABLE Orderss
ADD CONSTRAINT CHK_Datetime CHECK (order_date < GETDATE())
--Viết câu lệnh để thêm trường (ngày xuất hiện) trên thị trường của sản phẩm
ALTER TABLE Product1
ADD releaseDate date
UPDATE Product1
SET releaseDate = '2023-08-12'
WHERE productID = 1;
UPDATE Product1
SET releaseDate = '2023-07-12'
WHERE productID IN (2, 3)
GO
