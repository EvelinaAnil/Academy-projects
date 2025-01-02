--UNION
/*
Оператор UNION подобно inner join или outer join позволяет соединить две таблицы. 
Но в отличие от inner/outer join объединения соединяют не столбцы разных таблиц, а два однотипных набора в один. 
Формальный синтаксис объединения:

SELECT_выражение1
UNION [ALL] SELECT_выражение2
[UNION [ALL] SELECT_выражениеN]
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
--Выберем сразу всех клиентов банка и его сотрудников из обеих таблиц:
SELECT FirstName, LastName 
FROM Customers1
UNION SELECT FirstName, LastName FROM Employees
/*
В данном случае из первой таблицы выбираются два значения - имя и фамилия клиента. 
Из второй таблицы Employees также выбираются два значения - имя и фамилия сотрудников. 
То есть при объединении количество выбираемых столбцов и их тип совпадают для обеих выборок.

 И если мы захотим при этом еще произвести сортировку, 
 то в выражениях ORDER BY необходимо ориентироваться именно на названия столбцов первой выборки:
*/
SELECT FirstName + ' ' +LastName AS FullName
FROM Customers1
UNION SELECT FirstName + ' ' + LastName AS EmployeeName 
FROM Employees
ORDER BY FullName DESC

--Ограничения!!!!
--Если же в одной выборке больше столбцов, чем в другой, то они не смогут быть объединены. 
SELECT FirstName, LastName, AccountSum
FROM Customers1
UNION SELECT FirstName, LastName 
FROM Employees

--Также соответствующие столбцы должны соответствовать по типу.
SELECT FirstName, LastName
FROM Customers1
UNION SELECT Id, LastName 
FROM Employees

--Если оба объединяемых набора содержат в строках идентичные значения, то при объединении повторяющиеся строки удаляются. 
-- Если же необходимо при объединении сохранить все, в том числе повторяющиеся строки, 
--то для этого необходимо использовать оператор ALL
SELECT FirstName, LastName
FROM Customers1
UNION ALL SELECT FirstName, LastName 
FROM Employees

--Объединять выборки можно и из одной и той же таблицы. 
--Например, в зависимости от суммы на счете клиента нам надо начислять ему определенные проценты:
SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum 
FROM Customers1 WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum 
FROM Customers1 WHERE AccountSum >= 3000


--EXCEPT
/*
Оператор EXCEPT позволяет найти разность двух выборок, 
то есть те строки которые есть в первой выборке, но которых нет во второй.
Для его использования применяется следующий формальный синтаксис:
SELECT_выражение1
EXCEPT SELECT_выражение2
*/


--Таблица Employees содержит данные обо всех сотрудниках банка, а таблица Customers - обо всех клиентах. 
--Но сотрудники банка могут также быть его клиентами. 
--И допустим, нам надо найти всех клиентов банка, которые не являются его сотрудниками:
SELECT FirstName, LastName
FROM Customers1
EXCEPT SELECT FirstName, LastName 
FROM Employees

--Подобным образом можно получить всех сотрудников банка, которые не являются его клиентами:
SELECT FirstName, LastName
FROM Employees
EXCEPT SELECT FirstName, LastName 
FROM Customers1


--INTERSECT
/*
Оператор INTERSECT позволяет найти общие строки для двух выборок, 
то есть данный оператор выполняет операцию пересечения множеств. 
Для его использования применяется следующий формальный синтаксис:

SELECT_выражение1
INTERSECT SELECT_выражение2
*/

/*
В таблице Customers хранятся все клиенты банка, а в таблице Employees - все его сотрудники. 
Но сотрудники могут быть одновременно и клиентами банка, 
поэтому их данные могут храниться сразу в двух таблицах. 
Найдем всех сотрудников банка, которые одновременно являются его клиентами. 
То есть нам надо найти общие элементы двух выборок:
*/

SELECT FirstName, LastName
FROM Employees
INTERSECT SELECT FirstName, LastName 
FROM Customers1