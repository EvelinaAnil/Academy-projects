--������ �� ������� Products, ������� ����� ����������� ����:
SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products)

--������, ���� ������� ���� �������:
SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

--������������� ����������
--���������� ������� ������� �� �����, ������� ���������� � �������� �������.

--��� ������ �� ������� Orders, ������� � ��� ���������� � ������:
SELECT  CreatedAt, 
        Price, 
        (SELECT ProductName FROM Products 
        WHERE Products.Id = Orders.ProductId) AS Product
FROM Orders

--������������� ��������� ����� ����������� � ��� ��� �� �������, � ������� ����������� �������� ������.
--�� ������, ��������� ������� ���� ������� ���� ������� ��� ������� �������������
SELECT ProductName,
       Manufacturer,
       Price, 
        (SELECT AVG(Price) FROM Products AS SubProds 
         WHERE SubProds.Manufacturer=Prods.Manufacturer)  AS AvgPrice
FROM Products AS Prods
WHERE Price > 
    (SELECT AVG(Price) FROM Products AS SubProds 
     WHERE SubProds.Manufacturer=Prods.Manufacturer)
/*
� ������ ������ ���������� ��� ������������� ����������. 
������ ��������� ���������� ������������ ������� AvgPrice. 
�� ����� ����������� ��� ������ ������, ����������� �� ������� Products. 
� ��������� ���������� ������������� ������ � �� ��� ������ ���������� ������� ���� ��� ������� ������ ����� �������������. 
� ��� ��� ������������� � ������� ����� ����������, �� � ��������� ���������� � ������ ������ ����� ����� ����������.

������ ��������� ����������, ������ �� ������������ ��� ���������� ����������� �� ������� Products. 
� ����� �� ����� ����������� ��� ������ ������.

������� ���������, ��� ������������� ���������� ����������� ��� ������ ��������� ������ �������, 
�� ���������� ����� ����������� ����� ��������� ���������� ����� ������� � �����.
*/

------------
/*
���������� � SELECT
� ��������� SELECT �� ����� ������� ���������� �������� ���������:

������������ � ������� � ��������� WHERE

������������ � ������� � ��������� HAVING

������������ � �������� ������� ��� ������� � ��������� FROM

������������ � �������� ������������ ������� � ��������� SELECT
*/

--��� ������, � ������� ���� ���� �������:
SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

--���� ����������� �� ������� Customers, � ������� ��� ������� � ������� Orders:
SELECT * FROM CUSTOMERS
WHERE Id NOT IN (SELECT CustomerId FROM Orders)

--��������� ������ ��������
/*
����� ��������� ������������� �������� ����� ��������. 
����� ��� ������������� � ���������� ��������� ��������� ��� ���������� ����� ��������, 
����� ��� ���������� ������������ ���� �� ����������: ALL, SOME ��� ANY.

��� ������������� ��������� ����� ALL ������� � �������� ��������� ������ ���� ����� ��� ���� ��������, 
������� ������������ �����������. 

*/

--��� ������, ���� ������� ������ ��� � ������ ������ ����� Apple
SELECT * FROM Products
WHERE Price < ALL(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < ANY(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < SOME(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < (SELECT MAX(Price) FROM Products WHERE Manufacturer='Apple')

-------------------
--��������� ��� ������������ �������
--��������� ���������� ����� ������������ ��������� ������� � �������.

--��� ������ � ������� � ��� ���������� � �������� ������:
SELECT *, 
(SELECT ProductName FROM Products WHERE Id=Orders.ProductId) AS Product 
FROM Orders
--


--�������� EXISTS
--�������� EXISTS ��������� ���������, ���������� �� ��������� �����-���� ��������. 
--��� �������, ���� �������� ������������ ��� ��������� ����, ��� �����-���� ������ ������������� �������. 
--�� ���� ���������� �������� EXISTS �� ���������� ������, � ���� ���������, ��� � ���� ������ ���� ��� ������� ���� ������, 
--������� ������������� ������� �������. 
--��������� ����������� ������ ����� �� ����������, �� ���������� � �������� ���������� ����������� �������� ������.


--������ ���� ����������� �� ������� Customer, ������� ������ ������:
SELECT *
FROM Customers
WHERE EXISTS (SELECT * FROM Orders 
                  WHERE Orders.CustomerId = Customers.Id)

--������ ��� ������ �� ������� Products, �� ������� �� ���� ������� � ������� Orders:
SELECT *
FROM Products
WHERE NOT EXISTS (SELECT * FROM Orders WHERE Products.Id = Orders.ProductId)

--����� ��������, ��� ��� ��������� ��������� ���������� � ����� �� ������������ � ������� IN:
SELECT *
FROM Products
WHERE Id NOT IN (SELECT ProductId FROM Orders)

/*
�� ��������� ��� ���������� EXISTS �� ���������� ������� �����, 
�� ��� ������������� ����� ���������� � ����������, ��� ������������� ��������� IN.
*/
				  