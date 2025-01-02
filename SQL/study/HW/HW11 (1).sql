--1. Создать БД MyShopDB06
CREATE DATABASE MyShopDB06;
go
use MyShopDB06;

--2. Создать следующие таблицы в БД

--	Manufacturers
--		Id		PK
--		Name -	строка 40 символов, обязательное 
CREATE Table Manufacturers(
Id INT IDENTITY PRIMARY KEY,
NameM NVARCHAR(40) NOT NULL,
);
--	TypesProduct
--		Id		PK
--		Name -	строка 50 символов , обязательное
CREATE Table TypesProduct(
Id INT IDENTITY PRIMARY KEY,
Nametp NVARCHAR(50) NOT NULL,
);
--	Shippers
--		Id		PK
--		Name -	строка 45 символов , обязательное
--		Email	строка 55 символов , обязательное, уникальное
CREATE Table Shippers(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(45) NOT NULL,
Email VARCHAR(55) NOT NULL  UNIQUE
);
--	Customers
--		Id		PK
--		FN		строка 30 символов , обязательное
--		LN		строка 30 символов , обязательное
--		MN		строка 30 символов , может быть пустым
--		Email	строка 35 символов , обязательное, уникальное
--		Age		возраст, по умолчанию 16
CREATE Table Customers(
Id INT IDENTITY PRIMARY KEY,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(30) NOT NULL,
MiddleName NVARCHAR(30) NOT NULL,
Email VARCHAR(55) NOT NULL  UNIQUE,
Age int Default 16
);

--	Products
--		Id				PK
--		Model			строка 30 символов, обязательное
--		IdTypeProduct	FK на таблицу TypesProduct, каскадное удаление
--		IdManufacturer	FK на таблицу Manufacturers, каскадное удаление
--		Price			стоимость товара, обязательное
--		ProductCount	к-во товара на складе, по умолчанию = 0
CREATE Table Products(
Id INT IDENTITY PRIMARY KEY,
Model NVARCHAR(30) NOT NULL,
IdTypeProduct INT NULL REFERENCES TypesProduct(Id),
IdManufacturer INT NULL REFERENCES Manufacturers(Id),
Price money NOT NULL,
ProductCount int Default 0
);

--	Orders
--		Id				PK
--		NumberOrder		строка 25 символов фиксированной длины, обязательное
--		DateOrder		Дата заказа (дата + время), обязательное, по умолчанию  = системной дате 
--		IdCustomer		FK на таблицу Customers, каскадное удаление
--		OrderPrice		сумма заказа, по - умолчанию 0
CREATE Table Orders(
Id INT IDENTITY PRIMARY KEY,
Model NVARCHAR(30) NOT NULL,
IdTypeProduct INT NULL REFERENCES TypesProduct(Id),
IdManufacturer INT NULL REFERENCES Manufacturers(Id),
Price money NOT NULL,
ProductCount int Default 0
);
--	OrderDetails
--		Id				PK
--		IdOrder			FK на таблицу Orders, каскадное удаление, обязательное
--		IdProduct		FK на таблицу Products, каскадное удаление, обязательное
--		CountProduct	К-во товара, обязательное, по умолчанию - 1
--		Price			Цена, обязательная
CREATE Table OrderDetails(
Id INT IDENTITY PRIMARY KEY,
IdOrder INT NULL REFERENCES Orders(Id),
IdProduct INT NULL REFERENCES Products(Id),
CountProduct int NOT NULL Default 1,
Price money NOT NULL,
);
--	TrafficProducts
--		Id				PK
--		DateTraffic		Дата, по-умолчанию - системная дата
--		IdAgent			int, обязательное
--		TypeAgent		int, обязательное, по-умолчанию - 1
--		IdProduct		FK на таблицу Products, обязательное
--		ProductCount	К-во товара, обязательное, по умолчанию - 1
--		Price			Цена, обязательная
CREATE Table TrafficProducts(
Id INT IDENTITY PRIMARY KEY,
DateTraffic Date ,
IdAgent INT NOT NULL ,
TypeAgent INT NOT NULL DEFAULT 1, 
IdProduct INT NULL REFERENCES Products(Id),
CountProduct int NOT NULL Default 1,
Price money NOT NULL,
);
--3. Создать следующие представления в БД:

--	ProductView		(Объеденить таблицы: Manufacturers, TypesProduct, Products. 
--						Должны быть следующие поля:
--						Id,
--						NameTypeProduct,
--						NameManufacturer,
--						Model			
--						Price			
--						ProductCount	
--						)
CREATE VIEW ProductView
AS	
	SELECT m.Id,m.NameM,
tp.Nametp,
pr.Model,pr.Price,pr.ProductCount 
FROM Manufacturers m ,TypesProduct tp,Products pr

SELECT * FROM ProductView


	--CustomersView	(Объеденить в одно поле данные о ФИО из табл. Customers,
	--					состоит из полей: Id, Name, Email)
CREATE VIEW CustomersView
AS		
	SELECT s.Id,s.FirstName,s.LastName,s.MiddleName,s.Email 
FROM Customers s
SELECT * FROM CustomersView
	--Agent			(Объеденить 2 таблицы: Shippers, CustomersView. Добавить в представление 
	--					поле TypeAgent: 1 - это Customers, 2 - это Shippers)
	CREATE VIEW Agent
	AS
	SELECT TypeAgent
FROM Shippers sh,CustomersView,TrafficProducts
WHERE (TypeAgent =1)OR(TypeAgent =2 )

	--TrafficProductsView (Представление должно выводить данные:
	--					 дата, 
	--					 Название товара, 
	--					 Имя Агента, Тип Агента (покупатель/поставщик)
	--					 К-во,
	--					 Цена )
		CREATE VIEW TrafficProductsView
	AS
	SELECT DateTraffic,  sh.Name,s.FirstName,s.MiddleName,s.LastName,TypeAgent,o.CountProduct ,ss.Price
FROM Shippers sh,CustomersView,Customers s,TrafficProducts,ProductView ss,OrderDetails o

	--OrdersView		(Представление должно выводить данные:
	--					 дата,
	--					 номер заказа 
	--					 Название товара, 
	--					 Имя покупателя
	--					 К-во,
	--					 Цена )
		CREATE VIEW OrdersView
	AS
	SELECT tpr.DateTraffic,cts.Model,tp.Nametp,FirstName,MiddleName,LastName,Orders.Price,cts.ProductCount
FROM Orders,TypesProduct tp,Customers,Products cts,TrafficProducts tpr
--4.Создать процедуру CreateRecHistoryLog, 
--которая будет добавлять данные в таблицу HistoryLog (п.5). --!!))
-- DELIMITER //
CREATE PROCEDURE CreateRecHistoryLog 
@NameTable NVARCHAR(200),
@TypeOperation NVARCHAR(200),
@date date
AS
BEGIN
    INSERT  HistoryLog (NameTable,TypeOperation,CreateAt)
	VALUEs
	(@NameTable,@TypeOperation,@date);
END; 

--5. Для каждой таблицы создать триггер на протоколирования изменения данных
--		Данные должны вноситься в таблицу HistoryLog
	CREATE TABLE HistoryLog(	
   Id INT IDENTITY PRIMARY KEY,
    NameTable  NVARCHAR(200) NOT NULL,
    TypeOperation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE());
--	в триггере вызывать процедуру CreateRecHistoryLog
CREATE TRIGGER _CreateRecHistoryLog
ON OrderDetails
INSTEAD OF INSERT
AS
EXEC CreateRecHistoryLog 'Name','TypeOperation','2022-12-31';

--6. Для таблицы TrafficProducts создать триггер на добавление данных
--	Если товар поступил или был продан, то обновить к-во соответствующего товара в таблице Product
CREATE TRIGGER _TrafficProducts_insert_refresh
ON TrafficProducts 
INSTEAD OF INSERT
AS
INSERT INTO TrafficProducts
VALUES
('2023-01-02',1,1,(SELECT Id FROM Products),100,1600);
UPDATE Products SET ProductCount = 100 ; 

--7. Создать функцию CalcOrderPrice, которая принимает Id заказа
CREATE FUNCTION CalcOrderPrice (@id int)
returns int
AS
BEGIN
Return @id;
END;
--8.  Для таблицы OrderDetails создать триггер на добавление данных
--		При добавлении данных в таблицу OrderDetails, внести данные о продаже в таблицу 
--		TrafficProducts и обноновить поле OrderPrice в таблице Orders. Использовать функцию из п. 7.
CREATE TRIGGER OrderinsertANDupdate
ON OrderDetails 
INSTEAD OF INSERT
AS
 INSERT INTO OrderDetails VALUEs
((SELECT Id FROM Orders),(SELECT Id FROM Products),100,1600);
INSERT INTO TrafficProducts 
VALUEs 
('2023-01-02',1,1,(SELECT Id FROM Products),100,1600);
PRINT dbo.CalcOrderPrice(1);
  UPDATE Orders SET  Price = 1600 ;

--9. Выполнить наполнение данными в вышуказанные таблиц
INSERT INTO Customers
VALUES
('Kirill','Bryant','Mapth','kirill@ua.olx',98),
('Carl','Patricio','Santos','Santaclus@present.com',18),
('Nikolas','Saint','Nickolas','mefodiy@opp34.com',48),
('Edward','King','','Oporots@56por.org',28),
('Roger','Macquillin','Giacometti','Radion384ABC@ua.com',38);
INSERT INTO Manufacturers
VALUES
('Manufacturer_1'),
('Manufacturer_2'),
('Manufacturer_3'),
('Manufacturer_4'),
('Manufacturer_5');
INSERT INTO OrderDetails
VALUES
(1,1,120,2300),
(2,2,300,10000),
(3,3,210,4050),
(4,4,50,1200),
(5,5,170,1300);
INSERT INTO Orders
VALUES
('Zuitvel',1,1,1600,3100),
('Bread',2,2,1000,1400),
('Vis',3,3,40,2000),
('Vlees',4,4,500,5400),
('Zoet',5,5,43,1100);
INSERT INTO Products
VALUES
('Onion',1,1,1200,100),
('Kip',2,2,2200,240),
('Donkey',2,2,1220,190),
('Vis',3,3,3400,350),
('Cucucmber',4,4,1900,270);
INSERT INTO Shippers
VALUES
('Nezy','Nezy@monsters.arrg'),
('Petr','Pomidor330@rar.pop'),
('Julyia','Julyia3199@yla.com'),
('Peppy','Persik@popka.43.org'),
('Nikita','NikitaFord@ferz.com');
INSERT INTO TrafficProducts
VALUES
('2023-01-02',1,1,1,200,2300),
('2022-11-12',2,2,2,230,3400),
('2023-07-01',3,3,3,250,4300),
('2022-03-20',4,4,4,400,5300),
('2022-09-21',5,5,5,300,2303);
INSERT INTO TypesProduct
VALUES
('Perfect'),
('Good'),
('Normal'),
('Bad'),
('Sooo bad');

--10. Вывести все данные из представлений:
	
--	ProductView
SELECT  * FROM ProductView
--	CustomersView
SELECT  * FROM CustomersView
--	Agent
SELECT  * FROM Agent
--	TrafficProductsView
SELECT  * FROM TrafficProductsView
--	OrdersView
SELECT  * FROM OrdersView
