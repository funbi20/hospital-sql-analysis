-- =============================================
-- Hospital SQL Analysis
-- Patient Volume Analysis
-- =============================================

USE hospital_db;


-- 1. Total number of hospital encounters

SELECT
    COUNT(*) AS total_encounters
FROM encounters;


-- 2. Number of unique patients

SELECT
    COUNT(DISTINCT patient_id) AS unique_patients
FROM encounters;


-- 3. Encounters by encounter type

SELECT
    encounter_type,
    COUNT(*) AS total_encounters
FROM encounters
GROUP BY encounter_type
ORDER BY total_encounters DESC;


-- 4. Patient volume by department

SELECT
    d.department_name,
    COUNT(*) AS total_encounters
FROM encounters e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_encounters DESC;


-- 5. Monthly encounter volume

SELECT
    YEAR(admission_date) AS admission_year,
    MONTH(admission_date) AS admission_month,
    COUNT(*) AS total_encounters
FROM encounters
GROUP BY
    YEAR(admission_date),
    MONTH(admission_date)
ORDER BY
    admission_year,
    admission_month;


-- 6. Patient volume by city

SELECT
    p.city,
    COUNT(*) AS total_encounters
FROM encounters e
JOIN patients p
    ON e.patient_id = p.patient_id
GROUP BY p.city
ORDER BY total_encounters DESC;
