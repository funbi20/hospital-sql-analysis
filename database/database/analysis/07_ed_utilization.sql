-- =============================================
-- Hospital SQL Analysis
-- Emergency Department Utilization
-- =============================================

USE hospital_db;


-- 1. Total Emergency Department encounters

SELECT
    COUNT(*) AS total_ed_encounters
FROM encounters e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Emergency Department';


-- 2. Number of unique ED patients

SELECT
    COUNT(DISTINCT e.patient_id) AS unique_ed_patients
FROM encounters e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Emergency Department';


-- 3. Percentage of encounters occurring in the ED

SELECT
    COUNT(*) AS total_encounters,

    SUM(
        CASE
            WHEN encounter_type = 'Emergency' THEN 1
            ELSE 0
        END
    ) AS emergency_encounters,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN encounter_type = 'Emergency' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS emergency_utilization_percent

FROM encounters;


-- 4. Most common ED diagnoses

SELECT
    dx.diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM diagnoses dx
JOIN encounters e
    ON dx.encounter_id = e.encounter_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Emergency Department'
GROUP BY dx.diagnosis_name
ORDER BY diagnosis_count DESC;


-- 5. ED utilization by month

SELECT
    YEAR(e.admission_date) AS admission_year,
    MONTH(e.admission_date) AS admission_month,
    COUNT(*) AS ed_encounters
FROM encounters e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Emergency Department'
GROUP BY
    YEAR(e.admission_date),
    MONTH(e.admission_date)
ORDER BY
    admission_year,
    admission_month;


-- 6. Patients with multiple ED encounters

SELECT
    e.patient_id,
    COUNT(*) AS ed_visits
FROM encounters e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Emergency Department'
GROUP BY e.patient_id
HAVING COUNT(*) > 1
ORDER BY ed_visits DESC;
