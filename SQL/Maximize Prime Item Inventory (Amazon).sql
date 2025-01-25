WITH summary AS (
  SELECT 
    item_type,
    SUM(square_footage) AS sqf,
    COUNT(item_id) AS item_count
  FROM inventory
  GROUP BY item_type
)

SELECT item_type, 
  FLOOR(500000/sqf)* item_count AS item_count
FROM cte
WHERE item_type = 'prime_eligible'

UNION ALL

SELECT item_type,
  FLOOR((500000 - (SELECT FLOOR(500000/sqf) * sqf FROM summary WHERE item_type = 'prime_eligible'))
        / sqf) * item_count AS item_count
FROM cte 
WHERE item_type = 'not_prime'
