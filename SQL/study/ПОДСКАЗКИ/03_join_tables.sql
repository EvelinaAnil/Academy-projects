--�������� ��� ������� Orders � Customers:
SELECT * FROM Orders, Customers

/*
��� ����� ������� ��� ������ ������ �� ������� Orders 
����� ����������� � ������ ������� �� ������� Customers. 
�� ����, ��������� ������������ ����������. 
��������, � Orders ��� ������, � � Customers �� �� ��� ������, ������ �� ������� 3 * 3 = 9 �����
�� ���� � ������ ������ �� �������� ������ (���������) ������������ ���� �����.
*/

--���������� ������������ ��������� WHERE � ����������� ������ ��� �������, 
--��� ���� CustomerId �� Orders ������������� ���� Id �� Customers:

SELECT * FROM Orders, Customers
WHERE Orders.CustomerId = Customers.Id

--������� ��� ������ � ������� ���������� �� ������� � ���������� ������:
SELECT Customers.FirstName, Products.ProductName, Orders.CreatedAt 
FROM Orders, Customers, Products
WHERE Orders.CustomerId = Customers.Id AND Orders.ProductId=Products.Id

/*
��������� � ������ ������ �������� ������ ������ ����������� ���, 
�� �� ��� ����� ��������� �� ���� ������������� ����������� ������:
*/

SELECT C.FirstName, P.ProductName, O.CreatedAt 
FROM Orders AS O, Customers AS C, Products AS P
WHERE O.CustomerId = C.Id AND O.ProductId=P.Id

SELECT C.FirstName, P.ProductName, O.*
FROM Orders AS O, Customers AS C, Products AS P
WHERE O.CustomerId = C.Id AND O.ProductId=P.Id

-----------------------------------------------
--INNER JOIN
/*
 ���� ����������� ������� ���������� ������. 
 ��� ������������� �� ������ ������� ������� ������ ����� �������� ������. 
 ��� ������ ���������� ������ �� ���� ������ ����������� �������� JOIN. 
 ����� ���������� ��������� ���������� ��������� INNER JOIN:

 SELECT �������
FROM �������1
    [INNER] JOIN �������2
    ON �������1
    [[INNER] JOIN �������3
    ON �������2]


����� ��������� JOIN ���� �������� ������ �������, �� ������� ���� �������� ������ � �������. 
����� JOIN ����� �������������� �������������� �������� ����� INNER. 
��� ������� ��� ���������� �� �� ��� �� ������. 
����� ����� ��������� ����� ON ����������� ������� ����������. 
��� ������� �������������, ��� ��� ������� ����� ������������. 
� ����������� ������� ��� ���������� ����������� ��������� ���� ������� ������� � ������� ���� ��������� �������.
*/

--������� ��� ������ � ������� � ��� ���������� � �������:
SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId

--����� ��������� ����������, �� ����� ��������� ���:
SELECT O.CreatedAt, O.ProductCount, P.ProductName 
FROM Orders AS O
JOIN Products AS P
ON P.Id = O.ProductId

/*
�������� ������� �� ����� ������������ � ������ �������. 
��������, ������� � ������ ���������� � ���������� �� ������� Customers:
*/
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId
JOIN Customers ON Customers.Id=Orders.CustomerId

--��������� ���������� ������ �� ����� ������������ �� ������� ��� ���������� ������� ��� �� ����������:
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId
JOIN Customers ON Customers.Id=Orders.CustomerId
WHERE Products.Price < 45000
ORDER BY Customers.FirstName

--������� ����� ��������� ����� ON ����� ���� ����� �������� �� �������:
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId AND Products.Manufacturer='Apple'
JOIN Customers ON Customers.Id=Orders.CustomerId
ORDER BY Customers.FirstName
/*
��� ������������� ��������� JOIN ������� ���������, ��� ������� ���������� ������ ����� ���� ������������, 
������� ������� ��������� ������ �� �������, ������ �� ������� ������������� ����������. 
��� ������ ������ �����������, ��� ������ ��������� ������������������.
*/




--OUTER JOIN
/*
 � ������� �� inner join ������� ���������� ���������� ��� ������ ����� ��� ���� ������, ������� ��������� � ����������.

 Outer Join ����� ��������� ���������� ���������:

SELECT �������
FROM �������1
    {LEFT|RIGHT|FULL} [OUTER] JOIN �������2 ON �������1
    [{LEFT|RIGHT|FULL} [OUTER] JOIN �������3 ON �������2]...


LEFT: ������� ����� ��������� ��� ������ �� ������ ��� ����� �������

RIGHT: ������� ����� ��������� ��� ������ �� ������ ��� ������ �������

FULL: ������� ����� ��������� ��� ������ �� ����� ������

����� ����� ���������� JOIN ����� ����������� �������� ����� OUTER, 
�� ��� ���������� �������������. 
����� ����� JOIN ����������� �������������� �������, � ����� ���� ������� ����������.
*/

-- �������� ������� Orders � Customers:
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId 
FROM Orders LEFT JOIN Customers 
ON Orders.CustomerId = Customers.Id


-- INNER JOIN
SELECT FirstName, CreatedAt, ProductCount, Price 
FROM Customers JOIN Orders 
ON Orders.CustomerId = Customers.Id
 
--LEFT JOIN
SELECT FirstName, CreatedAt, ProductCount, Price 
FROM Customers LEFT JOIN Orders 
ON Orders.CustomerId = Customers.Id

-- ��� ���������� �� ��������������:
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId 
FROM Orders RIGHT JOIN Customers 
ON Orders.CustomerId = Customers.Id

/*
��������� ���� �� ����������� �� ������� Customers �� ����� ��������� ������� �� Orders, 
�� ��������������� �������, ������� ������� �� Orders, ����� ����� �������� NULL.
*/

--���������� ��� ���������� � ������� ���������� � ������������� � �������:
SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
LEFT JOIN Products ON Orders.ProductId = Products.Id

--� ����� ����� ��������� ����� ����������� ������� � ����������� � �����������. 
SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
LEFT JOIN Products ON Orders.ProductId = Products.Id
WHERE Products.Price < 45000
ORDER BY Orders.CreatedAt

-- ������� ���� ������������� �� Customers, � ������� ��� ������� � ������� Orders:
SELECT FirstName FROM Customers
LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
WHERE Orders.CustomerId IS NULL

--����� ����� ������������� Inner Join � Outer Join:
SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
JOIN Products ON Orders.ProductId = Products.Id AND Products.Price < 45000
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
ORDER BY Orders.CreatedAt


--Cross Join
SELECT * FROM Orders CROSS JOIN Customers
/*
Cross Join ��� ������������ ���������� ������� ����� �����, 
��� ������ ������ �� ����� ������� ����������� � ������ ������� �� ������ �������.
��� ������� ������������ ���������� ����� �������� �������� CROSS JOIN � ������ ����������� ��� ���������� �������:
*/
	
SELECT * FROM Orders, Customers