SELECT
  department,
  COUNT(patient_id) AS total_patients,
  ROUND(AVG(TIMESTAMP_DIFF(discharge_time, admission_time, HOUR)), 1) AS avg_los_hours
FROM
  `hospital_operations.patient_discharges`
GROUP BY
  department
ORDER BY
  avg_los_hours DESC;