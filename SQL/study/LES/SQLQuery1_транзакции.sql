CREATE DATABASE L11_39pr31;
go
USE L11_39pr31;
go
--Transaction
CREATE TABLE MyUserName
(
    IdTest int IDENTITY PRIMARY KEY,
    FName varchar(25),
    LName varchar(25)
)
GO
-----
Insert MyUserName
VALUES
('Fname1','Lname1') --add to MyUserName
--
SELECT * FROm MyUserName
---
--
BEGIN TRANSACTION

INSERT MyUserName
VALUES
('Fname2','Lname2')

-- COMMIT TRANSACTION; --�������� ���������� �����������
/*OR*/ROLLBACK TRANSACTION;---���� �������� ���������� 

--======
SELECT * FROM MyUserName

CREATE TABLE MyUserTell
(
    IdTest int IDENTITY PRIMARY KEY,
    IdUser int FOREIGN KEY REFERENCES MyUserName(IdTest) UNIQUE,
    TellN char(12)
    CHECK (TellN LIKE ('([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')) -- ��� ��� ������?
)
GO



CREATE TABLE MyUserInfo
(
    IdTest int IDENTITY PRIMARY KEY,
    IdUser int FOREIGN KEY REFERENCES MyUserName(IdTest),
    Bdate date
)
GO
---=
-- � ����� ���������� ����� ��������� ��������� ��������



BEGIN TRANSACTION; -- ������ ����������

DECLARE @Id int;



INSERT MyUserName
VALUES
    ('TestName0','TestLName0')
    
SET @Id = @@IDENTITY;
        
INSERT MyUserTell
VALUES
(@Id,'(097)2224455');
        
INSERT MyUserInfo
VALUES (@Id,'01/02/1990');



COMMIT TRANSACTION; -- �������� ���������� ����������   

SELECT * FROM MyUserName;
SELECT * FROM MyUserInfo;
SELECT * FROM MyUserTell;
GO
---===
-- � ����� ���������� ����� "��������" ��������� ��������.



BEGIN TRANSACTION; -- ������ ����������.

DECLARE @Id int;



INSERT MyUserName
VALUES
    ('RollBackTest','TestLName0')
    
SET @Id = @@IDENTITY;
        
INSERT MyUserTell
VALUES
(@Id,'(097)2224455');
        
INSERT MyUserInfo
VALUES (@Id,'01/02/1990');



ROLLBACK TRANSACTION; -- ����� ������������������ �������.



SELECT * FROM MyUserName;
SELECT * FROM MyUserInfo;
SELECT * FROM MyUserTell;
---==

-- ����� ���������� ���������� 
--(������������� ���������� ����������)

BEGIN TRAN

INSERT MyUserName
VALUES����('SavePoinTest1','TestLName0')
SAVE TRAN SavePointTran;
-- ����� ���������� ���������� 
--(������������� ���������� ����������)
PRINT 'SAVE POINT';
INSERT MyUserName
VALUES����('SavePointTest2','TestLName0')
SAVE TRAN SavePointTran2;

INSERT MyUserName
VALUES����('SavePoinTest3','TestLName0')

ROLLBACK TRAN SavePointTran;
-- ����� � ����� �������������.

COMMIT TRAN
-- ����� ����������� ����� ���������� 
--���������� ���� �� ����.

SELECT * FROM MyUserName;
GO

--=====
--===
--Transport ������
CREATE TABLE [dbo].[test_table_pivot](
    [fio] [varchar](50) NULL,
    [god] [int] NULL,
    [summa] [float] NULL
   ) ON [PRIMARY]
   GO



  insert into test_table_pivot values
   ('Ivanov', 2000, 100),
     ('Ivanov', 2001, 200),
     ('Ivanov', 2000, 100),
     ('Ivanov', 2001, 200),
       ('Ivanov', 2002, 400),
        ('Petrov', 2000, 300),
     ('Petrov', 2001, 400),
       ('Petrov', 2002, 500)
--
SELECT * FROM test_table_pivot

SELECT fio,god,sum(summa) as summa
FROm dbo.test_table_pivot
GROUP By fio,god
ORDER By fio,god
--==
SELECT
fio,[2000],[2001],[2002]
FROm dbo.test_table_pivot
PIVOT (SUM(summa)for god in ([2000],[2001],[2002])) AS test_pivot

----


--unpivot

CREATE TABLE [dbo].[test_table_unpivot](
    [fio] [varchar](50) NULL,
    [number1] [int] NULL,
    [number2] [int] NULL,
    [number3] [int] NULL,
    [number4] [int] NULL,
    [number5] [int] NULL,
   ) ON [PRIMARY]
   GO



  insert into test_table_unpivot values
   ('Ivanov', 11, 12, 13, 14, 15),
   ('Petrov', 11, 12, 13, 14, 15)
--
SELECT * FROM test_table_unpivot
--
SELECT fio,column_name, number 
FROM test_table_unpivot
UNPIVOT(
number for column_name in (
	[number1],[number2],[number3],[number4],[number5]
)

)AS test_unpivot
--====
---===

--���������� �������� ���������
CREATE TABLE TestTable2(��
[ProductId] INT IDENTITY(1,1) NOT NULL,��
[CategoryName] VARCHAR(100) NOT NULL, �
[ProductName] VARCHAR(100) NOT NULL,��
[Summa] MONEY NULL,��
[YearSales] INT NOT NULL��
)

-- ���������� ���������� ������
   INSERT INTO TestTable2(CategoryName, ProductName, Summa, YearSales)
     VALUES ('������������� ����������', '����', 100, 2015),
            ('������������� ����������', '����', 110, 2016),
            ('������������� ����������', '����', 120, 2017),
            ('������������� ����������', '����', 130, 2018),
            ('������������� ����������', '����', 130, 2018),
            ('������������� ����������', '����������', 170, 2016),
            ('������������� ����������', '����������', 180, 2017),
            ('������������� ����������', '����������', 190, 2018),
            ('������������� ����������', '����������', 200, 2018),
            ('��������� ����������', '�������', 400, 2015),
            ('��������� ����������', '�������', 450, 2016),
            ('��������� ����������', '�������', 500, 2017),
            ('��������� ����������', '�������', 550, 2017),
            ('��������� ����������', '�������', 600, 2018)
   GO



  --������ �� ������� (�������, ����� ������ � ��� ����)
   SELECT * FROM TestTable2
---===

-- ������� ������������� ��������� ��� ������������� PIVOT   
   CREATE PROCEDURE SP_Dynamic_Pivot
   (
  @TableSRC NVARCHAR(100),   
  --������� �������� (�������������)
  @ColumnName NVARCHAR(100), 
  --�������, ���������� ��������, 
  --������� ������ ������� ��������
  @Field NVARCHAR(100),      
  --�������, ��� ������� ��������� ���������
  @FieldRows NVARCHAR(100),  
  --������� (�������) ��� ����������� �� ������� (Column1, Column2)
  @FunctionType NVARCHAR(20) = 'SUM',
  --���������� ������� (SUM, COUNT, MAX, MIN, AVG),
  --�� ��������� SUM
  @Condition NVARCHAR(200) = '' 
  --������� (WHERE � �.�.). �� ��������� ��� �������
   )
   AS 
   BEGIN
  /*
    ������������� ��������� ������������ ������������� ������� PIVOT.
    ����������� Info-Comp.ru
  */
  
  --��������� ����� ���������� �����
  SET NOCOUNT ON;
  
  --���������� ��� �������� ������ �������
  DECLARE @Query NVARCHAR(MAX);        
   --���������� ��� �������� ���� ��������
  DECLARE @ColumnNames NVARCHAR(MAX);      
  --���������� ��� �������� ���������� ��������������� ������ ������
  DECLARE @ColumnNamesHeader NVARCHAR(MAX); 

  --���������� ������
  BEGIN TRY
    --������� ��� �������� ���������� ��������, 
    --������� ����� �������������� � �������� ��������  
    CREATE TABLE #ColumnNames(ColumnName NVARCHAR(100) NOT NULL PRIMARY KEY);
  
    --��������� ������ ������� ��� ��������� ���������� �������� ��� ���� ��������
    SET @Query = N'INSERT INTO #ColumnNames (ColumnName)
              SELECT DISTINCT COALESCE(' + @ColumnName + ', ''�����'') 
              FROM ' + @TableSRC + ' ' + @Condition + ';'
    
    --��������� ������ �������
    EXEC (@Query);

    --��������� ������ � ������� ��������
    SELECT @ColumnNames = ISNULL(@ColumnNames + ', ','') + QUOTENAME(ColumnName) 
    FROM #ColumnNames;
    
    --��������� ������ ��� ��������� ������������� ������������� ������� (PIVOT)
    SELECT @ColumnNamesHeader = ISNULL(@ColumnNamesHeader + ', ','') 
                  + 'COALESCE('
                  + QUOTENAME(ColumnName) 
                  + ', 0) AS '
                  + QUOTENAME(ColumnName)
    FROM #ColumnNames;
  
    --��������� ������ � �������� PIVOT
    SET @Query = N'SELECT ' + @FieldRows + ' , ' + @ColumnNamesHeader + ' 
             FROM (SELECT ' + @FieldRows + ', ' + @ColumnName + ', ' + @Field 
               + ' FROM ' + @TableSRC  + ' ' + @Condition + ') AS SRC
             PIVOT ( ' + @FunctionType + '(' + @Field + ')' +' FOR ' +  
                   @ColumnName + ' IN (' + @ColumnNames + ')) AS PVT
             ORDER BY ' + @FieldRows + ';'
    
    --������� ��������� �������
    DROP TABLE #ColumnNames;

    --��������� ������ ������� � PIVOT
    EXEC (@Query);
    
    --�������� ������� ����� ���������� �����
    SET NOCOUNT OFF;
    
  END TRY
  BEGIN CATCH
    --� ������ ������, ���������� ����� � �������� ���� ������
    SELECT ERROR_NUMBER() AS [����� ������], 
         ERROR_MESSAGE() AS [�������� ������]
  END CATCH
   END

   ---=====

   --������ 1. �������� ����� �� ����� � ������������ �� ���������
   EXEC SP_Dynamic_Pivot @TableSRC = 'TestTable2',  --������� �������� (�������������)
            @ColumnName = 'YearSales',--�������, ���������� �������� ��� �������� � PIVOT
            @Field = 'Summa',       --�������, ��� ������� ��������� ���������
            @FieldRows = 'CategoryName',--������� ��� ����������� �� �������
            @FunctionType = 'SUM',    --���������� �������, �� ��������
			@Condition = 'WHERE CategoryName =' '������������� ����������'''
----
-------
---------
-----------=====
--Cursors FETCH

use Northwind;
--���������� ��������
DECLARE c CURSOR SCROLL FOR
	SELECT ProductId,PriductName FROm Products;

Open c;

	DECLARE @prodName NVARCHAR,@id INT;
	DECLARE o CURSOR SCROLL for
		SELECt ord.OrderDate,ord.OrderId FROM Orders ord
		WHERE ord.OrderId IN (
		SELECT orddet.OrderId [Order Details] orddet ON ord.OrderId ==
		WHERE orddet.ProductId=@id;
		)

	FETCH NEXT from c INTo @id , @prodName;
	PRINT CONCAT(' ID:',@id,' Name: ',@prodName);
	Open o
	Close o
	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM c INTo @id , @prodName;
		PRINT CONCAT(' ID:',@id,' Name: ',@prodName);
	END



CLOSE c
DEALLOCATE c;
---
-----=======
	DECLARE c CURSOR SCROLL FOR
  SELECT ProductId, ProductName FROM Products;
  
DECLARE @prodName NVARCHAR, @id INT ; 



OPEN c;
  FETCH NEXT FROM c INTO @id, @prodName;
  IF @@FETCH_STATUS = 0
  BEGIN
    PRINT CONCAT('ID: ', @id, ', Name: ', @prodName);
    
    DECLARE o CURSOR LOCAL FOR
    SELECT ord.OrderDate, ord.OrderId  FROM Orders ord
     WHERE ord.OrderId IN (
     SELECT orddet.OrderId FROM [Order Details] orddet  
     WHERE  orddet.ProductId = @id
     );

    DECLARE @idOrder INT, @ordDate DATETIME;

    OPEN o
    FETCH NEXT FROM o INTO @ordDate, @idOrder;
    IF @@FETCH_STATUS <> 0
      BEGIN
        PRINT '����� �� ����������';
      END
    ELSE
      BEGIN
        PRINT CONCAT('N order: ', @idOrder, '����: ', @ordDate);
      END
    WHILE @@FETCH_STATUS = 0
    BEGIN
      FETCH NEXT FROM o INTO @ordDate, @idOrder;
      PRINT CONCAT('N order: ', @idOrder, '����: ', @ordDate);
    END
    CLOSE o
    PRINT '==============================';
  END
  ELSE
    BEGIN
    PRINT '������� ���!!!!';    
    END
  WHILE @@FETCH_STATUS = 0
  BEGIN
    FETCH NEXT FROM c INTO @id, @prodName;
    PRINT CONCAT('ID: ', @id, ', Name: ', @prodName);

    DECLARE oo CURSOR LOCAL FOR
    SELECT ord.OrderDate, ord.OrderId  FROM Orders ord
     WHERE ord.OrderId IN (
     SELECT orddet.OrderId FROM [Order Details] orddet  
     WHERE  orddet.ProductId = @id
     );

DECLARE @idOrdero INT, @ordDateo DATETIME;

    OPEN oo
    FETCH NEXT FROM oo INTO @ordDateo, @idOrdero;
    IF @@FETCH_STATUS <> 0
      BEGIN
        PRINT '����� �� ����������';
      END
    ELSE
      BEGIN
        PRINT CONCAT('N order: ', @idOrdero, '����: ', @ordDateo);
      END
    WHILE @@FETCH_STATUS = 0
    BEGIN
      FETCH NEXT FROM oo INTO @ordDate, @idOrder;
      PRINT CONCAT('N order: ', @idOrdero, '����: ', @ordDateo);
    END
    CLOSE oo
    
    PRINT '==============================';
    PRINT '';
    PRINT '';
    PRINT '';
  END
CLOSE c
DEALLOCATE c



