---------------------------Task 1: Display the current date and time using NOW()

SELECT NOW() AS CurrentDateTime;

--------------------------Task 2: Display order_date, year, month, and day

use restaurant_db;
SELECT * FROM Orders;

SELECT
    order_id,
    order_date,
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    DAY(order_date) AS Day
FROM Orders;
------------------------Task 3: Show delivery_date and expected_pickup_date (2 days before delivery)

SHOW TABLES;

CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);

INSERT INTO Deliveries VALUES
(1,'2026-08-05'),
(2,'2026-08-10'),
(3,'2026-08-15');

SELECT * FROM Deliveries;

SELECT
    delivery_id,
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;
------------------------------------Task 4: Calculate subscription duration using DATEDIFF()

CREATE TABLE Subscriptions (
    user_id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO Subscriptions VALUES
(1,'2026-01-01','2026-01-31'),
(2,'2026-02-10','2026-03-12'),
(3,'2026-04-01','2026-04-15'),
(4,'2026-05-20','2026-06-20');

SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM Subscriptions;

-----------------------------------Task 5: Find users who haven't logged in for more than 30 days

CREATE TABLE AppLogins (
    user_id INT,
    last_login_date DATE
);

INSERT INTO AppLogins VALUES
(1, '2026-06-20'),
(2, '2026-07-25'),
(3, '2026-05-15'),
(4, '2026-07-01');

SELECT
    user_id,
    last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;
