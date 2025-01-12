WITH find_duplicate AS (
SELECT company_id, COUNT(*) AS job_count
FROM job_listings
GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id)
FROM find_duplicate
WHERE job_count > 1
