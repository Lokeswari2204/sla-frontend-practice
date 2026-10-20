
create database assignment;
use assignment;

-- Customer Table ---
create table customer ( id int, name char(30), email varchar(30), phone varchar(15), address varchar(100));
desc customer;
insert into customer values 
(101, 'Marry', 'marry@gmail.com', '9876543210', 'ABC Street, Chennai'),
(102, 'Rose', 'rose@gmail.com', '9876576210', 'XYZ Street, Chennai'),
(103, 'Sam', 'sam@gmail.com', '9236543210', 'ABC Street, Chennai'),
(104, 'Raj', 'raj@gmail.com', '9238743210', 'T Nagar, Chennai'),
(105, 'Jack', 'jack@gmail.com', '8336543210', 'XYZ street Chennai');

select*from customer;
select id, name from customer;
select * from customer where name = 'Sam';

alter table customer add gender char(10);
desc customer;
alter table customer drop gender;
desc customer;
alter table customer modify phone bigint;
desc customer;

SET SQL_SAFE_UPDATES = 0;
update customer set address = 'ABC Street, Puducherry' where id = 105;
delete from customer where id = 104;
select*from customer;

delete from customer;
show tables;
drop table customer;


--  Employee Table ---
create table Employee ( empid int, empname varchar(30), role char(15), salary int, email varchar(30));
show tables;
insert into employee values
(101, 'Arun', 'Developer', 35000, 'arun@gmail.com'),
(102, 'Priya', 'Tester', 30000, 'priya@gmail.com'),
(103, 'Kumar', 'Manager', 55000, 'kumar@gmail.com'),
(104, 'Divya', 'Designer', 40000, 'divya@gmail.com'),
(105, 'Rahul', 'Developer', 45000, 'rahul@gmail.com');
select*from employee;
select empid, empname, role from employee;
select * from employee where salary <  40000;

alter table employee add gender char(10);
desc employee;
alter table employee drop gender;
desc employee;
alter table employee modify role char(20);
desc employee;

SET SQL_SAFE_UPDATES = 0;
update employee set salary = salary + 500;
delete from employee where empid = 104;
select*from employee;

delete from employee;
show tables;
drop table employee;


-- Student Table ---
create table Student ( id int, name varchar(30), age int, department varchar(30), mark int);
show tables;
desc Student;
insert into Student values 
(1, 'Jacky', 23, 'CSE', 87),
(2, 'Furose', 22, 'IT', 70),
(3, 'Rocky', 24, 'ECE', 79),
(4, 'Starvin', 25, 'MECH', 80),
(5, 'Merlin', 21, 'CSE', 90);
select* from Student;
select name, mark from Student;
select * from Student where mark > 80;

alter table Student add email varchar(30);
desc Student;
alter table Student drop email;
alter table Student modify name varchar(20);

update Student set mark = mark + 2;
select* from Student;
delete from Student where name = 'Furose';

delete from Student;
show tables;
drop table Student;

-- Staff Table-- 
create table Staff ( staffid int, staffname varchar(30), department char(20), salary int, phone varchar(15));
show tables;
desc Staff;

insert into Staff values
(201, 'Anitha', 'HR', 28000, '9876543210'),
(202, 'Bala', 'IT', 35000, '9876543211'),
(203, 'Charan', 'Finance', 32000, '9876543212'),
(204, 'Deepa', 'Sales', 30000, '9876543213'),
(205, 'Ezhil', 'IT', 40000, '9876543214');

select * from Staff;
select staffid, staffname, department from Staff;
select * from Staff where salary > 30000;

alter table Staff add gender char(10);
desc Staff;
alter table Staff drop gender;
desc Staff;
alter table Staff modify department char(30);
desc Staff;

SET SQL_SAFE_UPDATES = 0;
update Staff set salary = salary + 1000;
delete from Staff where staffid = 204;
select * from Staff;

delete from Staff;
show tables;
drop table Staff;


-- Product Table ---
create table Product ( productid int, productname varchar(30), category char(20), price decimal(10,2), stock int);
show tables;
desc Product;

insert into Product values
(301, 'Laptop', 'Electronics', 45000.00, 10),
(302, 'Mobile', 'Electronics', 18000.00, 25),
(303, 'Chair', 'Furniture', 2500.00, 15),
(304, 'Table', 'Furniture', 5000.00, 8),
(305, 'Headphones', 'Accessories', 1500.00, 30);

select * from Product;
select productid, productname, price from Product;
select * from Product where price > 5000;

alter table Product add brand varchar(30);
desc Product;
alter table Product drop brand;
desc Product;
alter table Product modify productname varchar(50);
desc Product;

SET SQL_SAFE_UPDATES = 0;
update Product set price = price + 500;
delete from Product where productid = 303;
select * from Product;

delete from Product;
show tables;
drop table Product;














