WITH measurement_rank AS (

  SELECT CAST(measurement_time AS DATE) AS measurement_day,
         ROW_NUMBER() OVER (
         PARTITION BY DATE(measurement_time)
         ORDER BY measurement_time) AS measurement_num,
         measurement_value
  FROM measurements

)

SELECT measurement_day,
       SUM(measurement_value) FILTER (WHERE measurement_num % 2 = 1) AS odd_sum,
       SUM(measurement_value) FILTER (WHERE measurement_num % 2 = 0) AS event_sum
FROM measurement_rank
GROUP BY measurement_day
