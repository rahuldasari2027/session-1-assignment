-----------------------------Task 1: Create a View TopRatedRestaurants
SELECT * FROM restaurants;

CREATE VIEW TopRatedRestaurants AS
SELECT
    restaurant_name,
    rating
FROM restaurants
WHERE rating > 4.0;

SELECT * FROM TopRatedRestaurants;

------------------------------------Session 18 – Task 2: Update the View to Include the City

CREATE TABLE RestaurantReviews (
    restaurant_id INT,
    total_reviews INT
);

INSERT INTO RestaurantReviews VALUES
(1, 250),
(2, 180),
(3, 320);

DROP VIEW IF EXISTS TopRatedRestaurants;

CREATE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    r.city,
    r.rating,
    rr.total_reviews
FROM restaurants r
INNER JOIN RestaurantReviews rr
ON r.restaurant_id = rr.restaurant_id
WHERE r.rating > 4.0;

SELECT * FROM TopRatedRestaurants;
--------------------------------------Task 3

DROP VIEW IF EXISTS TopRatedRestaurants;

CREATE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.rating,
    rr.total_reviews
FROM restaurants r
INNER JOIN RestaurantReviews rr
ON r.restaurant_id = rr.restaurant_id
WHERE r.rating > 4.0;

UPDATE TopRatedRestaurants
SET rating = 5.0
WHERE restaurant_id = 1;

SELECT * FROM TopRatedRestaurants;

SHOW VARIABLES LIKE 'sql_safe_updates';

-------------------------------------Task 4: Create DailyOrderSummary View
show tables;

CREATE TABLE Swiggyorders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Swiggyorders VALUES
(1, CURDATE(), 250),
(2, CURDATE(), 450),
(3, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 700),
(4, DATE_SUB(CURDATE(), INTERVAL 15 DAY), 1200),
(5, DATE_SUB(CURDATE(), INTERVAL 40 DAY), 300);

CREATE VIEW DailyorderSummary AS
SELECT
    order_date,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM SwiggyOrders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY order_date;

SELECT * FROM DailyOrderSummary;
------------------------------------------Task 5

1. Select only the required columns

Example: Create a Flipkart sales view that shows only product_name, sales_amount, and order_date.

2. Use meaningful view names

Example: Name the view FlipkartSalesSummary instead of View1.

3. Filter unnecessary data

Example: Show only the last 30 days of Flipkart orders using a WHERE clause.