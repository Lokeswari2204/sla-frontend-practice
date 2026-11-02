create database day57;
use day57;
show tables;

CREATE TABLE students (id INT,class VARCHAR(10),name VARCHAR(50),marks INT);
INSERT INTO students VALUES(1, 'A', 'John', 85),(2, 'A', 'Sara', 92),(3, 'A', 'Mike', 78),(4, 'B', 'Anna', 88),(5, 'B', 'Tom', 90);

CREATE TABLE exam (student VARCHAR(50),subject VARCHAR(20),score INT);
INSERT INTO exam VALUES('Alice', 'Math', 90),('Bob', 'Math', 90),('Charlie', 'Math', 85),('David', 'Science', 88),('Eva', 'Science', 88);

CREATE TABLE employees (emp_name VARCHAR(50),department VARCHAR(20),salary INT);
INSERT INTO employees VALUES('Alex', 'IT', 7000),('Brian', 'IT', 7000),('Chris', 'IT', 6500),('Diana', 'HR', 6000),('Eva', 'HR', 5800);

CREATE TABLE orders (order_id INT,order_date DATE, amount INT);
INSERT INTO orders VALUES(1, '2024-01-01', 100),(2, '2024-01-02', 200),(3, '2024-01-03', 150),(4, '2024-01-04', 300);

CREATE TABLE monthly_sales (month VARCHAR(10), sales INT);
INSERT INTO monthly_sales VALUES('Jan', 5000),('Feb', 6000),('Mar', 5500),('Apr', 7000);

select*from students;
select*from exam;
select*from employees;
select*from orders;
select*from monthly_sales;


-- 1. Assign a unique row number to students in each class based on highest marks.
select name, class, marks,
  Row_number() over (partition by class order by marks desc ) as row_num
from students;

-- 2.Rank students in each class based on marks (with gaps).
INSERT INTO students VALUES(6, 'A', 'Mary', 85);
select name, class, marks,
  Rank() over (Partition by class order by marks desc) as stud_rank
from students;


--  3. Rank students in each class based on marks (without gaps).
select name, class, marks,
  dense_Rank() over (Partition by class order by marks desc ) as stud_rank
from students;


-- 4. Display average marks of each class along with every student.
select name, class, marks,
  avg(marks)  over (Partition by class ) as avg_mark
from students;

-- 5. Show the highest marks scored in each class for every student.
select name, class, marks,
  max(marks)  over (Partition by class ) as max_mark
from students;

--  6. Assign row numbers to students per subject based on score.
select student, subject, score,
  Row_NUMBER() over ( Partition by subject order by score desc ) as row_num
from exam;

 -- 7. Rank students per subject (with gaps).
 select student, subject, score,
  Rank() over ( Partition by subject order by score desc ) as rank_val
from exam;

 -- 8. Rank students per subject (without gaps).
select student, subject, score,
  Dense_Rank() over ( Partition by subject order by score desc ) as rank_val
from exam;


-- 9. Show total number of students appearing in each subject.
select student, subject, score,
  count(subject) over ( Partition by subject ) as count
from exam;

 -- 10. Display the minimum score for each subject.
 select student, subject, score,
  min(score) over ( Partition by subject ) as min_score
from exam;



-- 11. Assign row numbers to employees per department by salary.
select emp_name, department, salary,
  Row_number() over (partition by department order by salary desc) as row_num
from employees;

-- 12. Rank employees per department based on salary.
select emp_name, department, salary,
  Rank() over (partition by department order by salary desc) as rank_val
from employees;

 -- 13. Rank employees per department without gaps.
 select emp_name, department, salary,
  DENSE_Rank() over (partition by department order by salary desc) as rank_val
from employees;

--  14. Show total salary paid in each department.
select emp_name, department, salary,
  sum(salary) over (partition by department) as total_salary
from employees;

-- 15. Display average salary of each department.
select emp_name, department, salary,
  avg(salary) over (partition by department) as average_salary
from employees;

-- 16. Assign row numbers based on order date.
select order_date, amount,
  ROW_NUMBER() over ( order by order_date) as row_num
from orders;

-- 17. Calculate running total of order amounts.
select order_date, amount,
  Sum(amount) over ( order by order_date) as running_total
from orders;

-- 18. Calculate moving average of last 2 orders.
select order_date, amount,
    avg(amount) over ( 
    order by order_date
    rows between 1 preceding and current row
    ) as moving_avg
from orders;

-- 19. Show maximum order amount till current row.
select order_date, amount,
  max(amount) over ( order by order_date) as max_amount
from orders;

-- 20. Display total number of orders.
select order_date, amount,
  count(order_id) over () as total_orders
from orders;

-- 21. Assign row numbers based on month
INSERT INTO monthly_sales VALUES('Jun', 5000),('May', 6000),('Aug', 5500),('Jul', 7000);
select month, sales,
   row_number() over ( order by  field (month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug')) as row_num
from monthly_sales;

-- 22. Show previous month’s sales.
select month, sales,
  lag(sales) over (order by  field (month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug')) as previous_month_sale
from monthly_sales;

-- 23. Show next month’s sales.
select month, sales,
  lead(sales) over (order by  field (month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug')) as next_month_sale
from monthly_sales;

-- 24. Calculate difference from previous month’s sales.
select month, sales,
   sales - lag(sales) over ( order by  field (month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug')) as diff_from_previous
from monthly_sales;

-- 25. Calculate cumulative sales.
select month, sales,
   sum(sales) over ( order by  field (month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug')) as cummulative_sales
from monthly_sales;










