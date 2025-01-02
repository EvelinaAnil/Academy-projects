--UNION
/*
�������� UNION ������� inner join ��� outer join ��������� ��������� ��� �������. 
�� � ������� �� inner/outer join ����������� ��������� �� ������� ������ ������, � ��� ���������� ������ � ����. 
���������� ��������� �����������:

SELECT_���������1
UNION [ALL] SELECT_���������2
[UNION [ALL] SELECT_���������N]
*/
-------------------------------------
CREATE TABLE Customers1
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    AccountSum MONEY
);
CREATE TABLE Employees
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
);
-----------------------------------
INSERT INTO Customers1 VALUES
('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800)
 
INSERT INTO Employees VALUES
('Homer', 'Simpson'),
('Tom', 'Smith'),
('Mark', 'Adams'),
('Nick', 'Svensson')
--------------------------

------------------------------
--������� ����� ���� �������� ����� � ��� ����������� �� ����� ������:
SELECT FirstName, LastName 
FROM Customers1
UNION SELECT FirstName, LastName FROM Employees
/*
� ������ ������ �� ������ ������� ���������� ��� �������� - ��� � ������� �������. 
�� ������ ������� Employees ����� ���������� ��� �������� - ��� � ������� �����������. 
�� ���� ��� ����������� ���������� ���������� �������� � �� ��� ��������� ��� ����� �������.

 � ���� �� ������� ��� ���� ��� ���������� ����������, 
 �� � ���������� ORDER BY ���������� ��������������� ������ �� �������� �������� ������ �������:
*/
SELECT FirstName + ' ' +LastName AS FullName
FROM Customers1
UNION SELECT FirstName + ' ' + LastName AS EmployeeName 
FROM Employees
ORDER BY FullName DESC

--�����������!!!!
--���� �� � ����� ������� ������ ��������, ��� � ������, �� ��� �� ������ ���� ����������. 
SELECT FirstName, LastName, AccountSum
FROM Customers1
UNION SELECT FirstName, LastName 
FROM Employees

--����� ��������������� ������� ������ ��������������� �� ����.
SELECT FirstName, LastName
FROM Customers1
UNION SELECT Id, LastName 
FROM Employees

--���� ��� ������������ ������ �������� � ������� ���������� ��������, �� ��� ����������� ������������� ������ ���������. 
-- ���� �� ���������� ��� ����������� ��������� ���, � ��� ����� ������������� ������, 
--�� ��� ����� ���������� ������������ �������� ALL
SELECT FirstName, LastName
FROM Customers1
UNION ALL SELECT FirstName, LastName 
FROM Employees

--���������� ������� ����� � �� ����� � ��� �� �������. 
--��������, � ����������� �� ����� �� ����� ������� ��� ���� ��������� ��� ������������ ��������:
SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum 
FROM Customers1 WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum 
FROM Customers1 WHERE AccountSum >= 3000


--EXCEPT
/*
�������� EXCEPT ��������� ����� �������� ���� �������, 
�� ���� �� ������ ������� ���� � ������ �������, �� ������� ��� �� ������.
��� ��� ������������� ����������� ��������� ���������� ���������:
SELECT_���������1
EXCEPT SELECT_���������2
*/


--������� Employees �������� ������ ��� ���� ����������� �����, � ������� Customers - ��� ���� ��������. 
--�� ���������� ����� ����� ����� ���� ��� ���������. 
--� ��������, ��� ���� ����� ���� �������� �����, ������� �� �������� ��� ������������:
SELECT FirstName, LastName
FROM Customers1
EXCEPT SELECT FirstName, LastName 
FROM Employees

--�������� ������� ����� �������� ���� ����������� �����, ������� �� �������� ��� ���������:
SELECT FirstName, LastName
FROM Employees
EXCEPT SELECT FirstName, LastName 
FROM Customers1


--INTERSECT
/*
�������� INTERSECT ��������� ����� ����� ������ ��� ���� �������, 
�� ���� ������ �������� ��������� �������� ����������� ��������. 
��� ��� ������������� ����������� ��������� ���������� ���������:

SELECT_���������1
INTERSECT SELECT_���������2
*/

/*
� ������� Customers �������� ��� ������� �����, � � ������� Employees - ��� ��� ����������. 
�� ���������� ����� ���� ������������ � ��������� �����, 
������� �� ������ ����� ��������� ����� � ���� ��������. 
������ ���� ����������� �����, ������� ������������ �������� ��� ���������. 
�� ���� ��� ���� ����� ����� �������� ���� �������:
*/

SELECT FirstName, LastName
FROM Employees
INTERSECT SELECT FirstName, LastName 
FROM Customers1