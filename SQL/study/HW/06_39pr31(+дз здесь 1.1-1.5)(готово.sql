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
---Групировка

---Агрегатные функции
/*
AVG	:находит среднее значение
SUM	:находит сумму значений
MIN	:находит наименьшее значений
MAX	:находит наибольшее значений
COUNT:находит кол-во строк в запросе
Все агрегатные функц за исключением COUNT(*) игнор значения NULL
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
SELECT COUNT(ALL ProductCount) FROM Products --без ALL -> по умолчанию
SELECT COUNT(DISTINCT ProductCount) FROM Products
--
SELECT DISTINCT Manufacturer FROM Products --DISTINCT ->значения не повторяються
--
SELECT DISTINCT Manufacturer,ProductCount FROM Products
--
SELECT DISTINCT Manufacturer FROM Products


--Операторы GROUP BY 
--++ что-то в настройках
SELECT  Manufacturer FROM Products
GROUP BY Manufacturer --> групперует группу для значений
--
SELECT  Manufacturer FROM Products
GROUP BY Manufacturer,ProductCount -->без именения в 200 rows
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
GROUP BY ROLLUP (Manufacturer,ProductCount) --ROLLUP ->сумма каждого столбца
--
SELECT
Manufacturer, ProductCount,
COUNT(*) as COUNT_RECORDS,SUM(ProductCount) as SUM_ProductCount
FROM Products
WHERE ProductCount >=2
GROUP BY Manufacturer,ProductCount WITH CUBE --WITH CUBE по цифр. одинак. делают итоги

-------------
--Стандарнтые функции в MSSQL 
--
--STRING
SELECT 1,100,500
--
--SELECT 123
SELECT LEN('Apple') ---5
SELECT LTRIM(' Apple') --удаляет пробелы слева
SELECT TRIM(' Apple ') --удаляет пробелы слева и справа
SELECT RTRIM(' Apple  ') --удаляет пробелы 
SELECT CHARINDEX('pl',' Apple  ')
SELECT PATINDEX('%p_e%',' Apple  ')
SELECT LEFT('Apple',3)
SELECT RIGHT('Apple',3)
SELECT SUBSTRING('Apple',8,2)  
SELECT REPLACE('Apple','edwfqqfweqefw','qwfeewfq') --замена
SELECT REVERSE('Apple') -- зеркально
SELECT LOWER('Apple')--нижн региср
SELECT UPPER('Apple')--верх регистр
SELECT 'Apple'+'edwfqqfweqefw'+'qwfeewfq' --соединение строк
SELECT 'Apple'+'edwfqqfweqefw'+'qwfeewfq' +100 --в строку записать сотку
SELECT 'Apple'+null+'qwfeewfq'  --черная дыра (NULL)
SELECT CONCAT('Apple','edwfqqfweqefw','qwfeewfq',100) --гасит исключения
SELECT CONCAT('Apple','edwfqqfweqefw','qwfeewfq',100,null)--гасит и null
SELECT CONCAT('Apple','edwfqqfweqefw',/*'          '*/ SPACE(10),100)
SELECT CONCAT( Manufacturer , Price ,'___',100) FROM Products

SELECT UPPER(LEFT(Manufacturer,2))  as Abbrevature,
CONCAT( ProductName , ' - ' , Manufacturer) As FullProdName
FROM Products
-----------
--Функции по работе с датами и временем
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

SELECT EOMONTH(GETDATE(),10)--возращает последний день месяца +10 месяцев


--SELECT DATEFROMPARTS

SELECT ISDATE('2006-09-01')--1
SELECT ISDATE('2006-40-01')--0

--Функции с числами
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

SELECT COS(1.0472)  -- 0.5 - 60 градусов
--

SELECT Id, 
CAST(Price*ProductCount AS nvarchar), CAST('100' AS INT), 
--CAST -> в строку потом  AS ... тип в который вы хотите преобразовать
CONVERT(nvarchar,Price*ProductCount), CONVERT(INT,'100')
FROM Products
--
/**/

--
SELECT Id, 
CAST(Price*ProductCount AS nvarchar), CAST('100q' AS INT), --'100q'->niet in int
--CAST -> в строку потом  AS ... тип в который вы хотите преобразовать
CONVERT(nvarchar,Price*ProductCount), CONVERT(INT,'100q')
FROM Products

SELECT Id, 
CAST(Price*ProductCount AS nvarchar), TRY_CAST('100q' AS INT), --'100q'->use TRY_
--CAST -> в строку потом  AS ... тип в который вы хотите преобразовать
CONVERT(nvarchar,Price*ProductCount), TRY_CONVERT(INT,'100q')
FROM Products

SELECT STR(123.4567,6,2) --123.46
SELECT CHAR(219)  --ы
SELECT ASCII('ы')    --219
SELECT NCHAR(1067)    --ы
SELECT UNICODE('ы')    --1067

--Логические функции 
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
--COALESCE(выражение_1,выражение_2,выражение_N)

UPDATE Products SET Manufacturer = null WHERE id=3
UPDATE Products SET Manufacturer = null,ProductName=null WHERE Id=4
--++ что-то в настройках
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
1.1. К-во продаж  ProductCount
1.2. К-во проданных товаров по всем заказам  COUNT(ProductCount)
1.3. Общая Сумма продаж по всем заказам				GROUP BY ROLLUP(Price)
1.4. К-во Уникальных Покупателей в заказах
1.5. К-во Уникальных Товаров в заказах   DISTINCT
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

--2. Дана БД Norwind
use Northwind;
--2.1 Вывести всех сотрудников в следующем формате:
/*(TitleOfCourtesy FirstName LastName) - NameEmployee
(PostalCode, Country, Region, City , Address) - FullAddress
(HireDate - BirthDate) DiffDays 				(к-во дней)*/
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


--2.2 Вывести всех поставщиков в следующем формате:
/*(ContactName [CompanyName]) - NameSupplier
//2(HomePage или Fax или Phone) - ContactInfo 			(Первое что не null) ?????????????
//3(Country) CountryRu 						(через case, название страны на русском)
//4(Phone)  CodePhone						(только код оператора в круглых скобках)

//5(Phone)  NumberPhone						(номер без символов в скобках)
(ContactTitle) About						(Первые 7 символов из строки слева)*/
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
--2.3. Вывести все товары в следующем формате:
/*(ProductName) ProductName
(Общая стоимость: [UnitPrice] * [UnitsInStock] = [UnitPrice * UnitsInStock] )	
(Соединить информацию из нескольких столбцов, квадратные скобки должны выводиться)*/
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
/*2.4. Вывести все заказы в следующем формате:
(OrderID)  NOrder
(OrderDate) DateOrderDetail 					(Вывести дату в формате Mon dd yyyy hh:miAM/PM)
(OrderDate) WeekDay 						(Вывести название дня недели)
(CustomerId) NameCustomer 					(Получить полное имя из таблицы Customers)
(OrderDate - ShippedDate) As CountYears				(Получить разницу в годах)
(OrderDate - ShippedDate) As CountMont				(Получить разницу в месяцах)
(OrderDate - ShippedDate) As CountDays				(Получить разницу в днях)
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
2.5. Получить следующие данные:
2.5.1. К-во заказов
2.5.2. Найти первый из заказов, которых был быстрее всего доставлен
2.5.3. Найти первый из заказов, которых был дольше всего доставлен
2.5.4. Получить к-во заказов за каждый день недели и вывести информацию:
Понедельник(1) 	 - N1 заказов
Вторник	(2)	 - N1 заказов
Среда(3)		 - N1 заказов
Чеверг(4)		 - N1 заказов
Пятница	(5)	 - N1 заказов
Суббота	(6)	 - N1 заказов
Воскресенье	(7) - N1 заказов
(Вывести № заказа, к-во дней)*/

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
