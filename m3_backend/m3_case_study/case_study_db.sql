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

use m3_case_study_db;

-- insert cac thong tin vao table 
insert into office(id,name) values(1,'Le Tan');
insert into office(id,name) values(2,'Buong Phong');
insert into office(id,name) values(3,'Dau Bep');
insert into office(id,name) values(4,'Bartender');
insert into office(id,name) values(5,'Tap Vu');
update office set name = 'Phuc Vu' where id = 2;
update office set name = 'Chuyen Vien' where id = 3;
update office set name = 'Giam Sat' where id = 4;
update office set name = 'Quan Ly' where id = 5;
insert into office(id,name) values(6,'Giam Doc');

insert into level(id,name) values(1,'12/12');
insert into level(id,name) values(2,'Trung Cap');
insert into level(id,name) values(3,'Cao Dang');
insert into level(id,name) values(4,'Dai Hoc');
insert into level(id,name) values(5,'Cao Hoc');

insert into department(id,name) values(1,'Sales-Marketing');
insert into department(id,name) values(2,'Hanh Chinh');
insert into department(id,name) values(3,'Phuc Vu');
insert into department(id,name) values(4,'Quan Ly');

insert into employee(name,birthday,employee_id,salary,phone,email,address,office_id,level_id,department_id)
values('Huynh Ngoc Dieu','2000-12-30','042078901234',7000000,'0983123789','dieu123@gmail.com','Da Nang',1,4,2);
insert into employee(name,birthday,employee_id,salary,phone,email,address,office_id,level_id,department_id)
values('Dinh Van Long','2000-8-30','042078901212',7000000,'0983123987','longdv@gmail.com','Da Nang',4,3,3);
insert into employee(name,birthday,employee_id,salary,phone,email,address,office_id,level_id,department_id)
values('Phan Nguyen Thanh','2003-9-15','042078901210',6500000,'0905123980','thanhpn@gmail.com','Kon Tum',4,3,3);
insert into employee(name,birthday,employee_id,salary,phone,email,address,office_id,level_id,department_id)
values('Phan Gioi','1995-9-15','042078901257',10000000,'0905123120','gioi@gmail.com','Quang Nam',3,2,3);
insert into employee(name,birthday,employee_id,salary,phone,email,address,office_id,level_id,department_id)
values('Nguyen Thi Le','1987-2-15','042078901255',6500000,'0905978009','lent@gmail.com','Binh Dinh',2,2,3);

insert into type_customer(name) values('Diamond');
insert into type_customer(name) values('Platinium');
insert into type_customer(name) values('Gold');
insert into type_customer(name) values('Silver');
insert into type_customer(name) values('Member');

insert into customer(guest_id,name,birthday,gender,customer_id,phone,email,address)
values(3,'Nguyen Manh','1990-10-12',true,'048079900089','0908890789','manh90@gmail.com','Ha Noi');
insert into customer(guest_id,name,birthday,gender,customer_id,phone,email,address)
values(4,'Nguyen Minh Hung','1993-10-12',true,'048079900098','0908890710','hung93@gmail.com','Nghe An');
insert into customer(guest_id,name,birthday,gender,customer_id,phone,email,address)
values(4,'Le Huu Loc','1989-1-15',true,'048079900012','0908890123','loclh@gmail.com','Hai Phong');
insert into customer(guest_id,name,birthday,gender,customer_id,phone,email,address)
values(1,'John Wilson','1965-3-20',true,'048079900023','1430200803','wilson@mail.com','Florida');
insert into customer(guest_id,name,birthday,gender,customer_id,phone,email,address)
values(5,'Halk Dysel','2002-5-20',true,'048079900020','1430200805','dysel@mail.com','London');

insert into type_service(name) values('Free');
insert into type_service(name) values('Pay');
update type_service set name = 'Villa' where id = 1;
update type_service set name = 'House' where id = 2;
insert into type_service(name) values('Room');
update type_service set name = 'Free' where id = 1;
update type_service set name = 'Pay' where id = 2;
delete from type_service where id = 3;

insert into type_rent(name) values('Year');
insert into type_rent(name) values('Month');
insert into type_rent(name) values('Day');
insert into type_rent(name) values('Hour');

insert into service(name,area,cost,max,rent_id,type_service_id,standard,describes,pool_area,floor)
values('Villa',300,250,10,3,2,'VIP','full tien nghi,ho boi,bep BBQ',30,3);
insert into service(name,area,cost,max,rent_id,type_service_id,standard,describes,pool_area,floor)
values('Villa',500,7000,10,2,2,'VIP','full tien nghi,ho boi,bep BBQ',40,4);
insert into service(name,area,cost,max,rent_id,type_service_id,standard,describes,floor)
values('House',80,120,4,3,2,'NORMAL','2 bed room,2 WC',2);
insert into service(name,area,cost,max,rent_id,type_service_id,standard,describes,floor)
values('House',80,150,6,3,2,'VIP','3 bed room,3 WC',3);
insert into service(name,area,cost,max,rent_id,type_service_id,standard,describes)
values('Room',30,50,2,3,1,'NORMAL','1 bed, 1 WC');
insert into service(name,area,cost,max,rent_id,type_service_id,standard,describes)
values('Room',50,80,4,3,1,'VIP','2 bed room, 2 WC');

insert into contract(id,start_time,end_time,deposit,employee_id,customer_id,service_id)
values(1,'2025-6-25 11:15:30','2025-6-26 11:15:30',20,5,3,5);
insert into contract(id,start_time,end_time,deposit,employee_id,customer_id,service_id)
values(2,'2025-6-25 11:15:30','2025-7-25 11:15:30',100,3,4,2);
insert into contract(id,start_time,end_time,deposit,employee_id,customer_id,service_id)
values(3,'2025-9-7 10:45:30','2025-9-8 10:45:30',20,2,5,4);

insert into add_service(id,name,price,unit,status) values(1,'Massage',7,1,'còn');
insert into add_service(id,name,price,unit,status) values(2,'Thue xe',10,1,'còn');
insert into add_service(id,name,price,unit,status) values(3,'Karaoke',100,1,'còn');
insert into add_service(id,name,price,unit,status) values(4,'Food and Drinks',10,5,'còn');

insert into contract_detail(contract_id,service_id,quantity) values(1,1,1);
insert into contract_detail(contract_id,service_id,quantity) values(2,3,1);
insert into contract_detail(contract_id,service_id,quantity) values(3,2,3);

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự