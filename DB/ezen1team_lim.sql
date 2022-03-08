use ezen1;

CREATE TABLE codelist(
num int NOT NULL AUTO_INCREMENT PRIMARY KEY,
m1 varchar(100) not null,
m2 varchar(100),
m3 varchar(100),
m4 varchar(100),
m5 varchar(100),
title varchar(100),
user varchar(100),
etc varchar(100),
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from codelist;

commit;

create table department(
num int NOT NULL AUTO_INCREMENT PRIMARY KEY,
dpcode varchar(100) not null,
dpname varchar(100) not null,
menu varchar(100),
etc varchar(100),
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from department;

create table status(
num int NOT NULL AUTO_INCREMENT PRIMARY KEY,
status varchar(100) not null,
ok varchar(30),
etc varchar(100),
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from status;

create table storehouse(
shnum varchar(100) not null,
num int not null AUTO_INCREMENT PRIMARY KEY,
shname varchar(100) not null,
detail varchar(100),
etc varchar(100),
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from storehouse;
