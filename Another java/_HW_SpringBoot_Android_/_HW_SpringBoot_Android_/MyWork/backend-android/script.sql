-- create table employees
-- (
--     id         int auto_increment
--         primary key,
--     first_name varchar(255) not null,
--     last_name  varchar(255) not null,
--     department varchar(255) null,
--     salary     int null
-- );



create database notesdb;
use notesdb;

create table users(
                      id int auto_increment primary key,
                      login varchar(255) not null,
                      email varchar(255) not null,
                      password varchar(255) not null
)

CREATE TABLE records (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         user_id INT NOT NULL,
                         record_name VARCHAR(255) NOT NULL,
                         description NVARCHAR(2000) NULL,
                         FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
