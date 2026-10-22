use assignment;
show tables;

--- Employee ---
select*from employee;
select count(*) as Total_Employee from employee;
select sum(salary) as total_salary from employee;
select avg(salary) as average_salary from employee;
select role, sum(salary) from employee group by role;
select max(salary) as Maximum_salary, min(salary) as Minimum_salary from employee;
select role, sum(salary) as Total_salary from employee group by role order by total_salary desc;

--- Customer ---
select*from customer;
select count(*) as Total_customers from customer;
select sum(purchase_amount) as Total_amount from customer;
select avg(purchase_amount) as Average_amount from customer;
select address, sum(purchase_amount) from customer group by address;
select max(purchase_amount), min(purchase_amount) from customer;
select address, sum(purchase_amount) as Total_amount from customer group by address order by Total_amount  desc;

--- Product ---
select*from product;
select count(*) from product;
select sum(price) as Total_price from product;
select avg(price) as Average_price from product;
select category, sum(stock) from product group by category;
select max(price), min(price) from product;
select category, sum(stock) from product group by category order by sum(stock) desc;

--- Staff ---
select*from staff;
select count(*) from staff;
select department,count(department) from staff group by department;
select sum(salary) as total_salary from staff;
select avg(salary) as average_salary from staff;
select department, sum(salary) as total_salary from staff group by department;
select max(salary) as Maximum_salary, min(salary) as Minimum_salary from staff;
select department, sum(salary) as total_salary from staff group by department order by total_salary desc;

--- Student ---
select*from student;
select count(*) from student;
select department, count(department) from student group by department;
select sum(mark) from student;
select avg(mark) from student;
select department, sum(mark) as total_marks from student group by department;
select department,max(mark), min(mark) from student group by department;
select department, sum(mark) as total_marks from student group by department order by total_marks desc;




--- Built-In function Date ---
create table events (id int primary key, event_name varchar(50), event_date date);
insert into events values
(1, 'Pongal Celebration', '2026-01-14'),
(2, 'Republic Day', '2026-01-26'),
(3, 'College Symposium', '2026-03-15'),
(4, 'Sports Day', '2026-07-20'),
(5, 'Annual Day', '2026-10-10'),
(6, 'Independence Day', '2026-08-15'),
(7, 'Christmas', '2026-12-25');
select*from events;
select now() as Current_Date_Time;
select event_name, date_format(event_date, '%d-%m-%Y') as Formatted_Date from events;
select event_name, date_format(event_date, '%M %d %Y') as Formatted_Date from events;
select event_name, year(event_date) as Event_Year from events;
select event_name, month(event_date) as Event_Month from events;
select concat(event_name, ' - ', date_format(event_date, '%d-%m-%Y')) as Event_details from events;










