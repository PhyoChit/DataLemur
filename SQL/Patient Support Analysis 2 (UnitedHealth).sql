WITH na_calls AS (
  SELECT COUNT(case_id) AS na_count
  FROM callers
  WHERE call_category IS NULL OR call_category = 'n/a'
)

SELECT 
  ROUND( na_count * 100.0 / (SELECT COUNT(case_id) FROM callers), 1) AS uncategorised_call_pct
FROM na_calls
