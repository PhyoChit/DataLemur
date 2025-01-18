WITH latest_transaction AS 
(
  SELECT transaction_date,
         user_id, 
         product_id,
         RANK() OVER (
         PARTITION BY user_id
         ORDER BY transaction_date DESC) AS transaction_rank
  FROM user_transactions
)

SELECT transaction_date, user_id,
       COUNT(product_id) AS purchase_count
FROM latest_transaction
WHERE transaction_rank = 1
GROUP BY 1, 2
