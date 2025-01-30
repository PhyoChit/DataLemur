SELECT 
  COALESCE(a.user_id, d.user_id) AS user_id,
  CASE WHEN d.paid IS NULL 
       THEN 'CHURN'
       WHEN a.status IN ('NEW', 'RESURRECT', 'EXISTING') AND d.paid IS NOT NULL
       THEN 'EXISTING'
       WHEN a.status = 'CHURN' AND d.paid IS NOT NULL
       THEN 'RESURRECT'
       WHEN a.status IS NULL AND d.paid IS NOT NULL
       THEN 'NEW'
  END AS new_status
FROM advertiser AS a 
FULL OUTER JOIN daily_pay AS d 
ON a.user_id = d.user_id
ORDER BY user_id
