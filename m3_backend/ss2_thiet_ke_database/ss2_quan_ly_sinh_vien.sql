drop database m3_csdl;
create database if not exists m3_csdl;
use m3_csdl;
create table james(
username varchar(50) primary key,
password varchar(50)
);
create table class(
id int primary key auto_increment,
name varchar(50)
);
create table student(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
score float,
class_id int,
username varchar(50) unique,
foreign key (class_id) references class(id),
foreign key (username) references james(username)
);
create table phone(
phone_number varchar(15),
student_id int,
foreign key (student_id) references student(id)
);
create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
salary float
);
create table instructor_class(
instructor_id int,
class_id int,
start_time date,
end_time date,
primary key (instructor_id,class_id),
foreign key (instructor_id) references instructor(id),
foreign key (class_id) references class(id)
);