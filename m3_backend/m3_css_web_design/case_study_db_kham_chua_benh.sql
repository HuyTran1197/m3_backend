drop database m3_kham_chua_benh;
create database m3_kham_chua_benh;
use m3_kham_chua_benh;
create table account(
username varchar(20) primary key,
password varchar(20),
date_create date,
roll varchar(20)
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
id int primary key,
customer_id int,
foreign key (customer_id) references customer(id),
date_time date
);
create table forms_detail(
id int primary key,
forms_id int,
service_id int,
foreign key (forms_id) references medical_forms(id),
foreign key (service_id) references service(id),
diagnosis_terminology varchar(100),
prescription varchar(100),
prescription_price double,
date_time datetime
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
customer_id int,
pay_type_id int,
foreign key (customer_id) references customer(id),
foreign key (pay_type_id) references pay_type(id),
date_time date
);
create table orders_detail(
id int primary key,
orders_id int,
supplements_id int,
foreign key (orders_id) references orders(id),
foreign key (supplements_id) references dietary_supplements(id),
quantity int,
date_time datetime
);
-- insert table 
insert into account(username, password, date_create, roll) values
('admin1', 'pass123', '2019-01-01', 'admin'),
('admin2', 'pass234', '2019-02-01', 'admin'),
('cust1', 'cust123', '2022-03-01', 'customer'),
('cust2', 'cust234', '2022-04-01', 'customer'),
('cust3', 'cust345', '2022-05-01', 'customer');

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

INSERT INTO medical_forms(id, customer_id, date_time) VALUES
(1, 1, '2022-03-05 09:00:00'),
(2, 2, '2022-04-10 10:00:00'),
(3, 3, '2022-05-15 14:00:00'),
(4, 1, '2023-03-10 09:00:00'),
(5, 2, '2023-06-12 10:30:00'),
(6, 3, '2023-09-20 13:45:00'),
(7, 1, '2024-01-25 08:30:00'),
(8, 2, '2024-04-18 09:15:00'),
(9, 3, '2024-10-02 15:10:00'),
(10, 1, '2025-02-14 11:00:00'),
(11, 2, '2025-03-21 14:20:00'),
(12, 3, '2025-05-01 16:45:00');

INSERT INTO forms_detail(id, forms_id, service_id, diagnosis_terminology, prescription,
prescription_price, date_time) VALUES
(1, 1, 1, 'Cảm lạnh nhẹ', 'Vitamin C', 50000, '2022-03-05 09:20:00'),
(2, 2, 2, 'Viêm nướu', 'Súc miệng', 60000, '2022-04-10 10:25:00'),
(3, 3, 4, 'Khô mắt nhẹ', 'Thuốc nhỏ mắt', 45000, '2022-05-15 14:20:00'),
(4, 4, 1, 'Mệt mỏi', 'Vitamin tổng hợp', 90000, '2023-03-10 09:20:00'),
(5, 5, 3, 'Thiếu máu nhẹ', 'Bổ sung sắt', 70000, '2023-06-12 10:50:00'),
(6, 6, 2, 'Ê buốt răng', 'Gel chống ê', 85000, '2023-09-20 14:00:00'),
(7, 7, 1, 'Suy nhược cơ thể', 'Bổ sung năng lượng', 95000, '2024-01-25 08:50:00'),
(8, 8, 4, 'Mỏi mắt', 'Nước mắt nhân tạo', 65000, '2024-04-18 09:35:00'),
(9, 9, 3, 'Đau đầu', 'Thuốc giảm đau', 50000, '2024-10-02 15:30:00'),
(10, 10, 2, 'Viêm lợi nhẹ', 'Dung dịch vệ sinh', 60000, '2025-02-14 11:20:00'),
(11, 11, 1, 'Căng thẳng', 'Vitamin B complex', 75000, '2025-03-21 14:40:00'),
(12, 12, 4, 'Mỏi mắt do làm việc', 'Thuốc nhỏ mắt', 55000, '2025-05-01 17:05:00');

INSERT INTO pay_type(name) VALUES
('Cash'),
('Bank Transfer');

INSERT INTO dietary_supplements(name, production_date, exp_date, description, price) VALUES
('Vitamin C', '2023-01-01', '2026-01-01', 'Hỗ trợ miễn dịch', 100000),
('Omega 3', '2023-01-01', '2026-01-01', 'Tim mạch khỏe mạnh', 200000),
('Calcium', '2023-01-01', '2026-01-01', 'Xương chắc khỏe', 150000),
('Multivitamin', '2023-01-01', '2026-01-01', 'Bổ sung vitamin mỗi ngày', 120000);

INSERT INTO orders(id, customer_id, pay_type_id, date_time) VALUES
-- 2022
(1, 1, 1, '2022-03-06 15:00:00'),
(2, 2, 2, '2022-04-12 11:00:00'),
(3, 3, 1, '2022-05-17 10:00:00'),

-- 2023
(4, 1, 2, '2023-03-11 10:00:00'),
(5, 2, 1, '2023-06-13 12:00:00'),
(6, 3, 2, '2023-09-22 09:30:00'),

-- 2024
(7, 1, 1, '2024-02-05 14:10:00'),
(8, 2, 2, '2024-04-20 16:15:00'),
(9, 3, 1, '2024-10-05 11:35:00'),

-- 2025
(10, 1, 2, '2025-02-16 13:50:00'),
(11, 2, 1, '2025-03-23 09:25:00'),
(12, 3, 2, '2025-05-02 18:10:00');


INSERT INTO orders_detail(id, orders_id, supplements_id, quantity, date_time) VALUES
-- 2022
(1, 1, 1, 1, '2022-03-06 15:05:00'),
(2, 1, 4, 1, '2022-03-06 15:05:00'),
(3, 2, 2, 1, '2022-04-12 11:05:00'),
(4, 2, 3, 1, '2022-04-12 11:05:00'),
(5, 2, 4, 1, '2022-04-12 11:05:00'),
(6, 3, 4, 1, '2022-05-17 10:05:00'),

-- 2023
(7, 4, 1, 1, '2023-03-11 10:05:00'),
(8, 5, 2, 1, '2023-06-13 12:05:00'),
(9, 5, 4, 1, '2023-06-13 12:05:00'),
(10, 6, 3, 1, '2023-09-22 09:35:00'),

-- 2024
(11, 7, 1, 1, '2024-02-05 14:15:00'),
(12, 7, 3, 1, '2024-02-05 14:15:00'),
(13, 8, 4, 1, '2024-04-20 16:20:00'),
(14, 9, 2, 1, '2024-10-05 11:40:00'),
(15, 9, 3, 1, '2024-10-05 11:40:00'),
(16, 9, 4, 1, '2024-10-05 11:40:00'),

-- 2025
(17, 10, 1, 1, '2025-02-16 13:55:00'),
(18, 11, 4, 1, '2025-03-23 09:30:00'),
(19, 11, 2, 1, '2025-03-23 09:30:00'),
(20, 12, 3, 1, '2025-05-02 18:15:00');






