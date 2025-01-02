use Northwind;

SELECT * FROM Customers
--1
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Orders
GROUP BY CustomerID
HAVING count(*) >0
) 
--2
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Orders
GROUP BY CustomerID
HAVING count(*) =0
) 
--3
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Orders
GROUP BY CustomerID
HAVING count(*) =1
) 
--4
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Orders
GROUP BY CustomerID
HAVING count(*) >2
) 
--5 
SELECT 
ContactName
FROM Customers
WHERE Fax IS  NULL

--6 
SELECT 
ContactName
FROM Customers
WHERE Region IS NOT NULL
--7
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE PostalCode LIKE '0%') 
--8
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE PostalCode LIKE '_____%') 
--9
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE PostalCode LIKE '0_____%') 
--10
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE Phone LIKE '%4') 
--11
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE Phone LIKE '%(%)%') 
--12
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE Phone LIKE '%(_)%') 
--13
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE Phone LIKE '%(___)%') 
--14
SELECT 
ContactName,Phone
FROM Customers
WHERE Phone In (
SELECT 
MAX(Phone)--,count(*)
FROM Customers)
--15
SELECT 
*
FROM Territories
--WHERE ((TerritoryDescription LIKE 'T%')AND (TerritoryDescription LIKE '%a'))
WHERE (TerritoryDescription LIKE 'T%a%') 
--16
SELECT 
ContactName
FROM Customers
WHERE CustomerID In (
SELECT 
CustomerID--,count(*)
FROM Customers
WHERE Phone LIKE '% %') 
--17
SELECT 
TerritoryDescription,s.RegionID
FROM Territories s,Region r
WHERE(s.RegionID =1)OR (s.RegionID =4)
--18
SELECT 
FirstName,LastName
FROM Employees
WHERE ((HomePhone like '%7%')AND (Country like '%USA%'))
--19 DISTINCT
   SELECT DISTINCT City 
   FROM Suppliers
--20  
 SELECT  * 
   FROM Suppliers
   WHERE ((Region is null)AND (HomePage is not null))
--21
 SELECT  MAX(UnitPrice)as Max_Price ,
  MIN(UnitPrice) as Min_Price,
   AVG(UnitPrice) as Middle_Price
   FROM Products
--20
SELECT *
FROM Products
WHERE (Discontinued =1)AND (UnitPrice > 28.8663)
--21
SELECT *
FROM Products
WHERE (SupplierID >=5)AND (SupplierID <=8)
--22
SELECT *
FROM Products
WHERE (((SupplierID =1)OR(SupplierID =8)OR(SupplierID=3)) AND(CategoryID >=2)AND(CategoryID<=4))
--23
SELECT *
FROM Products
WHERE (ProductName like '% %')
--24 
SELECT 
*
FROM Products
--WHERE ((ProductName LIKE 'Q%')AND (ProductName LIKE '%a'))
WHERE (ProductName LIKE 'Q%a')
--25
SELECT 
*
FROM Products
WHERE (ProductName like '%y%')OR(ProductName like '%i%')OR(ProductName like '%s%')
--26
SELECT 
*
FROM Products
WHERE (ProductName like '%a%')OR(ProductName like '%k%')OR(ProductName like '%f%')
--27
SELECT TOP(10) ProductName 
FROM Products
WHERE (ProductID >=10)
--28
SELECT 
*
FROM Orders
WHERE ( ShipCountry like 'Austria') OR(ShipCountry like '%Finland%') 
--29
SELECT 
CONCAT(FirstName,' ', LastName ,'  ',Country,' ',City)
FROM Employees
WHERE (Country like 'USA')
--30
SELECT DISTINCT City 
FROM Suppliers
WHERE (Country like 'Germany')


SELECt * FROM Region
SELECt * FROM Suppliers

/*
19   --¬ыводим все строки с повтор€ющимис€ значени€ми
   WITH DuplicateValue AS (
        SELECT Price, COUNT(*) AS CNT
        FROM Goods
        GROUP BY Price
        HAVING COUNT(*) > 1
   )
   SELECT ProductId, ProductName, Price 
   FROM Goods
   WHERE Price IN (SELECT Price FROM DuplicateValue)
   ORDER BY Price, ProductId;
*/