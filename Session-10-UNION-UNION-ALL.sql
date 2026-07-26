.....................Task 1: Create Tables and Insert Data


CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);


CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders VALUES
(1, 'Rahul', 550.00, '2025-07-01'),
(2, 'Priya', 720.00, '2025-07-02'),
(3, 'Amit', 480.00, '2025-07-03');

-- Insert Data into InStoreOrders
INSERT INTO InStoreOrders VALUES
(101, 'Neha', 650.00, '2025-07-01'),
(102, 'Rahul', 900.00, '2025-07-04'),
(103, 'Rohan', 350.00, '2025-07-05');

---------------------------------Task 2: UNION (Unique Customer Names)

SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;
-----------------------------------Task 3: UNION ALL (Show All Orders)

SELECT order_id,
       customer_name,
       amount,
       order_date
FROM AppOrders

UNION ALL

SELECT order_id,
       customer_name,
       amount,
       order_date
FROM InStoreOrders;
----------------------------------------Task 4: Difference Between UNION and UNION ALL

INSERT INTO AppOrders VALUES
(4, 'Neha', 400.00, '2025-07-06');

INSERT INTO InStoreOrders VALUES
(104, 'Priya', 500.00, '2025-07-06');

SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

SELECT customer_name
FROM AppOrders

UNION ALL

SELECT customer_name
FROM InStoreOrders;