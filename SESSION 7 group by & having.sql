--------------------------------------Task 1 – Total orders placed by each user

SELECT user_id,
COUNT(order_id) AS total_orders
FROM food_orders
GROUP BY user_id;

----------------------------Task 2 – Total amount spent by each payment method
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20)
);

INSERT INTO transactions VALUES
(1,101,250,'UPI'),
(2,102,500,'Card'),
(3,101,300,'UPI'),
(4,103,700,'Cash'),
(5,102,200,'Card');

SELECT payment_method,
SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_method;

----------------------------Task 3 – Total box office collection by genre above 10 crore

describe movies;

drop table movies;

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(30),
    box_office_collection DECIMAL(10,2)
);

INSERT INTO movies VALUES
(1,'Action',8),
(2,'Action',5),
(3,'Comedy',6),
(4,'Comedy',3),
(5,'Drama',15);

SELECT genre,
       SUM(box_office_collection) AS total_collection
FROM movies
GROUP BY genre
HAVING SUM(box_office_collection) > 10;

----------------------Task 4 – Users with playlist duration more than 7200 seconds

CREATE TABLE playlist (
    playlist_id INT,
    user_id INT,
    song_id INT,
    duration INT
);

INSERT INTO playlist VALUES
(1,101,201,3000),
(1,101,202,4500),
(2,102,203,2500),
(2,102,204,2000),
(3,103,205,4000),
(3,103,206,3500);

SELECT user_id,
SUM(duration) AS total_duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;