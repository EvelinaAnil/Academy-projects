USE [HW_2];

--1--
 INSERT Wards (Building,Floor,Name)  VALUES ( 1,1,'������ � 1_1_1'); --��� (������ ���,...),�� ����� ������!!
  INSERT Wards (Building,Floor,Name) VALUES ( 1,1,'������ � 1_1_2');
  INSERT Wards (Building,Floor,Name) VALUES ( 1,1,'������ � 1_1_3');
  INSERT Wards (Building,Floor,Name) VALUES ( 1,2,'������ � 1_2_4');
  INSERT Wards (Building,Floor,Name) VALUES ( 1,2,'������ � 1_2_5');
  INSERT Wards (Building,Floor,Name) VALUES ( 1,2,'������ � 1_2_6');
  INSERT Wards (Building,Floor,Name) VALUES ( 1,2,'������ � 1_2_7');
   INSERT Wards (Building,Floor,Name) VALUES ( 1,3,'������ � 1_3_8');
    INSERT Wards (Building,Floor,Name) VALUES ( 1,3,'������ � 1_3_9');
	 INSERT Wards(Building,Floor,Name)  VALUES ( 1,3,'������ � 1_3_10');

	 SELECT * FROM Wards

--1.2--
INSERT Wards VALUES ( 1,4,'������ � 1_4_11');
INSERT Wards VALUES ( 1,4,'������ � 1_4_12');
INSERT Wards VALUES ( 1,4,'������ � 1_4_13');
INSERT Wards VALUES ( 1,4,'������ � 1_4_14');

SELECT * FROM Wards

--1.3--
INSERT  Wards (Building,Floor,Name)
  VALUES 
( 1,5,'������ � 1_5_15'),
  ( 1,5,'������ � 1_5_16'),
 ( 1,5,'������ � 1_5_17'),
 --3
  ( 1,5,'������ � 1_5_18'),
   ( 2,1,'������ � 2_1_19'),------
    ( 2,1,'������ � 2_1_20'),--6----
	 ( 2,2,'������ � 2_2_21'),----
	  ( 2,3,'������ � 2_3_22'),----
	   ( 3,1,'������ � 3_1_23'),-----
	    ( 3,1,'������ � 3_1_24'),------
		 ( 3,2,'������ � 3_2_25'),--11-----
		  ( 3,3,'������ � 3_3_26'),-----
		   ( 4,1,'������ � 4_1_27'),------
		    ( 4,1,'������ � 4_1_28'),------
			 ( 4,2,'������ � 4_2_29'),---
			  ( 4,3,'������ � 4_3_30'),----
			  ( 5,1,'������ � 5_1_31'),----
			  ( 5,1,'������ � 5_1_32'),
			  ( 5,2,'������ � 5_2_33'),
			  ( 5,3,'������ � 5_3_34')
  ; 

  SELECT * FROM Wards


  --2--
  INSERT  Diseases (Name,Severity)
  VALUES 
( '������ � 1_5_15',1),--1
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1),
( '������ � 1_5_15',1);

  SELECT * FROM Diseases
  /*2.�������� � ������� Diseases 10 �������*/
   INSERT  Diseases (Name,Severity)
  VALUES 
( '������ � 1',1),--1
( '������ � 2',2),
( '������ � 3',3),
( '������ � 4',4),
( '������ � 5',5),
( '������ � 6',6),
( '������ � 7',7),
( '������ � 8',8),
( '������ � 9',9),
( '������ � 10',10);

 SELECT * FROM Diseases

/*3. �������� ������ � ������� Departments - 20 �������
� ������� ������ �������������� ������������� � ������� ���������� � � ������ ��������,
������ ��������������
( 11 ����������� ������ ����� �������������� ����� 30000,
3 ������������� ������ ����� �������������� �� 11000 �� 16000
� ������ ���������� � 3 �������
2 ������������� ������ ����� �������������� �� 26000
� ������ ���������� � 6 �������
3 ������������� ������ ����� �������������� �� 10000
� ������ ���������� � 3 ��� 6 �������
1 ������������� ������ ���� � 8 �������
1 ������������� ������ ���� � 9 �������
1 ������������� ������ ���� � 10 �������
)
������ ������ ���� ����������� � ����� ������ ��������.
*/
 INSERT  Department(Building,Financing,Floor,Name) 
 --Building(1-5) Financing>=0 Floor>=1 Name ��������.
  VALUES 
    ( 1,30001,1,'QwQ 1'), -- >30000
	( 2,30002,1,'QwQ 2'),
	( 3,30003,1,'QwQ 3'),
    ( 4,30004,1,'QwQ 4'),
	( 5,30005,9,'QwQ 5'),
	( 1,30006,10,'QwQ 6'),
	( 2,30007,1,'QwQ 7'),
	( 3,30008,1,'QwQ 8'),
    ( 4,30009,1,'QwQ 9'),
	( 5,30010,1,'QwQ 10'),
	( 1,30011,1,'QwQ 11'),--11
	( 3,11000,3,'QwQ 12'),--11000 �� 16000 
	( 3,15030,3,'QwQ 13'),
    ( 3,16000,3,'QwQ 14'),--3
	( 5,26000 ,6,'QwQ 15'),
	( 1,26090 ,6,'QwQ 16'),--2
	( 2, 10000,3,'QwQ 17'),
	( 3, 9000,6,'QwQ 18'),
    ( 4, 7000,6,'QwQ 19'),--3
	( 5,30005,8,'QwQ 20');--1
	 SELECT * FROM Department
/*4. �������� ������ � ������� Doctors - ������� 15 �������
2 ������� ������ �������� �� 1600
3 ������� ������ �������� ��, ������� � 6 ��� ������ ��������
2 ������� ������ ��������� �������, ������� ���������� �� ����� N*/
 INSERT  Doctors (Name,Phone,Premium,Salary,Surname)
 --Premium>=0 Salary>0
  VALUES 
( 'Birkos � 1',000001,1121,1600,'Pupkin_1'),
( 'Birkos � 2',000001,1121,1600,'Pupkin_2'),--2
( 'Birkos � 3',000001,1600,267,'Pupkin_3'),
( 'Birkos � 4',000001,1600,267,'Pupkin_4'),
( 'Birkos � 5',000001,1600,267,'Pupkin_5'),--3
( 'Birkos � 6',000001,1121,3223,'Nupkin_6'),
( 'Birkos � 7',000001,1121,3223,'Nupkin_7'),--2
( 'Birkos � 8',000001,1121,3223,'Pupkin_8'),
( 'Birkos � 9',000001,1121,3223,'Pupkin_9'),
( 'Birkos � 10',000001,1121,3223,'Pupkin_10'),
( 'Birkos � 11',000001,1121,3223,'Pupkin_11'),
( 'Birkos � 12',000001,1121,3223,'Pupkin_12'),
( 'Birkos � 13',000001,1121,3223,'Pupkin_13'),
( 'Birkos � 14',000001,1121,3223,'Pupkin_14'),
('Birkos � 15',000001,1121,3223,'Pupkin_15');
 SELECT * FROM Doctors
/*5. �������� ������ � ������� Examinations - ������ 15 �������
������ ������ ���� ���������� �� ������ ���� ������
� ��������� �������� ������ � ��������� ������������

��� �������� ������� �� ����������� ������������ �������, ������� ��������� ������ �
������� (����� � ����� ����� � �������������)*/

 INSERT  Examinations (DayOfWeek,EndTime,Name,StartTime)
 --DayOfWeek(1-7)  EndTime= >startTime Name ������. StartTime 8:00-18:00
  VALUES 
  ( 1,11,'oo � 1',8),
   ( 2,12,'oo � 2',9),
    ( 3,10,'oo � 3',9),
	 ( 4,12,'oo � 4',8),
	  ( 5,13,'oo � 5',8),
	  ( 6,14,'oo � 6',8),
	  ( 7,15,'oo � 7',8),
	  ( 1,16,'oo � 8',8),
	  ( 2,17,'oo � 9',8),
	  ( 3,18,'oo � 10',8),
	  ( 4,11,'oo � 11',9),
	  ( 5,13,'oo � 12',9),
	  ( 6,14,'oo � 13',9),
	  ( 7,15,'oo � 14',9),
( 1,16,'oo � 15',9);

 SELECT * FROM Examinations

 ----------------------
 /*1. ������� ���������� ������� �����.*/
   SELECT * FROM Wards
/*2. ������� ������� � �������� ���� ������.*/
 SELECT * FROM Doctors
/*3. ������� ��� ����� ��� ����������, �� ������� �������-
������ ������.*/
	 SELECT * FROM Department
/*4. ������� �������� ����������� ��� ������ �Name of Disease�
� ������� �� ������� ��� ������ �Severity of Disease�.*/
SELECT Name,Severity,'Name of Disease: ' + Name AS [Name of Disease],'Severity of Disease: ' + Severity AS [Severity of Disease]
FROM Diseases  --AS ("lHLDWL""")->name stolb 
/*5. ������������ ��������� FROM ��� ����� ���� ������
���� ������, ��������� ��� ��� ����������.*/
INSERT INTO Diseases (Name,Severity) VALUES ( 'Group_01:'); 
 SELECT * FROM Diseases
 INSERT INTO Wards (Building,Floor,Name) VALUES ( 'Group_02:'); 
 SELECT * FROM Wards
 INSERT INTO Doctors (Name,Phone,Premium,Salary,Surname) VALUES ( 'Group_03:'); 
 SELECT * FROM Doctors
/*6. ������� �������� ���������, ������������� � �������
5 � ������� ���� �������������� ����� 30000.*/
SELECT * FROM Department
WHERE Building=5 AND Financing >30000
/*7. ������� �������� ���������, ������������� � 3-� �������
� ������ �������������� � ��������� �� 12000 �� 15000.*/

 SELECT Name FROM Department
WHERE Building=3 AND (Financing >=12000 AND Financing <= 15000)

/*8. ������� �������� �����, ������������� � �������� 4 � 5
�� 1-� �����.*/
 SELECT Name FROM Wards
WHERE Floor=1 AND (Building =4 OR Building =5)
/*9. ������� ��������, ������� � ����� �������������� ��-
�������, ������������� � �������� 3 ��� 6 � �������
���� �������������� ������ 11000 ��� ������ 25000.*/
SELECT Name,Building ,Financing FROM Department
WHERE (Financing<11000 AND Financing>25000)  AND (Building =3 OR Building =6)
/*10. ������� ������� ������, ��� �������� (����� ������
� ��������) ��������� 1500.*/
SELECT Name FROM Doctors
WHERE Salary>1500 AND Premium>1500  
/*11. ������� ������� ������, � ������� �������� ��������
��������� ����������� ��������.*/
SELECT Surname FROM Doctors
WHERE  Premium<(Salary/2)
/*12. ������� �������� ������������ ��� ����������, �����-
����� � ������ ��� ��� ������ � 12:00 �� 15:00.*/
SELECT Name FROM Examinations
WHERE  (DayOfWeek=1 OR DayOfWeek=2 OR DayOfWeek=3) AND (StartTime=12 AND EndTime=15)
/*13. ������� �������� � ������ �������� ���������, �����-
�������� � �������� 1, 3, 8 ��� 10.*/
SELECT Name,id FROM Department
WHERE (Floor=1 OR Floor=3 OR Floor=8 OR Floor=10 )

/*14. ������� �������� ����������� ���� �������� �������,
����� 1-� � 2-�.*/
SELECT Name FROM Diseases
WHERE  (Severity=1 OR Severity=2)
/*15. ������� �������� ���������, ������� �� �������������
� 1-� ��� 3-� �������.*/
SELECT Name FROM Department
WHERE  (Building<>1 OR Building<>3) AND  (Building=2 OR Building=4 OR  Building=5)
/*16. ������� �������� ���������, ������� ������������� � 1-�
��� 3-� �������.*/
SELECT Name FROM Department
WHERE  Building=1 OR Building=3
/*17. ������� ������� ������, ������������ �� ����� �N�.
*/
SELECT Surname FROM Doctors
WHERE Name LIKE 'N%'
