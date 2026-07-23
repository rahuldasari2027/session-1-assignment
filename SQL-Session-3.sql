SELECT *
FROM restaurants
WHERE rating >= 4.5;

SELECT *
FROM movies
WHERE release_year > 2009
AND genre = 'Action';

SELECT *
FROM products
WHERE category <> 'Electronics'
   OR price < 500;
   
   CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    followers INT
);


INSERT INTO users (user_id, name, city, followers)
VALUES
(1, 'Rahul', 'Ahmedabad', 1500),
(2, 'Priya', 'Mumbai', 2000),
(3, 'Amit', 'Delhi', 900),
(4, 'Sneha', 'Pune', 1200),
(5, 'Rohan', 'Ahmedabad', 800);

SELECT *
FROM users
WHERE NOT city = 'Ahmedabad'
AND followers > 1000;



SELECT * FROM movies;