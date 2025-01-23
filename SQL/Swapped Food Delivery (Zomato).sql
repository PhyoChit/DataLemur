WITH order_count AS (
  SELECT COUNT(order_id) AS total_order
  FROM orders
)

SELECT 
       CASE 
          WHEN order_id % 2 != 0 AND order_id != total_order 
          THEN order_id + 1
          WHEN order_id % 2 != 0 AND order_id = total_order
          THEN order_id
          ELSE order_id - 1 
        END AS corrected_order_id , 
       item
FROM orders
CROSS JOIN order_count
ORDER BY corrected_order_id;
