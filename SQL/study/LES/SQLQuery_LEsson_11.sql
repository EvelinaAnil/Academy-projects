creATE DATABASE L11_23pr31;
go
use  L11_23pr31;
go

CREATE TABLE T1
(
    Id INT NOT NULL,
    ProdName NVARCHAR(50) NOT NULL,
    CategoryId INT NULL
);
go
INSERT INTO T1
VALUES 
(100,'t1', 1),
(105,'t2', 2),
(103,'t3', 3),
(101,'t4', 4),
(107,'t5', 5),
(1,'t6', 6);
go
SELECT * FROM T1
---
SELECT * FROM T1 WHERE Id=107
-------1 способ не куча
CREATE CLUSTERED index IX_Index_T1 ON T1
(
Id ASC)
--
SELECT * FROM T1
-----------
CREATE TABLE T2
(
    Id INT NOT NULL,
    ProdName NVARCHAR(50) NOT NULL,
    CategoryId INT NULL
);
go
INSERT INTO T2
VALUES 
(100,'t1', 1),
(105,'t2', 2),
(103,'t3', 3),
(101,'t4', 4),
(107,'t5', 5),
(1,'t6', 6);
go
---2 вариант перейти от кучи
ALTER Table T2 ADD CONSTRAINT PK_T2 PRIMARY KEY
(
Id ASC
)
---
SELECT * FROM T2
---
--3 вариант перейти от кучи (Некластерный индекс)
CREATE TABLE T5
(
    Id INT NOT NULL,
    ProdName NVARCHAR(50) NOT NULL,
    CategoryId INT NULL
);
INSERT INTO T5
VALUES 
(100,'t1', 1),
(105,'t2', 2),
(103,'t3', 3),
(101,'t4', 4),
(107,'t5', 5),
(1,'t6', 6);
----
SELECT * FROM T5 WHERE ID =1
---5 v
ALTER TABLE T5 ADD CONSTRAINT UN_Id_T5  UNIQUE
(
    Id ASC
)
------
CREATE NONCLUSTERED INDEX IX_NONClusteredIndex_TestTabl2 ON T2
(
CategoryId ASC)

SELECT * FROM T2 WHERE CategoryId =5
---
DROP INDEX IX_NONClusteredIndex_TestTabl2 ON T2

ALTER INDEX IX_NonClustered ON TestTable REBuild Go --Reorganize go
---
ALTER INDEX IX_NonClustered ON TestTable REORGANIZE GO 

  ----
   ALTER INDEX IX_NonClustered ON TestTable   REBUILD GO

---
SELECT OBJECT_NAME(T1.object_id) AS NameTable,
         T1.index_id AS IndexId, 
         T2.name AS IndexName, 
         T1.avg_fragmentation_in_percent AS Fragmentation 
  FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS T1
  LEFT JOIN sys.indexes AS T2 ON T1.object_id = T2.object_id AND T1.index_id = T2.index_id
----
use  Northwind;
go
-----
