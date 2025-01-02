create table employees
(
    id         int auto_increment primary key,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    phone      varchar(255) unique not null,
    skills     varchar(255),
    salary     int
);

create table teatchers_full_info
(
    id             int auto_increment primary key,
    email          varchar(255) not null,
    country        varchar(100) not null,
    city           varchar(100) not null,
    address        varchar(100) not null,
    is_married     boolean,
    date_of_birth  varchar(20),
    count_children int
);

create table teatchers
(
    id                 int auto_increment primary key,
    first_name         varchar(30)        not null,
    last_name          varchar(30)        not null,
    age                int,
    phone              varchar(20) unique not null,
    email              varchar(255)       not null,
    skills             varchar(20),
    id_teachers_full_info int UNIQUE,
    FOREIGN KEY (id_teachers_full_info) REFERENCES teachers_full_info (id)
);