WITH yearly_spend AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend
  FROM user_transactions
)

SELECT year, product_id,
       SUM(curr_year_spend) AS curr_year_spend,
       SUM(prev_year_spend) AS prev_year_spend,
       ROUND((SUM(curr_year_spend)-SUM(prev_year_spend)) * 100.0/ SUM(prev_year_spend), 2) AS yoy_rate
FROM yearly_spend
GROUP BY year, product_id
ORDER BY product_id
