-- =============================================
-- Hospital SQL Analysis
-- 30-Day Readmission Analysis
-- =============================================

USE hospital_db;


-- NOTE:
-- This is a simplified educational 30-day readmission
-- analysis using synthetic data. It is not intended
-- to reproduce an official CMS readmission measure.


-- 1. Display inpatient encounters chronologically

SELECT
    patient_id,
    encounter_id,
    admission_date,
    discharge_date
FROM encounters
WHERE encounter_type = 'Inpatient'
ORDER BY
    patient_id,
    admission_date;


-- 2. Identify each patient's next inpatient admission
-- Demonstrates LEAD() window function

SELECT
    patient_id,
    encounter_id,
    admission_date,
    discharge_date,

    LEAD(admission_date) OVER (
        PARTITION BY patient_id
        ORDER BY admission_date
    ) AS next_admission_date

FROM encounters
WHERE encounter_type = 'Inpatient';


-- 3. Calculate days between discharge and next admission
-- Demonstrates a Common Table Expression (CTE)

WITH inpatient_encounters AS (

    SELECT
        patient_id,
        encounter_id,
        admission_date,
        discharge_date,

        LEAD(admission_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS next_admission_date

    FROM encounters
    WHERE encounter_type = 'Inpatient'
)

SELECT
    patient_id,
    encounter_id,
    discharge_date,
    next_admission_date,
    DATEDIFF(next_admission_date, discharge_date)
        AS days_to_readmission

FROM inpatient_encounters;


-- 4. Classify encounters as 30-day readmissions

WITH inpatient_encounters AS (

    SELECT
        patient_id,
        encounter_id,
        admission_date,
        discharge_date,

        LEAD(admission_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS next_admission_date

    FROM encounters
    WHERE encounter_type = 'Inpatient'
)

SELECT
    patient_id,
    encounter_id,
    discharge_date,
    next_admission_date,

    DATEDIFF(
        next_admission_date,
        discharge_date
    ) AS days_to_readmission,

    CASE
        WHEN DATEDIFF(
            next_admission_date,
            discharge_date
        ) BETWEEN 0 AND 30
        THEN '30-Day Readmission'

        ELSE 'No 30-Day Readmission'
    END AS readmission_status

FROM inpatient_encounters;


-- 5. Calculate simplified 30-day readmission rate

WITH inpatient_encounters AS (

    SELECT
        patient_id,
        encounter_id,
        admission_date,
        discharge_date,

        LEAD(admission_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS next_admission_date

    FROM encounters
    WHERE encounter_type = 'Inpatient'
),

readmission_flags AS (

    SELECT
        patient_id,
        encounter_id,
        discharge_date,
        next_admission_date,

        CASE
            WHEN DATEDIFF(
                next_admission_date,
                discharge_date
            ) BETWEEN 0 AND 30
            THEN 1
            ELSE 0
        END AS readmitted_30_days

    FROM inpatient_encounters
    WHERE next_admission_date IS NOT NULL
)

SELECT
    COUNT(*) AS eligible_encounters,
    SUM(readmitted_30_days) AS readmissions,

    ROUND(
        100.0 *
        SUM(readmitted_30_days) /
        COUNT(*),
        2
    ) AS readmission_rate_percent

FROM readmission_flags;
