
SET GLOBAL local_infile = 1;

CREATE DATABASE IF NOT EXISTS employees_db;

USE employees_db;

-- Change the csv file data path

LOAD DATA LOCAL INFILE "\employees_data_cleaned.csv"
INTO TABLE employees_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT *
FROM employees_data;

SELECT department, GENDER, employee_id,KPIs_met_more_than_80
FROM employees_data
WHERE KPIs_met_more_than_80 = 1 
GROUP BY department, GENDER, employee_id;

-- Employee Count By Each Departments
SELECT department, COUNT(department) AS staff_count
FROM employees_data
GROUP BY department;

-- Department Count By Region
SELECT region, COUNT(department) as department_count
FROM employees_data
GROUP BY region;

-- Top Performing departments
SELECT RANK() OVER(ORDER BY SUM(avg_training_score) DESC) dept_rank,
	   department,
	   SUM(avg_training_score) AS score
FROM employees_data
WHERE previous_year_rating >3
GROUP BY department
LIMIT 5;

-- Top Performing Region
SELECT RANK() OVER(ORDER BY SUM(avg_training_score) DESC) AS region_rank,
	   region,
	   SUM(avg_training_score) AS score       
FROM employees_data
WHERE previous_year_rating > 4
GROUP BY region
LIMIT 5;

-- Average Training Score by department

SELECT department, AVG(avg_training_score) AS Average_dept_training_score
FROM employees_data
GROUP BY department;

-- CASE to Bucket employees into KPI performance tiers

SELECT 
    employee_id, KPIs_met_more_than_80, department,
    CASE 
        WHEN KPIs_met_more_than_80 = 1 THEN 'good'
        ELSE 'needs improvement'
    END AS performance_status
FROM 
    employees_data;

-- Employee Data

WITH emp_score_acc AS(
SELECT employee_id, department, gender
FROM employees_data
WHERE  department='technology'

GROUP BY employee_id, department,gender
)
SELECT *
FROM emp_score_acc;

-- Department  statistics

WITH dept_stats AS (
  SELECT 
    department,
    AVG(avg_training_score) AS avg_score,
    AVG(KPIs_met_more_than_80)*100 AS kpi_pct,
    AVG(awards_won) AS award_rate
  FROM employees_data
  GROUP BY department
)
SELECT *
FROM dept_stats;

