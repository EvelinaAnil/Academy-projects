USE [02_39pr31];
/*
Много 
строчный 
коммент
*/
--Одностроч коммент

--SQL DML--(обновление del select)
--SELECT
SELECT * FROM Groups  -- (*)->вывод всего(-уменьшение производительности в екзам ИЗБЕГАТЬ!!)
--
SELECT GroupName FROM Groups --(..)->вывод конкрекного значения
--+++++++
SELECT ID,GroupName FROM Groups --Замурчательно!!
--+++++++
SELECT ID,GroupName,'Groupe: ' + GroupName AS [Инфо о группе] FROM Groups  --AS ("lHLDWL""")->name stolb 
--[...]->если пробел в имени
SELECT ID,GroupName,'Groupee: ' + GroupName AS [Инфо о группе] FROM [02_39pr31].[dbo].[Groups]
-----------------------------------------------=================================================
--INSERT(add or edit)
--INSERT [INTO] name_tabl [(list_tables)] VALUES (знач1,знач2,....)
INSERT INTO Groups (GroupName) VALUES ( 'Group_601:'); 
 SELECT * FROM Groups
 ---------
  SELECT * FROM Students
  INSERT Students (FirstName,LastName,MiddleName,Email,Phone,Age,IDGroup) VALUES ( 'Ivan','Ivanov','Pupkinovich','Ivan@gml.org','+38009',40,1); 
    SELECT * FROM Students
 INSERT Students  VALUES ( 'Iva','Ivak','Indukovich','Ivan@gmlaik.org','+3800889',40,1); --без (первое имя,...),НО ЛУЧШЕ ПИСАТЬ!!
 SELECT * FROM Students
 --================
  INSERT Students (FirstName,LastName,MiddleName,Email,Phone,Age,IDGroup)
  VALUES 
  ( 'Oleg','Ivanov','Pupkinovich','Ivan@gm4.org','+3808609',58,2),
  ( 'Petr1','Ivanov','Pupkinovich','Ivan@gm5.org','+3806709',49,2),
  ( 'Ricar','Ivanov','Pupkinovich','Ivan@gm6.org','+38456009',40,2)
  ; 
   SELECT * FROM Students
   --================--================--================--================--================--================
   CREATE TABLE Products2
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) DEFAULT 'temp_name',
    Manufacturer NVARCHAR(20) DEFAULT 'temp_Manufacturer',
    ProductCount INT DEFAULT 0,
    Price MONEY DEFAULT 100
)
--
INSERT Products2 DEFAULT VALUES
--
SELECT * FROM Products2
 --================--================--================--================--================--================
SELECT * FROM Students
WHERE Age >=41 AND Age <=58   --1-5 do in hw ----
 SELECT * FROM Students   
