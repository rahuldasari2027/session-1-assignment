------------------------------Task 1: CASE WHEN – Classify Food Orders
use restaurant_db;

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10,2)
);
INSERT INTO FoodOrders VALUES
(1,250),
(2,450),
(3,1200),
(4,800),
(5,150);
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount < 300 THEN 'Small'
        WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM FoodOrders;

---------------------Task 2: CASE WHEN – Classify Movies by Rating

SELECT * FROM Movies;

ALTER TABLE Movies
ADD COLUMN rating DECIMAL(3,1);

UPDATE Movies SET rating = 8.5 WHERE movie_id = 1;
UPDATE Movies SET rating = 6.8 WHERE movie_id = 2;
UPDATE Movies SET rating = 9.2 WHERE movie_id = 3;
UPDATE Movies SET rating = 4.7 WHERE movie_id = 4;
UPDATE Movies SET rating = 7.5 WHERE movie_id = 5;

SELECT
    movie_id,
    rating,
    CASE
        WHEN rating >= 8 THEN 'Blockbuster'
        WHEN rating >= 5 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM Movies;
-------------------------------------------Task 3: CASE WHEN – Categorize Product Prices

SHOW TABLES;

CREATE TABLE FlipkartProducts (
    product_id INT PRIMARY KEY,
    price DECIMAL(10,2)
);

INSERT INTO FlipkartProducts VALUES
(1, 350),
(2, 1200),
(3, 2500),
(4, 450),
(5, 5000);

SELECT
    product_id,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM FlipkartProducts;
-----------------------------Task 4: CASE WHEN – Classify Employee Salaries
SELECT * FROM Employees;
SHOW TABLES;

DESCRIBE Employees;

ALTER TABLE Employees
ADD COLUMN salary DECIMAL(10,2);

UPDATE Employees SET salary = 25000 WHERE id = 1;
UPDATE Employees SET salary = 45000 WHERE id = 2;
UPDATE Employees SET salary = 70000 WHERE id = 3;
UPDATE Employees SET salary = 90000 WHERE id = 4;

UPDATE Employees SET salary = 35000 WHERE id = 5;

SELECT
    id,
    name,
    salary,
    CASE
        WHEN salary < 30000 THEN 'Low'
        WHEN salary BETWEEN 30000 AND 60000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM Employees;

