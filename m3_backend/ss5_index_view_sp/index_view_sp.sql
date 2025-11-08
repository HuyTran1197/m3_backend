drop database m3_ss5_index_view;
create database m3_ss5_index_view;
use m3_ss5_index_view;
create table products(
id int primary key auto_increment,
code varchar(20),
name varchar(20),
price double,
amount int,
description varchar(20),
status varchar(20)
);
insert into products(code,name,price,amount,description,status)
values('sp-0236','iphone 11 promax',9500000,20,'64 GB','available');
insert into products(code,name,price,amount,description,status)
values('sp-0237','samsung note 5',8500000,14,'128 GB','available');
insert into products(code,name,price,amount,description,status)
values('sp-0238','samsung a12',9500000,2,'128 GB','available');
insert into products(code,name,price,amount,description,status)
values('sp-0239','iphone 15 promax',1000000,8,'128 GB','available');
insert into products(code,name,price,amount,description,status)
values('sp-0240','xiaomi pro',7000000,5,'64 GB','available');

-- create index
select * from products where name = 'iphone 11 promax';
create unique index i_code on products(code);
alter table products add index i_name_price(name,price);
explain select * from products where name = 'iphone 11 promax';
explain select * from products where code = 'sp-0239';
explain select * from products where description = '64 GB';
alter table products add index i_description(description);
explain select * from products where status = 'available';
alter table products add index i_status(status);
select * from products where status = 'available';

-- create view
create view products_view as
select name,price,status
from products;
-- cap nhat view
create or replace view products_view as
select name,price,status,description
from products
where description = '128 GB';
-- xoa view
drop view products_view;

-- create store procedure
delimiter //
create procedure get_all()
begin
   select * from products;
end //
delimiter ;
call get_all();

-- add procedure
delimiter //
create procedure add_products()
begin
   insert into products(code,name,price,amount,description,status)
   values('sp-0245','realme pro',7500000,7,'64 GB','available');
end //
delimiter ;
call add_products();
drop procedure add_products;

-- add procedure with parameters
delimiter //
drop procedure add_new_products //
create procedure add_new_products(in add_code varchar(20),
   in add_name varchar(20),
   in add_price double,
   in add_amount int,
   in add_description varchar(20),
   in add_status varchar(20))
begin
    insert into products(code,name,price,amount,description,status)
    values(add_code,add_name,add_price,add_amount,add_description,add_status);
end //
delimiter ;
call add_new_products('sp-2305','Oppo reno',6900000,3,'128 GB','sold');

-- update procedure with id
delimiter //
create procedure update_products(in up_id int,
   in up_price double,
   in up_amount int,
   in up_status varchar(20))
begin
   update products set price = up_price,
   amount = up_amount,
   status = up_status
   where id = up_id;
end //
delimiter ;
call update_products(2,8000000,4,'available');

-- delete procedure with id
delimiter //
create procedure delete_products(in up_id int)
begin
   delete from products
   where id = up_id;
end //
delimiter ;
call delete_products(4);