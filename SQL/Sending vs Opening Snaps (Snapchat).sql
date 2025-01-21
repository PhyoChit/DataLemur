SELECT age.age_bucket,
       ROUND(SUM(time_spent) FILTER (WHERE activity_type = 'send') * 100.0 /
       SUM(time_spent) FILTER (WHERE activity_type IN ('send', 'open')), 2) AS send_perc,
       ROUND(SUM(time_spent) FILTER (WHERE activity_type = 'open') * 100.0 / 
       SUM(time_spent) FILTER (WHERE activity_type IN ('send', 'open')), 2) AS open_perc
FROM activities AS a
JOIN age_breakdown AS age  
ON a.user_id = age.user_id
GROUP BY age.age_bucket
