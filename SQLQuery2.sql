USE Orderhistory
GO
ALTER TABLE Hang
DROP CONSTRAINT hangID;
DROP TABLE IF EXISTS Order1
DROP TABLE IF EXISTS Customer1
DROP TABLE IF EXISTS Product1
DROP TABLE IF EXISTS Product1
CREATE TABLE Hang (
     hangID int primary key,
	 name Nvarchar(255),
	 address Nvarchar(255),
	 tel bigint,
)
INSERT INTO Hang(hangID,name,address,tel) VALUES 
              (123,N'ASUS',N'USA',983232)
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
          (1,N'Máy tính T450',N'Máy nhập mới',N'Chiếc',1000,10,N'Còn Hàng'),
		  (2,N'Điện thoại Nokia5670',N'Điện thoại đang hot',N'Chiếc',200,200,N'Còn Hàng'),
		  (3,N'Máy In Samsung 450',N'Máy in đang ế',N'Chiếc',100,10,N'Còn Hàng')

--Hiển thị tất cả các hãng sản xuất
SELECT * FROM Hang
--Hiển thị tất cả sản phẩm
SELECT * FROM Product1
--Liệt kê danh sách hãng theo thứ tự ngược với alphabet của tên
SELECT * FROM Product1
ORDER BY price DESC
--Hiển thị thông tin của hãng ASUS
SELECT * FROM Hang WHERE name='ASUS'
--Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
SELECT * FROM Product1 WHERE qty<11
--Liệt kê danh sách sản phẩm của hãng ASUS
SELECT COUNT(productID)
FROM Product1;
--Số khách hàng đã mua ở cửa hàng
SELECT COUNT(hangID)
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
