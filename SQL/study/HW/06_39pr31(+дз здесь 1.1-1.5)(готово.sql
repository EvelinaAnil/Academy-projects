CREATE DATABASE l06_39pr31;
go
use l06_39pr31;
---
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
go
---
INSERT INTO Products
VALUES
('iPhone 6', 'Apple', 3, 36000),
('iPhone 6S', 'Apple', 2, 41000),
('iPhone 7', 'Apple', 5, 52000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000),
('Mi6', 'Xiaomi', 5, 28000),
('OnePlus 5', 'OnePlus', 6, 38000)
go
----
SELECT * FROM Products
---����������

---���������� �������
/*
AVG	:������� ������� ��������
SUM	:������� ����� ��������
MIN	:������� ���������� ��������
MAX	:������� ���������� ��������
COUNT:������� ���-�� ����� � �������
��� ���������� ����� �� ����������� COUNT(*) ����� �������� NULL
*/
SELECT
AVG(Price) AS Average_Price,
SUM(Price) AS SUM_Price,
MIN(Price) AS MIN_Price,
MAX(Price) AS MAX_Price,
COUNT(*) AS COUNT_Price,
COUNT(Price) AS Count_Price
FROM Products
---
SELECT
AVG(Price*ProductCount) AS Average_Price,
SUM(Price) AS SUM_Price,
MIN(Price) AS MIN_Price,
MAX(Price) AS MAX_Price,
COUNT(*) AS COUNT_Price,
COUNT(Price) AS Count_Price
FROM Products
WHERE Manufacturer = 'Apple'
----
SELECT * FROM Products
--
SELECT COUNT(ProductCount) FROM Products
SELECT COUNT(ALL ProductCount) FROM Products --��� ALL -> �� ���������
SELECT COUNT(DISTINCT ProductCount) FROM Products
--
SELECT DISTINCT Manufacturer FROM Products --DISTINCT ->�������� �� ������������
--
SELECT DISTINCT Manufacturer,ProductCount FROM Products
--
SELECT DISTINCT Manufacturer FROM Products


--��������� GROUP BY 
--++ ���-�� � ����������
SELECT  Manufacturer FROM Products
GROUP BY Manufacturer --> ���������� ������ ��� ��������
--
SELECT  Manufacturer FROM Products
GROUP BY Manufacturer,ProductCount -->��� �������� � 200 rows
--
SELECT  
Manufacturer,ProductCount,
COUNT(*) AS ProdCount,
SUM(ProductCount) as SUMPRoCOUNT
FROM Products
GROUP BY Manufacturer,ProductCount
-------

SELECT
Manufacturer,
COUNT(*) as COUNT_RECORDS,SUM(ProductCount) as SUM_ProductCount
FROM Products
WHERE ProductCount >=2
GROUP BY Manufacturer
--HAVING SUM(ProductCount)>5
ORDER BY 1

---
SELECT
Manufacturer, ProductCount,
COUNT(*) as COUNT_RECORDS,SUM(ProductCount) as SUM_ProductCount
FROM Products
WHERE ProductCount >=2
GROUP BY ROLLUP (Manufacturer,ProductCount) --ROLLUP ->����� ������� �������
--
SELECT
Manufacturer, ProductCount,
COUNT(*) as COUNT_RECORDS,SUM(ProductCount) as SUM_ProductCount
FROM Products
WHERE ProductCount >=2
GROUP BY Manufacturer,ProductCount WITH CUBE --WITH CUBE �� ����. ������. ������ �����

-------------
--����������� ������� � MSSQL 
--
--STRING
SELECT 1,100,500
--
--SELECT 123
SELECT LEN('Apple') ---5
SELECT LTRIM(' Apple') --������� ������� �����
SELECT TRIM(' Apple ') --������� ������� ����� � ������
SELECT RTRIM(' Apple  ') --������� ������� 
SELECT CHARINDEX('pl',' Apple  ')
SELECT PATINDEX('%p_e%',' Apple  ')
SELECT LEFT('Apple',3)
SELECT RIGHT('Apple',3)
SELECT SUBSTRING('Apple',8,2)  
SELECT REPLACE('Apple','edwfqqfweqefw','qwfeewfq') --������
SELECT REVERSE('Apple') -- ���������
SELECT LOWER('Apple')--���� ������
SELECT UPPER('Apple')--���� �������
SELECT 'Apple'+'edwfqqfweqefw'+'qwfeewfq' --���������� �����
SELECT 'Apple'+'edwfqqfweqefw'+'qwfeewfq' +100 --� ������ �������� �����
SELECT 'Apple'+null+'qwfeewfq'  --������ ���� (NULL)
SELECT CONCAT('Apple','edwfqqfweqefw','qwfeewfq',100) --����� ����������
SELECT CONCAT('Apple','edwfqqfweqefw','qwfeewfq',100,null)--����� � null
SELECT CONCAT('Apple','edwfqqfweqefw',/*'          '*/ SPACE(10),100)
SELECT CONCAT( Manufacturer , Price ,'___',100) FROM Products

SELECT UPPER(LEFT(Manufacturer,2))  as Abbrevature,
CONCAT( ProductName , ' - ' , Manufacturer) As FullProdName
FROM Products
-----------
--������� �� ������ � ������ � ��������
SELECT GETDATE()
SELECT GETUTCDATE()
SELECT SYSDATETIME()
SELECT SYSDATETIMEOFFSET()
SELECT DAY(GETDATE()),MONTH(GETDATE()),YEAR(GETDATE())
SELECT DATENAME(mm,GETDATE())
/**/
SELECT DATEPART(MONTH,GETDATE()) --zie month
SELECT DATEADD(MONTH,2,GETDATE()) -- + 2 month
SELECT DATEDIFF(year, '2006-09-01',GETDATE())
SELECT DATEDIFF(month, '2006-09-01',GETDATE())
SELECT DATEDIFF(day, '2006-09-01',GETDATE())
SELECT DATEDIFF(minute, '2006-09-01',GETDATE())

SELECT EOMONTH(GETDATE(),10)--��������� ��������� ���� ������ +10 �������


--SELECT DATEFROMPARTS

SELECT ISDATE('2006-09-01')--1
SELECT ISDATE('2006-40-01')--0

--������� � �������
SELECT ROUND(1342.345,2) --1342.350
SELECT ROUND(1342.345,-2)--1300.000

SELECT ISNUMERIC(1342.345)--1
SELECT ISNUMERIC('ewwe')--0

--
SELECT ROUND(1342.345, 2)   -- 1342.350
SELECT ROUND(1342.345, -2)  -- 1300.000


SELECT ISNUMERIC(1342.345)          -- 1
SELECT ISNUMERIC('1342.345')        -- 1
SELECT ISNUMERIC('SQL')         -- 0
SELECT ISNUMERIC('13-04-2017')  -- 0


SELECT ABS(-123)    -- 123

SELECT CEILING(-123.45)     -- -123
SELECT CEILING(123.45)      -- 124
SELECT FLOOR(-123.45)       -- -124
SELECT FLOOR(123.45)        -- 123
SELECT SQUARE(5)        -- 25
SELECT SQRT(225)        -- 15


SELECT RAND()       -- 0.707365088352935
SELECT RAND()       -- 0.173808327956812

SELECT COS(1.0472)  -- 0.5 - 60 ��������
--

SELECT Id, 
CAST(Price*ProductCount AS nvarchar), CAST('100' AS INT), 
--CAST -> � ������ �����  AS ... ��� � ������� �� ������ �������������
CONVERT(nvarchar,Price*ProductCount), CONVERT(INT,'100')
FROM Products
--
/**/

--
SELECT Id, 
CAST(Price*ProductCount AS nvarchar), CAST('100q' AS INT), --'100q'->niet in int
--CAST -> � ������ �����  AS ... ��� � ������� �� ������ �������������
CONVERT(nvarchar,Price*ProductCount), CONVERT(INT,'100q')
FROM Products

SELECT Id, 
CAST(Price*ProductCount AS nvarchar), TRY_CAST('100q' AS INT), --'100q'->use TRY_
--CAST -> � ������ �����  AS ... ��� � ������� �� ������ �������������
CONVERT(nvarchar,Price*ProductCount), TRY_CONVERT(INT,'100q')
FROM Products

SELECT STR(123.4567,6,2) --123.46
SELECT CHAR(219)  --�
SELECT ASCII('�')    --219
SELECT NCHAR(1067)    --�
SELECT UNICODE('�')    --1067

--���������� ������� 
SELECT CHOOSE(3,'Manager','Director','Developer','Tester') AS RESULT;
SELECT CHOOSE(MONTH(GETDATE()), 'Winter','Winter','Spring','Spring','Spring','Summer','Summer',
'Summer','Autumn','Autumn','Autumn','Winter') AS Quarter_Pda

SELECT *,
CASE ProductCount
WHEN 1 then 'Need more tovar'
WHEN 2 then 'tovar exist'
WHEN 3 then 'tovar normal'
WHEN 4 then 'tovar super'
ELSE 'tovar superMAX'
END AS About
FROM Products

----
SELECT *,
CASE 
WHEN ProductCount>=0 AND ProductCount<3    then 'Need more tovar'
WHEN ProductCount>=3 AND ProductCount<5 then 'tovar exist'
ELSE 'tovar superMAX'
END AS About
FROM Products
------
SELECT *,
	IFF( ProductCount<=3, 'need more tovar' , 'super many tovar')
FROM Products

--
--COALESCE
--COALESCE(���������_1,���������_2,���������_N)

UPDATE Products SET Manufacturer = null WHERE id=3
UPDATE Products SET Manufacturer = null,ProductName=null WHERE Id=4
--++ ���-�� � ����������
SELECT * ,
	COALESCE( Manufacturer ,ProductName , 'niet naam tovar')
FROM Products
--
SELECT * ,
	ISNULL( Manufacturer , 'niet brend tovar')
FROM Products

CREATE DATABASE l06_1_39pr31;
go
use l06_1_39pr31;
---
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
go

CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL
);
go

CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);
go

INSERT INTO Products 
VALUES ('iPhone 6', 'Apple', 2, 36000),
('iPhone 6S', 'Apple', 2, 41000),
('iPhone 7', 'Apple', 5, 52000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000),
('Mi 5X', 'Xiaomi', 2, 26000),
('OnePlus 5', 'OnePlus', 6, 38000);
go
 
INSERT INTO Customers VALUES ('Tom'), ('Bob'),('Sam');
go
 
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
go
/*
1.1. �-�� ������  ProductCount
1.2. �-�� ��������� ������� �� ���� �������  COUNT(ProductCount)
1.3. ����� ����� ������ �� ���� �������				GROUP BY ROLLUP(Price)
1.4. �-�� ���������� ����������� � �������
1.5. �-�� ���������� ������� � �������   DISTINCT
*/

--1.1
SELECT
Manufacturer, ProductCount,
COUNT(ProductCount) as COUNT_ProductCount 
FROM Products
--1.2
SELECT
Manufacturer, ProductCount,
COUNT(ProductCount) as COUNT_ProductCount 
FROM Products
GROUP BY ROLLUP (Manufacturer,ProductCount)
--1.3
SELECT
Manufacturer, ProductCount,
COUNT(*) as COUNT_RECORDS,SUM(Price) as SUM_ProductCount
FROM Products
GROUP BY ROLLUP (Manufacturer,Price)
--1.4
SELECT COUNT(DISTINCT FirstName) AS COUNT_CUSTUMERS FROM Products

--1.5
SELECT COUNT(DISTINCT  ProductCount) AS COUNT_CUSTUMERS FROM Products

--2. ���� �� Norwind
use Northwind;
--2.1 ������� ���� ����������� � ��������� �������:
/*(TitleOfCourtesy FirstName LastName) - NameEmployee
(PostalCode, Country, Region, City , Address) - FullAddress
(HireDate - BirthDate) DiffDays 				(�-�� ����)*/
--CONCAT
SELECT
Concat(TitleOfCourtesy, FirstName,LastName) as NameEmployee
FROM Employees
SELECT
CONCAT(PostalCode, Country,Region,City,Address) as FullAddress
FROM Employees
SELECT
DATEDIFF(DAY, HireDate,BirthDate) as DiffDays
FROM Employees


--2.2 ������� ���� ����������� � ��������� �������:
/*(ContactName [CompanyName]) - NameSupplier
//2(HomePage ��� Fax ��� Phone) - ContactInfo 			(������ ��� �� null) ?????????????
//3(Country) CountryRu 						(����� case, �������� ������ �� �������)
//4(Phone)  CodePhone						(������ ��� ��������� � ������� �������)

//5(Phone)  NumberPhone						(����� ��� �������� � �������)
(ContactTitle) About						(������ 7 �������� �� ������ �����)*/
SELECT
CONCAT(ContactName, '[',CompanyName,']') as NameSupplier
FROM Customers

/*4*/SELECT
Phone  as CodePhone
FROM Customers
WHERE ((Phone like '%(_)%')OR(Phone like '%(___)%')OR(Phone like '%(__)%'))
/*5*/
SELECT
Phone as NumberPhone
FROM Customers
WHERE (Phone not like '%(%)%')

SELECT
LEFt(ContactTitle,5)
FROM Customers

use Northwind;
/*3*/
--SELECT
--  Country 
  
--  CASE
--    WHEN Country = 'Ausralia' THEN '1' 
--	WHEN Country = 'Brazil' THEN '2' 
--	WHEN Country = 'Canada' THEN '3' 
--	WHEN Country = 'Denmark' THEN  '4' 
--	WHEN Country = 'Finland' THEN  '5' 
--	WHEN Country = 'France' THEN  '6' 
--	WHEN Country = 'Germany' THEN  '7' 
--	WHEN Country = 'Italy' THEN  '8' 
--	WHEN Country = 'Japan' THEN  '9' 
--	WHEN Country = 'Netherlands' THEN  '10' 
--	WHEN Country = 'Norway' THEN  '11' 
--	WHEN Country = 'Singapore' THEN  '12' 
--	WHEN Country = 'Spain' THEN  '13' 
--	WHEN Country = 'Sweden' THEN  '14' 
--	WHEN Country = 'UK' THEN  '15' 
--	WHEN Country = 'USA' THEN  '16' 
--  END CountryRu
--  FROM Suppliers
/*//2 SELECT
IF HomePage is null 

PRINT CONCAT(HomePage) as NameSupplier

ELSE IF (Fax is null)

PRINT CONCAT(Fax) as NameSupplier

ELSE if(Phone is null)

PRINT CONCAT(Phone) as NameSupplier

ELSE 


FROM  Suppliers 
END*/

--SELECT Country
--CASE
--    WHEN Country = 'Uk' THEN 'Uk'
--    WHEN Country = 'Uk' THEN 'Uk'
--	WHEN Country = 'Uk' THEN 'Uk'
--	WHEN Country = 'Uk' THEN 'Uk'
--	WHEN Country = 'Uk' THEN 'Uk'
--	WHEN Country = 'Uk' THEN 'Uk'
--    ELSE 'The quantity is under 30'
--END AS CountryRu
--FROM Suppliers;

--SELECT  Country

--CASE
--    WHEN Country = 'Ausralia' THEN '1' 
--	WHEN Country = 'Brazil' THEN '2' 
--	WHEN Country = 'Canada' THEN '3' 
--	WHEN Country = 'Denmark' THEN  '4' 
--	WHEN Country = 'Finland' THEN  '5' 
--	WHEN Country = 'France' THEN  '6' 
--	WHEN Country = 'Germany' THEN  '7' 
--	WHEN Country = 'Italy' THEN  '8' 
--	WHEN Country = 'Japan' THEN  '9' 
--	WHEN Country = 'Netherlands' THEN  '10' 
--	WHEN Country = 'Norway' THEN  '11' 
--	WHEN Country = 'Singapore' THEN  '12' 
--	WHEN Country = 'Spain' THEN  '13' 
--	WHEN Country = 'Sweden' THEN  '14' 
--	WHEN Country = 'UK' THEN  '15' 
--	WHEN Country = 'USA' THEN  '16' 

--    ELSE 'Not exist in mijn case'
--END AS CountryRu
--FROM Suppliers;
----
Select Country
 from Suppliers
 ORDER BY  CASE Country
--   WHEN  'Ausralia' THEN '1' 
--	WHEN  'Brazil' THEN '2' 
--	WHEN 'Canada' THEN '3' 
--	WHEN  'Denmark' THEN  '4' 
--	WHEN  'Finland' THEN  '5' 
--	WHEN  'France' THEN  '6' 
--	WHEN 'Germany' THEN  '7' 
--	WHEN  'Italy' THEN  '8' 
--	WHEN  'Japan' THEN  '9' 
--	WHEN  'Netherlands' THEN  '10' 
--	WHEN  'Norway' THEN  '11' 
--	WHEN  'Singapore' THEN  '12' 
--	WHEN  'Spain' THEN  '13' 
--	WHEN  'Sweden' THEN  '14' 
--	WHEN  'UK' THEN  '15' 
--	WHEN  'USA' THEN  '16'
--End DESC--,
--Case 
   WHEN /*Country =*/ 'Ausralia' THEN '1' 
	--WHEN Country = 'Brazil' THEN '2' 
	--WHEN Country = 'Canada' THEN '3' 
	--WHEN Country = 'Denmark' THEN  '4' 
	--WHEN Country = 'Finland' THEN  '5' 
	--WHEN Country = 'France' THEN  '6' 
	--WHEN Country = 'Germany' THEN  '7' 
	--WHEN Country = 'Italy' THEN  '8' 
	--WHEN Country = 'Japan' THEN  '9' 
	--WHEN Country = 'Netherlands' THEN  '10' 
	--WHEN Country = 'Norway' THEN  '11' 
	--WHEN Country = 'Singapore' THEN  '12' 
	--WHEN Country = 'Spain' THEN  '13' 
	--WHEN Country = 'Sweden' THEN  '14' 
	--WHEN Country = 'UK' THEN  '15' 
	--WHEN Country = 'USA' THEN  '16'
END --as CountryRu
----


SELECT * FROM Suppliers;
--2.3. ������� ��� ������ � ��������� �������:
/*(ProductName) ProductName
(����� ���������: [UnitPrice] * [UnitsInStock] = [UnitPrice * UnitsInStock] )	
(��������� ���������� �� ���������� ��������, ���������� ������ ������ ����������)*/
SELECT
CONCAT( '(',ProductName,')') as ProductName
FROM Products
---
SELECT
CONCAT('Sum price','[',UnitPrice,']',' * ', '[',UnitsInStock,']',' = ', '[',UnitPrice * UnitsInStock ,']' )
FROM Products
---
SELECT
CONCAT(' ','[',v.CompanyName,']','  ', '(', CategoryName ,')','  ', '\\',s.CompanyName ,'\\' )
FROM Categories,Shippers s,Customers v
/*2.4. ������� ��� ������ � ��������� �������:
(OrderID)  NOrder
(OrderDate) DateOrderDetail 					(������� ���� � ������� Mon dd yyyy hh:miAM/PM)
(OrderDate) WeekDay 						(������� �������� ��� ������)
(CustomerId) NameCustomer 					(�������� ������ ��� �� ������� Customers)
(OrderDate - ShippedDate) As CountYears				(�������� ������� � �����)
(OrderDate - ShippedDate) As CountMont				(�������� ������� � �������)
(OrderDate - ShippedDate) As CountDays				(�������� ������� � ����)
*/
SELECT
CONCAT( '(',OrderID,')') as NOrder
FROM Orders
---
select FORMAT(OrderDate,'MM/dd/yyyy hh:mm:s tt')
FROM Orders
---
use Northwind;
SELECT DATEPART (  mm , OrderDate )as WeekDay_  --SUBSTRING('abcdef', 2, 3) AS x FROM dbo.DimCustomer 
FROM Orders
---
SELECT
CONCAT(CustomerId,' * ', CompanyName,' | |',ContactName,'__',ContactTitle,'  ADR: ',c.Address , '  ',City,'  ',Region,'  ',PostalCode,'  ',Country,'  Phone::',Phone,'  ',Fax) as NameCustomer
FROM Customers c
----
SELECT OrderDate,ShippedDate, DATEDIFF(YEAR,OrderDate,ShippedDate)  As CountYears FROM Orders
SELECT OrderDate,ShippedDate, DATEDIFF(Month,OrderDate,ShippedDate)  As CountMont FROM Orders
SELECT OrderDate,ShippedDate,DATEDIFF(DAY,OrderDate,ShippedDate)  As CountDays FROM Orders
SELECT OrderDate,ShippedDate FROM Orders
---

/*
2.5. �������� ��������� ������:
2.5.1. �-�� �������
2.5.2. ����� ������ �� �������, ������� ��� ������� ����� ���������
2.5.3. ����� ������ �� �������, ������� ��� ������ ����� ���������
2.5.4. �������� �-�� ������� �� ������ ���� ������ � ������� ����������:
�����������(1) 	 - N1 �������
�������	(2)	 - N1 �������
�����(3)		 - N1 �������
������(4)		 - N1 �������
�������	(5)	 - N1 �������
�������	(6)	 - N1 �������
�����������	(7) - N1 �������
(������� � ������, �-�� ����)*/

--2.5.1
SELECT
 count(*) 
FROM Orders

--2.5.2
SELECT MIN(ShippedDate) as FastDay FROM Orders
--2.5.3
SELECT MAX(ShippedDate) as FastDay FROM Orders
--2.5.4 OrderID,DATEPART ( wk , ShippedDate )  
SELECT OrderID,DATEPART ( wk , RequiredDate ) /7 As Week_ FROM Orders



--CREATE TABLE Products
--(
--    Id INT IDENTITY PRIMARY KEY,
--    ProductName NVARCHAR(30) NOT NULL,
--    Manufacturer NVARCHAR(20) NOT NULL,
--    ProductCount INT DEFAULT 0,
--    Price MONEY NOT NULL
--);
--CREATE TABLE Customers
--(
--    Id INT IDENTITY PRIMARY KEY,
--    FirstName NVARCHAR(30) NOT NULL
--);
--CREATE TABLE Orders
--(
--    Id INT IDENTITY PRIMARY KEY,
--    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
--    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
--    CreatedAt DATE NOT NULL,
--    ProductCount INT DEFAULT 1,
--    Price MONEY NOT NULL
--);

--INSERT INTO Products 
--VALUES ('iPhone 6', 'Apple', 2, 36000),
--('iPhone 6S', 'Apple', 2, 41000),
--('iPhone 7', 'Apple', 5, 52000),
--('Galaxy S8', 'Samsung', 2, 46000),
--('Galaxy S8 Plus', 'Samsung', 1, 56000),
--('Mi 5X', 'Xiaomi', 2, 26000),
--('OnePlus 5', 'OnePlus', 6, 38000)
 
--INSERT INTO Customers VALUES ('Tom'), ('Bob'),('Sam')
 
--INSERT INTO Orders 
--VALUES
--( 
--    (SELECT Id FROM Products WHERE ProductName='Galaxy S8'), 
--    (SELECT Id FROM Customers WHERE FirstName='Tom'),
--    '2017-07-11',  
--    2, 
--    (SELECT Price FROM Products WHERE ProductName='Galaxy S8')
--),
--( 
--    (SELECT Id FROM Products WHERE ProductName='iPhone 6S'), 
--    (SELECT Id FROM Customers WHERE FirstName='Tom'),
--    '2017-07-13',  
--    1, 
--    (SELECT Price FROM Products WHERE ProductName='iPhone 6S')
--),
--( 
--    (SELECT Id FROM Products WHERE ProductName='iPhone 6S'), 
--    (SELECT Id FROM Customers WHERE FirstName='Bob'),
--    '2017-07-11',  
--    1, 
--    (SELECT Price FROM Products WHERE ProductName='iPhone 6S')
--);
