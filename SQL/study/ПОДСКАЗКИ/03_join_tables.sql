--соединим две таблицы Orders и Customers:
SELECT * FROM Orders, Customers

/*
При такой выборке для каждая строка из таблицы Orders 
будет совмещаться с каждой строкой из таблицы Customers. 
То есть, получится перекрестное соединение. 
Например, в Orders три строки, а в Customers то же три строки, значит мы получим 3 * 3 = 9 строк
То есть в данном случае мы получаем прямое (декартово) произведение двух групп.
*/

--необходимо использовать выражение WHERE и фильтровать строки при условии, 
--что поле CustomerId из Orders соответствует полю Id из Customers:

SELECT * FROM Orders, Customers
WHERE Orders.CustomerId = Customers.Id

--получим все заказы и добавим информацию по клиенту и связанному товару:
SELECT Customers.FirstName, Products.ProductName, Orders.CreatedAt 
FROM Orders, Customers, Products
WHERE Orders.CustomerId = Customers.Id AND Orders.ProductId=Products.Id

/*
Поскольку в данном случае названия таблиц сильно увеличивают код, 
то мы его можем сократить за счет использования псевдонимов таблиц:
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
 было рассмотрено неявное соединение таблиц. 
 Оно производилось на основе простой выборки неявно путем сведения данных. 
 Для явного соединения данных из двух таблиц применяется оператор JOIN. 
 Общий формальный синтаксис применения оператора INNER JOIN:

 SELECT столбцы
FROM таблица1
    [INNER] JOIN таблица2
    ON условие1
    [[INNER] JOIN таблица3
    ON условие2]


После оператора JOIN идет название второй таблицы, из которой надо добавить данные в выборку. 
Перед JOIN может использоваться необязательное ключевое слово INNER. 
Его наличие или отсутствие ни на что не влияет. 
Затем после ключевого слова ON указывается условие соединения. 
Это условие устанавливает, как две таблицы будут сравниваться. 
В большинстве случаев для соединения применяется первичный ключ главной таблицы и внешний ключ зависимой таблицы.
*/

--выберем все заказы и добавим к ним информацию о товарах:
SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId

--Также используя псевдонимы, мы можем сократить код:
SELECT O.CreatedAt, O.ProductCount, P.ProductName 
FROM Orders AS O
JOIN Products AS P
ON P.Id = O.ProductId

/*
Подобным образом мы можем присоединять и другие таблицы. 
Например, добавим к заказу информацию о покупателе из таблицы Customers:
*/
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId
JOIN Customers ON Customers.Id=Orders.CustomerId

--Благодаря соединению таблиц мы можем использовать их столбцы для фильтрации выборки или ее сортировки:
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId
JOIN Customers ON Customers.Id=Orders.CustomerId
WHERE Products.Price < 45000
ORDER BY Customers.FirstName

--Условия после ключевого слова ON могут быть более сложными по составу:
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId AND Products.Manufacturer='Apple'
JOIN Customers ON Customers.Id=Orders.CustomerId
ORDER BY Customers.FirstName
/*
При использовании оператора JOIN следует учитывать, что процесс соединения таблиц может быть ресурсоемким, 
поэтому следует соединять только те таблицы, данные из которых действительно необходимы. 
Чем больше таблиц соединяется, тем больше снижается производительность.
*/




--OUTER JOIN
/*
 В отличие от inner join внешнее соединение возвращает все строки одной или двух таблиц, которые участвуют в соединении.

 Outer Join имеет следующий формальный синтаксис:

SELECT столбцы
FROM таблица1
    {LEFT|RIGHT|FULL} [OUTER] JOIN таблица2 ON условие1
    [{LEFT|RIGHT|FULL} [OUTER] JOIN таблица3 ON условие2]...


LEFT: выборка будет содержать все строки из первой или левой таблицы

RIGHT: выборка будет содержать все строки из второй или правой таблицы

FULL: выборка будет содержать все строки из обоих таблиц

Также перед оператором JOIN может указываться ключевое слово OUTER, 
но его применение необязательно. 
Далее после JOIN указывается присоединяемая таблица, а затем идет условие соединения.
*/

-- соединим таблицы Orders и Customers:
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

-- тип соединения на правостороннее:
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId 
FROM Orders RIGHT JOIN Customers 
ON Orders.CustomerId = Customers.Id

/*
Поскольку один из покупателей из таблицы Customers не имеет связанных заказов из Orders, 
то соответствующие столбцы, которые берутся из Orders, будут иметь значение NULL.
*/

--соединение для добавления к заказам информации о пользователях и товарах:
SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
LEFT JOIN Products ON Orders.ProductId = Products.Id

--И также можно применять более комплексные условия с фильтрацией и сортировкой. 
SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
LEFT JOIN Products ON Orders.ProductId = Products.Id
WHERE Products.Price < 45000
ORDER BY Orders.CreatedAt

-- выберем всех пользователей из Customers, у которых нет заказов в таблице Orders:
SELECT FirstName FROM Customers
LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
WHERE Orders.CustomerId IS NULL

--Также можно комбинировать Inner Join и Outer Join:
SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
JOIN Products ON Orders.ProductId = Products.Id AND Products.Price < 45000
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
ORDER BY Orders.CreatedAt


--Cross Join
SELECT * FROM Orders CROSS JOIN Customers
/*
Cross Join или перекрестное соединение создает набор строк, 
где каждая строка из одной таблицы соединяется с каждой строкой из второй таблицы.
При неявном перекрестном соединении можно опустить оператор CROSS JOIN и просто перечислить все получаемые таблицы:
*/
	
SELECT * FROM Orders, Customers