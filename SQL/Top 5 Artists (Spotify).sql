WITH top_10_cte AS (

  SELECT a.artist_name,
         DENSE_RANK() OVER (
         ORDER BY COUNT(s.song_id) DESC) AS artist_rank
  FROM artists AS a 
  JOIN songs AS s 
  ON a.artist_id = s.artist_id
  JOIN global_song_rank AS g 
  ON s.song_id = g.song_id 
  WHERE g.rank <= 10
  GROUP BY a.artist_name
)

SELECT artist_name, artist_rank
FROM top_10_cte
WHERE artist_rank <= 5
