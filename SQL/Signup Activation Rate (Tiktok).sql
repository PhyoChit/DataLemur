SELECT 
    ROUND(SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1 ELSE 0 END) * 1.0/
    SUM(CASE WHEN t.signup_action IN ('Confirmed', 'Not Confirmed') THEN 1 ELSE 0 END), 2) AS confirm_rate
FROM emails AS e 
JOIN texts AS t 
ON e.email_id = t.email_id
