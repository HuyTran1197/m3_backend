create database m3_demo_exam_abc_company;
use m3_demo_exam_abc_company;
create table category_unit(
id int primary key auto_increment,
name varchar(50)
);
create table category_type(
id int primary key auto_increment,
name varchar(50)
);
create table products(
id varchar(20) primary key,
products_unit int,
products_type int,
foreign key(products_unit) references category_unit(id),
foreign key(products_type) references category_type(id),
name varchar(50),
price double,
receive_date date
);

-- insert into category_unit
insert into category_unit(name) values('kg'),
('túi'),
('bó');
-- insert into category_type
insert into category_type(name) values('Rau'),
('Củ'),
('Quả'),
('Hoa');
-- insert into products
insert into products(id,products_unit,products_type,name,price,receive_date) 
values('MHH-0001',1,1,'Rau muống',20000,'2025-12-18'),
('MHH-0002',1,2,'Cà rốt',15000,'2025-12-18'),
('MHH-0003',3,4,'Huớng dương',30000,'2025-12-18'),
('MHH-0004',1,3,'Táo',25000,'2025-12-18'),
('MHH-0005',1,3,'Lê',20000,'2025-12-18'),
('MHH-0006',1,3,'Nho',30000,'2025-12-18'),
('MHH-0007',1,3,'Cam',35000,'2025-12-18'),
('MHH-0008',1,3,'Việt quất',18000,'2025-12-18'),
('MHH-0009',1,2,'Cà chua',15000,'2025-12-18'),
('MHH-0010',1,2,'Ớt',30000,'2025-12-18'),
('MHH-0011',1,2,'Khoai sắn',20000,'2025-12-18'),
('MHH-0012',2,1,'Rau dền',20000,'2025-12-18'),
('MHH-0013',2,1,'Rau cải thìa',23000,'2025-12-18'),
('MHH-0014',3,4,'Hồng',30000,'2025-12-18'),
('MHH-0015',3,4,'Ly',28000,'2025-12-18');

select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p
join category_unit cu on p.products_unit = cu.id
join category_type ct on p.products_type = ct.id
order by p.id;

select * from category_unit;

select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p
join category_unit cu on p.products_unit = cu.id
join category_type ct on p.products_type = ct.id
where p.name like '%CAM%' and cu.name like '%KG%' and ct.name like '%qu%';


