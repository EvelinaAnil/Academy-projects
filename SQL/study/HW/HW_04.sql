/*������� 1. �������� ���� ������ ����������� ����������.
��� ���� ������ ������ ��������� ���� ������� �����. 
� ������� ����� �������: ��� ��������, ���� ��������, ���, �������, ����� ����������, ������ ����������, �������� �����.
��� �������� ���� ������ ����������� ������ CREATE DATABASE.
��� �������� ������� ����������� ������ CREATE TABLE.*/
--1
CREATE DATABASE LHW_04__1
ON PRIMARY
(
name= ����������_����������,
filename='E:\���\SQL\study\HW\LHW_04__1.mdf',
size=12MB,
maxsize=20MB,
filegrowth=2MB
)
LOG ON
(
name= ����������_����������_log,
filename='E:\���\SQL\study\HW\LHW_04__1_log.ldf',
size=2MB,
maxsize=11MB,
filegrowth=1MB
)
COLLATE Latin1_general_CI_AI

USE LHW_04__1;
go
CREATE TABLE People
(
ID INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Date_of_birth DATE,
Sex NVARCHAR(20),
Contry NVARCHAR(20),
Adress VARCHAR(100),
Phone VARCHAR(20)
)
/*������� 2. �������� ���� ������ ��������. ���� ������ ������ ���������
���������� � ���������, �����������, ��������. ���������� ������� ���������
����������:
1. � ���������: ���, email, ���������� �������
2. � �����������: ���, email, ���������� �������
3. � ��������: ����������, ��������, �������� ������, ���� �������, ���� ������.
��� �������� ���� ������ ����������� ������ CREATE DATABASE. ��� ��������
������� ����������� ������ CREATE TABLE. ����������� ��� �������� ������
�������� ����� ����� ����.*/
--2
CREATE DATABASE LHW_04__2
ON PRIMARY
(
name= �������,
filename='E:\���\SQL\study\HW\LHW_04__2.mdf',
size=12MB,
maxsize=20MB,
filegrowth=2MB
)
LOG ON
(
name= �������_log,
filename='E:\���\SQL\study\HW\LHW_04__2_log.ldf',
size=2MB,
maxsize=11MB,
filegrowth=1MB
)
COLLATE Latin1_general_CI_AI
--
USE LHW_04__2;
go
CREATE TABLE Prodavec
(
ID_1 INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100),
Phone VARCHAR(20)
)
--
CREATE TABLE Costumer
(
ID_2 INT,
FName NVARCHAR(20),
LNAME NVARCHAR(20),
Email VARCHAR(100),
Phone VARCHAR(20)
)
--
CREATE TABLE Orders1
(
ID_orders INT,
ProdavecId INT,
CostumerId INT,
Name_tovar NVARCHAR(20),
Price FLOAT(23),
Date_deal DATE,



PRIMARY KEY (ProdavecId,CostumerId)
);