CREATE DATABASE hackathon.sql,
USE hackathon.sql,

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	phone VARCHAR(15) NOT NULL,
);

CREATE TABLE Brands (
	brand_id INT PRIMARY KEY AUTO_INCREMENT,
	brand_name VARCHAR(100) UNIQUE,
);

CREATE TABLE  Products (
	product_id INT PRIMARY KEY  AUTO_INCREMENT,
	product_name VARCHAR(100) UNIQUE,
	brand_id VARCHAR(5),
	price DECIMAL(10, 2) CHECK(gia_san_pham > 0) NOT NULL,
	stock INT
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id VARCHAR(5), 
	product_id VARCHAR(5),
	status VARCHAR(20),
	order_date DATE
);

INSERT INTO Customers (customer_id, full_name, email, phone)
VALUES
	('C01 Nguyễn Văn An an.nv@gmail.com 0911111111'),
    ('C02 Nguyễn Thị Mai mai.nt@gmail.com 0922222222'),
    ('C03 Trần Quang Hải hai.tq@gmail.com 0933333333'),
    ('C04 Phạm Bảo Ngọc ngoc.pb@gmail.com 0944444444'),
    ('C05 Vũ Đức Đam dam.vd@gmail.com 0955555555');

INSERT INTO Brands (brand_id, brand_name)
VALUES
	('B01 Apple'),
    ('B02 Samsung'),
    ('B03 Sony'),
    ('B04 Dell');

INSERT INTO Products (product_id, product_name, brand_id, price, stock)
VALUES
	('P01 iPhone 15 Pro Max B01 30000000.00 10'),
    ('P02 MacBook Pro M3 B01 45000000.00 5'),
    ('P03 Galaxy S24 Ultra B02 25000000.00 20'),
    ('P04 PlayStation 5 B03 15000000.00 8'),
    ('P05 Dell XPS 15 B04 35000000.00 15');
    
INSERT INTO Orders (order_id, customer_id, product_id, status, order_date)
VALUES 
	('1 C01 P01 Pending 2025-10-01'),
    ('2 C02 P03 Completed 2025-10-02'),
    ('3 C01 P02 Completed 2025-10-03'),
    ('4 C04 P05 Cancelled 2025-10-04'),
    ('5 C05 P01 Pending 2025-10-05');
    
SELECT product_name, stock
FROM Products,
SET Products CHECK ('stock' > 10) AND 'price' = 5%;

UPDATE Customers 
SET phone = customer_id = 'C03'
WHERE phone = '0999999999';

DELETE FROM Orders 
WHERE status = 'Completed'
AND order_date < '2025-10-03';

SELECT*FROM Products 
WHERE product_id = '15,000,000-30,000,000' AND (stock > 0);

SELECT*FROM Customers
WHERE  full_name LIKE '%Nguyễn%' AND email IS NOT NULL

SELECT*FROM order_id, customer_id, order_date
FROM Products
ORDER BY order_date DESC;

SELECT*FROM Products 
WHERE product_name = 'price'
ORDER BY price ASC
LIMIT 3;

SELECT product_name, stock
FROM Products 
LIMIT 2 OFFSET 3;

SELECT o.order_id, o. o.full_name, o.products_name, o.order_date 
FROM Orders
JOIN  Customers.b ON full_name = full_name
JOIN  Orders.b ON order_id = order_id
JOIN  Products.b ON products_name = products_name
JOIN  Orders.b ON order_date = order_date 
WHERE Orders = 'Pending';

SELECT brand_id, brand_name 
FROM Brand 
LEFT JOIN Brand ON brand_id = brand_id

SELECT status, SUM(Orders) AS total_orders 
FROM Orders 
GROUP BY status;





