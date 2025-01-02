CREATE DATABASE l09_39pr31;
go

USE l09_39pr31;
go
------
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);

INSERT INTO Products 
VALUES ('iPhone 6', 'Apple', 2, 36000),
('iPhone 6S', 'Apple', 2, 41000),
('iPhone 7', 'Apple', 5, 52000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000),
('Mi 5X', 'Xiaomi', 2, 26000),
('OnePlus 5', 'OnePlus', 6, 38000)
 
INSERT INTO Customers VALUES ('Tom'), ('Bob'),('Sam')
 
INSERT INTO Orders 
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='Galaxy S8'), 
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2017-07-11',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='Galaxy S8')
),
( 
    (SELECT Id FROM Products WHERE ProductName='iPhone 6S'), 
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2017-07-13',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='iPhone 6S')
),
( 
    (SELECT Id FROM Products WHERE ProductName='iPhone 6S'), 
    (SELECT Id FROM Customers WHERE FirstName='Bob'),
    '2017-07-11',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='iPhone 6S')
);
---
SELECT * FROM Products;
SELECT * FROM Customers
SELECT * FROM Orders
------
--Function --функции
CREATE Function MyHello()
RETURNS NVARCHAR(50)
AS 
BEGIN
	DECLARE @myVAr  NVARCHAR(50) = 'Hello, 39pr31!)';
	RETURN @myVAr;
END
--=---=---=-
PRINT dbo.MyHello();

SELECT *,dbo.MyHello() FROM Customers;
---
CREATE Function CalcNDS(@price MONEY)
RETURNS MONEY
AS
BEGIN
DEclare
@nds MONEY = @price/6;
RETURN @nds;
END;
-----
PRINT dbo.CalcNDS(120);
--
SELECT *,dbo.CalcNDS(Price) FROM Products
---
--ALTER
--DROP


----------=-==-=-=-=-=-=--=
--Табличные переменные
DECLARE @MyTable TABLE (Id int,GroupName NVARCHAR(50));

INSERT @MyTable
VALUES (1, 'Group #1'), 
		(2, 'Group #2'), 
		 (3, 'Group #3');
SELECT * FROM @MyTable

----Производные таблицы 
WITH OrdersInfo
AS
(
SELECT o.Id,o.CreatedAt ,Price,c.FirstName FROM Orders o
LEFT JOIN Customers c ON c.Id=o.CustomerId
)
SELECT * FROM OrdersInfo

--Временная таблица

CREATE TABLE #T1
(
ID INT,
GroupName NVARCHAR(50)
);

INSERT #T1
VALUES (1,'Gr1'),(2,'Gr12'),(3,'Gr13');
SELECT * FROM #T1
--
CREATE TABLE #T2
(
ID INT,
GroupName NVARCHAR(50)
);

--View
CREATE VIEW OrderDetails 
AS
SELECT o.Id,o.CreatedAt,o.Price,c.FirstName 
FRom Orders o
LEFT JOIN Customers c ON c.Id=o.CustomerId
LEFT JOIN Products p ON p.Id=o.ProductId

---
SELECT * FROM OrderDetails

--
CREATE VIEW Kunt
AS	
	SELECT FirstName FROM Customers
--
SELECT * FROM Kunt
-- 
INSERT Kunt (FirstName) VALUES ('test1')
--
UPDATE Kunt SET FirstName = 'TEST@' WHERE FirstName = 'test1'
--
DELETE FROM Kunt WHERE FirstName = 'TEST@'

--Триггеры
CREATE TRIGGER Custumers_INSERT
ON
----
Enable Trigger Products_INSERT ON Products
---
ALTER Table Product
	Add  IsDeleted INT Default 0
	-----
	SELECT * FROM Products
---
UPDATE Products SET IsDeleted = 1 WHERE Id=9
---=--=-==
CREATE VIEW Prods
AS 
SELECT * FROM Products WHERE IsDeleted <> 1

--=-=---=
SELECT * FROM Prods
-- 
CREATE TRIGGER Products_deleted
ON Products
FOR UPDATE
NOT FOR REPLICATION
AS
BEGIN
  INSERT INTO PersonalAccountJournalMeteringDevice
  VAlues
  ();
END;
----==
SELECT * FROM Products
DELETE FROM Products WHERE Id=8
SELECT * FROM Products
SELECT * FROm Prods

