
create database m3_chuyen_doi_mhqh;
use m3_chuyen_doi_mhqh;
create table supplier(
id int primary key,
name varchar(20),
address varchar(20)
);
create table phone_supplier(
phone_number varchar(20),
supplier_id int,
foreign key (supplier_id) references supplier(id)
);
create table orders(
id int primary key auto_increment,
order_time date,
supplier_id int,
foreign key (supplier_id) references supplier(id)
);
create table supplies(
id int primary key auto_increment,
name varchar(20)
);
create table supplies_orders(
supplies_id int,
orders_id int,
primary key (supplies_id,orders_id),
foreign key (supplies_id) references supplies(id),
foreign key (orders_id) references orders(id)
);
create table input_form(
id int primary key auto_increment,
input_time date
);
create table supplies_input_form(
supplies_id int,
input_form_id int,
input_name varchar(20),
quantity int,
primary key(supplies_id,input_form_id),
foreign key (supplies_id) references supplies(id),
foreign key (input_form_id) references input_form(id)
);
create table output_form(
id int primary key auto_increment,
output_time date
);
create table supplies_output_form(
supplies_id int,
output_form_id int,
output_name varchar(20),
quantity int,
primary key (supplies_id,output_form_id),
foreign key (supplies_id) references supplies(id),
foreign key (output_form_id) references output_form(id)
);