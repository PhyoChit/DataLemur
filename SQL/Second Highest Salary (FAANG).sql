WITH salary_ranking AS (
  SELECT 
      employee_id,
      DENSE_RANK() OVER (
      ORDER BY salary DESC) AS salary_rank,
      salary
  FROM employee
)

SELECT DISTINCT salary AS second_highest_salary
FROM salary_ranking
WHERE salary_rank = 2
