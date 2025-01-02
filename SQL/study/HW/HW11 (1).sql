--1. ������� �� MyShopDB06
CREATE DATABASE MyShopDB06;
go
use MyShopDB06;

--2. ������� ��������� ������� � ��

--	Manufacturers
--		Id		PK
--		Name -	������ 40 ��������, ������������ 
CREATE Table Manufacturers(
Id INT IDENTITY PRIMARY KEY,
NameM NVARCHAR(40) NOT NULL,
);
--	TypesProduct
--		Id		PK
--		Name -	������ 50 �������� , ������������
CREATE Table TypesProduct(
Id INT IDENTITY PRIMARY KEY,
Nametp NVARCHAR(50) NOT NULL,
);
--	Shippers
--		Id		PK
--		Name -	������ 45 �������� , ������������
--		Email	������ 55 �������� , ������������, ����������
CREATE Table Shippers(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(45) NOT NULL,
Email VARCHAR(55) NOT NULL  UNIQUE
);
--	Customers
--		Id		PK
--		FN		������ 30 �������� , ������������
--		LN		������ 30 �������� , ������������
--		MN		������ 30 �������� , ����� ���� ������
--		Email	������ 35 �������� , ������������, ����������
--		Age		�������, �� ��������� 16
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
--		Model			������ 30 ��������, ������������
--		IdTypeProduct	FK �� ������� TypesProduct, ��������� ��������
--		IdManufacturer	FK �� ������� Manufacturers, ��������� ��������
--		Price			��������� ������, ������������
--		ProductCount	�-�� ������ �� ������, �� ��������� = 0
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
--		NumberOrder		������ 25 �������� ������������� �����, ������������
--		DateOrder		���� ������ (���� + �����), ������������, �� ���������  = ��������� ���� 
--		IdCustomer		FK �� ������� Customers, ��������� ��������
--		OrderPrice		����� ������, �� - ��������� 0
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
--		IdOrder			FK �� ������� Orders, ��������� ��������, ������������
--		IdProduct		FK �� ������� Products, ��������� ��������, ������������
--		CountProduct	�-�� ������, ������������, �� ��������� - 1
--		Price			����, ������������
CREATE Table OrderDetails(
Id INT IDENTITY PRIMARY KEY,
IdOrder INT NULL REFERENCES Orders(Id),
IdProduct INT NULL REFERENCES Products(Id),
CountProduct int NOT NULL Default 1,
Price money NOT NULL,
);
--	TrafficProducts
--		Id				PK
--		DateTraffic		����, ��-��������� - ��������� ����
--		IdAgent			int, ������������
--		TypeAgent		int, ������������, ��-��������� - 1
--		IdProduct		FK �� ������� Products, ������������
--		ProductCount	�-�� ������, ������������, �� ��������� - 1
--		Price			����, ������������
CREATE Table TrafficProducts(
Id INT IDENTITY PRIMARY KEY,
DateTraffic Date ,
IdAgent INT NOT NULL ,
TypeAgent INT NOT NULL DEFAULT 1, 
IdProduct INT NULL REFERENCES Products(Id),
CountProduct int NOT NULL Default 1,
Price money NOT NULL,
);
--3. ������� ��������� ������������� � ��:

--	ProductView		(���������� �������: Manufacturers, TypesProduct, Products. 
--						������ ���� ��������� ����:
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


	--CustomersView	(���������� � ���� ���� ������ � ��� �� ����. Customers,
	--					������� �� �����: Id, Name, Email)
CREATE VIEW CustomersView
AS		
	SELECT s.Id,s.FirstName,s.LastName,s.MiddleName,s.Email 
FROM Customers s
SELECT * FROM CustomersView
	--Agent			(���������� 2 �������: Shippers, CustomersView. �������� � ������������� 
	--					���� TypeAgent: 1 - ��� Customers, 2 - ��� Shippers)
	CREATE VIEW Agent
	AS
	SELECT TypeAgent
FROM Shippers sh,CustomersView,TrafficProducts
WHERE (TypeAgent =1)OR(TypeAgent =2 )

	--TrafficProductsView (������������� ������ �������� ������:
	--					 ����, 
	--					 �������� ������, 
	--					 ��� ������, ��� ������ (����������/���������)
	--					 �-��,
	--					 ���� )
		CREATE VIEW TrafficProductsView
	AS
	SELECT DateTraffic,  sh.Name,s.FirstName,s.MiddleName,s.LastName,TypeAgent,o.CountProduct ,ss.Price
FROM Shippers sh,CustomersView,Customers s,TrafficProducts,ProductView ss,OrderDetails o

	--OrdersView		(������������� ������ �������� ������:
	--					 ����,
	--					 ����� ������ 
	--					 �������� ������, 
	--					 ��� ����������
	--					 �-��,
	--					 ���� )
		CREATE VIEW OrdersView
	AS
	SELECT tpr.DateTraffic,cts.Model,tp.Nametp,FirstName,MiddleName,LastName,Orders.Price,cts.ProductCount
FROM Orders,TypesProduct tp,Customers,Products cts,TrafficProducts tpr
--4.������� ��������� CreateRecHistoryLog, 
--������� ����� ��������� ������ � ������� HistoryLog (�.5). --!!))
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

--5. ��� ������ ������� ������� ������� �� ���������������� ��������� ������
--		������ ������ ��������� � ������� HistoryLog
	CREATE TABLE HistoryLog(	
   Id INT IDENTITY PRIMARY KEY,
    NameTable  NVARCHAR(200) NOT NULL,
    TypeOperation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE());
--	� �������� �������� ��������� CreateRecHistoryLog
CREATE TRIGGER _CreateRecHistoryLog
ON OrderDetails
INSTEAD OF INSERT
AS
EXEC CreateRecHistoryLog 'Name','TypeOperation','2022-12-31';

--6. ��� ������� TrafficProducts ������� ������� �� ���������� ������
--	���� ����� �������� ��� ��� ������, �� �������� �-�� ���������������� ������ � ������� Product
CREATE TRIGGER _TrafficProducts_insert_refresh
ON TrafficProducts 
INSTEAD OF INSERT
AS
INSERT INTO TrafficProducts
VALUES
('2023-01-02',1,1,(SELECT Id FROM Products),100,1600);
UPDATE Products SET ProductCount = 100 ; 

--7. ������� ������� CalcOrderPrice, ������� ��������� Id ������
CREATE FUNCTION CalcOrderPrice (@id int)
returns int
AS
BEGIN
Return @id;
END;
--8.  ��� ������� OrderDetails ������� ������� �� ���������� ������
--		��� ���������� ������ � ������� OrderDetails, ������ ������ � ������� � ������� 
--		TrafficProducts � ���������� ���� OrderPrice � ������� Orders. ������������ ������� �� �. 7.
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

--9. ��������� ���������� ������� � ������������ ������
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

--10. ������� ��� ������ �� �������������:
	
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
