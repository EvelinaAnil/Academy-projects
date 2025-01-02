/*Задание 1. Создайте базу данных «Телефонный справочник».
Эта база данных должна содержать одну таблицу «Люди». 
В таблице нужно хранить: ФИО человека, дату рождения, пол, телефон, город проживания, страна проживания, домашний адрес.
Для создания базы данных используйте запрос CREATE DATABASE.
Для создания таблицы используйте запрос CREATE TABLE.*/
--1
CREATE DATABASE LHW_04__1
ON PRIMARY
(
name= телефонный_справочник,
filename='E:\ШАГ\SQL\study\HW\LHW_04__1.mdf',
size=12MB,
maxsize=20MB,
filegrowth=2MB
)
LOG ON
(
name= телефонный_справочник_log,
filename='E:\ШАГ\SQL\study\HW\LHW_04__1_log.ldf',
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
/*Задание 2. Создайте базу данных «Продажи». База данных должна содержать
информацию о продавцах, покупателях, продажах. Необходимо хранить следующую
информацию:
1. О продавцах: ФИО, email, контактный телефон
2. О покупателях: ФИО, email, контактный телефон
3. О продажах: покупатель, продавец, название товара, цена продажи, дата сделки.
Для создания базы данных используйте запрос CREATE DATABASE. Для создания
таблицы используйте запрос CREATE TABLE. Обязательно при создании таблиц
задавать связи между ними.*/
--2
CREATE DATABASE LHW_04__2
ON PRIMARY
(
name= Продажи,
filename='E:\ШАГ\SQL\study\HW\LHW_04__2.mdf',
size=12MB,
maxsize=20MB,
filegrowth=2MB
)
LOG ON
(
name= Продажи_log,
filename='E:\ШАГ\SQL\study\HW\LHW_04__2_log.ldf',
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