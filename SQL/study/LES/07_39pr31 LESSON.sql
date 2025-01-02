CREATE DATABASE l07_39pr31;
go 
USE l07_39pr31;
go

CREATE TABLE Manufacturers
(
    Id INT IDENTITY PRIMARY KEY,
    ManufacturerName NVARCHAR(100) NOT NULL
);
 
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    ManufacturerId Int NOT NULL REFERENCES Manufacturers(Id) ON DELETE CASCADE,
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
    CreatedAt DATE NOT NULL,
    ProductId INT NULL REFERENCES Products(Id),
    CustomerId INT NULL REFERENCES Customers(Id),    
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);


INSERT INTO Manufacturers VALUES 
('���� ����� ������'),
('������ ���� ��������'),
('������� �����'),
('�������� ��������'),
('������� ������'),
('������������ ������� ������'),
('������� �����'),
('Samsung'),
('LG');

INSERT INTO Products 
VALUES 
('�����', (SELECT Id FROM Manufacturers WHERE ManufacturerName='���� ����� ������'), 100, 50),
('����',  (SELECT Id FROM Manufacturers WHERE ManufacturerName='������ ���� ��������'), 15, 45),
('������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������� �����'), 500, 20),
('������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='�������� ��������'), 333, 70),
('��������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������� ������'), 1000, 7),
('�������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������ ���� ��������'), 456, 15),
('������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������ ���� ��������'), 35, 23),
('�����', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������� �����'), 20, 18),
('�������� �������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������������ ������� ������'), 55, 100);
 
INSERT INTO Customers VALUES ('����'), ('����'),('���������'), ('������'), ('�������'), ('���'), ('������'), ('����');
 
INSERT INTO Orders 
(ProductId, CustomerId, CreatedAt,  ProductCount, Price)
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='�����'), 
    (SELECT Id FROM Customers WHERE FirstName='����'),
    '2019-09-01',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='�����')
),
( 
    (SELECT Id FROM Products WHERE ProductName='����'), 
    (SELECT Id FROM Customers WHERE FirstName='����'),
    '2019-08-31',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='����')
),
( 
    (SELECT Id FROM Products WHERE ProductName='������'), 
    (SELECT Id FROM Customers WHERE FirstName='�������'),
    '2019-08-30',  
    5, 
    (SELECT Price FROM Products WHERE ProductName='������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='������'), 
    (SELECT Id FROM Customers WHERE FirstName='�������'),
    '2019-08-30',  
    3, 
    (SELECT Price FROM Products WHERE ProductName='������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='��������'), 
    (SELECT Id FROM Customers WHERE FirstName='���������'),
    '2019-08-29',  
    11, 
    (SELECT Price FROM Products WHERE ProductName='��������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='�������'), 
    (SELECT Id FROM Customers WHERE FirstName='������'),
    '2019-08-29',  
    9, 
    (SELECT Price FROM Products WHERE ProductName='�������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='������'), 
    (SELECT Id FROM Customers WHERE FirstName='������'),
    '2019-08-29',  
    4, 
    (SELECT Price FROM Products WHERE ProductName='������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='�����'), 
    (SELECT Id FROM Customers WHERE FirstName='�������'),
    '2019-08-29',  
    6, 
    (SELECT Price FROM Products WHERE ProductName='�����')
);

------
SELECT * FROm Manufacturers;
SELECT * FROm Customers;
SELECT * FROm Products;
SELECT * FROm Orders;
----

SELECT 
ord.Id, CreatedAt ,ord.ProductCount,ord.Price,
p.ProductName , m.ManufacturerName, c.FirstName
--*
FROm Orders AS ord , Products /*AS*/ p , Customers c,Manufacturers m
-- ��������� ������������  can be without "AS"
WHERE ord.ProductId = p.Id AND ord.CustomerId = c.Id AND p.ManufacturerId = m.Id
--

SELECT 
*, 
(SELECT TOP 1 ProductName FROM Products WHERE Id = Orders.ProductId) as ProdNum,
(SELECT TOP 1 FirstName FROM Customers WHERE Id = Orders.CustomerId) as CustNum
FROM Orders;

---------
--����������� ����
--��������� (10-25)
--�������  (�������� - 9.9(10��� -25-> ���)) (
--�����

SELECT * FROM Products
SELECT * FROM Manufacturers

--
SELECT
* 
FROM Products 
--��������� ����������
INNER JOIN Manufacturers ON
/*������ �������*/ 
Products.ManufacturerId = Manufacturers.Id
--
--
SELECT
 CONCAT
 ( p.ProductName,' (',m.ManufacturerName,') ') as Name,p.ProductCount,p.ProductName
FROM Products p
--��������� ����������
/*INNER*/ JOIN Manufacturers m ON  --can be without INNER
/*������ �������*/ 
p.ManufacturerId = m.Id

----
--������� ����������(OUTER)
--OUTER
--LEFT
--RIGHT
--FULL

SELECT 
* 
FROm Products p
LEFT JOIN Manufacturers m ON p.ManufacturerId=m.Id--������� ���� �����
--
SELECT 
* 
FROm Products p
RIGHT JOIN Manufacturers m ON p.ManufacturerId=m.Id  --������� ���� ������(������� null)
--
SELECT 
* 
FROm Products p
FULL JOIN Manufacturers m ON p.ManufacturerId=m.Id  --������� ���� all (full)
--
SELECT 
*
FROM Products p
LEFT JOIN Manufacturers m ON p.ManufacturerId=m.Id
WHERE m.Id is NULL
--
SELECT 
*
FROM Products p
RIGHT JOIN Manufacturers m ON p.ManufacturerId=m.Id
WHERE m.Id is NULL
---
SELECT 
Count(*)
FROM Products p 
LEFT JOIN Manufacturers m ON p.ManufacturerId=m.Id
WHERE p.ManufacturerId is NULL
--
SELECT
*
FROM Orders o
LEFT JOIN Products p ON o.ProductId=p.Id 
LEFT JOIN Customers c ON o.CustomerId=c.Id
LEFT JOIN Manufacturers m ON p.ManufacturerId=m.Id
/*
������� ��� ������ ,������ �� ���� �� �����������
*/
SELECT
*
FROM Orders o
RIGHT JOIN Products p ON o.ProductId=p.Id
WHERE o.ProductId is NULL
--
SELECT
*
FROM Products p
LEFT JOIN Orders o ON p.Id=o.ProductId
WHERE o.ProductId is NULL
--
SELECT
*
FROM Products p
WHERE  p.Id NOT IN (SELECT o.ProductId FROM Orders o
WHERE o.ProductId is NOT NULL) --�� � --ERROR WAROOM?
--
SELECT
*
FROM Products p
FULL JOIN Manufacturers m ON p.ManufacturerId=m.Id
WHERE m.Id is NULL OR p.ManufacturerId is NULL
----------


--CROSS
SELECT * FROM Products
CROSS JOIN Manufacturers --���������� ������������
--
---------------------

CREATE TABLE Customers1
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    AccountSum MONEY
);
CREATE TABLE Employees
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
);
-----------------------------------
INSERT INTO Customers1 VALUES
('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800)

INSERT INTO Employees VALUES
('Homer', 'Simpson'),
('Tom', 'Smith'),
('Mark', 'Adams'),
('Nick', 'Svensson')

----
SELECT * FROM Customers1
SELECT * FROM Employees

--UNION(��������� ) 
SELECT FirstName ,LastName FROM Customers1
UNION 
SELECT FirstName,LastName FROM Employees
---
SELECT FirstName ,LastName FROM Customers1
UNION  ALL --(ALL--> � ������������)
SELECT FirstName,LastName FROM Employees
---
SELECT Id ,FirstName ,LastName FROM Customers1
UNION  ALL 
SELECT     FirstName,LastName FROM Employees 
---��������� ������ ��������� then-> ERROR
------
SELECT FirstName ,LastName FROM Customers1
--ERROR--ORDER BY FirstName
UNION  ALL 
SELECT FirstName,LastName FROM Employees 
ORDER BY 1
--
SELECT FirstName  FROM Customers1
UNION  ALL 
SELECT FirstName FROM Employees 
UNION
SELECT FirstName FROM Customers

---
--�������� ���� �������(what is NOT similar)
SELECT FirstName  FROM Customers1
EXcEPT
SELECT     FirstName FROM Customers 
---

---����� ������(what is similar)
SELECT FirstName  FROM Customers1
INTERSECT
SELECT     FirstName FROM Employees 

----
----

--��� ������,� ������ ���� ���� �������
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

--�� ������ ������ � CUstumers 
--1 �������
SELECT * FROM Customers
WHERE Id NOT IN (SELECT o.CustomerId FROM Orders o )
--2 �������
SELECT * FROM Customers c
LEFT JOIN Orders o ON o.CustomerId = c.Id
WHERE o.CustomerId is NULL

--��� ������, ���� ������� ������ ��� � ������ ������ �������� �����
SELECT * FROM Products
WHERE Price < (SELECT MIN(PRICE) FROM Products WHERE ManufacturerId =3)
--
SELECT * FROM Products
WHERE Price < ALL(SELECT Price FROM Products WHERE ManufacturerId =3)
--ALL fatser then MIN


SELECT * FROM Products
WHERE Price < ANY(SELECT Price FROM Products WHERE ManufacturerId =3)
--any en some similar

--exist  ��������
SELECT * FROm Products
WHERE EXISTS (SELECT * FROM Orders 
WHERE Orders.CustomerId= Products.Id)
--
SELECT * FROm Products
WHERE NOT EXISTS (SELECT * FROM Orders 
WHERE Orders.CustomerId= Products.Id) --FASTER
-----

