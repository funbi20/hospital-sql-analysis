<img width="1536" height="1024" alt="Hospital DB ERD" src="https://github.com/user-attachments/assets/7500682d-6b37-4d99-8c07-c478595cf6a1" />
# hospital-sql-analysis
SQL analysis of a synthetic hospital database examining patient volume, length of stay, diagnoses, emergency department utilization, and 30-day readmissions.
# Hospital Patient Utilization & Readmission Analysis

## Project Overview

This project analyzes a synthetic hospital database using MySQL to examine patient utilization, hospital length of stay, diagnoses, emergency department utilization, and 30-day readmissions.

The project was created to demonstrate SQL and healthcare data analytics skills using a relational healthcare database.

All patient information used in this project is synthetic and does not contain real patient or protected health information (PHI).

## Business Questions

The analysis focuses on the following questions:

1. How many patients and hospital encounters are represented in the database?
2. Which hospital departments experience the highest patient volume?
3. What is the average length of stay?
4. How does length of stay vary by department and encounter type?
5. What diagnoses are most frequently observed?
6. Which diagnoses are most common within each department?
7. How frequently is the Emergency Department utilized?
8. Which patients have multiple Emergency Department visits?
9. Which inpatient encounters are followed by another inpatient admission within 30 days?
10. Are there potential data quality issues within the database?

## Database Structure

The database contains four primary tables:

### Patients
Contains patient demographic and insurance information.

### Encounters
Contains information about hospital visits, including admission dates, discharge dates, encounter types, and departments.

### Departments
Contains hospital department and specialty information.

### Diagnoses
Contains diagnosis codes and diagnoses associated with hospital encounters.

## Database Relationships

Patients are connected to Encounters through `patient_id`.

Encounters are connected to Departments through `department_id`.

Diagnoses are connected to Encounters through `encounter_id`.

## SQL Skills Demonstrated

- SELECT statements
- WHERE filtering
- JOIN and LEFT JOIN
- GROUP BY
- HAVING
- CASE expressions
- Aggregate functions
- Date calculations
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Data validation queries
- Relational database design
- Primary and foreign keys

## Tools

- MySQL
- MySQL Workbench
- GitHub

## Dataset

The project uses a synthetic dataset created specifically for SQL practice and portfolio demonstration.

The database contains:

- 10 synthetic patients
- 20 hospital encounters
- 6 hospital departments
- 20 diagnosis records

No real patient information or PHI is included.

## Key Findings

Analysis of the synthetic hospital dataset produced the following findings:

- The database contained **20 hospital encounters representing 10 unique patients**.
- **Inpatient encounters accounted for 50%** of all encounters, followed by **Emergency encounters at 35%** and **Outpatient encounters at 15%**.
- The **Emergency Department had the highest encounter volume**, with 7 encounters. Cardiology and Internal Medicine followed with 4 encounters each.
-The overall average encounter duration was 43.30 hours across inpatient, emergency, and outpatient encounters.
-Inpatient encounters had an average length of stay of 82.20 hours, compared with 5.00 hours for emergency encounters and 3.00 hours for outpatient encounters.- **Neurology had the longest average length of stay at 101.50 hours**, followed by Orthopedics at 78.50 hours and Cardiology at 77.50 hours.
- Monthly encounter volume was highest in **February and March, with 6 encounters each**, compared with 5 in January and 3 in April.
- Emergency encounters represented **35% of total hospital encounters**.
- Diagnosis frequency was evenly distributed in the synthetic dataset, with each represented diagnosis occurring twice.
- Using the project's simplified 30-day readmission definition, **3 of 5 eligible inpatient encounters were followed by another inpatient admission within 30 days**, resulting in a 60% rate within the synthetic sample.

> **Note:** This project uses a small synthetic dataset created for SQL practice. The utilization and readmission results are intended to demonstrate analytical methods and should not be interpreted as real-world hospital performance measures.

## Limitations

This project uses a small synthetic dataset and is intended to demonstrate SQL and healthcare data analysis techniques rather than evaluate actual hospital performance.

Key limitations include:

- The dataset contains only 10 patients and 20 encounters.
- Diagnoses were intentionally distributed across the synthetic dataset and do not represent real disease prevalence.
- The analysis does not adjust for patient demographics, severity, comorbidities, or other clinical risk factors.
- Length of stay includes inpatient, outpatient, and emergency encounters unless otherwise specified.
- The 30-day readmission calculation is a simplified educational measure and does not reproduce CMS readmission methodology.
- The dataset does not currently include claims, medications, laboratory results, providers, or procedures.

## Future Improvements

Future versions of this project could include:

- Claims and insurance data
- Provider information
- Laboratory results
- Medication data
- Appointment and no-show analysis
- Larger synthetic patient populations
- Tableau dashboard development

```text
Patients
   |
   | patient_id
   v
Encounters --------> Departments
   |                 department_id
   |
   | encounter_id
   v
Diagnoses

