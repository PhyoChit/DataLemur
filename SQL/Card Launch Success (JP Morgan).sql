SELECT 
  DISTINCT card_name,
  FIRST_VALUE(issued_amount) OVER (PARTITION BY card_name
  ORDER BY issue_year, issue_month) AS issued_amount
FROM monthly_cards_issued
ORDER BY issued_amount DESC;

-- Option 2

WITH card_launch AS (
  SELECT 
    card_name,
    issued_amount,
    MAKE_DATE(issue_year, issue_month, 1) AS issued_date,
    MIN(MAKE_DATE(issue_year, issue_month, 1)) OVER (PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM card_launch
WHERE issued_date = launch_date
ORDER BY issued_amount DESC
