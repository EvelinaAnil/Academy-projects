CREATE DATABASE lHW_WCDB_39pr31;
go 
USE lHW_WCDB_39pr31;
go

CREATE TABLE Employee
(
	Id INT IDENTITY PRIMARY KEY,
	SecondName NVARCHAR(200) NOT NULL,
	FirstName NVARCHAR(200) NOT NULL,
	ThirdName NVARCHAR(200) NOT NULL,
	Gender  NVARCHAR(15) NOT NULL,
	DateBirth Date NOT NULL,
	PositionId INT NULL REFERENCES Position(Id),
	DepartmentId INT NULL REFERENCES Department(Id),
	DateStartWork Date NOT NULL,
	DateEndWork Date  NULL
	
);
---
CREATE TABLE Position --(10)
(
Id INT IDENTITY PRIMARY KEY,
Name_ NVARCHAR(30)
);
-----
CREATE TABLE Department  --(10)
(
Id INT IDENTITY PRIMARY KEY,
NameD_ NVARCHAR(30)
);

----
CREATE TABLE Tabelr   
(
Id INT IDENTITY PRIMARY KEY,
EmployeeId INT NULL REFERENCES Employee(Id),
Date_firstmonthgetal Date NOT NULL,
Practicing   INT
);
----
CREATE TABLE Graph    
(
Id INT IDENTITY PRIMARY KEY,
Date_firstmonthgetal Date NOT NULL,
Norma_Practicing   INT
);
----
 CREATE TABLE TypeNU     
(
Id INT IDENTITY PRIMARY KEY,
Name_ NVARCHAR(300) NOT NULL,
Code INT,
--��� ����������
--(0 - ����������, 1 - �����. �����, 
--2 - ������� ����, 3 - ����.���.�����.,
--4 - ������� ��, ��-��������� 0)
-----
--������ � ������ �����. �������
--(0 - ���, 1 - ��, ��-��������� 0.)
Type_ INT default 0 CHECk (Type_ >=0 AND Type_ <=4 ),
Calculation int default 0 Check (calculation >=0 AND calculation <=1) 
);

CREATE TABLE SotrudnikProfit     
(
Id INT IDENTITY PRIMARY KEY,
EmployeeId INT NULL REFERENCES Employee(Id),
TypeNUId INT NULL REFERENCES TypeNU(Id),
Date_startactive Date NOT NULL DEFAULT GETDATE() ,
Date_endactive Date  NULL,
Quarter_days   INT null,
Price money  ,
Procent money
);
----
CREATE TABLE Paylist      
(
Id INT IDENTITY PRIMARY KEY,
EmployeeId INT NULL REFERENCES Employee(Id),
TypeNUId INT NULL REFERENCES TypeNU(Id),
Summ money null ,
Date_startactive_sum Date default (DATEADD(Day,1,EOMONTH( DATEADD(MONTH, -1,getdate())))),
Date_endactive_sum Date default (DATEADD(Day,1,EOMONTH( DATEADD(MONTH, -1,getdate() )))) ,
Quarter_days   INT null
);
/*
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes' !!!! DEFAULT 0
);
---
ALTER TABLE myTable 
  ADD CONSTRAINT CONSTRAINT_NAME
    DEFAULT GETDATE() FOR myColumn !!!! DEFAULT GETDATE()
---
--https://learn.microsoft.com/ru-ru/sql/t-sql/functions/datediff-transact-sql?view=sql-server-ver16
���� ���������� ����� (������ ���� ������ ������ ������)
---

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
 /*
 SecondName NVARCHAR(30) NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	ThirdName NVARCHAR(30) NOT NULL,
	Gender  NVARCHAR(15) NOT NULL,
	DateBirth Date NOT NULL,
	PositionId INT NULL REFERENCES Position(Id),
	DepartmentId INT NULL REFERENCES Department(Id),
	DateStartWork Date NOT NULL,
	DateEndWork Date  NULL
 */
*/
INSERT INTO Department 
VALUES 
('Yeg_01'),
('Yeg_02'),
('Yeg_03'),
('Yeg_04'),
('Yeg_05'),
('Yeg_06'),
('Yeg_07'),
('Yeg_08'),
('Yeg_09'),
('Yeg_10');

INSERT INTO Position 
VALUES 
('Pos_01'),
('Pos_02'),
('Pos_03'),
('Pos_04'),
('Pos_05'),
('Pos_06'),
('Pos_07'),
('Pos_08'),
('Pos_09'),
('Pos_10');

INSERT INTO  Employee
VALUES        --datebirth                                                      --datestartwork dateendwork
('�������','������','��������','�','1997-09-01',(SELECT Id FROM Position WHERE Id=1),(SELECT Id FROM Department WHERE Id = 1),'2017-09-01',null),
('����������','���������','����������','�','1998-03-11',(SELECT Id FROM Position WHERE Id=2),(SELECT Id FROM Department WHERE Id = 2),'2020-03-25',null),
('����������','�����','���������','�','1990-04-24',(SELECT Id FROM Position WHERE Id=3),(SELECT Id FROM Department WHERE Id = 3),'2015-02-26','2020-07-01'),
('������','��������','������������','�','1991-01-01',(SELECT Id FROM Position WHERE Id=4),(SELECT Id FROM Department WHERE Id = 4),'2020-01-19',null),
('���������','�������','�����������','�','1995-11-18',(SELECT Id FROM Position WHERE Id=5),(SELECT Id FROM Department WHERE Id = 5),'2020-01-13',null),
('���������','������','������������','�','1995-09-18',(SELECT Id FROM Position WHERE Id=6),(SELECT Id FROM Department WHERE Id = 6),'2019-09-01',null),
('�����','���������','��������','�','1996-06-13',(SELECT Id FROM Position  WHERE Id=7),(SELECT Id FROM Department WHERE Id = 7),'2019-09-01',null),
('������','������','���㳿���','�','1993-12-20',(SELECT Id FROM Position  WHERE Id=8),(SELECT Id FROM Department WHERE Id = 8),'2018-03-27','2020-04-18'),
('���������','̳����','������������','�','1998-05-30',(SELECT Id FROM Position WHERE Id=9),(SELECT Id FROM Department WHERE Id = 9),'2020-07-25',null),
('�����','������','�������������','�','1992-07-17',(SELECT Id FROM Position WHERE Id=10),(SELECT Id FROM Department WHERE Id = 10),'2019-05-23',null);
 
 /*������(1)	�������(2)	  ����(3)	������(4)	���(5)	����(6)	   ����(7)	������(8)	��������(9)   �������(10)	������(11)	�������(12)
	21	            20	        20	       21	      21	  18	     23	      21	          21	       22	      21	       21*/
INSERT INTO  Graph -- (���. 12 ������� - � ������ �� ������� 2020 �.)
VALUES 
/*
Date_firstmonthgetal Date NOT NULL,
Norma_Practicing   INT
*/
('2020-01-21',8),
('2020-02-20',8),
('2020-03-20',8),
('2020-04-21',8),
('2020-05-21',8),
('2020-06-18',8),
('2020-07-23',8),
('2020-08-21',8),
('2020-09-21',8),
('2020-10-22',8),
('2020-11-21',8),
('2020-12-21',8);

CREATE TABLE Privilege
(
Id INT IDENTITY PRIMARY KEY,
EmployeeId INT NULL REFERENCES Employee(Id),
Date_startactive Date NOT NULL DEFAULT GETDATE() ,
Date_endactive Date  NULL,
Procent money
);
INSERT INTO  Privilege 
VALUES 
((SELECT Id FROM Employee WHERE DateStartWork='2020-01-13' ),'2020-01-01','2020-04-01',2102.00);
use lHW_WCDB_39pr31
go
CREATE TABLE MinZp 
(
Id INT IDENTITY PRIMARY KEY,
Salary_min money, --
Date_ Date  NULL
);
CREATE TABLE MaxZp  
(
Id INT IDENTITY PRIMARY KEY,
Salary_max money, --
Date_ Date  NULL
);
CREATE TABLE PrivilegeZp   
(
Id INT IDENTITY PRIMARY KEY,
Salary_privelege money, --15%
Date_ Date  NULL
);
INSERT INTO  MinZp 
VALUES 
(4723.00,'2020-01-01');

INSERT INTO  MaxZp 
VALUES 
(10727.00,'2020-01-01');

INSERT INTO  PrivilegeZp 
VALUES 
(1051.00,'2020-01-01');
---//////////////2 Part
--CREATE TABLE Tabel   
--(
--Id INT IDENTITY PRIMARY KEY,
--EmployeeId INT NULL REFERENCES Employee(Id),
--Date_firstmonthgetal Date NOT NULL,
--Practicing   INT
--);
--
--WHILE(@n>0)
--BEGIN
--	SET @f = @f*@n;
--	SET @n = @n-1;
--END

-----2 part
CREATE PROCEDURE AddInfoToTableFromSotrudnik 
@Id INT
AS 
BEGIn
DECLARE @r int 
SET  @r=0
  While @r<=12
  BEGIN
  INSERT INTO  Tabelr
VALUES 
(rand(),rand(),rand());
SET @r= @r+1;
END
END
	EXEC AddInfoToTableFromSotrudnik 1
	EXEC AddInfoToTableFromSotrudnik 2
	EXEC AddInfoToTableFromSotrudnik 3
	EXEC AddInfoToTableFromSotrudnik 4
	EXEC AddInfoToTableFromSotrudnik 5
	EXEC AddInfoToTableFromSotrudnik 6
	EXEC AddInfoToTableFromSotrudnik 7
	EXEC AddInfoToTableFromSotrudnik 8
	EXEC AddInfoToTableFromSotrudnik 9
SELECT * FROM Tabelr
-----
--21. �������� ������ �� ������� ���� ����������\��������� ��������� ������:
--	����� - ������ �� �����. ������ - 1, ��� ������. - 0 
--	������ - ��� ������. - 0 
--	������ - ��� ������. - 0 
--	�����. ���� - ��� ������. - 0
--	�������� - ������ �� �����. ������, ��� ������. - 0 
--	����� - ������ �� �����. ������, ��� ������. - 0 
--	�����. ����� - ��� ������. - 1
--	������� ���� - ��� ������. - 2
--	����.���.�����. - ��� ������. - 3, 
--	������� �� - ��� ������. - 4,
INSERT INTO TypeNU 
Values
('Salary',1,0,1 ),
('Award',2,0,0 ),
('Vacation',3,0,0 ),
('Sick. sheet',4,0,0 ),
('Surcharge',5,0,1 ),
('Salary',6,0,1 ),
('Military tax',7,1,0 ),
('Down. tax',8,2,0 ),
('United Social Contribution',9,3,0 ),
('Payment of salary',10,4,0 );

SELECT *FROM TypeNU;
-----
--22. ������� ��������� AddInfoSotrudnikProfit
--	�������� ������ �� ���� ���������� �� ���������� � ������� SotrudnikProfit, ������� ���������:
--         - ����� ��������(��������� ���� �� ������� ����������),
--	 - ����� ��������(��������� ���� �� ������� TypeNU),
--	 - ������������ ����� (����� �� ����������)
CREATE PROCEDURE AddInfoSotrudnikProfit
@idemployer int,
@idTypeNu int,
@money money
AS 
BEGIN
INSERT INTO SotrudnikProfit (EmployeeId,TypeNUId,Price)
  VAlues
  (@idemployer,@idTypeNu,@money);
END;

	EXEC AddInfoSotrudnikProfit 1,1,160
	SELECT * FROM SotrudnikProfit
-----
SELECT * FROM Employee
--23. ������� ��������� AddInfoSotrudnikProfit � �� ������� ���������� �
--������� SotrudnikProfit ������ ��������:
--		- �����. ����� ������ ���������� ��� ������ ������� rand.
--		- ������. ����� ���������� ��� ������ ������� rand.                --?
--	(��������� ��������� ����� ���������� ��������� �� 
--	���������� ��������� AddInfoSotrudnikProfit)
EXEC AddInfoSotrudnikProfit 1,1,1600
INSERT INTO SotrudnikProfit
VALUES 
(1,0,'1997-12-12','2024-12-12',24,rand(),rand());
-----
CREATE FUNCTION FullNameSotrudnik(@Id int)
returns Table  
AS

 RETURN(SELECT SecondName,FirstName,ThirdName FROM [dbo].Employee r Where @Id =r.Id)

Go
--
SELECT * FROM  dbo.FullNameSotrudnik(1);
------
CREATE FUNCTION CalcPN (@price MONEY)
RETURNS MONEY 
AS
BEGIN
DEclare
@nds MONEY = @price*0.18;
RETURN @nds;
END;

PRINT dbo.CalcPN(120);
 -----
 CREATE FUNCTION CalcVZ (@price MONEY)
RETURNS MONEY
AS
BEGIN
DEclare
@nds MONEY = @price*0.015;
RETURN @nds;
END;

PRINT dbo.CalcVZ(120);
------
 CREATE FUNCTION CalcESV  (@price MONEY)
RETURNS MONEY
AS
BEGIN
DEclare
@nds MONEY = @price*0.22;
RETURN @nds;
END;

PRINT dbo.CalcESV (120);

--28. ������� ��������� CalcTax.
--��������� ��������� ����� ����� (��������� ���� ����������) � ����.
--��������� ������ �������� ��� ����� (������� ��� �����) �� ���������� � 
--��������� ����  ������ �� ����������� (��������, �����, ������ � �.�.) 
--� ������� Paylist.
--����� ������� ��������� �������:
--	- CalcPN - �. 25
--	- CalcVZ - �. 26 
--	- CalcESV - �. 27
--���������� ����� (��� ���������)
--�� ������ ������� ������� � ������� Paylist
--� ������ ����� ��������� �������� ������� TypeNU

CREATE PROCEDURE CalcTax 
@id int,
	 @date date 
	AS BEGIN 
	PRINT @date;
	SELECT SUM(sp.Price*sp.Procent) FROM Employee e  ,SotrudnikProfit sp WHERE (e.Id = @id) AND (@date >=e.DateStartWork) AND ( @date <e.DateEndWork)
	AND (e.Id=sp.EmployeeId) 
	PRINT dbo.CalcPN(25);
	PRINT dbo.CalcVZ(26);
	PRINT dbo.CalcESV (27);
	INSERT INTO Paylist (Summ)
	VALUES
	(dbo.CalcPN(25)),
	(dbo.CalcVZ(26)),
	(dbo.CalcESV (27));
	END;

--29.������� ��������� ������� �� �� ���������� CalcSalary.
--��������� ��������� ����� ����� (��������� ���� ����������) � ����.
--�� ������������ ���������� ���������� �������� ��� ����������
--(������� SotrudnikProfit).
--���� ���������� ������� �� �������. �������, �� ����������:
--		- �������� ����� �� ��������. (����� ������.)
--		- �������� �� ����. ���� ����� �� ������� Graph (�����)
--		- �������� �� ����. ���� � ���������� ����. �����. ����� �� 
--		������� Tabelr (����.�����.���)
--		- ��������� ����� �� ������� :
--		((����� ������.)/(�����))* (����.�����.���)
--	   ���� ���������� �� �������,
--	   �� ������������� ����� ����� �������� �� 
--	   ������� SotrudnikProfit �� ����. ���������� (���� ����� ������).
--����� ������� ���������� - ������� ������ � ������� Paylist
--����� ���������� �������� ��������� �� �.28, ������� ��������� 
--������ �� ����������
CREATE PROCEDURE CalcSalary
@id int,
@date date
AS
BEGIN
SELECT SUM((pa.Summ/g.Norma_Practicing)*sp.Quarter_days) FROM SotrudnikProfit sp ,TypeNU tp ,Graph g,Tabelr tb,Paylist pa
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=1/*����������� ����� -> ��*/)


SELECT sp.Price FROM SotrudnikProfit sp ,TypeNU tp 
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=0/*����������� �����-> ���*/)
INSERT INTO Paylist(Quarter_days,Summ)
VALUES 
((SELECT sp.Quarter_days FROM SotrudnikProfit sp ,TypeNU tp 
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=0)),(SELECT sp.Price FROM SotrudnikProfit sp ,TypeNU tp 
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=0) ));
INSERT INTO Paylist(Quarter_days,Summ)
VALUES 
((SELECT sp.Quarter_days FROM SotrudnikProfit sp ,TypeNU tp 
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=1)),(SELECT sp.Price FROM SotrudnikProfit sp ,TypeNU tp 
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=1) ));
EXEC CalcTax @id,@date
END;
---3 part
--30. ������� ��������� CreateSumForPay, �������  ��������� ����� ����� (��������� ���� ����������) � ����.
--	���������, ������ ��������:
--	-> ����� ���������� �� �� 
--(!!! ������ ���������� - �����, ������, � �.�.) 
--�� ��������� ����� � �� ���������� ����������
--	-> ����� ��������� �� �� 
--(!!! ������ ��������� - ������ - �����. ����� � ������� ����.) 
--�� ��������� ����� � �� ���������� ����������.
--����.���.����� � ������ �� ��������, �.�. 
--���� ����� ������ ����������� �����������
-- ->�������� ������� �� ���� ����������� ����.
--���� ����� ������ ����, �� ������� ������ � ������� Paylist ��� ����� �������.

CREATE PROCEDURE CreateSumForPay
@id int,
@date date
AS 
BEGIN

END;

--31. ������� ������� GetCalcedWageForMonth, ������� ��������� 
--���� � ���������� ������� ���������� ����:
--	��������� ���
--	��������� 
--	�������������                   
--	����� ���. ��
--	����� ��. �������
--	����� �������
--	����� �� ����
--	������ ���������� �������� �� ������ Sotrudnik,
--	Position, Department, Paylist � ��������� CreateSumForPay
--	������ ���������� ������� �� ���� �����������.
 CREATE FUNCTION GetCalcedWageForMonth  (@data date)
RETURNS table
AS

RETURN (SELECT em.FirstName,em.SecondName,em.ThirdName ,pos.Name_, d.NameD_,pr.Price,pr.Procent,pr.Quarter_days,pr.TypeNUId
FROM SotrudnikProfit pr,Position pos,Department d ,Employee em WHERE (@data >=em.DateStartWork)AND (@data < em.DateEndWork))


PRINT dbo.GetCalcedWageForMonth ('2022-12-14');

--32. ������� ��������� CalcSalaryFromMontnForAllSotr--!!!
--	��������� ��������� ���� �������� - ���� ������� 
--(������ ���� ������, ���� ���� ������ �� ������ ���� ������
--( ��������, 05.02.2019), �� �������� ���� ������ ���� ������ 
--(��������, 05.02.2019 -> 01.02.2019))
--� ��������� ���������� �������� ���� �����������, 
--������� �� ������� � �������� ��������� (�.�. �������� � ������ ������). 
--�� ������� ���������� ���������� �������  ��������� CalcSalary
CREATE PROCEDURE CalcSalaryFromMontnForAllSotr 
	 @date date 
	AS BEGIN 

	SET @date = (DATEADD(Day,1,EOMONTH( DATEADD(MONTH, -1,@date ))));
	PRINT @date;
SELECT * FROM Employee em WHERE(@date>=em.DateStartWork) AND(@date<em.DateEndWork)
	EXEC CalcSalary 1,@date
	EXEC CalcSalary 2,@date
	EXEC CalcSalary 3,@date
	EXEC CalcSalary 4,@date
	EXEC CalcSalary 5,@date
	EXEC CalcSalary 6,@date
	EXEC CalcSalary 7,@date
	EXEC CalcSalary 8,@date
	EXEC CalcSalary 9,@date
	END;
--33. ��������� ������� ��� �������--!!!

--34. ������� ��������� CalcSalaryFromMontnForAllSotr
EXEC CalcSalaryFromMontnForAllSotr '2020-03-25'
--35. ������� ������� GetCalcedWageForMonth � ������� Select.--!!!
select  dbo.GetCalcedWageForMonth  ('2019-09-01')
