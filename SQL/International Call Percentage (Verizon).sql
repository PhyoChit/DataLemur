WITH international_call AS (
  SELECT 
      caller.caller_id,
      caller.country_id,
      receiver.caller_id,
      receiver.country_id
  FROM phone_calls AS call 
  JOIN phone_info AS caller 
  ON call.caller_id = caller.caller_id 
  JOIN phone_info AS receiver 
  ON call.receiver_id = receiver.caller_id
  WHERE caller.country_id <> receiver.country_id
)

SELECT 
  ROUND(COUNT(*) * 100.0/(SELECT COUNT(*) FROM phone_calls), 1)
FROM international_call
