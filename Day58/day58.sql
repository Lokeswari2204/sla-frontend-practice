create database day58;
use day58;

create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    department varchar(30),
    salary decimal(10,2)
);
insert into employees values
(1, 'Arun', 'IT', 45000),
(2, 'Priya', 'HR', 35000),
(3, 'Karthik', 'IT', 60000),
(4, 'Divya', 'Finance', 50000),
(5, 'Rahul', 'HR', 40000),
(6, 'Sneha', 'Finance', 70000),
(7, 'Vijay', 'IT', 30000),
(8, 'Meena', 'Sales', 55000);

create table students (
    student_id int primary key,
    student_name varchar(50),
    course varchar(30),
    mark int
);
insert into students values
(1, 'Anu', 'Python', 85),
(2, 'Bala', 'Java', 70),
(3, 'Charan', 'Python', 92),
(4, 'Deepa', 'SQL', 65),
(5, 'Ezhil', 'Java', 88),
(6, 'Farah', 'SQL', 78),
(7, 'Gokul', 'Python', 55),
(8, 'Hema', 'Java', 95);

create table products (
    product_id int primary key,
    product_name varchar(50),
    category varchar(30),
    price decimal(10,2)
);
insert into products values
(1, 'Laptop', 'Electronics', 55000),
(2, 'Mobile Phone', 'Electronics', 25000),
(3, 'Headphones', 'Accessories', 1500),
(4, 'Smart TV', 'Electronics', 45000),
(5, 'Keyboard', 'Accessories', 1200),
(6, 'Refrigerator', 'Home Appliances', 32000),
(7, 'Washing Machine', 'Home Appliances', 28000),
(8, 'Mouse', 'Accessories', 600);


select * from employees;
select * from students;
select * from products;


-- 1. Find Employees with Salary Greater Than Average
-- Table: employees : emp_id , emp_name , department , salary
-- Create a CTE named avg_salary that calculates the average salary of all employees.
-- Then display employees whose salary is greater than the average salary.
with avg_salary as (
  select avg(salary) as avg_sal from employees
)
select*from employees e, avg_salary a where e.salary > a.avg_sal;


-- 2. Calculate Department-Wise Average Salary
-- Using the employees table above
-- Create a CTE named dept_salary that calculates the average salary for each department.
-- Display:department,average_salary
with dept_salary as(
  select department, avg(salary) as 'Average_salary' from employees group by department
)
select * from dept_salary;


-- 3. Find Students Who Scored Above Average
-- Table: students:student_id , student_name , course , mark
-- Create a CTE named average_mark to calculate the average mark.
-- Then display students whose marks are greater than the average mark.
-- Expected columns:student_name,course,mark
with average_mark as (
  select avg(mark) as 'avg_mark' from students
)
select* from students s, average_mark a where s.mark > a.avg_mark;


-- 4. Find High-Priced Products
-- Table: products:product_id , product_name , category , price
-- Create a CTE named product_data.
-- Inside the CTE, calculate: product_name,category,price
-- Then display products whose price is greater than ₹20,000.
with product_data as (
  select product_name, category, price from products where price > 20000
)
select*from product_data;



-- 5. Calculate Employee Bonus
-- Using the employees table:
-- Create a CTE named employee_bonus.
-- Calculate a 10% bonus for every employee.
-- The CTE should contain:emp_id,emp_name,salary,bonus
-- Then display the employee name, salary, bonus, and total salary.
with employee_bonus as (
select emp_id, emp_name, salary, salary*0.10 as 'bonus' from employees
)
select emp_name, salary, bonus, salary + bonus as 'total_salary' from employee_bonus;




