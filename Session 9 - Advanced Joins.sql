------------------------------------- Create Influencers Table
CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(100),
    city VARCHAR(50)
);

-- Create Brands Table
CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100),
    city VARCHAR(50)
);

-- Insert Sample Data
INSERT INTO influencers VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Priya', 'Delhi'),
(3, 'Amit', 'Pune');

INSERT INTO brands VALUES
(101, 'Nike', 'Mumbai'),
(102, 'Adidas', 'Bangalore'),
(103, 'Puma', 'Delhi');

---------------------------------- FULL OUTER JOIN (MySQL)
SELECT
    i.influencer_name,
    b.brand_name,
    COALESCE(i.city, b.city) AS city
FROM influencers i
LEFT JOIN brands b
ON i.city = b.city

UNION

SELECT
    i.influencer_name,
    b.brand_name,
    COALESCE(i.city, b.city) AS city
FROM influencers i
RIGHT JOIN brands b
ON i.city = b.city;
------------------------------------Task 2: SELF JOIN (Playlists)

CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);
INSERT INTO playlists VALUES
(1, 'Workout', NULL),
(2, 'Morning Workout', 1),
(3, 'Evening Workout', 1),
(4, 'Cardio Mix', 2);
-- Create Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100)
);

-- Create Offers Table
CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

-- Insert Data
INSERT INTO users VALUES
(1,'Rahul'),
(2,'Priya'),
(3,'Amit');

INSERT INTO offers VALUES
(101,'10% Discount'),
(102,'Free Delivery'),
(103,'Buy 1 Get 1');

-- CROSS JOIN
SELECT
    u.user_name,
    o.offer_title
FROM users u
CROSS JOIN offers o;

-- This can be used for generating all possible
-- user-offer combinations for personalized campaigns.
SELECT
    p.playlist_name AS Playlist,
    parent.playlist_name AS Parent_Playlist
FROM playlists p
LEFT JOIN playlists parent
ON p.parent_playlist_id = parent.id;

--------------------------------Task 3: CROSS JOIN

CREATE TABLE app_users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100)
);

CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO app_users VALUES
(1,'Rahul'),
(2,'Priya'),
(3,'Amit');

INSERT INTO offers VALUES
(101,'10% Discount'),
(102,'Free Delivery'),
(103,'Buy 1 Get 1');

SELECT
    u.user_name,
    o.offer_title
FROM app_users u
CROSS JOIN offers o;

---------------------------Task 4

SELECT * FROM employees;

INSERT INTO employees VALUES
(1,'John',NULL),
(2,'Rahul',1),
(3,'Priya',1),
(4,'Amit',2);

-- Employee with Manager
SELECT
    e.name AS Employee,
    m.name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

-- Employees without Manager
SELECT
    name
FROM employees
WHERE manager_id IS NULL;
----------------------------------Task 5

CREATE TABLE users_city (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO users_city VALUES
(1,'Rahul','Mumbai'),
(2,'Priya','Delhi'),
(3,'Amit','Mumbai'),
(4,'Neha','Pune'),
(5,'Rohan','Delhi');

SELECT
    u1.user_name AS User1,
    u2.user_name AS User2,
    u1.city
FROM users_city u1
JOIN users_city u2
ON u1.city = u2.city
AND u1.user_id < u2.user_id;