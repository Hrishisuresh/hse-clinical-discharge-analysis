SELECT
  CASE EXTRACT(DAYOFWEEK FROM discharge_time)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS day_of_week,
  COUNT(patient_id) AS total_discharges
FROM
  `hospital_operations.patient_discharges`
GROUP BY
  day_of_week, EXTRACT(DAYOFWEEK FROM discharge_time)
ORDER BY
  EXTRACT(DAYOFWEEK FROM discharge_time);