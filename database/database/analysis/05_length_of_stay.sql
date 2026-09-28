-- =============================================
-- Hospital SQL Analysis
-- Length of Stay Analysis
-- =============================================

USE hospital_db;


-- 1. Calculate length of stay for each encounter

SELECT
    encounter_id,
    patient_id,
    admission_date,
    discharge_date,
    TIMESTAMPDIFF(HOUR, admission_date, discharge_date) AS los_hours
FROM encounters
ORDER BY los_hours DESC;


-- 2. Calculate average length of stay

SELECT
    ROUND(
        AVG(TIMESTAMPDIFF(HOUR, admission_date, discharge_date)),
        2
    ) AS avg_los_hours
FROM encounters;


-- 3. Average length of stay by encounter type

SELECT
    encounter_type,
    ROUND(
        AVG(TIMESTAMPDIFF(HOUR, admission_date, discharge_date)),
        2
    ) AS avg_los_hours
FROM encounters
GROUP BY encounter_type
ORDER BY avg_los_hours DESC;


-- 4. Average length of stay by department

SELECT
    d.department_name,
    ROUND(
        AVG(TIMESTAMPDIFF(HOUR, e.admission_date, e.discharge_date)),
        2
    ) AS avg_los_hours
FROM encounters e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_los_hours DESC;


-- 5. Encounters with above-average length of stay
-- Demonstrates the use of a subquery

SELECT
    encounter_id,
    patient_id,
    encounter_type,
    TIMESTAMPDIFF(HOUR, admission_date, discharge_date) AS los_hours
FROM encounters
WHERE TIMESTAMPDIFF(HOUR, admission_date, discharge_date) >
(
    SELECT AVG(
        TIMESTAMPDIFF(HOUR, admission_date, discharge_date)
    )
    FROM encounters
)
ORDER BY los_hours DESC;
