use Northwind;
--1-3
--4
SELECT CompanyName
FROM Customers
WHERE CustomerID IN
(
SELECT 
CustomerID--,COUNT(*)
FROm Orders
GROUP BY CustomerID
HAVING COUNT(*) >2 /*=1*/)
-----------^^HW
---
CREATE DATABASE L08_39pr31
go
use L08_39pr31;  --T-SQL-

DECLARE
 @name NVARCHAR(20) = 'Vary',
 @age INT;

SET @age =12;
SET @name = 'Pikoviy valet';

PRINT 'Hello T-SQL'; --white console with text
PRINT 'Name: ' +@name;
PRINT 'Age: ' +CONVERT(CHAR, @age);--or concat
--
SELECT @name,@age
----------
----------
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
SELECT * FROM Customers;
SELECT * FROM Orders;
------
------
DECLARE
	@countOrders INT =0/*,12*/,
	@lastOrderDate DATE;
SELECT @countOrders = count(*),@lastOrderDate=max(CreatedAt) 
--createdAt -> colums from Orders
FROM Orders
if(@countOrders >0)
BEGIN
	PRINT CONCAT('Amount of orders: ', @countOrders );
	PRINT CONCAT('Date of the last Order: ', @lastOrderDate);
END
ELSE
BEGIN
	PRINT 'Niets Orders';
END

/* While условие  {инструкция|Begin...END} */
---7!= 1* 2* 3* 4*

DECLARE
	@f INT = 1,
	@n INT = 7;
WHILE(@n>0)
BEGIN
	SET @f = @f*@n;
	SET @n = @n-1;
END
PRINT CONCAT('7!= ',@f);

--Вывести все четные числа от 1 -35
DECLARE
	@x INT = 1;
While(@x<=35)
BEGIN
if(@x%2=0 AND @x%@x=0)PRINT CONCAT('x= ',@x);

	SET @x = @x+1;
END

--Вывести последовательность ФОББОНАЧИ до 15 елементов 
--1 1 2 3 5 8 13 21 34 56 91
DECLARE
	@w INT = 1,
	@t INT,
	@s INT = 1,
	@d INT = 1;
While(@d<=15)
BEGIN

SET @t = @w+1;
SET @w = @w+@s;
SET @s = @t;
SET @d = @d+1;
print CONCAT('w= ',@w);
END --&?
--can do with 'break' and 'continue'

--
---
DECLARE
 @CONT INT,
 @i INT = 1;
 SELECT @CONT =COUNT(*) FROM Customers;
 WHILE (@i<=@CONT)
 BEGIN
 DECLARE
	@nameiop NVARCHAR(50),
	@countProducts INT,
	@i_p INT =1;
	SELECT @nameiop=FirstName FROM Customers Where Id=@i
	PRINT @nameiop;
	SELECT @countProducts= COUNT(*) FROM Products
	WHILE(@i_p < @countProducts)
	BEGIN
		DECLARE
		@price MONEY , @proname NVARCHAR(50);
		SELECT @price=Price,@proname=ProductName 
		FROM Products 
		WHERE Id =@i_p
		PRINT CONCAT('Tovar: ',@proname,'Price: ',@price)

		INSERT Orders
		(ProductId,CustomerId,ProductCount,Price,CreatedAt)
		VALUES
		(@i_p, @i , 1 , @price,GETDATE() );


	SET @i_p=@i_p+1
	END
	SET @i=@i+1
 END
 ---
 ---


 --Procedure----------------------------
 CREATE PROCEDURE OrderInfo
 AS
 Begin
	SELECT * FROM Orders;
END;
------------------------
EXECUTE OrdrInfo;
----------------------
ALTER PROCEDURE OrderInfo
AS
BEGIN
	SELECT Price,Id FROM Orders;
END;
--DROP--=DELETE--------------------
DROP PROCEDURE OrderInfo;
-------------------------------
CREATE PROCEDURE AddProduct
	@name NVARCHAR(20),
	@manufacturer NVARCHAR(20),
	@count INT,
	@price MONEY
AS
BEGIN
	INSERT Products
	(ProductName,Manufacturer,ProductCount,Price)
	VALUES
	(@name,@manufacturer,@count,@price);
END
--------------------------------
EXEC AddProduct 'Tovar1','M1',100,333
--------------------------------
EXEC AddProduct @price = 444, @manufacturer = 'M2',
@name ='T2',@count=23
--------------------------------
CREATE PROCEDURE GetMaxMinProducts
	@minPrice MONEY OUTPUT,
	@maxPrice MONEY OUTPUT
AS
BEGIN
	SELECT @minPrice = Min(Price),@maxPrice = Max(Price) 
	FROM Products
END
--------------------------------
DECLARE @x INT,@y INT;
EXEC GetMaxMinProducts @x OUTPUT,@y OUTPUT
PRINT @x
PRINT @y

--------------------------------
CREATE PROCEDURE AddProduct2
@name NVARCHAR(20),
	@manufacturer NVARCHAR(20),
	@count INT,
	@price MONEY,
	@id INT OUT
AS
BEGIN
	INSERT Products
	(ProductName,Manufacturer,ProductCount,Price)
	VALUES
	(@name,@manufacturer,@count,@price);
	SET @id =@@IDENTITY;
END
--------------------------------
DECLARE  
	@idd INT;
EXEC AddProduct2 'T3','M3',3,33,@idd OUTPUT
PRINT CONCAT('Id: ',@idd);
--------------------------------
CREATE PROCEDURE AddProduct3
@name NVARCHAR(20),
	@manufacturer NVARCHAR(20),
	@count INT,
	@price MONEY,
	@id INT OUT
AS
BEGIN
DECLARE 
	@res INT =0;
	BEGIN TRY        
	--
			INSERT Products
			(ProductName,Manufacturer,ProductCount,Price)
			VALUES
			(@name,@manufacturer,@count,@price);
			SET @id =@@IDENTITY;
	--
		END TRY
			BEGIN  CATCH
				SET @res =101;

			END CATCH
				RETURN @res;
END
--------------------------------
DECLARE
	@idd INT,
	@ress INT;
	EXEC @ress = AddProduct3 'T4','M4',4,44,@idd OUTPUT
PRINT CONCAT('Id: ',@idd);
PRINT CONCAT('Result: ',@ress);
-------------------------------
-------------------------------