--товары из таблицы Products, которые имеют минимальную цену:
SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products)

--товары, цена которых выше средней:
SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

--Коррелирующие подзапросы
--результаты которых зависят от строк, которые выбираются в основном запросе.

--все заказы из таблицы Orders, добавив к ним информацию о товаре:
SELECT  CreatedAt, 
        Price, 
        (SELECT ProductName FROM Products 
        WHERE Products.Id = Orders.ProductId) AS Product
FROM Orders

--Коррелирующий подзапрос может выполняться и для той же таблицы, к которой выполняется основной запрос.
--те товары, стоимость которых выше средней цены товаров для данного производителя
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
В данном случае определено два коррелирующих подзапроса. 
Первый подзапрос определяет спецификацию столбца AvgPrice. 
Он будет выполняться для каждой строки, извлекаемой из таблицы Products. 
В подзапрос передается производитель товара и на его основе выбирается средняя цена для товаров именно этого производителя. 
И так как производитель у товаров может отличаться, то и результат подзапроса в каждом случае также может отличаться.

Второй подзапрос аналогичен, только он используется для фильтрации извлекаемых из таблицы Products. 
И также он будет выполняться для каждой строки.

Следует учитывать, что коррелирующие подзапросы выполняются для каждой отдельной строки выборки, 
то выполнение таких подзапросов может замедлять выполнение всего запроса в целом.
*/

------------
/*
Подзапросы в SELECT
В выражении SELECT мы можем вводить подзапросы четырьмя способами:

Использовать в условии в выражении WHERE

Использовать в условии в выражении HAVING

Использовать в качестве таблицы для выборки в выражении FROM

Использовать в качестве спецификации столбца в выражении SELECT
*/

--все товары, у которых цена выше средней:
SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

--всех покупателей из таблицы Customers, у которых нет заказов в таблице Orders:
SELECT * FROM CUSTOMERS
WHERE Id NOT IN (SELECT CustomerId FROM Orders)

--Получение набора значений
/*
ногда возникает необходимость получить набор значений. 
Чтобы при использовании в операторах сравнения подзапрос мог возвращать набор значений, 
перед ним необходимо использовать один из операторов: ALL, SOME или ANY.

При использовании ключевого слова ALL условие в операции сравнения должно быть верно для всех значений, 
которые возвращаются подзапросом. 

*/

--все товары, цена которых меньше чем у любого товара фирмы Apple
SELECT * FROM Products
WHERE Price < ALL(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < ANY(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < SOME(SELECT Price FROM Products WHERE Manufacturer='Apple')

SELECT * FROM Products
WHERE Price < (SELECT MAX(Price) FROM Products WHERE Manufacturer='Apple')

-------------------
--Подзапрос как спецификация столбца
--Результат подзапроса может представлять отдельный столбец в выборке.

--все заказы и добавим к ним информацию о названии товара:
SELECT *, 
(SELECT ProductName FROM Products WHERE Id=Orders.ProductId) AS Product 
FROM Orders
--


--Оператор EXISTS
--Оператор EXISTS позволяет проверить, возвращает ли подзапрос какое-либо значение. 
--Как правило, этот оператор используется для индикации того, что какая-либо строка удовлетворяет условию. 
--То есть фактически оператор EXISTS не возвращает строки, а лишь указывает, что в базе данных есть как минимум одна строка, 
--которые соответствует данному запросу. 
--Поскольку возвращения набора строк не происходит, то подзапросы с подобным оператором выполняются довольно быстро.


--найдем всех покупателей из таблицы Customer, которые делали заказы:
SELECT *
FROM Customers
WHERE EXISTS (SELECT * FROM Orders 
                  WHERE Orders.CustomerId = Customers.Id)

--найдем все товары из таблицы Products, на которые не было заказов в таблице Orders:
SELECT *
FROM Products
WHERE NOT EXISTS (SELECT * FROM Orders WHERE Products.Id = Orders.ProductId)

--Стоит отметить, что для получения подобного результата ы могли бы использовать и опеатор IN:
SELECT *
FROM Products
WHERE Id NOT IN (SELECT ProductId FROM Orders)

/*
Но поскольку при применении EXISTS не происходит выборка строк, 
то его использование более оптимально и эффективно, чем использование оператора IN.
*/
				  