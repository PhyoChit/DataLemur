WITH department_salary AS (
  SELECT 
    e.department_id,
    ROUND(AVG(s.amount), 2) AS avg_dsalary
  FROM employee AS e 
  JOIN salary AS s 
  ON e.employee_id = s.employee_id
  WHERE EXTRACT(YEAR FROM payment_date) = 2024
  AND EXTRACT(MONTH FROM payment_date) = 3
  GROUP BY e.department_id
),

company_salary AS (
SELECT 
  ROUND(AVG(amount), 2) AS avg_csalary,
  TO_CHAR(payment_date, 'MM-YYYY') AS payment_date
FROM salary
WHERE EXTRACT(YEAR FROM payment_date) = 2024
AND EXTRACT(MONTH FROM payment_date) = 3
GROUP BY payment_date
)

SELECT 
  d.department_id,
  c.payment_date,
  CASE WHEN avg_dsalary > avg_csalary
       THEN 'higher'
       WHEN avg_dsalary < avg_csalary
       THEN 'lower'
       ELSE 'same'
  END AS comparison
FROM department_salary AS d 
CROSS JOIN company_salary AS c
