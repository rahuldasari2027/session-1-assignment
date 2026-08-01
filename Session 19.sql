-----------------------Task 1
use restaurant_db;

SELECT * FROM orders;

SELECT *
FROM orders
WHERE user_id = 1;

-----------------------------Task2
show tables;

CREATE INDEX idx_user_id
ON orders(user_id);

SELECT *
FROM orders
WHERE user_id = 1;

-------------------------------Task3
EXPLAIN
SELECT *
FROM orders
WHERE user_id = 1;

----------------------------------Step 3: 

Before adding the index: The query performed a full table scan (type = ALL), scanning more rows and taking longer.

After adding the index: MySQL used the idx_user_id index (type = ref), scanned fewer rows, and executed the query faster.

----------------------------------Task 4
SHOW TABLES;

SELECT * FROM products;

DESCRIBE products;

CREATE INDEX idx_category
ON products(category);

SELECT *
FROM products
WHERE category = 'Electronics';

SELECT DISTINCT category
FROM products;

SELECT *
FROM products
WHERE category = 'Mobile';

SELECT *
FROM products
WHERE category = 'Food';

-----------------------------------Task5

SELECT * FROM orders WHERE user_id = 1;

SELECT order_id, order_date, total_amount
FROM orders
WHERE user_id = 1;

