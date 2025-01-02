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
('Агро фирма Херсон'),
('Фермер Вася Пяточкин'),
('Бабушка Клава'),
('Турецкий Бусурман'),
('Бульбаш Батько'),
('Кондитерская фабрика Свиточ'),
('Фабрика Рошен'),
('Samsung'),
('LG');

INSERT INTO Products 
VALUES 
('Арбуз', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Агро фирма Херсон'), 100, 50),
('Дыня',  (SELECT Id FROM Manufacturers WHERE ManufacturerName='Фермер Вася Пяточкин'), 15, 45),
('Яблоко', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Бабушка Клава'), 500, 20),
('Персик', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Турецкий Бусурман'), 333, 70),
('Картошка', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Бульбаш Батько'), 1000, 7),
('Помидор', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Фермер Вася Пяточкин'), 456, 15),
('Огурец', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Фермер Вася Пяточкин'), 35, 23),
('Груша', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Бабушка Клава'), 20, 18),
('Молочный шоколад', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Кондитерская фабрика Свиточ'), 55, 100);
 
INSERT INTO Customers VALUES ('Иван'), ('Петр'),('Александр'), ('Катюша'), ('Маричка'), ('Боб'), ('Мартын'), ('Кузя');
 
INSERT INTO Orders 
(ProductId, CustomerId, CreatedAt,  ProductCount, Price)
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='Арбуз'), 
    (SELECT Id FROM Customers WHERE FirstName='Иван'),
    '2019-09-01',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='Арбуз')
),
( 
    (SELECT Id FROM Products WHERE ProductName='Дыня'), 
    (SELECT Id FROM Customers WHERE FirstName='Петр'),
    '2019-08-31',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='Дыня')
),
( 
    (SELECT Id FROM Products WHERE ProductName='Яблоко'), 
    (SELECT Id FROM Customers WHERE FirstName='Маричка'),
    '2019-08-30',  
    5, 
    (SELECT Price FROM Products WHERE ProductName='Яблоко')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Катюша'), 
    (SELECT Id FROM Customers WHERE FirstName='Маричка'),
    '2019-08-30',  
    3, 
    (SELECT Price FROM Products WHERE ProductName='Персик')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Картошка'), 
    (SELECT Id FROM Customers WHERE FirstName='Александр'),
    '2019-08-29',  
    11, 
    (SELECT Price FROM Products WHERE ProductName='Картошка')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Помидор'), 
    (SELECT Id FROM Customers WHERE FirstName='Катюша'),
    '2019-08-29',  
    9, 
    (SELECT Price FROM Products WHERE ProductName='Помидор')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Огурец'), 
    (SELECT Id FROM Customers WHERE FirstName='Катюша'),
    '2019-08-29',  
    4, 
    (SELECT Price FROM Products WHERE ProductName='Огурец')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Груша'), 
    (SELECT Id FROM Customers WHERE FirstName='Маричка'),
    '2019-08-29',  
    6, 
    (SELECT Price FROM Products WHERE ProductName='Груша')
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
-- Декартово произведение  can be without "AS"
WHERE ord.ProductId = p.Id AND ord.CustomerId = c.Id AND p.ManufacturerId = m.Id
--

SELECT 
*, 
(SELECT TOP 1 ProductName FROM Products WHERE Id = Orders.ProductId) as ProdNum,
(SELECT TOP 1 FirstName FROM Customers WHERE Id = Orders.CustomerId) as CustNum
FROM Orders;

---------
--ПЕРЕСИЧЕНИЯ Виды
--Внутрение (10-25)
--Внешние  (бесконеч - 9.9(10ююю -25-> НЕТ)) (
--Кросс

SELECT * FROM Products
SELECT * FROM Manufacturers

--
SELECT
* 
FROM Products 
--внутрение соединение
INNER JOIN Manufacturers ON
/*задать правила*/ 
Products.ManufacturerId = Manufacturers.Id
--
--
SELECT
 CONCAT
 ( p.ProductName,' (',m.ManufacturerName,') ') as Name,p.ProductCount,p.ProductName
FROM Products p
--внутрение соединение
/*INNER*/ JOIN Manufacturers m ON  --can be without INNER
/*задать правила*/ 
p.ManufacturerId = m.Id

----
--ВНЕШНЕЕ СОЕДИНЕНИЕ(OUTER)
--OUTER
--LEFT
--RIGHT
--FULL

SELECT 
* 
FROm Products p
LEFT JOIN Manufacturers m ON p.ManufacturerId=m.Id--главное инфо слево
--
SELECT 
* 
FROm Products p
RIGHT JOIN Manufacturers m ON p.ManufacturerId=m.Id  --главное инфо справа(поэтому null)
--
SELECT 
* 
FROm Products p
FULL JOIN Manufacturers m ON p.ManufacturerId=m.Id  --главное инфо all (full)
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
Выбрать все товары ,котрые ни разу не продавались
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
WHERE o.ProductId is NOT NULL) --не в --ERROR WAROOM?
--
SELECT
*
FROM Products p
FULL JOIN Manufacturers m ON p.ManufacturerId=m.Id
WHERE m.Id is NULL OR p.ManufacturerId is NULL
----------


--CROSS
SELECT * FROM Products
CROSS JOIN Manufacturers --декартовое произведение
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

--UNION(оьединить ) 
SELECT FirstName ,LastName FROM Customers1
UNION 
SELECT FirstName,LastName FROM Employees
---
SELECT FirstName ,LastName FROM Customers1
UNION  ALL --(ALL--> С ПОВТОРЕНИЯМИ)
SELECT FirstName,LastName FROM Employees
---
SELECT Id ,FirstName ,LastName FROM Customers1
UNION  ALL 
SELECT     FirstName,LastName FROM Employees 
---типизация должна совпадать then-> ERROR
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
--РАЗНОСТЬ ДВУХ ВЫБОРОК(what is NOT similar)
SELECT FirstName  FROM Customers1
EXcEPT
SELECT     FirstName FROM Customers 
---

---Общие строки(what is similar)
SELECT FirstName  FROM Customers1
INTERSECT
SELECT     FirstName FROM Employees 

----
----

--все товары,у котрых цена выше средней
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

--нИ ОДНОГО ЗАКАЗА У CUstumers 
--1 вариант
SELECT * FROM Customers
WHERE Id NOT IN (SELECT o.CustomerId FROM Orders o )
--2 вариант
SELECT * FROM Customers c
LEFT JOIN Orders o ON o.CustomerId = c.Id
WHERE o.CustomerId is NULL

--все товары, цена которых меньше чем у любого товара БУБУШКАИ КЛАВЫ
SELECT * FROM Products
WHERE Price < (SELECT MIN(PRICE) FROM Products WHERE ManufacturerId =3)
--
SELECT * FROM Products
WHERE Price < ALL(SELECT Price FROM Products WHERE ManufacturerId =3)
--ALL fatser then MIN


SELECT * FROM Products
WHERE Price < ANY(SELECT Price FROM Products WHERE ManufacturerId =3)
--any en some similar

--exist  оператор
SELECT * FROm Products
WHERE EXISTS (SELECT * FROM Orders 
WHERE Orders.CustomerId= Products.Id)
--
SELECT * FROm Products
WHERE NOT EXISTS (SELECT * FROM Orders 
WHERE Orders.CustomerId= Products.Id) --FASTER
-----

