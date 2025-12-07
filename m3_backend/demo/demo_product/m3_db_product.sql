drop database m3_product_manager;
create database m3_product_manager;
use m3_product_manager;
create table category(
id int primary key auto_increment,
name varchar(50)
);
create table products(
id int primary key auto_increment,
category_id int,
foreign key (category_id) references category(id),
name varchar(50),
description varchar(50),
price double
);

select * from products;
insert into category(name) values("Smartphone"),
("Television"),
("Computer");
