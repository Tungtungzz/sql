CREATE DATABASE AZBank
USE AZBank
GO
CREATE TABLE Customer(
	CustomerID int NOT NULL primary key,
	Name Nvarchar(50),
	City Nvarchar(50),
	Country Nvarchar(50),
	Phone Nvarchar(15),
	Email Nvarchar(50),
)
CREATE TABLE CustomerAccount(
	AccountNumber char(9) NOT NULL primary key,
	CustomerID int NOT NULL,
	Balance money NOT NULL,
	MinAccount money,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
CREATE TABLE CustomerTransaction(
	TransactionID int NOT NULL,
	AccountNumber char(9),
	TransactionDate smalldatetime,
	Amount money,
	DepositorWithdraw bit,
	FOREIGN KEY (AccountNumber) REFERENCES CustomerAccount(AccountNumber),
	CHECK (Amount > 0 AND Amount <= 1000000)
)
INSERT INTO Customer(CustomerID,Name,City,Country,Phone,Email) VALUES
	(100,N'Luu Quang Thanh',N'Hanoi',N'Viet Nam',987654321,N'thanhlq@gmail.com'),
	(101,N'Pham Dang Tung',N'Hanoi',N'Viet Nam',123456789,N'tungpd@gmail.com'),
	(102,N'Chu Tuan Linh',N'Hanoi',N'Viet Nam',888886666,N'linhct@gmail.com')
INSERT INTO CustomerAccount(AccountNumber,CustomerID,Balance,MinAccount) VALUES
	(10,100,1000,0),
	(11,101,10000,0),
	(12,102,100000,0)
INSERT INTO CustomerTransaction(TransactionID,AccountNumber,TransactionDate,Amount,DepositorWithdraw) VALUES
	(1000,10,'2020-01-01',1000,1),
	(1000,11,'2020-01-02',10000,1),
	(1000,12,'2020-01-03',100000,1)
SELECT * FROM Customer WHERE City='Hanoi'

SELECT C.Name, C.Phone, C.Email, CA.AccountNumber, CA.Balance
FROM CustomerAccount CA
JOIN Customer C ON CA.CustomerID = C.CustomerID;

GO
CREATE VIEW vCustomerTransactions AS
SELECT C.Name, CT.AccountNumber, CT.TransactionDate, CT.Amount, CT.DepositorWithdraw
FROM CustomerTransaction CT
JOIN CustomerAccount CA ON CT.AccountNumber = CA.AccountNumber
JOIN Customer C ON CA.CustomerID = C.CustomerID;