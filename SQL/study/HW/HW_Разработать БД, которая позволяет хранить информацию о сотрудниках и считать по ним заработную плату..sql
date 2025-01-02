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
--Тип начисления
--(0 - начисление, 1 - Подох. налог, 
--2 - Военный сбор, 3 - Един.Соц.Взнос.,
--4 - Выплата ЗП, по-умолчанию 0)
-----
--Расчет с учетом отраб. времени
--(0 - Нет, 1 - Да, по-умолчанию 0.)
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
Дата проведения суммы (должно быть первым числом месяца)
---

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
('Мельник','Микита','Іванович','м','1997-09-01',(SELECT Id FROM Position WHERE Id=1),(SELECT Id FROM Department WHERE Id = 1),'2017-09-01',null),
('Вербицький','Владислав','Васильович','м','1998-03-11',(SELECT Id FROM Position WHERE Id=2),(SELECT Id FROM Department WHERE Id = 2),'2020-03-25',null),
('Бондаренко','Ганна','Михайлівна','ж','1990-04-24',(SELECT Id FROM Position WHERE Id=3),(SELECT Id FROM Department WHERE Id = 3),'2015-02-26','2020-07-01'),
('Курбас','Катерина','Володимирівна','ж','1991-01-01',(SELECT Id FROM Position WHERE Id=4),(SELECT Id FROM Department WHERE Id = 4),'2020-01-19',null),
('Кравченко','Ізяслав','Ярославович','м','1995-11-18',(SELECT Id FROM Position WHERE Id=5),(SELECT Id FROM Department WHERE Id = 5),'2020-01-13',null),
('Біленська','Марина','Олександрівна','ж','1995-09-18',(SELECT Id FROM Position WHERE Id=6),(SELECT Id FROM Department WHERE Id = 6),'2019-09-01',null),
('Швець','Святополк','Ігорович','м','1996-06-13',(SELECT Id FROM Position  WHERE Id=7),(SELECT Id FROM Department WHERE Id = 7),'2019-09-01',null),
('Гончар','Наталія','Сергіївна','ж','1993-12-20',(SELECT Id FROM Position  WHERE Id=8),(SELECT Id FROM Department WHERE Id = 8),'2018-03-27','2020-04-18'),
('Мельничук','Міхаїло','Мстиславович','м','1998-05-30',(SELECT Id FROM Position WHERE Id=9),(SELECT Id FROM Department WHERE Id = 9),'2020-07-25',null),
('Лебідь','Олексій','Святославович','м','1992-07-17',(SELECT Id FROM Position WHERE Id=10),(SELECT Id FROM Department WHERE Id = 10),'2019-05-23',null);
 
 /*Январь(1)	Февраль(2)	  Март(3)	Апрель(4)	Май(5)	Июнь(6)	   Июль(7)	Август(8)	Сентябрь(9)   Октябрь(10)	Ноябрь(11)	Декабрь(12)
	21	            20	        20	       21	      21	  18	     23	      21	          21	       22	      21	       21*/
INSERT INTO  Graph -- (мин. 12 записей - с января по декабрь 2020 г.)
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
--21. Вставить данные по таблице Типы начислений\удержаний следующие данные:
--	Оклад - расчет по отраб. времен - 1, тип начисл. - 0 
--	Премия - тип начисл. - 0 
--	Отпуск - тип начисл. - 0 
--	Больн. лист - тип начисл. - 0
--	Надбавка - расчет по отраб. времен, тип начисл. - 0 
--	Оклад - расчет по отраб. времен, тип начисл. - 0 
--	Подох. налог - тип начисл. - 1
--	Военный сбор - тип начисл. - 2
--	Един.Соц.Взнос. - тип начисл. - 3, 
--	Выплата ЗП - тип начисл. - 4,
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
--22. Создать процедуру AddInfoSotrudnikProfit
--	Вставить данные по Типы начислений по сотруднику в таблицу SotrudnikProfit, которая принимает:
--         - целое значение(первичный ключ на таблицу сотрудника),
--	 - целое значение(первичный ключ на таблицу TypeNU),
--	 - вещественное число (сумма по начислению)
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
--23. Вызвать Процедуру AddInfoSotrudnikProfit и по каждому сотруднику в
--таблицу SotrudnikProfit должна добавить:
--		- оклад. Сумму оклада определить при помощи функции rand.
--		- премия. Сумму определить при помощи функции rand.                --?
--	(генерацию случайной суммы необходимо выполнять за 
--	переделами процедуры AddInfoSotrudnikProfit)
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

--28. Создать процедуру CalcTax.
--Процедура принимает целое число (первичный ключ сотрудника) и дату.
--Процедура должна получить все суммы (сложить все суммы) по сотруднику и 
--указанной дате  только по начислениям (например, оклад, премия и т.п.) 
--в таблице Paylist.
--Далее вызвать следующие функции:
--	- CalcPN - п. 25
--	- CalcVZ - п. 26 
--	- CalcESV - п. 27
--Полученные суммы (это удержания)
--из каждой функции занести в таблицу Paylist
--с учетом видов удержаний согласно таблицы TypeNU

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

--29.Создать процедуру расчета ЗП по сотруднику CalcSalary.
--Процедура принимает целое число (первичный ключ сотрудника) и дату.
--По указазанному сотруднику необходимо получить все Начисления
--(таблица SotrudnikProfit).
--Если начисление зависит от отработ. времени, то необходимо:
--		- получить сумму по начислен. (Сумма начисл.)
--		- получить по указ. дате норму из таблицы Graph (Норма)
--		- получить по указ. дате и сотруднику факт. отраб. время из 
--		таблицы Tabelr (Факт.отраб.дни)
--		- посчитать сумму по формуле :
--		((Сумма начисл.)/(Норма))* (Факт.отраб.дни)
--	   Если начисление не зависит,
--	   то расчитываемая сумма равна значению из 
--	   таблицы SotrudnikProfit по указ. сотруднику (поле Сумма оплаты).
--После расчета Начисления - занести данные в таблицу Paylist
--Далее необходимо вызывать процедуру из п.28, которая посчитает 
--налоги по сотруднику
CREATE PROCEDURE CalcSalary
@id int,
@date date
AS
BEGIN
SELECT SUM((pa.Summ/g.Norma_Practicing)*sp.Quarter_days) FROM SotrudnikProfit sp ,TypeNU tp ,Graph g,Tabelr tb,Paylist pa
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=1/*отработаное время -> да*/)


SELECT sp.Price FROM SotrudnikProfit sp ,TypeNU tp 
WHERE (@id=sp.EmployeeId) AND(sp.TypeNUId=tp.Id) AND(tp.Calculation=0/*отработаное время-> нет*/)
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
--30. Создать Процедуру CreateSumForPay, которая  принимает целое число (первичный ключ сотрудника) и дату.
--	ПРоцедура, должна получить:
--	-> сумму начисления по ЗП 
--(!!! только начисления - оклад, премия, и т.п.) 
--за указанный месяц и по указанному сотруднику
--	-> сумму удержаний по ЗП 
--(!!! только удержания - налоги - Подох. налог и Военный сбор.) 
--за указанный месяц и по указанному сотруднику.
--Един.Соц.Взнос в расчет не включаем, т.к. 
--этот налог платит собственник предприятия
-- ->Получить разницу из выше посчитанных сумм.
--Если сумма больше нуля, то занести данные в таблицу Paylist как сумма выплаты.

CREATE PROCEDURE CreateSumForPay
@id int,
@date date
AS 
BEGIN

END;

--31. Создать функцию GetCalcedWageForMonth, которая принимает 
--дату и возвращает таблицу следующего вида:
--	Сотрудник ФИО
--	Должность 
--	Подразделение                   
--	Сумма нач. ЗП
--	Сумма уд. Налогов
--	Сумма выплаты
--	Сумма на руки
--	Данные необходимо получить из таблиц Sotrudnik,
--	Position, Department, Paylist и процедуры CreateSumForPay
--	Данные необходимо вывести по всем сотрудникам.
 CREATE FUNCTION GetCalcedWageForMonth  (@data date)
RETURNS table
AS

RETURN (SELECT em.FirstName,em.SecondName,em.ThirdName ,pos.Name_, d.NameD_,pr.Price,pr.Procent,pr.Quarter_days,pr.TypeNUId
FROM SotrudnikProfit pr,Position pos,Department d ,Employee em WHERE (@data >=em.DateStartWork)AND (@data < em.DateEndWork))


PRINT dbo.GetCalcedWageForMonth ('2022-12-14');

--32. Создать процедуру CalcSalaryFromMontnForAllSotr--!!!
--	Процедура принимает один параметр - Дату расчета 
--(первый день месяца, если дата пришла не первый день месяца
--( например, 05.02.2019), то получить дату первый день месяца 
--(например, 05.02.2019 -> 01.02.2019))
--В процедуре необходимо получить всех сотрудников, 
--которые не уволены и являются принятыми (т.е. работают в данном месяце). 
--По каждому сотруднику необходимо вызвать  процедуру CalcSalary
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
--33. Наполнить данными все таблицы--!!!

--34. Вызвать процедуру CalcSalaryFromMontnForAllSotr
EXEC CalcSalaryFromMontnForAllSotr '2020-03-25'
--35. Вызвать функцию GetCalcedWageForMonth в запросе Select.--!!!
select  dbo.GetCalcedWageForMonth  ('2019-09-01')
