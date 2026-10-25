use assignment;
show tables;

-- Employee-- 
select*from employee;
Alter table employee add constraint pk_emp primary key(empid);
desc employee;
Alter table employee add constraint uk_emp unique key(email);
Alter table employee add dept_id int;
create table department ( depid int primary key, deptname varchar(20));
INSERT INTO department VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Testing'),
(5, 'Development'),
(6, 'Marketing');
Alter table employee add constraint fk_emp Foreign key (dept_id) REFERENCES department (depid);
SET SQL_SAFE_UPDATES = 0;
update employee set dept_id = 1 where empid=106;
Alter table employee add constraint ck_emp check (salary > 0);
Alter table employee alter salary set default 25000;
Alter table employee modify column empname varchar(30) not null;
Alter table employee modify column dept_id int null;
desc employee;

-- Customer -- 
select*From customer;
desc customer;
Alter table customer add constraint pk_cust primary key(id);
Alter table customer add constraint uk_cust unique key(phone);
create table orders ( order_id int primary key, order_date date, product_name varchar(20), order_price decimal(10,2), cust_id int, Foreign key (cust_id) references customer(id));
desc orders;
INSERT INTO orders (order_id, order_date, product_name, order_price, cust_id) VALUES
(1, '2026-10-20', 'Laptop', 45000.00, 101),
(2, '2026-10-21', 'Mouse', 800.00, 102),
(3, '2026-10-22', 'Keyboard', 1500.00, 101),
(4, '2026-10-23', 'Headphones', 2500.00, 103),
(5, '2026-10-24', 'Monitor', 12000.00, 108),
(6, '2026-10-25', 'Mouse', 800.00, 105);
select*from orders;
Alter table customer alter purchase_amount set default 0;
Alter table customer modify column name varchar(30) not null;
Alter table customer modify address varchar(50) null;
Alter table customer add constraint ch_cust check (purchase_amount >= 0 );


-- Product ---
select*from product;
desc product;
Alter table product add constraint pk_prod primary key(productid);
Alter table product add constraint uk_prod unique key(productname);
create table product_orders ( order_id INT PRIMARY KEY, order_date DATE, quantity INT, productid INT, FOREIGN KEY (productid) REFERENCES product(productid));
INSERT INTO product_orders VALUES
(1, '2026-10-20', 2, 301),
(2, '2026-10-21', 1, 302),
(3, '2026-10-22', 3, 305),
(4, '2026-10-23', 2, 317),
(5, '2026-10-24', 1, 318),
(6, '2026-10-25', 4, 301);
select*from product_orders;
desc product_orders;
ALter table product modify column category char(20) not null;
ALter table product modify column stock int null;
Alter table product alter stock set default 0;
Alter table product add constraint chk_prod check (price > 0);

 --- Student ---
 select*from student;
 desc student;
Alter table student add constraint pk_stud primary key(id);
Alter table student add column phone bigint unique;
alter table student drop department;
create table dept_student ( depid int primary key, deptname varchar(20));
alter table student add dept_id int;
Alter table student add constraint fk_stud Foreign key (dept_id) REFERENCES dept_student (depid);
INSERT INTO dept_student (depid, deptname) VALUES
(1, 'CSE'),
(2, 'IT'),
(3, 'ECE'),
(4, 'EEE'),
(5, 'Mechanical'),
(6, 'Civil'),
(7, 'AI/DS'),
(8, 'Chemical');
UPDATE student SET dept_id = 1 WHERE id = 16;
ALter table student modify column name varchar(30) null;
ALter table student modify column age int null;
Alter table student alter mark set default 0;
Alter table student add constraint chk_stud check (age >= 18);







