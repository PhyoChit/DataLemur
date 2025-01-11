WITH total_tweets AS
(
  SELECT COUNT(tweet_id) AS tweet_bucket, user_id
  FROM tweets
  WHERE EXTRACT(YEAR FROM CAST(tweet_date AS date)) = 2022
  GROUP BY user_id
)

SELECT tweet_bucket, COUNT(user_id) AS users_num
FROM total_tweets
GROUP BY tweet_bucket
