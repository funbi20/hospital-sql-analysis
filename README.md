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
