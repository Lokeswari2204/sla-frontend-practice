create database day54;
use day54;

create table customers (
    CustomerID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    Phone varchar(15),
    Address varchar(100),
    City varchar(50),
    State varchar(50),
    RegistrationDate date
);


insert into customers values
(1, 'Arun', 'Kumar', 'arun@gmail.com', '9876543210', '12 Main Road', 'Chennai', 'Tamil Nadu', '2025-01-15'),
(2, 'Priya', 'Sharma', 'priya@gmail.com', '9876543211', '25 Lake Street', 'Bangalore', 'Karnataka', '2025-02-10'),
(3, 'Rahul', 'Verma', null, '9876543212', '8 Gandhi Street', 'Chennai', 'Tamil Nadu', '2025-03-05'),
(4, 'Anitha', 'Raj', 'anitha@gmail.com', '9876543213', '17 Park Road', 'Hyderabad', 'Telangana', '2025-04-20'),
(5, 'Arunima', 'Das', 'arunima@gmail.com', '9876543214', '42 Beach Road', 'Puducherry', 'Puducherry', '2025-05-12'),
(6, 'Karthik', 'Kumar', 'karthik@gmail.com', '9876543215', '9 Temple Street', 'Chennai', 'Tamil Nadu', '2025-06-18'),
(7, 'Divya', 'Sharma', null, '9876543216', '31 Anna Nagar', 'Bangalore', 'Karnataka', '2025-07-22'),
(8, 'Priya', 'Raj', 'priya.raj@gmail.com', '9876543217', '5 Cross Street', 'Hyderabad', 'Telangana', '2025-08-14'),
(9, 'Vijay', 'Kumar', 'vijay@gmail.com', '9876543218', '22 Market Road', 'Puducherry', 'Puducherry', '2025-09-09'),
(10, 'Meena', 'Devi', 'meena@gmail.com', '9876543219', '14 School Street', 'Chennai', 'Tamil Nadu', '2025-10-25');

select*from customers;

-- Question 1: Create a stored procedure to add a new customer.
delimiter //
create procedure insertCustomer(in _CustomerID int, in _FirstName varchar(50), in _LastName varchar(50),
   in _Email varchar(100), in _phone varchar(15), in _Address varchar(100), in _City varchar(50), in _State varchar(50), in _RegistrationDate date)
begin
insert into customers values ( _CustomerID,  _FirstName,  _LastName, _Email ,  _phone ,  _Address ,  _City ,  _State ,  _RegistrationDate);
end //
delimiter ;

call insertCustomer(11, 'Ashwinth', 'Karthikeyen', 'ashwinth@gmail.com', '9876543287', '19 JN Street', 'Chennai', 'Tamil Nadu', '2025-10-28');


-- Question 2: Create a stored procedure to retrieve customer details by CustomerID.
delimiter //
create procedure displayById(in _customerID int)
begin
select*from customers where customerID = _customerID;
end //
delimiter ;

call displayById(11);

-- Question 3: Create a stored procedure to update a customer's email and phone number.
delimiter $$
create procedure updateCust(in _customerid int, in _email varchar(100), in _phone varchar(15))
begin
update customers set email = _email , phone = _phone where customerid = _customerid;
end $$
delimiter ;

call updateCust(7, 'divya@gmail.com', '9271646298');


-- Question 4: Create a stored procedure to get all customers from a specific city.
delimiter //
create procedure displayCust( in _city varchar(50))
begin
select*from customers where city = _city;
end //
delimiter ;

call displayCust('Chennai');

-- Question 5: Create a stored procedure to delete a customer by CustomerID.
delimiter //
create procedure deleteCustID( in _customerid int)
begin
delete from customers where customerid = _customerid;
end //
delimiter ;

call deleteCustID(3);


-- Question 6: Create a stored procedure to list customers registered within a given date range.
delimiter //
create procedure listCust(in _startDate date, in _endDate date)
begin
select *from customers where RegistrationDate Between _startDate and _endDate;
end //
delimiter ;


call listCust('2025-01-01', '2025-06-30');

-- Question 7: Create a stored procedure to search for customers by partial FirstName or LastName.
delimiter //
create procedure searchByName(in _name varchar(50))
begin
select *from customers where firstName like concat('%', _name, '%') or  lastName like concat('%', _name, '%');
end //
delimiter ;

call searchByName('Ar');
call searchByName('th');


-- Question 8: Create a stored procedure to update a customer's entire address.
delimiter $$
create procedure updateCustAddress(in _customerid int, in _address varchar(100), in _city varchar(50), in _state varchar(50))
begin
update customers set address = _address , city = _city, state = _state where customerid = _customerid;
end $$
delimiter ;

call updateCustAddress(4, '15 Ayyanar street', 'Chennai', 'Tamil Nadu');


-- Question 9: Create a stored procedure that returns the total number of customers.
delimiter //
create procedure totalCust(out totalcount int)
begin
select count(*)  into totalcount from customers;
end //
delimiter ;

call totalCust(@totalcount);
select @totalcount as Total_customers;


-- Question 10: Create a stored procedure to retrieve customers who have not provided an email address.
delimiter //
create procedure retrieveCust()
begin
select*from customers where email is null;
end //
delimiter ;

call retrieveCust();


