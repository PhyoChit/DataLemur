WITH count_query AS (
  SELECT COALESCE(COUNT(DISTINCT q.query_id), 0) AS unique_queries, e.employee_id 
  FROM employees AS e 
  LEFT JOIN queries AS q
  ON q.employee_id = e.employee_id
  AND EXTRACT(YEAR FROM DATE(query_starttime)) = 2023 
  AND EXTRACT(MONTH FROM DATE(query_starttime)) IN (7, 8, 9)
  GROUP BY e.employee_id
)

SELECT unique_queries, COUNT(employee_id) AS employee_count
FROM count_query
GROUP BY unique_queries
ORDER BY unique_queries
