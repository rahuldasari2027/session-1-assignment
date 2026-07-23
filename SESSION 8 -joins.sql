---------------------------------Task 1 – Create Users and Orders tables
use restaurant_db

select * from users;
select * from orders;

describe orders;

CREATE TABLE orders_join (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO orders_join VALUES
(101,1,'Laptop',65000),
(102,1,'Mouse',800),
(103,2,'Mobile',25000),
(104,2,'Keyboard',1500),
(105,1,'Headphones',2000);

SELECT u.name,
       o.product
FROM Users u
INNER JOIN orders_join o
ON u.user_id = o.user_id;
-------------------------------Task 3 left join

SELECT u.name,
       o.product
FROM Users u
LEFT JOIN orders_join o
ON u.user_id = o.user_id;

------------------------------TASK 4 RIGHT JOIN
SELECT u.name,
       o.product
FROM Users u
RIGHT JOIN orders_join o
ON u.user_id = o.user_id;

--------------------------------TASK 5

CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);

INSERT INTO CustomerSegments values
(1, 'gold'),
(2, 'silver'),
(3, 'bronze');

SELECT
    u.name,
    cs.segment_name,
    SUM(o.amount) AS total_order_amount
FROM Users u
JOIN CustomerSegments cs
ON u.user_id = cs.segment_id
LEFT JOIN orders_join o
ON u.user_id = o.user_id
GROUP BY u.name, cs.segment_name;