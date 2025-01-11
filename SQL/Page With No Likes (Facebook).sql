-- Option 1
SELECT p.page_id
FROM pages AS p
LEFT JOIN page_likes AS pl 
ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL;


-- Option 2
SELECT page_id
FROM pages
EXCEPT 
SELECT page_id
FROM page_likes;

-- Option 3

SELECT page_id
FROM pages
WHERE page_id NOT IN
(
  SELECT page_id
  FROM page_likes
  WHERE page_id IS NOT NULL
);

