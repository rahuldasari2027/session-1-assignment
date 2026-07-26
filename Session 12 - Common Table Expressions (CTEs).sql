--------------------------------------------Task 1
USE restaurant_db;

SHOW TABLES;

CREATE TABLE SpotifyArtists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers INT
);
INSERT INTO SpotifyArtists (artist_id, name, followers)
VALUES
(1, 'Arijit Singh', 95000000),
(2, 'Taylor Swift', 130000000),
(3, 'Ed Sheeran', 118000000),
(4, 'Justin Bieber', 85000000),
(5, 'The Weeknd', 125000000);
WITH TopArtists AS (
    SELECT *
    FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT *
FROM TopArtists;
--------------------------------------Task 2-------------------------------

CREATE TABLE FlipkartOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);
INSERT INTO FlipkartOrders (order_id, user_id, order_date, total_amount)
VALUES
(1,101,'2023-01-10',1200),
(2,102,'2023-01-15',800),
(3,103,'2023-02-05',2500),
(4,104,'2023-02-20',1500),
(5,105,'2023-03-08',3000),
(6,106,'2023-03-18',2200),
(7,107,'2023-04-12',1800),
(8,108,'2023-05-02',4500);

WITH MonthlyTotals AS (
    SELECT
        MONTH(order_date) AS month,
        SUM(total_amount) AS total_sales
    FROM FlipkartOrders
    WHERE YEAR(order_date) = 2023
    GROUP BY MONTH(order_date)
)
SELECT *
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;
---------------------------------------------Step 2: Run the Recursive CTE----------------

WITH RECURSIVE CalendarDays AS (
    SELECT CURDATE() AS day_date
    UNION ALL
    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM CalendarDays
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT *
FROM CalendarDays;

-----------------------------------task 4------------------------------

CREATE TABLE ZomatoRestaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);
INSERT INTO ZomatoRestaurants (id, name, city, rating)
VALUES
(1, 'Spice Garden', 'Mumbai', 4.5),
(2, 'Food Palace', 'Mumbai', 4.2),
(3, 'Cafe Delight', 'Delhi', 3.8),
(4, 'Royal Biryani', 'Delhi', 4.0),
(5, 'Pizza Hub', 'Pune', 4.7),
(6, 'Burger Point', 'Pune', 4.3);

WITH CityAverage AS (
    SELECT
        city,
        AVG(rating) AS avg_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT z.*
FROM ZomatoRestaurants z
JOIN CityAverage c
ON z.city = c.city
WHERE c.avg_rating > 4.0;
----------------------------------------task4----------------------

CREATE TABLE IPLMatches (
    match_id INT PRIMARY KEY,
    team VARCHAR(100),
    runs INT,
    match_year INT
);
INSERT INTO IPLMatches (match_id, team, runs, match_year)
VALUES
(1, 'Mumbai Indians', 850, 2023),
(2, 'Mumbai Indians', 780, 2023),
(3, 'Mumbai Indians', 600, 2023),
(4, 'Chennai Super Kings', 900, 2023),
(5, 'Chennai Super Kings', 850, 2023),
(6, 'Chennai Super Kings', 500, 2023),
(7, 'Royal Challengers Bangalore', 950, 2023),
(8, 'Royal Challengers Bangalore', 780, 2023),
(9, 'Royal Challengers Bangalore', 400, 2023),
(10, 'Kolkata Knight Riders', 700, 2023),
(11, 'Kolkata Knight Riders', 650, 2023);
WITH TeamRuns AS (
    SELECT
        team,
        SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT *
FROM TeamRuns
WHERE total_runs > 2000;