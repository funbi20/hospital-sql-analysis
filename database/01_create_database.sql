-- =============================================
-- Hospital SQL Analysis
-- Database Creation
-- =============================================

CREATE DATABASE hospital_db;

USE hospital_db;

-- Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    sex VARCHAR(10),
    city VARCHAR(50),
    insurance_type VARCHAR(50)
);

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    specialty VARCHAR(100)
);

-- Encounters Table
CREATE TABLE encounters (
    encounter_id INT PRIMARY KEY,
    patient_id INT,
    admission_date DATETIME,
    discharge_date DATETIME,
    encounter_type VARCHAR(50),
    department_id INT,
    discharge_disposition VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Diagnoses Table
CREATE TABLE diagnoses (
    diagnosis_id INT PRIMARY KEY,
    encounter_id INT,
    diagnosis_code VARCHAR(20),
    diagnosis_name VARCHAR(100),
    diagnosis_type VARCHAR(50),
    FOREIGN KEY (encounter_id) REFERENCES encounters(encounter_id)
);
