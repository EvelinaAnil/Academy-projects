--Группировка в соединениях
/*
В выражениях INNER/OUTER JOIN также можно использовать группировку. 
Например, выведем для каждого пользователя количество заказов, которые он сделал:
*/
--Так как это INNER JOIN, то в группах будут только те покупатели, у которых есть заказы.
SELECT FirstName, COUNT(Orders.Id)
FROM Customers JOIN Orders 
ON Orders.CustomerId = Customers.Id
GROUP BY Customers.Id, Customers.FirstName;

--Если необходимо вывести даже тех покупателей, у которых нет заказов, то применяется OUTER JOIN:
SELECT FirstName, COUNT(Orders.Id)
FROM Customers LEFT JOIN Orders 
ON Orders.CustomerId = Customers.Id
GROUP BY Customers.Id, Customers.FirstName;

--выведем товары с общей суммой сделанных заказов:
SELECT Products.ProductName, Products.Manufacturer, 
        SUM(Orders.ProductCount * Orders.Price) AS Units
FROM Products 
LEFT JOIN Orders ON Orders.ProductId = Products.Id
GROUP BY Products.Id, Products.ProductName, Products.Manufacturer