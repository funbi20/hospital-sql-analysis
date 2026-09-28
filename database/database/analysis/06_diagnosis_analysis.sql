-- =============================================
-- Hospital SQL Analysis
-- Diagnosis Analysis
-- =============================================

USE hospital_db;


-- 1. Diagnosis frequency

SELECT
    diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM diagnoses
GROUP BY diagnosis_name
ORDER BY diagnosis_count DESC;


-- 2. Diagnoses by department

SELECT
    d.department_name,
    dx.diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM diagnoses dx
JOIN encounters e
    ON dx.encounter_id = e.encounter_id
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY
    d.department_name,
    dx.diagnosis_name
ORDER BY
    d.department_name,
    diagnosis_count DESC;


-- 3. Diagnoses by encounter type

SELECT
    e.encounter_type,
    dx.diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM diagnoses dx
JOIN encounters e
    ON dx.encounter_id = e.encounter_id
GROUP BY
    e.encounter_type,
    dx.diagnosis_name
ORDER BY
    e.encounter_type,
    diagnosis_count DESC;


-- 4. Diagnosis frequency by diagnosis code

SELECT
    diagnosis_code,
    diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM diagnoses
GROUP BY
    diagnosis_code,
    diagnosis_name
ORDER BY diagnosis_count DESC;
