--------------------task 1

USE restaurant_db;

SHOW TABLES;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    payment_method VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_name, payment_method, amount)
VALUES
(1, 'Rahul', 'Cash', 450),
(2, 'Priya', 'UPI', 700),
(3, 'Amit', 'Credit Card', 1200),
(4, 'Sneha', 'UPI', 300),
(5, 'Rohan', 'Cash', 650),
(6, 'Neha', 'Debit Card', 900);

SELECT DISTINCT payment_method
FROM orders;

--------------------------------------------task 2
SHOW TABLES;

SELECT DISTINCT city
FROM users
ORDER BY city ASC;

--------------------------------------------task 3
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    movie_name VARCHAR(100),
    booking_date DATE
);

INSERT INTO bookings (booking_id, customer_name, movie_name, booking_date)
VALUES
(1, 'Rahul', 'War 2', '2026-07-01'),
(2, 'Priya', 'KGF', '2026-07-10'),
(3, 'Amit', 'Pushpa', '2026-07-15'),
(4, 'Sneha', 'Bahubali', '2026-07-18'),
(5, 'Rohan', 'Dangal', '2026-07-20'),
(6, 'Neha', '3 Idiots', '2026-07-22'),
(7, 'Karan', 'Leo', '2026-07-23');

SELECT *
FROM bookings
ORDER BY booking_date DESC
LIMIT 5;

------------------------------------------task 4

SHOW TABLES;

SELECT  * from  products;

use restaurant_db

INSERT INTO products (product_id, product_name, category, price, sold_count)
VALUES
(6, 'Smart Watch', 'Electronics', 3500, 500),
(7, 'Power Bank', 'Electronics', 1200, 700),
(8, 'Bluetooth Speaker', 'Electronics', 2500, 400),
(9, 'Monitor', 'Electronics', 12000, 300),
(10, 'USB Cable', 'Accessories', 300, 1100);

DESCRIBE products;

UPDATE products
SET sold_count = 450
WHERE product_id = 1;

UPDATE products
SET sold_count = 600
WHERE product_id = 2;

UPDATE products
SET sold_count = 300
WHERE product_id = 3;

UPDATE products
SET sold_count = 250
WHERE product_id = 4;

UPDATE products
SET sold_count = 200
WHERE product_id = 5;

SELECT product_name, sold_count
FROM products
ORDER BY sold_count DESC
LIMIT 10;