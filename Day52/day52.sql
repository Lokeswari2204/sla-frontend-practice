create database day52;
use day52;
create table departments ( dept_id int, dept_name varchar(50));
create table employees (emp_id int, emp_name varchar(50), dept_id int, manager_id int, salary int);
CREATE TABLE projects (project_id INT,project_name VARCHAR(50),dept_id INT);
CREATE TABLE emp_projects (emp_id INT,project_id INT);
CREATE TABLE locations (location_id INT,dept_id INT,city VARCHAR(50));

show tables;
INSERT INTO departments VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
INSERT INTO employees VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
INSERT INTO projects VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);
INSERT INTO emp_projects VALUES(1, 101),(2, 101),(3, 103),(4, 102);
INSERT INTO locations VALUES(1, 1, 'New York'),(2, 2, 'London'),(3, 3, 'Tokyo');

select*from employees;
select*from departments;
select*from projects;
select*from emp_projects;
select*from locations;

-- 1.Get employee names with their department names.
select e.emp_name, d.dept_name from employees e Inner join departments d on e.dept_id = d.dept_id;

-- 2.Get all employees including those without departments.
select e.emp_name, d.dept_name from employees e Left join departments d on e.dept_id = d.dept_id;

-- 3.Get all departments even if no employees exist.
select d.dept_name, e.emp_name from employees e right join departments d on e.dept_id = d.dept_id;
 
--  4.Find employees working on projects.
select e.emp_id, e.emp_name from employees e Inner join emp_projects p on e.emp_id = p.emp_id;

-- 5.Find employees NOT assigned to any project.
  select e.emp_id, emp_name, ep.project_id from employees e left join emp_projects ep on e.emp_id = ep.emp_id where ep.project_id is null;
  
-- 6.List projects with department name.
select p.project_name, d.dept_name from departments d Inner join projects p on d.dept_id = p.dept_id;

-- 7.Get employee names with department and city.
select e.emp_name, d.dept_name, l.city from employees e Inner join departments d on e.dept_id = d.dept_id 
Inner join locations l on d.dept_id = l.dept_id;

-- 8.Get employees and their manager names (SELF JOIN).
select e2.emp_id, e2.emp_name as 'Employee_name', e1.emp_name as 'Manager_name', e2.manager_id from employees e1, employees e2 where e1.emp_id = e2.manager_id;

--  9.Find departments with no projects.
select d.dept_id, d.dept_name, p.project_id from departments d left join projects p on d.dept_id = p.dept_id where p.dept_id is null;
 
-- 10.Get employees earning more than their manager.
 select e2.emp_id, e2.emp_name as 'Employee_name', e2.salary, e2.manager_id, e1.emp_name as 'Manager_name', e1.salary from employees e1, employees e2 where e1.emp_id = e2.manager_id and e2.salary > e1.salary;
 
 -- 11.Show department-wise employee count.
 select d.dept_id, d.dept_name, count(e.emp_id) as 'Employee_count' from departments d left join employees e on d.dept_id = e.dept_id group by d.dept_id, d.dept_name;
 
--  12.List employees with no department.
select emp_id, emp_name, dept_id from employees where dept_id is null;

-- 13.Get project count per department.
select d.dept_id, d.dept_name, count(p.dept_id) as 'Project_count' from departments d left join projects p on d.dept_id = p.dept_id group by d.dept_id, d.dept_name;

-- 14.Find employees working in IT department.
select e.emp_id, e.emp_name, e.dept_id,d.dept_name from employees e inner join departments d on e.dept_id = d.dept_id where d.dept_name = 'IT';

-- 15.Get employees with their project names (if any).
select e.emp_id, e.emp_name, p.project_name from employees e left join emp_projects ep on e.emp_id = ep.emp_id left join projects p on ep.project_id = p.project_id;

-- 16.Get departments and their locations.
select d.dept_id, d.dept_name, l.city from departments d left join locations l on d.dept_id = l.dept_id;

-- 17.Find employees working in Tokyo.
select e.emp_id, e.emp_name, l.city from employees e Inner join locations l on e.dept_id = l.dept_id where l.city = 'Tokyo';

-- 18.Show project name with employee count.
select p.project_name, count(ep.emp_id) as 'Employee_count' from projects p Left join emp_projects ep on p.project_id = ep.project_id group by  p.project_name;

-- 19.Find departments having more than 1 employee.
select d.dept_id, d.dept_name, count(e.emp_id) as 'Employee_count' from departments d Left join employees e on d.dept_id = e.dept_id group by d.dept_id, d.dept_name having count(e.emp_id) > 1;

-- 20.Get employees and their department & project.
select e.emp_id, e.emp_name, d.dept_name, p.project_name from employees e inner join departments d on e.dept_id = d.dept_id inner join emp_projects ep on e.emp_id = ep.emp_id 
inner join projects p on ep.project_id = p.project_id;

-- 21.Find employees without managers.
select emp_id, emp_name, manager_id from employees where manager_id is null;

-- 22.Get all possible employee–project combinations (CROSS JOIN).
select e.emp_id, e.emp_name, p.project_id, p.project_name from employees e cross join projects p;

-- 23.Find employees who work in same department as Alice.
select e1.emp_id, e1.emp_name from employees e1, employees e2 where e2.emp_name = 'Alice' and e2.dept_id = e1.dept_id  and e1.emp_name <> 'Alice';

-- 24.FULL OUTER JOIN (Departments & Employees) – MySQL way.
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from employees e left join departments d on e.dept_id = d.dept_id 
Union
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from employees e right join departments d on e.dept_id = d.dept_id ;

-- 25.Find departments with employees but no location.
select d.dept_id, d.dept_name from departments d  join employees e on d.dept_id = e.dept_id left join locations l on d.dept_id = l.dept_id where l.location_id is null group by d.dept_id, d.dept_name;
