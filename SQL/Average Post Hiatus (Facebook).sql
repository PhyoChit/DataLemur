SELECT user_id,
       MAX(DATE(post_date)) - MIN(DATE(post_date)) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM CAST(post_date AS DATE)) = 2021
GROUP BY user_id
HAVING COUNT(post_id) > 1
