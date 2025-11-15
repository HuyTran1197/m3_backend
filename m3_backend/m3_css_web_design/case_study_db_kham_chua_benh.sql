create database m3_kham_chua_benh;
use m3_kham_chua_benh;
create table account(
username varchar(20) primary key,
password varchar(20)
);
create table admin(
id int primary key auto_increment,
username varchar(20),
foreign key (username) references account(username),
name varchar(20),
gender boolean,
email varchar(20),
phone varchar(20)
);
create table customer_type(
id int primary key auto_increment,
name varchar(20)
);
create table customer(
id int primary key auto_increment,
username varchar(20),
customer_type_id int,
foreign key (username) references account(username),
foreign key (customer_type_id) references customer_type(id),
name varchar(20),
gender boolean,
birthday date,
email varchar(20),
phone varchar(20),
address varchar(20)
);
create table service(
id int primary key auto_increment,
name varchar(20),
doctor_name varchar(20)
);
create table medical_forms(
id int primary key auto_increment,
customer_id int,
service_id int,
foreign key (customer_id) references customer(id),
foreign key (service_id) references service(id),
date_time date
);
create table pay_type(
id int primary key auto_increment,
name varchar(20)
);
create table dietary_supplements(
id int primary key auto_increment,
name varchar(20),
production_date date,
exp_date date,
description varchar(50),
price double
);
create table orders(
id int primary key,
supplements_id int,
customer_id int,
pay_type_id int,
foreign key (supplements_id) references dietary_supplements(id),
foreign key (customer_id) references customer(id),
foreign key (pay_type_id) references pay_type(id),
quantity int,
date_time datetime
);
alter table account
add column date_create date;
-- insert table 
insert into account(username, password, date_create) values
('admin1', 'pass123', '2019-01-01'),
('admin2', 'pass234', '2019-02-01'),
('cust1', 'cust123', '2022-03-01'),
('cust2', 'cust234', '2022-04-01'),
('cust3', 'cust345', '2022-05-01');

insert into admin(username, name, gender, email, phone) values
('admin1', 'Nguyen Van Hung', 1, 'hung@gmail.com', '0901111111'),
('admin2', 'Tran Le Quyen', 0, 'manh@gmail.com', '0902222222');
update admin set email = 'quyen@gmail.com' where id = 2;

INSERT INTO customer_type(name) VALUES
('Premium'),
('Gold'),
('Silver'),
('Normal');

INSERT INTO customer(username, customer_type_id, name, gender, birthday, email, phone, address) VALUES
('cust1', 1, 'Le Van Luyen', 1, '1990-05-12', 'luyen@gmail.com', '0911111111', 'Da Nang'),
('cust2', 2, 'Pham Thi Dinh', 0, '1985-08-20', 'dinh@gmail.com', '0912222222', 'Hue'),
('cust3', 3, 'Hoang Duy Hai', 1, '1992-12-03', 'hai@gmail.com', '0913333333', 'Ha Noi');

INSERT INTO service(name, doctor_name) VALUES
('General Checkup', 'Dr. Nguyen'),
('Dental Cleaning', 'Dr. Tran'),
('Blood Test', 'Dr. Le'),
('Eye Exam', 'Dr. Hoang');

INSERT INTO medical_forms(customer_id, service_id, date_time) VALUES
(3, 3, '2022-07-03'),
(3, 3, '2022-08-03'),
(1, 1, '2022-11-01'),
(1, 1, '2022-12-01'),
(1, 4, '2023-01-04'),
(2, 2, '2024-01-02'),
(2, 1, '2025-05-15');

INSERT INTO pay_type(name) VALUES
('Cash'),
('Bank Transfer');

INSERT INTO dietary_supplements(name, production_date, exp_date, description, price) VALUES
('Vitamin C', '2023-01-01', '2026-01-01', 'Hỗ trợ miễn dịch', 100000),
('Omega 3', '2023-01-01', '2026-01-01', 'Tim mạch khỏe mạnh', 200000),
('Calcium', '2023-01-01', '2026-01-01', 'Xương chắc khỏe', 150000),
('Multivitamin', '2023-01-01', '2026-01-01', 'Bổ sung vitamin mỗi ngày', 120000);

INSERT INTO orders(id, supplements_id, customer_id, pay_type_id, quantity, date_time) VALUES
(1, 1, 1, 2, 2, '2024-02-10 10:00:00'),
(2, 4, 1, 2, 1, '2024-02-10 10:00:00'),
(3, 2, 2, 1, 2, '2025-05-11 11:00:00'),
(4, 3, 3, 2, 3, '2025-07-12 12:00:00'),
(5, 4, 1, 1, 1, '2025-11-10 14:00:00');





