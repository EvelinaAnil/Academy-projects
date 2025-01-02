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

-- COMMIT TRANSACTION; --успешное завершение трпанзакции
/*OR*/ROLLBACK TRANSACTION;---если отменить транзакцию 

--======
SELECT * FROM MyUserName

CREATE TABLE MyUserTell
(
    IdTest int IDENTITY PRIMARY KEY,
    IdUser int FOREIGN KEY REFERENCES MyUserName(IdTest) UNIQUE,
    TellN char(12)
    CHECK (TellN LIKE ('([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')) -- Что это значит?
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
-- в одной транзакции можно выполнять несколько действий



BEGIN TRANSACTION; -- начало транзакции

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



COMMIT TRANSACTION; -- успешное завершение транзакции   

SELECT * FROM MyUserName;
SELECT * FROM MyUserInfo;
SELECT * FROM MyUserTell;
GO
---===
-- В одной транзакции можно "откатить" несколько действий.



BEGIN TRANSACTION; -- Начало транзакции.

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



ROLLBACK TRANSACTION; -- Откат последовательности дейсвий.



SELECT * FROM MyUserName;
SELECT * FROM MyUserInfo;
SELECT * FROM MyUserTell;
---==

-- Точка сохранения транзакции 
--(промежуточное сохранение транзакции)

BEGIN TRAN

INSERT MyUserName
VALUES    ('SavePoinTest1','TestLName0')
SAVE TRAN SavePointTran;
-- Точка сохранения транзакции 
--(промежуточное сохранение транзакции)
PRINT 'SAVE POINT';
INSERT MyUserName
VALUES    ('SavePointTest2','TestLName0')
SAVE TRAN SavePointTran2;

INSERT MyUserName
VALUES    ('SavePoinTest3','TestLName0')

ROLLBACK TRAN SavePointTran;
-- Откат к точке востановления.

COMMIT TRAN
-- Снять комментарий после выполнения 
--транзакции ниже по коду.

SELECT * FROM MyUserName;
GO

--=====
--===
--Transport данных
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

--Инструкция создания таблицы  
CREATE TABLE TestTable2(  
[ProductId] INT IDENTITY(1,1) NOT NULL,  
[CategoryName] VARCHAR(100) NOT NULL,  
[ProductName] VARCHAR(100) NOT NULL,  
[Summa] MONEY NULL,  
[YearSales] INT NOT NULL  
)

-- Инструкция добавления данных
   INSERT INTO TestTable2(CategoryName, ProductName, Summa, YearSales)
     VALUES ('Комплектующие компьютера', 'Мышь', 100, 2015),
            ('Комплектующие компьютера', 'Мышь', 110, 2016),
            ('Комплектующие компьютера', 'Мышь', 120, 2017),
            ('Комплектующие компьютера', 'Мышь', 130, 2018),
            ('Комплектующие компьютера', 'Мышь', 130, 2018),
            ('Комплектующие компьютера', 'Клавиатура', 170, 2016),
            ('Комплектующие компьютера', 'Клавиатура', 180, 2017),
            ('Комплектующие компьютера', 'Клавиатура', 190, 2018),
            ('Комплектующие компьютера', 'Клавиатура', 200, 2018),
            ('Мобильные устройства', 'Телефон', 400, 2015),
            ('Мобильные устройства', 'Телефон', 450, 2016),
            ('Мобильные устройства', 'Телефон', 500, 2017),
            ('Мобильные устройства', 'Телефон', 550, 2017),
            ('Мобильные устройства', 'Телефон', 600, 2018)
   GO



  --Запрос на выборку (смотрим, какие данные у нас есть)
   SELECT * FROM TestTable2
---===

-- Создаем универсальную процедуру для динамического PIVOT   
   CREATE PROCEDURE SP_Dynamic_Pivot
   (
  @TableSRC NVARCHAR(100),   
  --Таблица источник (Представление)
  @ColumnName NVARCHAR(100), 
  --Столбец, содержащий значения, 
  --которые станут именами столбцов
  @Field NVARCHAR(100),      
  --Столбец, над которым проводить агрегацию
  @FieldRows NVARCHAR(100),  
  --Столбец (столбцы) для группировки по строкам (Column1, Column2)
  @FunctionType NVARCHAR(20) = 'SUM',
  --Агрегатная функция (SUM, COUNT, MAX, MIN, AVG),
  --по умолчанию SUM
  @Condition NVARCHAR(200) = '' 
  --Условие (WHERE и т.д.). По умолчанию без условия
   )
   AS 
   BEGIN
  /*
    Универсальная процедура формирования динамического запроса PIVOT.
    Разработчик Info-Comp.ru
  */
  
  --Отключаем вывод количества строк
  SET NOCOUNT ON;
  
  --Переменная для хранения строки запроса
  DECLARE @Query NVARCHAR(MAX);        
   --Переменная для хранения имен столбцов
  DECLARE @ColumnNames NVARCHAR(MAX);      
  --Переменная для хранения заголовков результирующего набора данных
  DECLARE @ColumnNamesHeader NVARCHAR(MAX); 

  --Обработчик ошибок
  BEGIN TRY
    --Таблица для хранения уникальных значений, 
    --которые будут использоваться в качестве столбцов  
    CREATE TABLE #ColumnNames(ColumnName NVARCHAR(100) NOT NULL PRIMARY KEY);
  
    --Формируем строку запроса для получения уникальных значений для имен столбцов
    SET @Query = N'INSERT INTO #ColumnNames (ColumnName)
              SELECT DISTINCT COALESCE(' + @ColumnName + ', ''Пусто'') 
              FROM ' + @TableSRC + ' ' + @Condition + ';'
    
    --Выполняем строку запроса
    EXEC (@Query);

    --Формируем строку с именами столбцов
    SELECT @ColumnNames = ISNULL(@ColumnNames + ', ','') + QUOTENAME(ColumnName) 
    FROM #ColumnNames;
    
    --Формируем строку для заголовка динамического перекрестного запроса (PIVOT)
    SELECT @ColumnNamesHeader = ISNULL(@ColumnNamesHeader + ', ','') 
                  + 'COALESCE('
                  + QUOTENAME(ColumnName) 
                  + ', 0) AS '
                  + QUOTENAME(ColumnName)
    FROM #ColumnNames;
  
    --Формируем строку с запросом PIVOT
    SET @Query = N'SELECT ' + @FieldRows + ' , ' + @ColumnNamesHeader + ' 
             FROM (SELECT ' + @FieldRows + ', ' + @ColumnName + ', ' + @Field 
               + ' FROM ' + @TableSRC  + ' ' + @Condition + ') AS SRC
             PIVOT ( ' + @FunctionType + '(' + @Field + ')' +' FOR ' +  
                   @ColumnName + ' IN (' + @ColumnNames + ')) AS PVT
             ORDER BY ' + @FieldRows + ';'
    
    --Удаляем временную таблицу
    DROP TABLE #ColumnNames;

    --Выполняем строку запроса с PIVOT
    EXEC (@Query);
    
    --Включаем обратно вывод количества строк
    SET NOCOUNT OFF;
    
  END TRY
  BEGIN CATCH
    --В случае ошибки, возвращаем номер и описание этой ошибки
    SELECT ERROR_NUMBER() AS [Номер ошибки], 
         ERROR_MESSAGE() AS [Описание ошибки]
  END CATCH
   END

   ---=====

   --Пример 1. Получаем суммы по годам с группировкой по категории
   EXEC SP_Dynamic_Pivot @TableSRC = 'TestTable2',  --Таблица источник (Представление)
            @ColumnName = 'YearSales',--Столбец, содержащий значения для столбцов в PIVOT
            @Field = 'Summa',       --Столбец, над которым проводить агрегацию
            @FieldRows = 'CategoryName',--Столбец для группировки по строкам
            @FunctionType = 'SUM',    --Агрегатная функция, по умолчани
			@Condition = 'WHERE CategoryName =' 'Комплектующие компьютера'''
----
-------
---------
-----------=====
--Cursors FETCH

use Northwind;
--обьявление куросора
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
        PRINT 'Товар не продовался';
      END
    ELSE
      BEGIN
        PRINT CONCAT('N order: ', @idOrder, 'Дата: ', @ordDate);
      END
    WHILE @@FETCH_STATUS = 0
    BEGIN
      FETCH NEXT FROM o INTO @ordDate, @idOrder;
      PRINT CONCAT('N order: ', @idOrder, 'Дата: ', @ordDate);
    END
    CLOSE o
    PRINT '==============================';
  END
  ELSE
    BEGIN
    PRINT 'Товаров нет!!!!';    
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
        PRINT 'Товар не продовался';
      END
    ELSE
      BEGIN
        PRINT CONCAT('N order: ', @idOrdero, 'Дата: ', @ordDateo);
      END
    WHILE @@FETCH_STATUS = 0
    BEGIN
      FETCH NEXT FROM oo INTO @ordDate, @idOrder;
      PRINT CONCAT('N order: ', @idOrdero, 'Дата: ', @ordDateo);
    END
    CLOSE oo
    
    PRINT '==============================';
    PRINT '';
    PRINT '';
    PRINT '';
  END
CLOSE c
DEALLOCATE c



