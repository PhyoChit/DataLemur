SELECT 
  EXTRACT(MONTH FROM curr.event_date) AS month,
  COUNT(DISTINCT curr.user_id) AS monthly_active_users
FROM user_actions AS curr 
WHERE EXISTS (
  SELECT
    1
  FROM user_actions AS last 
  WHERE curr.user_id = last.user_id
  AND EXTRACT(MONTH FROM last.event_date) = EXTRACT(MONTH FROM curr.event_date - INTERVAL '1 MONTH')
)
AND EXTRACT(MONTH FROM curr.event_date) = 7
AND EXTRACT(YEAR FROM curr.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr.event_date)
  
