-------14------------Task 1: ROW_NUMBER() – Assign a sequential number to each order per user

use restaurant_db;

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY order_date DESC
    ) AS row_num
FROM Orders;

-------------------Task 2: RANK() – Rank songs based on streams within each artist

SELECT * FROM Songs;

SELECT
    song_id,
    artist_name,
    streams,
    RANK() OVER (
        PARTITION BY artist_name
        ORDER BY streams DESC
    ) AS song_rank
FROM Songs;
--------------------------------Task 3: DENSE_RANK() – Rank movies by rating within each genre
SELECT * FROM Movies;

SELECT
    song_id,
    singer,
    streams,
    RANK() OVER (
        PARTITION BY singer
        ORDER BY streams DESC
    ) AS song_rank
FROM Songs;
---------------------------------Task 4: Display the Top 3 Influencers per Platform using ROW_NUMBER()

SELECT * FROM Influencers;

ALTER TABLE Influencers
ADD COLUMN platform VARCHAR(50),
ADD COLUMN followers INT;

UPDATE Influencers
SET platform = 'Instagram', followers = 50000
WHERE influencer_id = 1;

UPDATE Influencers
SET platform = 'YouTube', followers = 80000
WHERE influencer_id = 2;

UPDATE Influencers
SET platform = 'Instagram', followers = 65000
WHERE influencer_id = 3;

WITH RankedInfluencers AS (
    SELECT
        influencer_id,
        influencer_name,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers
)
SELECT
    influencer_id,
    influencer_name,
    platform,
    followers,
    row_num
FROM RankedInfluencers
WHERE row_num <= 3;