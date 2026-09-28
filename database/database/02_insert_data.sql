-- =============================================
-- Hospital SQL Analysis
-- Synthetic Data
-- =============================================

USE hospital_db;

-- =============================================
-- Departments
-- =============================================

INSERT INTO departments
(department_id, department_name, specialty)
VALUES
(1, 'Emergency Department', 'Emergency Medicine'),
(2, 'Cardiology', 'Cardiovascular Medicine'),
(3, 'Internal Medicine', 'General Medicine'),
(4, 'Orthopedics', 'Musculoskeletal Care'),
(5, 'Neurology', 'Neurological Care'),
(6, 'Pediatrics', 'Pediatric Medicine');


-- =============================================
-- Patients
-- =============================================

INSERT INTO patients
(patient_id, first_name, last_name, date_of_birth, sex, city, insurance_type)
VALUES
(1001, 'Maya', 'Johnson', '1985-06-12', 'Female', 'Atlanta', 'Commercial'),
(1002, 'David', 'Williams', '1972-03-21', 'Male', 'Decatur', 'Medicare'),
(1003, 'Amina', 'Smith', '1993-11-08', 'Female', 'Atlanta', 'Medicaid'),
(1004, 'James', 'Brown', '1965-04-17', 'Male', 'Marietta', 'Medicare'),
(1005, 'Sophia', 'Davis', '2001-09-25', 'Female', 'Suwanee', 'Commercial'),
(1006, 'Daniel', 'Wilson', '1988-01-30', 'Male', 'Atlanta', 'Commercial'),
(1007, 'Olivia', 'Thomas', '1979-07-14', 'Female', 'Lawrenceville', 'Medicaid'),
(1008, 'Michael', 'Anderson', '1958-12-03', 'Male', 'Decatur', 'Medicare'),
(1009, 'Grace', 'Taylor', '1997-05-19', 'Female', 'Atlanta', 'Commercial'),
(1010, 'Samuel', 'Martin', '2012-10-11', 'Male', 'Marietta', 'Medicaid');


-- =============================================
-- Encounters
-- =============================================

INSERT INTO encounters
(encounter_id, patient_id, admission_date, discharge_date, encounter_type, department_id, discharge_disposition)
VALUES
(2001, 1001, '2026-01-05 08:30:00', '2026-01-08 14:00:00', 'Inpatient', 3, 'Home'),
(2002, 1002, '2026-01-10 11:15:00', '2026-01-10 17:30:00', 'Emergency', 1, 'Home'),
(2003, 1003, '2026-01-15 09:00:00', '2026-01-18 12:00:00', 'Inpatient', 2, 'Home'),
(2004, 1004, '2026-01-20 16:45:00', '2026-01-25 10:30:00', 'Inpatient', 5, 'Rehabilitation'),
(2005, 1005, '2026-02-02 13:20:00', '2026-02-02 18:00:00', 'Emergency', 1, 'Home'),
(2006, 1006, '2026-02-07 07:45:00', '2026-02-09 15:00:00', 'Inpatient', 4, 'Home'),
(2007, 1007, '2026-02-12 10:00:00', '2026-02-12 13:30:00', 'Outpatient', 3, 'Home'),
(2008, 1008, '2026-02-18 21:15:00', '2026-02-22 11:00:00', 'Inpatient', 2, 'Home'),
(2009, 1009, '2026-03-01 18:30:00', '2026-03-01 23:45:00', 'Emergency', 1, 'Home'),
(2010, 1010, '2026-03-05 09:15:00', '2026-03-05 12:00:00', 'Outpatient', 6, 'Home'),
(2011, 1001, '2026-01-25 10:00:00', '2026-01-28 13:00:00', 'Inpatient', 3, 'Home'),
(2012, 1002, '2026-02-03 20:30:00', '2026-02-04 02:15:00', 'Emergency', 1, 'Home'),
(2013, 1003, '2026-03-10 08:00:00', '2026-03-12 16:00:00', 'Inpatient', 2, 'Home'),
(2014, 1004, '2026-02-15 14:30:00', '2026-02-19 09:00:00', 'Inpatient', 5, 'Rehabilitation'),
(2015, 1005, '2026-03-18 22:00:00', '2026-03-19 03:30:00', 'Emergency', 1, 'Home'),
(2016, 1008, '2026-03-05 12:00:00', '2026-03-09 10:00:00', 'Inpatient', 2, 'Home'),
(2017, 1009, '2026-03-20 17:15:00', '2026-03-20 22:30:00', 'Emergency', 1, 'Home'),
(2018, 1006, '2026-04-02 06:45:00', '2026-04-06 13:00:00', 'Inpatient', 4, 'Home'),
(2019, 1007, '2026-04-10 09:30:00', '2026-04-10 14:00:00', 'Outpatient', 3, 'Home'),
(2020, 1010, '2026-04-15 15:00:00', '2026-04-15 20:15:00', 'Emergency', 1, 'Home');


-- =============================================
-- Diagnoses
-- =============================================

INSERT INTO diagnoses
(diagnosis_id, encounter_id, diagnosis_code, diagnosis_name, diagnosis_type)
VALUES
(3001, 2001, 'J18.9', 'Pneumonia', 'Primary'),
(3002, 2002, 'R07.9', 'Chest Pain', 'Primary'),
(3003, 2003, 'I10', 'Hypertension', 'Primary'),
(3004, 2004, 'G45.9', 'Transient Ischemic Attack', 'Primary'),
(3005, 2005, 'R10.9', 'Abdominal Pain', 'Primary'),
(3006, 2006, 'S82.90', 'Lower Leg Fracture', 'Primary'),
(3007, 2007, 'E11.9', 'Type 2 Diabetes', 'Primary'),
(3008, 2008, 'I50.9', 'Heart Failure', 'Primary'),
(3009, 2009, 'R51.9', 'Headache', 'Primary'),
(3010, 2010, 'J06.9', 'Upper Respiratory Infection', 'Primary'),
(3011, 2011, 'J18.9', 'Pneumonia', 'Primary'),
(3012, 2012, 'R07.9', 'Chest Pain', 'Primary'),
(3013, 2013, 'I10', 'Hypertension', 'Primary'),
(3014, 2014, 'G45.9', 'Transient Ischemic Attack', 'Primary'),
(3015, 2015, 'R10.9', 'Abdominal Pain', 'Primary'),
(3016, 2016, 'I50.9', 'Heart Failure', 'Primary'),
(3017, 2017, 'R51.9', 'Headache', 'Primary'),
(3018, 2018, 'S82.90', 'Lower Leg Fracture', 'Primary'),
(3019, 2019, 'E11.9', 'Type 2 Diabetes', 'Primary'),
(3020, 2020, 'J06.9', 'Upper Respiratory Infection', 'Primary');
