CREATE DATABASE e02PR31_calcService_Fam;
go
use e02PR31_calcService_Fam;
go
CREATE TAble Countries
(
   Id INT IDENTITY PRIMARY KEY,
   Name_ NVARCHAR(200) NOT NULL --Where (Name_ not like '__')
--Ќазвание 
--(добавить ограничение - не может принимать null и строка не
--может содержать менее 1 символа)
   );
CREATE TAble Cities
(
   Id INT IDENTITY PRIMARY KEY,
   Name_ NVARCHAR(200) ,
   IdCountry INT NULL REFERENCES Countries(Id),

);
CREATE TAble Streets
(
   Id INT IDENTITY PRIMARY KEY,
   Name_ NVARCHAR(200) ,
   IdCity INT NULL REFERENCES Cities(Id),

);
INSERT INTO  Countries
VALUES 
('Andorra'),
('Canada'),
('Ukraine'),
('Venezuela'),
('Zambia');
--
INSERT INTO  Cities
VALUES 
('Encamp',null), --Andorra
('Toronto ',null),
('Kharkiv',null),
('Caracas',null),
('Lusaka ',null);
--
INSERT INTO  Streets
VALUES 
('13 Carrer',null),
('104 Birchmount Road',null),
('3C Pletnivskyi Lane',null),
('Street View',null),
('ChaChaCha',null); --Lusaka
----
----
--USE AdventureWorks2012 ;   
--GO  
--CREATE VIEW HumanResources.EmployeeHireDate  
--AS  
--SELECT p.FirstName, p.LastName, e.HireDate  
--FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
--ON e.BusinessEntityID = p.BusinessEntityID ;   
--GO  
---- Query the view  
--SELECT FirstName, LastName, HireDate  
--FROM HumanResources.EmployeeHireDate  
--ORDER BY LastName;  
--
/*6,7*/
use e02PR31_calcService_Fam;
go
CREATE VIEW  CountryCityStreets 
AS
SELECT s.Id As Id ,(  c.Name_+' '+ci.Name_+' '+s.Name_ )  
as FullAdress 
FROM Streets s ,Cities ci ,Countries c 
Left JOIN Streets ON Streets.IdCity  = Streets.IdCity
Left JOIN Cities ON Streets.IdCity  = Cities.Id
Left JOIN Countries ON Cities.IdCountry = Countries.Id
go
drop view CountryCityStreets
---
--=-
SELECT * FROM CountryCityStreets; 
--------------
CREATE TAble PersonalAccount
(
   Id INT IDENTITY PRIMARY KEY,
   MiddleName NVARCHAR(200)Not null ,
    FirstName NVARCHAR(200)Not null,
	 LastName NVARCHAR(200)Not null,
	 gender nvarchar(10) not null,
	 DateBirth Date,
	 IdCountryCityStreets INT NULL,
);
DROP TABLE PersonalAccount;
select * FROM PersonalAccount;

INSERT INTO  PersonalAccount 
VALUES 
('Kirstian','James','Smith','male','1997-12-09',1),
('Charlotte','Louise','Harris','female','1987-10-26',2),
('Liam','Thomas','Brown','male','1966-03-01',3),
('Olivia','Grace','Garcia','female','1988-12-20',4),
('Oliver','William','Miller','male','1977-05-16',5);



---
CREATE TAble TypeMeteringDevices
(
   Id INT IDENTITY PRIMARY KEY,
   Name_ NVARCHAR(200) NOT NULL UNIQUE  ,

);
--11
CREATE TABLE Accounting_Hot_water(
 Id INT IDENTITY PRIMARY KEY,
  IdPersonalAccount INT NULL REFERENCES PersonalAccount(Id),
	 IdTypeMeteringDevices INT NULL REFERENCES TypeMeteringDevices(Id),
	 Date_end_counter date,
 Hot_water int,
);
CREATE TABLE Accounting_Cold_water(
 Id INT IDENTITY PRIMARY KEY,
   IdPersonalAccount INT NULL REFERENCES PersonalAccount(Id),
	 IdTypeMeteringDevices INT NULL REFERENCES TypeMeteringDevices(Id),
	 Date_end_counter date,
 Cold_water int,
);
CREATE TABLE Accounting_Energy(
 Id INT IDENTITY PRIMARY KEY,
   IdPersonalAccount INT NULL REFERENCES PersonalAccount(Id),
	 IdTypeMeteringDevices INT NULL REFERENCES TypeMeteringDevices(Id),
	 Date_end_counter date,
 Energy int,
);
CREATE TABLE Accounting_Gas(
 Id INT IDENTITY PRIMARY KEY,
   IdPersonalAccount INT NULL REFERENCES PersonalAccount(Id),
	 IdTypeMeteringDevices INT NULL REFERENCES TypeMeteringDevices(Id),
	 Date_end_counter date,
 Gas int,
);
--
CREATE TAble PersonalAccountJournalMeteringDevice
(
   Id INT IDENTITY PRIMARY KEY,
   Name_ NVARCHAR(200) NOT NULL UNIQUE  ,
   Date_ Date Default 
   (DATEADD(Day,1,EOMONTH( DATEADD(MONTH, -1,getdate() )))),
   Service_value int Not null check (Service_value>0),

);
CREATE TAble PersonalAccountMeteringDevice
(
   Id INT IDENTITY PRIMARY KEY,
    IdPersonalAccount INT NULL REFERENCES PersonalAccount(Id),
	 IdTypeMeteringDevices INT NULL REFERENCES TypeMeteringDevices(Id),
   Date_start Date Not null default getdate() ,
   Date_end Date Not null default DATEADD(yy,100,getdate()), 
   Service_value int  null check (Service_value>=0),

);
CREATE TAble PersonalAccountMeteringDeviceValues
(
   Id INT IDENTITY PRIMARY KEY,
    IdPersonalAccountMeteringDevice INT NULL REFERENCES PersonalAccountMeteringDevice(Id),
   Date_ Date  Default 
   (DATEADD(Day,1,EOMONTH( DATEADD(MONTH, -1,getdate() )))), 
   Service_value int Not null check (Service_value>=0),

);


	CREATE PROCEDURE AddMeteringDeviceToPersonalAccount --!))
	@IDPersonalAccount int ,
	@IDTypeMeteringDevices int,
	@Date_Start_counter date,
	@Date_end_counter date,
	@Service_value int,
	@First_testimony_counter int
	AS BEGIN 

	INSERT PersonalAccountMeteringDevice
	Values 
	(@IDPersonalAccount,@IDTypeMeteringDevices,
	@Date_Start_counter,
	@Date_end_counter,@Service_value);

	INSERT PersonalAccountMeteringDeviceValues
	Values (@IDTypeMeteringDevices,@Date_Start_counter,
	@Service_value);

	END;

--16
DECLARE 
@idd int ,
@id int ,
@ress INT;
	EXEC @ress = AddMeteringDeviceToPersonalAccount @idd ,@id  ,'2022-12-29','2022-12-20',160,100

	SELECT * FROM PersonalAccountMeteringDevice
	SELECT * FROM PersonalAccountMeteringDeviceValues
--17
CREATE PROCEDURE AddValuesToMeteringDevicePersonalAccount --!))
@IDPersonalAccount Int,
@IDTypeMeteringDevices int,
@Date_end_counter date,
@Testimony_counter int
As Begin
INSERT Accounting_Cold_water
Values (@IDPersonalAccount,@IDTypeMeteringDevices,@Date_end_counter,
@Testimony_counter);

INSERT Accounting_Hot_water
Values (@IDPersonalAccount,@IDTypeMeteringDevices,@Date_end_counter,
@Testimony_counter);

INSERT Accounting_Energy
Values (@IDPersonalAccount,@IDTypeMeteringDevices,@Date_end_counter,
@Testimony_counter);

INSERT Accounting_Gas
Values (@IDPersonalAccount,@IDTypeMeteringDevices,@Date_end_counter,
@Testimony_counter);
end;
--18
CREATE TRIGGER PersonalAccountMeteringDeviceValues_insert
ON PersonalAccountMeteringDeviceValues
FOR UPDATE
NOT FOR REPLICATION
AS
BEGIN
  INSERT INTO PersonalAccountJournalMeteringDevice
  VAlues
  ('Sybrian','13-11-1997',160);
END;

--19
DECLARE 
@idd int ,
@id int ,
@ress INT;
	EXEC @ress = AddValuesToMeteringDevicePersonalAccount @idd ,@id  ,'2022-12-29',160

	SELECT * FROM Accounting_Cold_water
	SELECT * FROM Accounting_Hot_water
	SELECT * FROM Accounting_Energy
	SELECT * FROM Accounting_Gas