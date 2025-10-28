drop database m3_sales;
create database m3_sales;
use m3_sales;
create table goods(
id int primary key,
name varchar(20),
price float
);
create table customer(
id int primary key,
name varchar(20)
);
create table phone_customer(
phone_number varchar(20),
customer_id int,
foreign key (customer_id) references customer(id)
);
create table goods_customer(
goods_id int,
customer_id int,
quantity int,
sold_time date,
primary key (goods_id,customer_id),
foreign key(goods_id) references goods(id),
foreign key(customer_id) references customer(id)
);
create table staff(
id int primary key auto_increment,
name varchar(20),
birthday date,
salary float
);
create table phone_staff(
phone_number varchar(20),
staff_id int,
foreign key(staff_id) references staff(id)
);
create table goods_staff(
goods_id int,
staff_id int,
quantity int,
receive_time date,
primary key (goods_id,staff_id),
foreign key(goods_id) references goods(id),
foreign key(staff_id) references staff(id)
);
create table customer_staff(
staff_id int,
customer_id int,
start_work date,
end_deal date,
primary key (staff_id,customer_id),
foreign key(staff_id) references staff(id),
foreign key(customer_id) references customer(id)
);
