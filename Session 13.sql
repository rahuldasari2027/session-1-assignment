-----------------------------------Task 1--------------
USE restaurant_db;
show tables;
SELECT * FROM Orders;

ALTER TABLE Orders
ADD order_amount DECIMAL(10,2);

ALTER TABLE Orders
ADD app_name VARCHAR(50);

DESCRIBE Orders;

UPDATE Orders SET order_amount = 550, app_name='Zomato' WHERE order_id=1;
UPDATE Orders SET order_amount = 700, app_name='Swiggy' WHERE order_id=2;
UPDATE Orders SET order_amount = 400, app_name='Flipkart' WHERE order_id=3;
UPDATE Orders SET order_amount = 900, app_name='Zomato' WHERE order_id=4;
UPDATE Orders SET order_amount = 300, app_name='Swiggy' WHERE order_id=5;

SELECT
    order_id,
    user_id,
    app_name,
    order_amount,
    SUM(order_amount) OVER() AS total_order_amount
FROM Orders;

-----------------------------------------Task 2-----------------------------

SELECT
    order_id,
    user_id,
    order_amount,
    AVG(order_amount) OVER(PARTITION BY user_id) AS avg_order_amount
FROM Orders;
------------------------------------Task 3----------------------------------
DESCRIBE playlists;
SELECT * FROM playlists;

SHOW COLUMNS FROM playlists;

CREATE TABLE PlaylistSongs (
    song_id INT PRIMARY KEY,
    user_id INT,
    duration_sec INT
);

INSERT INTO PlaylistSongs (song_id, user_id, duration_sec)
VALUES
(1,101,210),
(2,101,180),
(3,102,240),
(4,102,150),
(5,103,300),
(6,101,200),
(7,103,250);

SELECT
    song_id,
    user_id,
    duration_sec,
    SUM(duration_sec) OVER(PARTITION BY user_id) AS total_duration
FROM PlaylistSongs;
---------------------------------------------Task 4-----------------

SHOW TABLES;

CREATE TABLE MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating INT
);

INSERT INTO MovieRatings (rating_id, user_id, movie_name, rating)
VALUES
(1,101,'Pushpa 2',5),
(2,102,'Pushpa 2',4),
(3,103,'Pushpa 2',5),
(4,101,'KGF 2',4),
(5,102,'KGF 2',3),
(6,103,'KGF 2',5),
(7,104,'Leo',4),
(8,105,'Leo',5);

SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    AVG(rating) OVER(PARTITION BY movie_name) AS avg_movie_rating,
    rating - AVG(rating) OVER(PARTITION BY movie_name) AS difference
FROM MovieRatings;