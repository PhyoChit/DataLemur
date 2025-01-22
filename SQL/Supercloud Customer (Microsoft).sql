WITH category_count AS (
  SELECT c.customer_id,
         COUNT(DISTINCT p.product_category) AS count
  FROM customer_contracts AS c 
  JOIN products AS p 
  ON c.product_id = p.product_id
  GROUP BY c.customer_id
)

SELECT customer_id
FROM category_count
WHERE count = (SELECT COUNT(DISTINCT product_category) FROM products)
