create database m3_ss2_sales;
use m3_ss2_sales;
create table customer(
id int primary key auto_increment,
name varchar(20),
birthday date
);
create table orders(
id int primary key auto_increment,
order_time date,
total_price float,
customer_id int,
foreign key (customer_id) references customer(id)
);
create table product(
id int primary key auto_increment,
name varchar(20),
price float
);
create table order_detail(
order_id int,
product_id int,
quantity int,
primary key(order_id,product_id),
foreign key (order_id) references orders(id),
foreign key (product_id) references product(id)
);