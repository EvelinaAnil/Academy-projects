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
('���� ����� ������'),
('������ ���� ��������'),
('������� �����'),
('�������� ��������'),
('������� ������'),
('������������ ������� ������'),
('������� �����'),
('Samsung'),
('LG');

INSERT INTO Products 
VALUES 
('�����', (SELECT Id FROM Manufacturers WHERE ManufacturerName='���� ����� ������'), 100, 50),
('����',  (SELECT Id FROM Manufacturers WHERE ManufacturerName='������ ���� ��������'), 15, 45),
('������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������� �����'), 500, 20),
('������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='�������� ��������'), 333, 70),
('��������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������� ������'), 1000, 7),
('�������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������ ���� ��������'), 456, 15),
('������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������ ���� ��������'), 35, 23),
('�����', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������� �����'), 20, 18),
('�������� �������', (SELECT Id FROM Manufacturers WHERE ManufacturerName='������������ ������� ������'), 55, 100);
 
INSERT INTO Customers VALUES ('����'), ('����'),('���������'), ('������'), ('�������'), ('���'), ('������'), ('����');
 
INSERT INTO Orders 
(ProductId, CustomerId, CreatedAt,  ProductCount, Price)
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='�����'), 
    (SELECT Id FROM Customers WHERE FirstName='����'),
    '2019-09-01',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='�����')
),
( 
    (SELECT Id FROM Products WHERE ProductName='����'), 
    (SELECT Id FROM Customers WHERE FirstName='����'),
    '2019-08-31',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='����')
),
( 
    (SELECT Id FROM Products WHERE ProductName='������'), 
    (SELECT Id FROM Customers WHERE FirstName='�������'),
    '2019-08-30',  
    5, 
    (SELECT Price FROM Products WHERE ProductName='������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='������'), 
    (SELECT Id FROM Customers WHERE FirstName='�������'),
    '2019-08-30',  
    3, 
    (SELECT Price FROM Products WHERE ProductName='������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='��������'), 
    (SELECT Id FROM Customers WHERE FirstName='���������'),
    '2019-08-29',  
    11, 
    (SELECT Price FROM Products WHERE ProductName='��������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='�������'), 
    (SELECT Id FROM Customers WHERE FirstName='������'),
    '2019-08-29',  
    9, 
    (SELECT Price FROM Products WHERE ProductName='�������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='������'), 
    (SELECT Id FROM Customers WHERE FirstName='������'),
    '2019-08-29',  
    4, 
    (SELECT Price FROM Products WHERE ProductName='������')
)
,
( 
    (SELECT Id FROM Products WHERE ProductName='�����'), 
    (SELECT Id FROM Customers WHERE FirstName='�������'),
    '2019-08-29',  
    6, 
    (SELECT Price FROM Products WHERE ProductName='�����')
);

