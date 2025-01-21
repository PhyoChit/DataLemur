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
WHERE salary_rank = 2;

-- Option 2

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee)
