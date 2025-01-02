use [03_39pr31];
go
--
CREATE TABLE Products
(    Id INT IDENTITY PRIMARY KEY,  
	ProductName NVARCHAR(30) NOT NULL, 
	Manufacturer NVARCHAR(20) NOT NULL,  
	ProductCount INT DEFAULT 0,
	Price MONEY NOT NULL
)
go
-------
INSERT INTO Products
VALUES
('iPhone 6', 'Apple', 3, 36000),
('iPhone 6S', 'Apple', 2, 41000),
('iPhone 7', 'Apple', 5, 52000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000),
('Mi6', 'Xiaomi', 5, 28000),
('OnePlus 5', 'OnePlus', 6, 38000);
go
----
SELECT * FROM Products
----
SELECT 
Id,ProductCount, ProductName
FROM Products
---
SELECT 
Id, ProductName + ' ( '+ Manufacturer+ ' )  ' 
as ProdName, 
Price, 
ProductCount,
Price * ProductCount as all_sum_row
FROM Products
----
SELECT
	DISTINCt	Manufacturer
FROM Products
-----
SELECT
DISTINCT
Manufacturer, Id
FROM Products
----
SELECT TOP 3 ID,ProductName
FROM Products
----
SELECT TOP 70 PERCENT ID,ProductName
FROM Products
----
SELECT * FROM Products
ORDER BY Manufacturer
-----
SELECT * FROM Products
ORDER BY 5
----
SELECT * FROM Products
ORDER BY Manufacturer DESC
----
SELECT * FROM Products
ORDER BY Manufacturer, ProductCount  DESC
---
SELECT
* , Price * ProductCount as Total
FROM Products
ORDER BY Total
----
SELECT
* --, Price * ProductCount as Total
FROM Products
ORDER BY Price * ProductCount DESC
---
SELECT * FROM Products WHERE Manufacturer = 'Apple'
---
SELECT * FROM Products WHERE Manufacturer != 'Apple'
---
SELECT *FROM Products WHERE ProductCount* Price <= 70000
---
SELECT *FROM Products WHERE Manufacturer = 'Apple' AND ProductCount >= 3
---
SELECT *FROM Products WHERE Manufacturer = 'Apple' OR Manufacturer = 'Samsung'
---
SELECT *FROM Products WHERE Manufacturer <> 'Apple'-- like !=
---
SELECT *FROM Products WHERE NOT Manufacturer = 'Apple' -- or like NOT
------------------------
INSERT Products (ProductName, Manufacturer, ProductCount) VALUES ('test1','m1',10)
--
SELECT * FROM Products
--
SELECT * FROM Products WHERE Price  IS NULL
SELECT * FROM Products WHERE Price  IS NOT NULL
---=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-
SELECT * FROM Products WHERE
(Manufacturer = 'Apple' OR Manufacturer ='Samsung')
--
SELECT * FROM Products WHERE Manufacturer IN ('Apple','Samsung')
SELECT * FROM Products WHERE ProductCount >=3 AND ProductCount <=5
SELECT * FROM Products WHERE ProductCount NOT BETWEEN 2 AND 5  -- zonder NOT
---
SELECT * FROM Products Where Manufacturer LIKE 'A%'
SELECT * FROM Products Where ProductName LIKE '%ne%'
SELECT * FROM Products Where ProductName LIKE 'iPhone __'

SELECT * FROM Products Where ProductName LIKE 'iPhone [6,7,8,9]%'
SELECT * FROM Products Where ProductName LIKE 'iPhone [6-9]%'

SELECT * FROM Products Where ProductName LIKE 'iPhone [6-9]%'
SELECT * FROM Products Where ProductName LIKE 'iPhone [^6]%'
------------------------
SELECT /*DISTINCT*/  TOP 5 Manufacturer FROM Products 
WHERE ProductCount > 2
ORDER BY ProductName DESC
------------------------
SELECT * FROM Products
UPDATE Products SET Price=Price*0.10+Price, ProductCount=ProductCount+100
WHERE Manufacturer = 'A'
----=-==-=--=-=-=-=--=--=-=----=-DELETE
DELETE FROM Products WHERE Manufacturer = 'Xiaomi'
--
--TRUNCATE TABLE Products


UPDATE Products SET Manufacturer ='Apple Corp'
FROM
(SELECT TOP 2 * FROM Products
WHERE Manufacturer = 'Apple') as SESE
WHERE Products.Id =SESE.Id -- AND ProductCount >=3 AND ProductCount <=2

