-- =============================================
-- Hospital SQL Analysis
-- Data Validation and Quality Checks
-- =============================================

USE hospital_db;


-- 1. Check for missing patient information

SELECT *
FROM patients
WHERE patient_id IS NULL
   OR first_name IS NULL
   OR last_name IS NULL
   OR date_of_birth IS NULL
   OR sex IS NULL
   OR insurance_type IS NULL;


-- 2. Check for potential duplicate patients

SELECT
    first_name,
    last_name,
    date_of_birth,
    COUNT(*) AS duplicate_count
FROM patients
GROUP BY first_name, last_name, date_of_birth
HAVING COUNT(*) > 1;


-- 3. Check for missing admission or discharge dates

SELECT *
FROM encounters
WHERE admission_date IS NULL
   OR discharge_date IS NULL;


-- 4. Check for discharge dates occurring before admission dates

SELECT
    encounter_id,
    patient_id,
    admission_date,
    discharge_date
FROM encounters
WHERE discharge_date < admission_date;


-- 5. Check for negative length of stay

SELECT
    encounter_id,
    patient_id,
    TIMESTAMPDIFF(HOUR, admission_date, discharge_date) AS los_hours
FROM encounters
WHERE TIMESTAMPDIFF(HOUR, admission_date, discharge_date) < 0;


-- 6. Check for duplicate encounter IDs

SELECT
    encounter_id,
    COUNT(*) AS duplicate_count
FROM encounters
GROUP BY encounter_id
HAVING COUNT(*) > 1;


-- 7. Check for encounters without matching patients

SELECT
    e.encounter_id,
    e.patient_id
FROM encounters e
LEFT JOIN patients p
    ON e.patient_id = p.patient_id
WHERE p.patient_id IS NULL;


-- 8. Check for encounters without matching departments

SELECT
    e.encounter_id,
    e.department_id
FROM encounters e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- 9. Check for diagnoses without matching encounters

SELECT
    dx.diagnosis_id,
    dx.encounter_id
FROM diagnoses dx
LEFT JOIN encounters e
    ON dx.encounter_id = e.encounter_id
WHERE e.encounter_id IS NULL;
