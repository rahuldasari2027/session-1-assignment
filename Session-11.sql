----------------------------Task 1: Restaurants with Rating Above Average
SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

SELECT * FROM Restaurants;

SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

-----------------------------------task2

SELECT * FROM Products;

SELECT
    p1.product_name,
    p1.price,
    p1.category,
    (
        SELECT AVG(p2.price)
        FROM Products p2
        WHERE p2.category = p1.category
    ) AS average_category_price
FROM Products p1;
------------------------------------------------Task 3

DESCRIBE Users;
DESCRIBE Playlists;

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100)
);

INSERT INTO Playlists VALUES
(1,1,'Workout'),
(2,1,'Travel'),
(3,2,'Study'),
(4,3,'Party'),
(5,3,'Chill'),
(6,3,'Focus');

SELECT * FROM Orders;

----------------------------------------task4

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1,1,550.00),
(2,2,700.00),
(3,3,400.00),
(4,1,900.00),
(5,2,300.00);

SELECT DISTINCT user_id
FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
);

SELECT * FROM Orders;