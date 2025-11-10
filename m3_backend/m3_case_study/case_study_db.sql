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

-- 1/ insert cac thong tin vao table 
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

-- 2/ Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
use m3_case_study_db;
select * 
from employee
where (name like 'h%' or name like 't%' or name like 'k%')
and length(name)<=15;

-- 3/ Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”
select * 
from customer where (birthday >= 18 or birthday <= 50) and
address = 'Da Nang' or address = 'Quang Tri';

-- 4/ Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có  Tên  loại   khách   hàng  là “Diamond”
select c.id, c.name, count(ct.customer_id) as book_times
from customer c
inner join contract ct on c.id = ct.customer_id
where guest_id = 1
group by c.id
order by book_times asc;

-- 5/ Hiển   thị  ma_khach_hang,   ho_ten,   ten_loai_khach,   ma_hop_dong,
-- ten_dich_vu,   ngay_lam_hop_dong,   ngay_ket_thuc,   tong_tien  (Với
-- tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng *
-- Giá,   với   Số   Lượng   và   Giá   là   từ   bảng   dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những
-- khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)
select c.id, c.name, ts.name as type_customer, ct.id as contract_id, sv.name as service_name,
ct.start_time, ct.end_time, ((sv.cost*(day(ct.end_time)-day(ct.start_time)))+sum(ctdt.quantity*adsv.price)) as total_price
from customer c
left join type_customer ts on c.guest_id = ts.id
left join contract ct on c.id = ct.customer_id
left join service sv on ct.service_id = sv.id
left join contract_detail ctdt on ct.id = ctdt.contract_id
left join add_service adsv on ctdt.service_id = adsv.id
group by c.id,c.name,ts.name,ct.id,sv.name,ct.start_time,ct.end_time;

-- 6/ Hiển thị  ma_dich_vu,   ten_dich_vu,   dien_tich,   chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)
use m3_case_study_db;
insert into contract(id,start_time,end_time,deposit,employee_id,customer_id,service_id)
values(4,'2021-2-23','2021-3-23',100,3,1,3);
update contract ct set ct.start_time = '2021-2-23 10:45:20' where id = 4;
update contract ct set ct.end_time = '2021-3-23 10:45:50' where id = 4;

select sv.id,sv.name,sv.area,sv.cost,ts.name
from service sv
left join type_service ts on sv.type_service_id = ts.id
left join contract ct on sv.id = ct.service_id
where sv.id not in(select distinct ct.service_id
from contract ct
where year(ct.start_time) = 2021 and quarter(ct.start_time) = 1);

-- 7/ Hiển   thị   thông   tin  ma_dich_vu,   ten_dich_vu,   dien_tich, so_nguoi_toi_da,   chi_phi_thue,   ten_loai_dich_vu  của tất cả các loại
-- dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021
update contract ct set ct.start_time = '2020-5-23 10:45:20' where id = 2;
update contract ct set ct.end_time = '2020-5-25 10:45:50' where id = 2;

select sv.id,sv.name,sv.area,sv.max,sv.cost,ts.name
from service sv
left join type_service ts on sv.type_service_id = ts.id
left join contract ct on sv.id = ct.service_id
where sv.id in(select distinct ct.service_id
from contract ct
where year(ct.start_time) = 2020 and not year(ct.start_time) = 2021);

-- 8/ Hiển thị thông tin  ho_ten  khách hàng  có trong hệ thống, với yêu cầu ho_ten không trùng nhau. Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
insert into customer(guest_id,name,birthday,customer_id,phone,email,address)
values(3,'Nguyen Manh','1990-10-12',048079900082,0908890777,'manh@gmail.com','Da Nang');
-- cach 1
select distinct name
from customer;
-- cach 2
select name
from customer
group by name;
-- cach 3
select c.name
from customer c where c.id = (select min(id) from customer where name = c.name);

-- 9/ Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
insert into contract(id,start_time,end_time,deposit,employee_id,customer_id,service_id)
values(5,'2021-7-23 10:45:20','2021-8-23 10:45:20',100,2,2,3);
insert into contract(id,start_time,end_time,deposit,employee_id,customer_id,service_id)
values(6,'2021-7-10 10:45:20','2021-7-12 10:45:20',50,2,6,4);

select month(start_time) as month, count(id) as order_quantity
from contract
where year(start_time) = 2021
group by month;

-- 10/ Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch   vụ   đi   kèm.   Kết   quả   hiển   thị   bao   gồm  ma_hop_dong,
-- ngay_lam_hop_dong,   ngay_ket_thuc,   tien_dat_coc,
-- so_luong_dich_vu_di_kem  (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem)
select ct.id, ct.start_time, ct.end_time, ct.deposit,sum(cd.quantity) as quantity
from contract ct
left join contract_detail cd on ct.id = cd.contract_id
group by ct.id,ct.start_time, ct.end_time, ct.deposit;

-- 11/ Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách
-- hàng có ten_loai_khach  là  “Diamond”  và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”
select adsv.id as id, adsv.name as name
from add_service adsv
join contract_detail cd on adsv.id = cd.service_id
join contract ct on cd.contract_id = ct.id
join customer c on ct.customer_id = c.id
join type_customer tc on c.guest_id = tc.id
where tc.name = 'Diamond' and (c.address = 'Vinh' or c.address = 'Quang Ngai');

-- 12/ Hiển thị thông tin  ma_hop_dong,  ho_ten  (nhân viên),  ho_ten  (khách hàng),  so_dien_thoai  (khách   hàng),  ten_dich_vu, so_luong_dich_vu_di_kem  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng
-- đặt vào 6 tháng đầu năm 2021
select ct.id as id, e.name as employee_name, c.name as customer_name, c.phone as customer_phone,
sv.name as service_name, sum(cd.quantity) as quantity, ct.deposit as deposit
from contract ct
join employee e on ct.employee_id = e.id
join customer c on ct.customer_id = c.id
join service sv on ct.service_id = sv.id
join contract_detail cd on ct.id = cd.contract_id
where (year(ct.start_time) = 2020 and quarter(ct.start_time) = 4)
and sv.id not in (select distinct cnt.service_id
from contract cnt
where year(cnt.start_time) = 2021
and quarter(cnt.start_time) in (1,2))
group by id, employee_name, customer_name, customer_phone, service_name,deposit;

insert into contract_detail(contract_id,service_id,quantity)
values(4,4,2);
insert into contract_detail(contract_id,service_id,quantity)
values(5,2,2);
insert into contract_detail(contract_id,service_id,quantity)
values(6,1,1);

-- 13/ Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
-- dụng nhiều như nhau)
use m3_case_study_db;
select cd.service_id as id, adsv.name as name, sum(quantity) as so_luong
from contract_detail cd
join add_service adsv on cd.service_id = adsv.id
group by id, name
having so_luong >= all (select sum(quantity)
from contract_detail
group by service_id);

-- 14/ Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
-- (được tính dựa trên việc count các ma_dich_vu_di_kem)
select ct.id as contract_id, ts.name as type_name, adsv.name as name_service, count(cd.service_id) as times
from contract ct
join service sv on ct.service_id = sv.id
join type_service ts on sv.type_service_id = ts.id
join contract_detail cd on ct.id = cd.contract_id
join add_service adsv on cd.service_id = adsv.id
where cd.service_id in (select service_id
from contract_detail
group by service_id
having count(service_id) = 1)
group by ct.id, ts.name, adsv.name
order by ct.id;

select service_id from contract_detail group by service_id having count(service_id) = 1;

-- 15/ Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021
select e.id as id, e.name as name, lv.name as level, d.name as department, e.phone as phone, e.address as address,
year(ct.start_time) as year_contract
from employee e
join level lv on e.level_id = lv.id
join department d on e.department_id = d.id
join contract ct on e.id = ct.employee_id
where ct.employee_id in (select employee_id 
from contract 
group by employee_id 
having count(employee_id)<=3) and year(ct.start_time) in (2020,2021);

-- 16/ lọc nhân viên chưa từng làm hợp đồng từ năm 2019 đến 2021
select e.id,e.name
from employee e
left join contract c on e.id = c.employee_id
and (year(c.start_time) in (2019,2020,2021))
where c.employee_id is null;
-- xoa
delete e 
from employee e
left join contract c on e.id = c.employee_id
and (year(c.start_time) in (2019,2020,2021))
where c.employee_id is null;


-- 17/ Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- chi phí được quy đổi 1 (USD) ~ 26000 (VND) => 10tr ~ 380.52 USD
select c.id as id, c.name as name, c.guest_id as type_customer_id
from customer c
join contract ct on c.id = ct.customer_id
join service sv on ct.service_id = sv.id
join contract_detail cd on ct.id = cd.contract_id
join add_service adsv on cd.service_id = adsv.id
where year(ct.start_time) = 2021
group by c.id,c.name,c.guest_id,sv.cost,ct.start_time,ct.end_time
having ((sv.cost*(day(ct.end_time)-day(ct.start_time)))+sum(cd.quantity*adsv.price)) > 380.52;


