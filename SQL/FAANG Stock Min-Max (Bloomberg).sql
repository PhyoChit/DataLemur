WITH highest AS (
  SELECT 
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
    MAX(open) AS highest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker
    ORDER BY open DESC) AS ranking
  FROM stock_prices
  GROUP BY 1, 2, open
),

lowest AS (
  SELECT
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
    MIN(open) AS lowest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker
    ORDER BY open) AS ranking
  FROM stock_prices
  GROUP BY 1, 2, open
)

SELECT 
  h.ticker,
  h.highest_mth,
  h.highest_open,
  l.lowest_mth,
  l.lowest_open
FROM highest AS h
JOIN lowest AS l 
ON h.ticker = l.ticker
AND h.ranking = 1
AND l.ranking = 1
ORDER BY ticker
