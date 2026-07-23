use restaurant_db;

-------------------------------------------------Task 1 – Total amount spent (SUM)

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO food_orders VALUES
(1, 101, 250.00),
(2, 102, 450.00),
(3, 101, 300.00),
(4, 103, 600.00),
(5, 102, 150.00);

SELECT SUM(amount) AS total_amount_spent
FROM food_orders;

..........................................Task 2 – Total songs added by each user (COUNT)

CREATE TABLE spotify_playlists (
    playlist_id INT,
    user_id INT,
    song_id INT
);

INSERT INTO spotify_playlists VALUES
(1,101,201),
(1,101,202),
(1,101,203),
(2,102,204),
(2,102,205),
(3,103,206),
(3,103,207),
(3,103,208),
(3,103,209);
 
 SELECT user_id,
       COUNT(song_id) AS total_songs
FROM spotify_playlists
GROUP BY user_id;

--------------------------------------------Task 3 Average movie rating rounded to 1 decimal (AVG + ROUND)

CREATE TABLE bookmyshow_reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO bookmyshow_reviews VALUES
(1,101,4.5),
(2,101,3.5),
(3,102,5.0),
(4,103,4.0),
(5,102,4.5);

SELECT ROUND(AVG(rating), 1) AS average_rating
FROM bookmyshow_reviews;

---------------------------------------------------task 4  Minimum and maximum transaction amount (MIN, MAX)

CREATE TABLE paytm_transactions (
    txn_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO paytm_transactions VALUES
(1,101,250.00),
(2,101,500.00),
(3,102,150.00),
(4,102,800.00),
(5,103,350.00);

SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM paytm_transactions;alter;

----------------------task 5-Orders, average order value, and highest order value for each user
CREATE TABLE myntra_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10,2)
);

INSERT INTO myntra_orders VALUES
(1,101,1200.00),
(2,101,1800.00),
(3,102,900.00),
(4,102,1500.00),
(5,103,2500.00),
(6,103,1000.00);

SELECT
    user_id,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;