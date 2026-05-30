WITH delayed_patients AS (
  SELECT *
  FROM `hospital_operations.patient_discharges`
  WHERE delay_reason != 'None'
)

SELECT
  delay_reason,
  COUNT(patient_id) AS total_incidents,
  ROUND(COUNT(patient_id) * 100.0 / (SELECT COUNT(*) FROM delayed_patients), 1) AS percentage_of_delays
FROM
  delayed_patients
GROUP BY
  delay_reason
ORDER BY
  total_incidents DESC;