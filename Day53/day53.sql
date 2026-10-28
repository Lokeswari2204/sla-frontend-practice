create database day53;
use day53;

CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
budget DECIMAL(12,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Employee_Projects (
emp_id INT,
project_id INT,
hours_worked INT,
PRIMARY KEY (emp_id, project_id),
FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO Departments VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');

INSERT INTO Employees VALUES
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown', 'QA Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

INSERT INTO Projects VALUES
(501, 'Apollo Project', 250000.00, 20),
(502, 'Zeus Initiative', 120000.00, 20),
(503, 'Global Branding', 85000.00, 30),
(504, 'CRM Migration', 150000.00, 40),
(505, 'Talent Acquisition', 30000.00, 10);

INSERT INTO Employee_Projects VALUES
(102, 501, 120),
(102, 502, 80),
(103, 501, 150),
(104, 503, 200),
(105, 501, 40),
(107, 504, 180),
(108, 504, 50),
(109, 502, 100);

select*from departments;
select*from Employees;
select*from projects;
select*from Employee_projects;


-- Q26. Find all employees who earn more than the company average salary.
select emp_id, emp_name, salary from employees where salary > (select avg(salary) from employees);

-- Q27. Find employees who work in the Engineering department using a subquery (No Explicit JOIN).
select emp_id, emp_name, dept_id from employees where dept_id = (select dept_id from departments where dept_name ='Engineering');

-- Q28. Find the names of employees who are working on at least one project.
select emp_id, emp_name from employees where emp_id IN (select emp_id from  employee_projects);

-- Q29. Find the names of employees who are NOT working on any project.
select emp_id, emp_name from employees where emp_id NOT IN (select emp_id from  employee_projects);

-- Q30. Find the project with the highest budget.
select project_id, project_name, budget from projects where budget = (select max(budget) from projects);

-- Q31. Find departments that have a higher-than-average project budget allocation.
 select dept_id, dept_name from departments  where dept_id in ( select dept_id from projects where budget > ( select avg(budget) from projects) ) ;

-- Q32. Find employees who earn more than the maximum salary of the Marketing department.
select emp_id, emp_name, salary from employees where salary > (select max(salary) from employees where dept_id = (select dept_id from departments where dept_name = 'Marketing'));

-- Q33. Use a correlated subquery to find employees who earn more than the average salary of their own department.
select emp_id, emp_name, salary, dept_id from employees e where salary > (select avg(salary) from employees where dept_id = e.dept_id);

-- Q34. Find the names of departments that actually have employees assigned to them using EXISTS.
select dept_id, dept_name from departments d where  EXISTS (select * from employees where dept_id = d.dept_id);

-- Q35. Find departments that do not have any projects registered using NOT EXISTS.
select dept_id, dept_name from departments d where NOT EXISTS ( select * from projects where dept_id = d.dept_id);

-- Q36. Select employee names alongside a column showing the total company payroll (Scalar Subquery).
select emp_name, salary, (select sum(salary) from employees) as 'Total_Payroll' from employees; -- Scalary subquery returns only one value. 

-- Q37. Find the oldest employee(s) based on hire date.
select emp_name as 'Oldest_employee', hire_date from employees where hire_date = ( select min(hire_date) from employees);

-- Q38. Find the second highest salary in the company.
select max(salary) as 'Second_Highest_salary' from employees where salary < ( select max(salary) from employees);
select salary as 'Second_Highest_salary' from employees order by salary desc limit 1 offset 1;

-- Q39. Find projects that have a budget greater than all projects managed by the Sales department combined.
select project_id, project_name from projects where budget > ( select sum(budget) from projects where dept_id = (select dept_id from departments where dept_name = 'Sales'));

-- Q40. List all employees whose manager works in a different department.
select emp_id, emp_name, dept_id, manager_id from employees e where dept_id <> ( select dept_id from employees m where m.emp_id = e.manager_id);

-- Q41. Find the name of the department that has the highest number of employees.
select dept_id, dept_name from departments where dept_id = (select dept_id from employees group by dept_id order by count(*) desc limit 1);

-- Q42. Find employees who work on the project with the longest hours logged.
select emp_id, emp_name from employees where emp_id in (select emp_id from employee_projects  where hours_worked = (select max(hours_worked) from employee_projects));

-- Q43. Find departments located in cities starting with New or San using a subquery.
select dept_name, location from departments where dept_id in ( select dept_id from departments where location like 'New%' or location like 'San%');

-- Q44. Fetch employees whose salary is higher than the salary of any employee hired in 2024.
 select emp_id, emp_name, salary from employees where salary > any (select salary from  employees where year(hire_date) = '2024');
 
--  Q45. Find the names of managers who supervise at least 2 employees.
-- meaning - manager has atlest 2 employees
select emp_name as 'Manager_name' from employees where emp_id  IN (select manager_id from employees group by manager_id having count(*) >= 2);

-- Q46. Get the project names whose budget is lower than the average project budget across the company.
select project_name from projects where budget < (select avg(budget) from projects);

-- Q47. List employee names who are the only ones working on their specific project.
select emp_id, emp_name from employees where emp_id  IN (select emp_id from employee_projects where project_id in 
(select project_id from employee_projects group by project_id having count(*) = 1));

-- Q48. Display each employees name, salary, and the difference between their salary and their departments average salary using a subquery in the SELECT clause.
select emp_id, emp_name, salary, salary - (select avg(salary) from employees where dept_id = e.dept_id  ) as 'salary_difference' from employees e;

-- Q49. Find the department(s) with the minimum total payroll.
select dept_id, sum(salary) as total_payroll from employees group by dept_id having sum(salary) = ( 
   select min(dept_payroll) from ( select sum(salary) as dept_payroll from employees group by dept_id  ) as payroll );

-- Q50. Find projects that have at least one employee from the Engineering department working on them.
select project_id, project_name from projects where project_id in 
(select project_id from employee_projects where emp_id in
 (select emp_id from employees where dept_id = (select dept_id from departments where dept_name='Engineering')));