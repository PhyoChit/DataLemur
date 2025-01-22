WITH salary_ranking AS (
  SELECT d.department_name, 
         e.name, 
         e.salary,
         DENSE_RANK() OVER (
         PARTITION BY d.department_id
         ORDER BY salary DESC) AS ranking
  FROM employee AS e  
  JOIN department AS d 
  ON e.department_id = d.department_id
)

SELECT department_name, name, salary
FROM salary_ranking
WHERE ranking <= 3
ORDER BY department_name ASC, salary DESC, name ASC
