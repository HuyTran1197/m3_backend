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

select p.id,p.name,p.description,p.price, c.name as category_name 
from products p 
join category c on c.id = p.category_id;

select c.*, p.name as products_name 
from category c
join products p on c.id = p.category_id;

