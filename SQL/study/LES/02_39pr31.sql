USE [02_39pr31];
/*
����� 
�������� 
�������
*/
--��������� �������

--SQL DML--(���������� del select)
--SELECT
SELECT * FROM Groups  -- (*)->����� �����(-���������� ������������������ � ����� ��������!!)
--
SELECT GroupName FROM Groups --(..)->����� ����������� ��������
--+++++++
SELECT ID,GroupName FROM Groups --�������������!!
--+++++++
SELECT ID,GroupName,'Groupe: ' + GroupName AS [���� � ������] FROM Groups  --AS ("lHLDWL""")->name stolb 
--[...]->���� ������ � �����
SELECT ID,GroupName,'Groupee: ' + GroupName AS [���� � ������] FROM [02_39pr31].[dbo].[Groups]
-----------------------------------------------=================================================
--INSERT(add or edit)
--INSERT [INTO] name_tabl [(list_tables)] VALUES (����1,����2,....)
INSERT INTO Groups (GroupName) VALUES ( 'Group_601:'); 
 SELECT * FROM Groups
 ---------
  SELECT * FROM Students
  INSERT Students (FirstName,LastName,MiddleName,Email,Phone,Age,IDGroup) VALUES ( 'Ivan','Ivanov','Pupkinovich','Ivan@gml.org','+38009',40,1); 
    SELECT * FROM Students
 INSERT Students  VALUES ( 'Iva','Ivak','Indukovich','Ivan@gmlaik.org','+3800889',40,1); --��� (������ ���,...),�� ����� ������!!
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
