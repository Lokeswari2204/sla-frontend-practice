show databases;
use assignment;
show tables;

--  Employee Table ---
SET SQL_SAFE_UPDATES = 0;
select*from employee;
insert into employee values
(106, 'Sneha', 'HR', 32000, 'sneha@gmail.com'),
(107, 'Vijay', 'Analyst', 38000, 'vijay@gmail.com'),
(108, 'Meena', 'Tester', 28000, 'meena@gmail.com'),
(109, 'Karthik', 'Team Lead', 60000, 'karthik@gmail.com'),
(110, 'Anu', 'Developer', 42000, 'anu@gmail.com'),
(111, 'Ravi', 'Designer', 36000, 'ravi@gmail.com'),
(112, 'Nisha', 'Tester', 31000, 'nisha@gmail.com'),
(113, 'Suresh', 'Manager', 58000, 'suresh@gmail.com'),
(114, 'Kavya', 'Developer', 47000, 'kavya@gmail.com'),
(115, 'Manoj', 'Analyst', 39000, 'manoj@gmail.com');

--- Arithmetic operator ---
select empid, empname, salary, salary+1000 as "+ New Salary", salary-1000 as "- New Salary", salary * 2 as " *2 New Salary", salary / 2 as " /2 New salary", salary % 3 as " %3 New salary" from employee;
--- Comparison operator ---
select * from employee where empid = 108;
select * from employee where empid <> 108;
select * from employee where empid != 110;
select * from employee where empid < 110;
select * from employee where empid > 110;
select * from employee where empid <= 110;
select * from employee where empid >= 110;
--- Range Operator ---
select*from employee where salary between 30000 and 40000;
select*from employee where salary not between 30000 and 40000;
--- List Operator ---
select*from employee where role in ('Tester', 'Developer');
select*from employee where role not in ('Tester', 'Developer', 'Designer');
--- Null or Not null ---
insert into employee (empid, empname, role, email) values (116, 'Sneha', 'HR', 'sneha@gmail.com');
select*from employee;
select*from employee  where salary is null;
select*from employee  where salary is not null;
--- Logical operator ---
select*from employee where salary > 40000 and role='Developer';
select*from employee where salary > 50000 or role='Developer';
select*from employee where not(salary > 40000 or role='Developer');
--- String operator ---
select*from employee where empname like 'A__';
select*from employee where empname like 'k%';
select*from employee where empname like '%r%';
select*from employee where empname like '_a%';
select*from employee where empname like 'a_%_%';
select*from employee where empname not like '%';


--- Customer Table ---
SET SQL_SAFE_UPDATES = 0;
select*from customer;
insert into customer values
(106, 'Anitha', 'anitha@gmail.com', '9876543215', 'Anna Nagar, Chennai'),
(107, 'Vijay', 'vijay@gmail.com', '9876543216', 'Lawspet, Puducherry'),
(108, 'Priya', 'priya@gmail.com', '9876543217', 'Velachery, Chennai'),
(109, 'Karthik', 'karthik@gmail.com', '9876543218', 'White Town, Puducherry'),
(110, 'Sneha', 'sneha@gmail.com', '9876543219', 'T Nagar, Chennai'),
(111, 'Rahul', 'rahul@gmail.com', '9876543220', 'Ariyankuppam, Puducherry'),
(112, 'Divya', 'divya@gmail.com', '9876543221', 'Adyar, Chennai'),
(113, 'Manoj', 'manoj@gmail.com', '9876543222', 'Muthialpet, Puducherry'),
(114, 'Nisha', 'nisha@gmail.com', '9876543223', 'Tambaram, Chennai'),
(115, 'Arun', 'arun@gmail.com', '9876543224', 'Reddiarpalayam, Puducherry');

--- Arithmetic operator ---
alter table customer add purchase_amount decimal(10,2);
update customer set purchase_amount = 1500 where id = 101;
update customer set purchase_amount = 2500 where id = 102;
update customer set purchase_amount = 3000 where id = 103;
update customer set purchase_amount = 1800 where id = 105;
select id, name, purchase_amount,
       purchase_amount + 1000 as "+ New Amount",
       purchase_amount - 1000 as "- New Amount",
       purchase_amount * 2 as "*2 New Amount",
       purchase_amount / 2 as "/2 New Amount",
       purchase_amount % 3 as "%3 New Amount"
from customer;
--- Comparison operator ---
select * from customer where id = 108;
select * from customer where id <> 108;
select * from customer where id != 110;
select * from customer where id < 110;
select * from customer where id > 110;
select * from customer where id <= 110;
select * from customer where id >= 110;
--- Range Operator ---
select*from customer where purchase_amount between 1000 and 2000;
select*from customer where purchase_amount not between 1000 and 2000;
--- List Operator ---
select*from customer where purchase_amount in ('2500', '1500');
select*from customer where purchase_amount not in ('1500', '1200');
--- Null or Not null ---
select*from customer where purchase_amount is null;
select*from customer where purchase_amount is not null;
--- Logical Operator ---
select * from customer where name = 'Marry' and purchase_amount = 1500;
select * from customer where name = 'Rose' or purchase_amount = 1500;
select * from customer where not(name = 'Rose' or purchase_amount = 1500);
--- String operator ---
select* from customer;
select*from customer where name like 's__';
select*from customer where name like 'k%';
select*from customer where name like '%k%';
select*from customer where name not like '%';



--- Product Table ---
select * from product;
insert into product values
(316, 'Smartphone', 'Electronics', 25000.00, 20),
(317, 'Keyboard', 'Accessories', 1200.00, 15),
(318, 'Mouse', 'Accessories', 800.00, 30),
(319, 'Monitor', 'Electronics', 12000.00, 10),
(320, 'Printer', 'Electronics', 8500.00, 8),
(321, 'Office Chair', 'Furniture', 6500.00, 12),
(322, 'Tablet', 'Electronics', 22000.00, 18),
(323, 'Webcam', 'Accessories', 2500.00, 25),
(324, 'Bookshelf', 'Furniture', 4500.00, 7),
(325, 'Speaker', 'Electronics', 3500.00, 14);

--- Arithmetic Operator ---
select productid, productname, price,
price + 1000 as "+ New Price",
price - 1000 as "- New Price",
price * 2 as "*2 New Price",
price / 2 as "/2 New Price",
price % 3 as "%3 New Price"
from product;
--- Comparison Operator ---
select * from product where productid = 318;
select * from product where productid <> 318;
select * from product where productid != 320;
select * from product where price < 5000;
select * from product where price > 10000;
select * from product where price <= 5000;
select * from product where price >= 10000;
--- Range Operator ---
select * from product where price between 1000 and 5000;
select * from product where price not between 1000 and 20000;
--- List Operator ---
select * from product where category in ('Electronics', 'Accessories');
select * from product where category not in ('Electronics', 'Furniture');
select * from product where price in (1200, 2500, 4500);
select * from product where price not in (800, 1200);
--- Null or Not Null ---
insert into product (productid, productname, category, stock) values (326, 'Microphone', 'Accessories', 10);
select * from product;
select * from product where price is null;
select * from product where price is not null;
--- Logical Operator ---
select * from product where price > 10000 and category = 'Electronics';
select * from product where price > 20000 or category = 'Furniture';
select * from product where not (price > 10000 or category = 'Accessories');
--- String Operator ---
select * from product where productname like 'M%';
select * from product where productname like 'S__%';
select * from product where productname like '%o%';
select * from product where productname like '_a%';
select * from product where productname like '____';
select * from product where productname not like 't%';



--- Staff Table ---
select * from staff;
insert into staff values
(206, 'Mohan', 'HR', 31000, '9876543215'),
(207, 'Kavitha', 'IT', 42000, '9876543216'),
(208, 'Ramesh', 'Finance', 35000, '9876543217'),
(209, 'Sowmiya', 'Sales', 28000, '9876543218'),
(210, 'Prakash', 'IT', 45000, '9876543219'),
(211, 'Divya', 'HR', 33000, '9876543220'),
(212, 'Sanjay', 'Sales', 30000, '9876543221'),
(213, 'Meena', 'Finance', 38000, '9876543222'),
(214, 'Arun', 'IT', 40000, '9876543223'),
(215, 'Nithya', 'HR', 29000, '9876543224');
-- Arithmetic Operator --
select staffid, staffname, salary,
salary + 1000 as "+ New Salary",
salary - 1000 as "- New Salary",
salary * 2 as "*2 New Salary",
salary / 2 as "/2 New Salary",
salary % 3 as "%3 New Salary"
from staff;
-- Comparison Operator --
select * from staff where staffid = 208;
select * from staff where staffid <> 208;
select * from staff where staffid != 210;
select * from staff where salary < 30000;
select * from staff where salary > 40000;
select * from staff where salary <= 35000;
select * from staff where salary >= 35000;
-- Range Operator --
select * from staff where salary between 30000 and 35000;
select * from staff where salary not between 30000 and 40000;
-- List Operator --
select * from staff where department in ('IT', 'HR');
select * from staff where department not in ('IT', 'Sales');
select * from staff where salary in (30000, 35000, 40000);
select * from staff where salary not in (40000, 30000);
-- Null or Not Null --
insert into staff (staffid, staffname, department, phone) values (216, 'Harish', 'IT', '9876543225');
select * from staff where salary is null;
select * from staff where salary is not null;
-- Logical Operator --
select * from staff where salary > 35000 and department = 'IT';
select * from staff where salary > 40000 or department = 'HR';
select * from staff where not (salary > 35000 or department = 'IT');
-- String Operator --
select * from staff where staffname like 'M%';
select * from staff where staffname like 'S__%';
select * from staff where staffname like '%a%';
select * from staff where staffname like '_a%';
select * from staff where staffname like '____';
select * from staff where staffname not like 'S%';



--- Student Table ---
select * from student;
insert into student values
(6, 'Arun', 20, 'IT', 85),
(7, 'Priya', 21, 'CSE', 92),
(8, 'Karthik', 22, 'ECE', 76),
(9, 'Divya', 20, 'IT', 88),
(10, 'Manoj', 23, 'MECH', 72),
(11, 'Nisha', 21, 'CSE', 95),
(12, 'Vijay', 24, 'EEE', 68),
(13, 'Sneha', 22, 'IT', 81),
(14, 'Rahul', 20, 'ECE', 79),
(15, 'Meena', 23, 'CSE', 90);
--- Arithmetic Operator ---
select id, name, mark,
mark + 5 as "+ New Mark",
mark - 5 as "- New Mark",
mark * 2 as "*2 New Mark",
mark / 2 as "/2 New Mark",
mark % 3 as "%3 New Mark"
from student;
--- Comparison Operator ---
select * from student where id = 8;
select * from student where id <> 8;
select * from student where id != 10;
select * from student where age < 22;
select * from student where age > 22;
select * from student where mark <= 80;
select * from student where mark >= 85;
--- Range Operator ---
select * from student where mark between 70 and 85;
select * from student where mark not between 70 and 85;
--- List Operator ---
select * from student where department in ('CSE', 'IT');
select * from student where department not in ('ECE', 'MECH');
select * from student where mark in (80, 85, 90);
select * from student where mark not in (70, 75, 80);
--- Null or Not Null ---
insert into student (id, name, age, department) values (16, 'Harish', 21, 'IT');
select * from student where mark is null;
select * from student where mark is not null;
--- Logical Operator ---
select * from student where mark > 80 and department = 'CSE';
select * from student where age > 23 or department = 'IT';
select * from student where not (mark > 80 or department = 'CSE');
--- String Operator ---
select * from student where name like 'A%';
select * from student where name like 'S__%';
select * from student where name like '%a%';
select * from student where name like '_a%';
select * from student where name like '____';
select * from student where name not like 'S%';
































