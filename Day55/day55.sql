create database day55;
use day55;

CREATE TABLE Products (product_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),price DECIMAL(10, 2), stock_quantity INT,status VARCHAR(20) DEFAULT 'Available');
CREATE TABLE Inventory_Audit (audit_id INT PRIMARY KEY AUTO_INCREMENT,product_id INT,action_type VARCHAR(50), old_value VARCHAR(100),new_value VARCHAR(100),changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO Products (name, price, stock_quantity) VALUES
('laptop', 55000.00, 10),
('mobile phone', 25000.00, 15),
('headphones', 1500.00, 8),
('keyboard', 800.00, 5),
('mouse', 500.00, 0);

SELECT * FROM Products;
SELECT * FROM Inventory_Audit;

-- 1. Prevent Negative Stock
-- Question: Create a trigger to prevent the stock_quantity from being updated to a value less than 0.
delimiter //
create trigger before_update_stock
before update on products
for each row
begin
    if New.stock_quantity < 0 then
	  signal SQLSTATE '45000'
      set message_text = 'Stock cannot be negative';
    end if;
end //
delimiter ;

update products set stock_quantity = -2 where product_id = 4;



-- 2. Audit Price Changes
-- Question: Log whenever a product price is updated into the Inventory_Audit table.
delimiter //
create trigger after_update_price
after update on products
for each row
begin
    if New.price <> old.price then
      Insert into inventory_audit(product_id, action_type, old_value, new_value, changed_at) values
        (old.product_id, 'Update', old.price, New.price, now());
	end if;
end //
delimiter ;

update products set price =  2000 where product_id=3;
select*from products;
select*from inventory_audit;



-- 3. Auto-Update Status to 'Out of Stock'
-- Question: If stock reaches 0, automatically change the status to 'Out of Stock'.
delimiter //
create trigger update_stock_status
before update on products
for each row
begin
    if new.stock_quantity = 0 then
       set new.status = 'Out of Stock';
	else
        set new.status = 'Available';
	end if;
end //
delimiter ;

select*From products;

update products set stock_quantity = 0 where product_id = 5;



-- 4. Enforce Uppercase Product Names
-- Question: Ensure all product names are stored in uppercase upon insertion.
delimiter //
create trigger before_insert_name
before insert on products
for each row
begin
    set new.name = upper(new.name);
end //
delimiter ;


Insert into products (name, price, stock_quantity, status) values ('tablet', 40000, 6, 'Available');
select*from products;


-- 5. Log New Product Additions
-- Question: Record a log entry whenever a new product is added to the system.
create table product_log (
    log_id int primary key auto_increment,
    product_id int,
    name varchar(100),
    price decimal(10,2),
    stock_quantity int,
    status varchar(20),
    added_at timestamp default current_timestamp
);

delimiter //
create trigger after_insert_product
after insert on products
for each row
begin
    Insert into product_log (product_id, name, price, stock_quantity, status, added_at) values
      (new.product_id, new.name, new.price, new.stock_quantity, new.status, now());
end //
delimiter ;

Insert into products (name, price, stock_quantity, status) values ('Printer', 8500, 4, 'Available');
select*from products;
select*from product_log;













