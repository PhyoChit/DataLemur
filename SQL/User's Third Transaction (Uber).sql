WITH transaction_rank AS (
  SELECT user_id,
         ROW_NUMBER() OVER (
         PARTITION BY user_id
         ORDER BY transaction_date) AS transaction_num,
         spend,
         transaction_date
  FROM transactions
)

SELECT user_id, spend, transaction_date
FROM transaction_rank
WHERE transaction_num = 3
