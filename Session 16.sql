----------------------Task 1: CONCAT() – Combine first name and last name
SELECT * FROM Users;
ALTER TABLE Users
ADD COLUMN first_name VARCHAR(50),
ADD COLUMN last_name VARCHAR(50);

UPDATE Users
SET first_name='Rahul', last_name='Sharma'
WHERE user_id=1;

UPDATE Users
SET first_name='Priya', last_name='Patel'
WHERE user_id=2;

UPDATE Users
SET first_name='Amit', last_name='Kumar'
WHERE user_id=3;

UPDATE Users
SET first_name='Sneha', last_name='Joshi'
WHERE user_id=4;

UPDATE Users
SET first_name='Rohan', last_name='Mehta'
WHERE user_id=5;

SELECT
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM Users;
-------------------------------Task 2: UPPER()

SELECT * FROM playlists;

DESCRIBE playlists;

SELECT
    playlist_name,
    UPPER(playlist_name) AS uppercase_title
FROM playlists;

SELECT
    playlist_name,
    UPPER(playlist_name) AS uppercase_title
FROM playlists;
-----------------------------Next: Task 3 – TRIM()

CREATE TABLE food_items (
    item_code VARCHAR(50)
);

INSERT INTO food_items (item_code) VALUES
('  BURGER101  '),
('  PIZZA202'),
('SANDWICH303  '),
('  PASTA404  ');

SELECT
    item_code,
    TRIM(item_code) AS cleaned_item_code
FROM food_items;

-------------------------✅ Task 4: RIGHT() – Extract the last 7 characters from imdb_id

SELECT * FROM movies;

DESCRIBE movies;

ALTER TABLE movies
ADD COLUMN imdb_id VARCHAR(20);

UPDATE movies SET imdb_id = 'tt1234567' WHERE movie_id = 1;
UPDATE movies SET imdb_id = 'tt7654321' WHERE movie_id = 2;
UPDATE movies SET imdb_id = 'tt9876543' WHERE movie_id = 3;
UPDATE movies SET imdb_id = 'tt4567890' WHERE movie_id = 4;
UPDATE movies SET imdb_id = 'tt1111111' WHERE movie_id = 5;

SELECT
    movie_id,
    imdb_id,
    RIGHT(imdb_id, 7) AS movie_number
FROM movies;
--------------------------------------------------Task 5: REPLACE()

SELECT * FROM products;

ALTER TABLE products
ADD COLUMN sku_code VARCHAR(50);

UPDATE products SET sku_code='MOB-123-XY' WHERE product_id=1;
UPDATE products SET sku_code='LAP-456-AB' WHERE product_id=2;
UPDATE products SET sku_code='TV-789-CD' WHERE product_id=3;
UPDATE products SET sku_code='TAB-321-EF' WHERE product_id=4;

SELECT
    sku_code,
    REPLACE(sku_code, '-', '_') AS updated_code
FROM products;

UPDATE products SET sku_code = 'CAM-654-GH' WHERE product_id = 5;
UPDATE products SET sku_code = 'MON-111-IJ' WHERE product_id = 6;
UPDATE products SET sku_code = 'KEY-222-KL' WHERE product_id = 7;
UPDATE products SET sku_code = 'MOU-333-MN' WHERE product_id = 8;
UPDATE products SET sku_code = 'SPK-444-OP' WHERE product_id = 9;
UPDATE products SET sku_code = 'HDP-555-QR' WHERE product_id = 10;