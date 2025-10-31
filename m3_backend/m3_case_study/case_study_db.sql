drop database m3_case_study_db;
create database m3_case_study_db;
use m3_case_study_db;
create table office(
id int primary key,
name varchar(45)
);
create table level(
id int primary key,
name varchar(45)
);
create table department(
id int primary key,
name varchar(45)
);
create table employee(
id int primary key auto_increment,
name varchar(45),
birthday date,
employee_id varchar(45),
salary double,
phone varchar(45),
email varchar(45),
address varchar(45),
office_id int,
level_id int,
department_id int,
foreign key (office_id) references office(id),
foreign key (level_id) references level(id),
foreign key (department_id) references department(id)
);
create table type_customer(
id int primary key auto_increment,
name varchar(45)
);
create table customer(
id int primary key auto_increment,
guest_id int,
foreign key (guest_id) references type_customer(id),
name varchar(45),
birthday date,
gender boolean,
customer_id varchar(45),
phone varchar(45),
email varchar(45),
address varchar(45)
);
create table type_service(
id int primary key auto_increment,
name varchar(45)
);
create table type_rent(
id int primary key auto_increment,
name varchar(45)
);
create table service(
id int primary key auto_increment,
name varchar(45),
area int,
cost double,
max int,
rent_id int,
type_service_id int,
foreign key (rent_id) references type_rent(id),
foreign key (type_service_id) references type_service(id),
standard varchar(45),
describes varchar(45),
pool_area double,
floor int
);
create table contract(
id int primary key,
start_time datetime,
end_time datetime,
deposit double,
employee_id int,
customer_id int,
service_id int,
foreign key(employee_id) references employee(id),
foreign key(customer_id) references customer(id),
foreign key(service_id) references service(id)
);
create table add_service(
id int primary key,
name varchar(45),
price double,
unit varchar(10),
status varchar(45)
);
create table contract_detail(
id int primary key auto_increment,
contract_id int,
service_id int,
foreign key (contract_id) references contract(id),
foreign key (service_id) references add_service(id),
quantity int
);


-- insert cac thong tin vao table 