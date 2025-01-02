CREATE TABLE Manufacturers
(
    Id INT IDENTITY PRIMARY KEY,
    ManufacturerName NVARCHAR(100) NOT NULL
);
 
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    ManufacturerId Int NOT NULL REFERENCES Manufacturers(Id) ON DELETE CASCADE,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    CreatedAt DATE NOT NULL,
    ProductId INT NULL REFERENCES Products(Id),
    CustomerId INT NULL REFERENCES Customers(Id),    
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);


INSERT INTO Manufacturers VALUES 
('Агро фирма Херсон'),
('Фермер Вася Пяточкин'),
('Бабушка Клава'),
('Турецкий Бусурман'),
('Бульбаш Батько'),
('Кондитерская фабрика Свиточ'),
('Фабрика Рошен'),
('Samsung'),
('LG');

INSERT INTO Products 
VALUES 
('Арбуз', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Агро фирма Херсон'), 100, 50),
('Дыня',  (SELECT Id FROM Manufacturers WHERE ManufacturerName='Фермер Вася Пяточкин'), 15, 45),
('Яблоко', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Бабушка Клава'), 500, 20),
('Персик', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Турецкий Бусурман'), 333, 70),
('Картошка', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Бульбаш Батько'), 1000, 7),
('Помидор', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Фермер Вася Пяточкин'), 456, 15),
('Огурец', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Фермер Вася Пяточкин'), 35, 23),
('Груша', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Бабушка Клава'), 20, 18),
('Молочный шоколад', (SELECT Id FROM Manufacturers WHERE ManufacturerName='Кондитерская фабрика Свиточ'), 55, 100);
 
INSERT INTO Customers VALUES ('Иван'), ('Петр'),('Александр'), ('Катюша'), ('Маричка'), ('Боб'), ('Мартын'), ('Кузя');
 
INSERT INTO Orders 
(ProductId, CustomerId, CreatedAt,  ProductCount, Price)
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='Арбуз'), 
    (SELECT Id FROM Customers WHERE FirstName='Иван'),
    '2019-09-01',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='Арбуз')
),
( 
    (SELECT Id FROM Products WHERE ProductName='Дыня'), 
    (SELECT Id FROM Customers WHERE FirstName='Петр'),
    '2019-08-31',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='Дыня')
),
( 
    (SELECT Id FROM Products WHERE ProductName='Яблоко'), 
    (SELECT Id FROM Customers WHERE FirstName='Маричка'),
    '2019-08-30',  
    5, 
    (SELECT Price FROM Products WHERE ProductName='Яблоко')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Катюша'), 
    (SELECT Id FROM Customers WHERE FirstName='Маричка'),
    '2019-08-30',  
    3, 
    (SELECT Price FROM Products WHERE ProductName='Персик')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Картошка'), 
    (SELECT Id FROM Customers WHERE FirstName='Александр'),
    '2019-08-29',  
    11, 
    (SELECT Price FROM Products WHERE ProductName='Картошка')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Помидор'), 
    (SELECT Id FROM Customers WHERE FirstName='Катюша'),
    '2019-08-29',  
    9, 
    (SELECT Price FROM Products WHERE ProductName='Помидор')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Огурец'), 
    (SELECT Id FROM Customers WHERE FirstName='Катюша'),
    '2019-08-29',  
    4, 
    (SELECT Price FROM Products WHERE ProductName='Огурец')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='Груша'), 
    (SELECT Id FROM Customers WHERE FirstName='Маричка'),
    '2019-08-29',  
    6, 
    (SELECT Price FROM Products WHERE ProductName='Груша')
);

