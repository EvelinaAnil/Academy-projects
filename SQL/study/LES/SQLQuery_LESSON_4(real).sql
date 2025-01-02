CREATE DATABASE l04_39pr31;
go

CREATE DATABASE l04_39pr31_2
ON PRIMARY
(
name=l04_39pr31_2,
filename='E:\ØÀÃ\SQL\l04_39pr31_2.mdf',
size = 12MB,
maxsize= 20MB,
filegrowth= 2MB
)
LOG ON
(
name=l04_39pr31_2_Log,
filename='E:\ØÀÃ\SQL\l04_39pr31_2_Log.ldf',
size = 2MB,
maxsize= 11MB,
filegrowth= 1MB

)

COLLATE Latin1_General_CI_AI;

--ALTER--(change)
ALTER DATABASE l04_39pr31_2
ADD FILE
(
name=l04_39pr31_22,
filename='E:\ØÀÃ\SQL\l04_39pr31_22.mdf',
size = 12MB,
maxsize= 20MB,
filegrowth= 2MB
);
---
--DROP--(delete)
DROP DATABASE l04_39pr31_2;

CREATE DATABASE contactsdb
ON PRIMARY(FILENAME='E:\ØÀÃ\SQL\contactsdb.mdf')
FOR ATTACH;
--
CREATE DATABASE l04_39pr31;
go
--
--CREATE TABLE name_table
USE l04_39pr31;
go
CREATE TABLE Custumers1
(
ID INT,
AGE INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100),
Phone VARCHAR(20)
)
--
CREATE TABLE Custumers2
(
ID INT PRIMARY KEY IDENTITY(1,10),
AGE INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100),
Phone VARCHAR(20)
)
--
CREATE TABLE Custumers3
(
ID INT  IDENTITY(1,10),
AGE INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100),
Phone VARCHAR(20),

PRIMARY KEY(ID)
);
--
CREATE TABLE OrderLines01
(
OrderId INT,
ProId INT,
QUID INT,
PRicwId INT,
PRIMARY KEY (OrderId,ProId)
);
--
CREATE TABLE Custumers4
(
ID INT  IDENTITY(1,10),
AGE INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(20) UNIQUE,

PRIMARY KEY(ID)
);
--
CREATE TABLE Custumers5
(
ID INT  IDENTITY(1,10),
AGE INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(20) UNIQUE,
SPassport NVARCHAR(2) ,
NPassport NVARCHAR(6) ,

PRIMARY KEY(ID),
UNIQUE(SPassport,NPassport)
);
--
CREATE TABLE Custumers6
(
ID INT  IDENTITY(1,10),
AGE INT NOT NULL DEFAULT 18,
FName NVARCHAR(20)  NULL,
LNAME NVARCHAR(20),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(20) UNIQUE,
SPassport NVARCHAR(2) ,
NPassport NVARCHAR(6) ,

PRIMARY KEY(ID),
UNIQUE(SPassport,NPassport)
);
--
CREATE TABLE Custumers7
(
ID INT  IDENTITY(1,10),
AGE INT NOT NULL DEFAULT 18 CHECK(Age>=18 AND Age<100),
FName NVARCHAR(20)  NULL,
LNAME NVARCHAR(20),
Email VARCHAR(100) UNIQUE CHECK(LEN(Email)>0),
Phone VARCHAR(20) UNIQUE,
SPassport NVARCHAR(2) ,
NPassport NVARCHAR(6) ,

PRIMARY KEY(ID),
UNIQUE(SPassport,NPassport)
);
--
CREATE TABLE Custumers8
(
ID INT  IDENTITY(1,10),
AGE INT NOT NULL DEFAULT 18 ,
FName NVARCHAR(20)  NULL,
LNAME NVARCHAR(20),
Email VARCHAR(100) UNIQUE ,
Phone VARCHAR(20) UNIQUE,
SPassport NVARCHAR(2) ,
NPassport NVARCHAR(6) ,

PRIMARY KEY(ID),
UNIQUE(SPassport,NPassport),
CHECK((Age>=18 AND Age<100)AND (LEN(Email)>0))
);
--
CREATE TABLE Custumers9
(
ID INT  IDENTITY(1,10),
AGE INT NOT NULL CONSTRAINT DF_Custumers9_Age DEFAULT 18 ,
FName NVARCHAR(20)  NULL,
LNAME NVARCHAR(20),
Email VARCHAR(100) CONSTRAINT UQ_Custumers9_Email UNIQUE ,
Phone VARCHAR(20) CONSTRAINT UQ_Custumers9_Phone UNIQUE,
SPassport NVARCHAR(2) ,
NPassport NVARCHAR(6) ,

CONSTRAINT PK_Custumers9_ID PRIMARY KEY(ID),
CONSTRAINT  UQ_Custumers9_Passport UNIQUE(SPassport,NPassport),
CONSTRAINT CK_Custumers9_Age_Email CHECK((Age>=18 AND Age<100)AND (LEN(Email)>0))
);
---
CREATE TABLE Orders0_9
(
id INT PRIMARY KEY IDENTITY,
CustumerID INT REFERENCES Custumers9(id),
Created Date DEFAULT GETDATE()
)
--
CREATE TABLE Orders0_9_1
(
id INT PRIMARY KEY IDENTITY,
CustumerID INT,
Created Date DEFAULT GETDATE(),

FOREIGN KEY(CustumerID)  REFERENCES Custumers9(id)
)
--
CREATE TABLE Orders0_9_2
(
id INT PRIMARY KEY IDENTITY,
CustumerID INT,
Created Date DEFAULT GETDATE(),

CONSTRAINT FK_Orders0_9_2_To_Custumers9 FOREIGN KEY(CustumerID)  REFERENCES Custumers9(id)
)
--
CREATE TABLE Orders0_9_3
(
id INT CONSTRAINT PK_Orders0_9_3_Id PRIMARY KEY IDENTITY,
CustumerID INT,
Created Date DEFAULT GETDATE(),

CONSTRAINT FK_Orders0_9_3_To_Custumers9 FOREIGN KEY(CustumerID)  REFERENCES Custumers9(id)
)
--
CREATE TABLE Orders0_9_4
(
id INT  PRIMARY KEY IDENTITY,
CustumerID INT /*,*/ DEFAULT 2 NOT NULL, --DEFAULT 2 NOT NULL --
Created Date DEFAULT GETDATE(),

FOREIGN KEY(CustumerID)  REFERENCES Custumers9(id)
ON DELETE SET DEFAULT--ON DELETE CASCADE --ON DELETE SET NULL --ON DELETE NO ACTION
ON UPDATE NO ACTION --ON UPDATE SET NULL --ON UPDATE SET DEFAULT
)
---
--ALTER (CHANGE TABLE)

ALTER TABLE Custumers2
ADD 
SPassport NVARCHAR(2),
 NPassport NVARCHAR(2);

 ALTER TABLE Custumers2
ALTER COLUMN
SPassport NVARCHAR(3);

 ALTER TABLE Custumers2
ALTER COLUMN
 NPassport NVARCHAR(6);

  ALTER TABLE Custumers2
DROP COLUMN NPassport;

--add îãðàíè÷åíèÿ CHECK
 ALTER TABLE Custumers02
 ADD CHECK (Age >21);
 --

 --DROP
 DROP TABLE Custumers1;

  DROP TABLE Custumers9;
  --
  EXECUTE sp_rename 'Custumer2','OrderLinea01'
  --
  CREATE SCHEMA HR;

  create table testTable (id int not null,number int);
    create table HR.testTable (id int not null,number int);
	--create schema eople authorization Pupkin;
	--
	SELECT * FROM HR.testTable
	--
	DROP SCHEMA HR--unavaileble!!
	--
	CREATE TYPE d_name from VARCHAR(20) NOT NULL
	--
	    create table testTable2 (id int not null,number int, t d_name);
		---
		create default my_def_int as 5
		go
		--
		create rule rule_int as @ivar >=0
		go
