Company Database – SQL Assignment

## # 1 Create Database


CREATE DATABASE company_db;
```

## # 2 Use Database


USE company_db;


## # 3 Department Table

CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);
```

## # 4 Employee Table


CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    gender VARCHAR(10)
);
```

## # 5 Project Table


CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(10,2),
    dept_id INT
);
```

## # 6 Skills Table


CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    category VARCHAR(100)
);
```

## # 7 Show Databases


SHOW DATABASES;


## # 8 Show Tables


SHOW TABLES;


## # 9 Insert Departments


INSERT INTO department (dept_name, location)
VALUES 
('HR','New York'),
('IT','San Francisco'),
('Finance','Chicago'),
('Marketing','Los Angeles');
```

## # 10 Add Sales Department


INSERT INTO department (dept_name, location)
VALUES ('Sales','Boston');
```

## # 11 Insert Employees


INSERT INTO employee (first_name,last_name,email,hire_date,salary,dept_id,gender)
VALUES
('John','Doe','john.doe@company.com','2022-06-12',60000,2,'Male'),
('Jane','Smith','jane.smith@company.com','2023-03-15',72000,1,'Female'),
('Michael','Brown','michael.brown@company.com','2021-11-05',82000,3,'Male');
```

## # 12 Insert Alice Green

```sql
INSERT INTO employee
(first_name,email,hire_date,salary,dept_id,gender)
VALUES
('Alice Green','alice.green@company.com','2024-01-10',62000,4,'Female');
```

## # 13 Insert Tom with Partial Data

```sql
INSERT INTO employee (first_name,email)
VALUES ('Tom','tom@company.com');
```

## # 14 Insert Projects

```sql
INSERT INTO project (project_name,budget,dept_id)
VALUES
('Website Development',50000,2),
('AI Research',75000,2),
('Marketing Campaign',40000,4);
```

## # 15 Insert Multiple Projects

```sql
INSERT INTO project (project_name,budget,dept_id)
VALUES
('Mobile App',60000,2),
('Training Program',25000,1);
```

## # 16 Select All Employees

```sql
SELECT * FROM employee;
```

## # 17 Employee Details with Alias

```sql
SELECT 
emp_id AS "Employee ID",
first_name AS "Name",
email AS "Email Address"
FROM employee;
```

## # 18 Employees Hired After 2023

```sql
SELECT * 
FROM employee
WHERE hire_date > '2023-01-01';
```

## # 19 Projects Budget > 40000

```sql
SELECT *
FROM project
WHERE budget > 40000
ORDER BY budget DESC;
```

## # 20 Unique Department Locations

```sql
SELECT DISTINCT location
FROM department;
```

## # 21 Add Phone Number Column

```sql
ALTER TABLE employee
ADD phone_number VARCHAR(15) AFTER email;
```

## # 22 Update John Salary

```sql
UPDATE employee
SET salary = 65000
WHERE first_name = 'John';
```

## # 23 Update Gender for Dept 2

```sql
UPDATE employee
SET gender = 'Other'
WHERE dept_id = 2;
```

## # 24 Drop Phone Column

```sql
ALTER TABLE employee
DROP COLUMN phone_number;
```

## # 25 Salary Between 60000 and 80000

```sql
SELECT *
FROM employee
WHERE salary BETWEEN 60000 AND 80000;
```

## # 26 Names Starting with J

```sql
SELECT *
FROM employee
WHERE first_name LIKE 'J%';
```

## # 27 Projects in Dept 1 or 2

```sql
SELECT *
FROM project
WHERE dept_id IN (1,2);
```

## # 28 Employees with Email

```sql
SELECT *
FROM employee
WHERE email IS NOT NULL;
```

## # 29 Departments not in NY or Chicago

```sql
SELECT *
FROM department
WHERE location NOT IN ('New York','Chicago');
```

## # 30 Employees Hired in 2023

```sql
SELECT *
FROM employee
WHERE YEAR(hire_date)=2023;
```

## # 31 Total Salary

```sql
SELECT SUM(salary) AS total_salary
FROM employee;
```

## # 32 Average Project Budget

```sql
SELECT AVG(budget) AS avg_budget
FROM project;
```

## # 33 Highest Salary

```sql
SELECT MAX(salary) AS highest_salary
FROM employee;
```

## # 34 IT Employee Count

```sql
SELECT COUNT(*) AS IT_employee_count
FROM employee
WHERE dept_id=2;
```

## # 35 Minimum Budget

```sql
SELECT MIN(budget) AS minimum_budget
FROM project;
```

## # 36 Employee and Department Join

```sql
SELECT e.first_name,d.dept_name
FROM employee e
JOIN department d
ON e.dept_id=d.dept_id;
```

## # 37 Department Employee Count

```sql
SELECT d.dept_name,COUNT(e.emp_id) AS employee_count
FROM department d
LEFT JOIN employee e
ON d.dept_id=e.dept_id
GROUP BY d.dept_name;
```

## # 38 Project with Department

```sql
SELECT p.project_name,d.dept_name
FROM project p
JOIN department d
ON p.dept_id=d.dept_id;
```

## # 39 Employees in San Francisco

```sql
SELECT e.*
FROM employee e
JOIN department d
ON e.dept_id=d.dept_id
WHERE d.location='San Francisco';
```

## # 40 Departments Without Projects

```sql
SELECT d.dept_name
FROM department d
LEFT JOIN project p
ON d.dept_id=p.dept_id
WHERE p.project_id IS NULL;
```

## # 41 Full Name Using CONCAT

```sql
SELECT CONCAT(first_name,' ',last_name) AS Full_Name
FROM employee;
```

## # 42 Department Names Uppercase

```sql
SELECT UPPER(dept_name)
FROM department;
```

## # 43 Email First 3 Letters

```sql
SELECT SUBSTRING(email,1,3)
FROM employee;
```

## # 44 Absolute Value

```sql
SELECT ABS(-50000);
```

## # 45 Rounded Average Salary

```sql
SELECT ROUND(AVG(salary),2)
FROM employee;
```

## # 46 Latest 3 Employees

```sql
SELECT *
FROM employee
ORDER BY hire_date DESC
LIMIT 3;
```

## # 47 Pagination Example

```sql
SELECT *
FROM employee
ORDER BY emp_id
LIMIT 3 OFFSET 3;
```

## # 48 Salary Level

```sql
SELECT first_name,
IF(salary>=70000,'High','Low') AS salary_level
FROM employee;
```

## # 49 Project Budget Category

```sql
SELECT project_name,
CASE
WHEN budget>=60000 THEN 'Large'
WHEN budget>=40000 THEN 'Medium'
ELSE 'Small'
END AS budget_category
FROM project;
```

## # 50 Total Budget per Department

```sql
SELECT dept_id,SUM(budget) AS total_budget
FROM project
GROUP BY dept_id;
```

## # 51 Longest First Name

```sql
SELECT *
FROM employee
ORDER BY LENGTH(first_name) DESC
LIMIT 1;
```

## # 52 Employees Joined Last 90 Days

```sql
SELECT *
FROM employee
WHERE hire_date >= CURDATE() - INTERVAL 90 DAY;
```

## # 53 Delete Salary < 60000

```sql
DELETE FROM employee
WHERE salary < 60000;
```

## # 54 Drop Project Table

```sql
DROP TABLE project;
```

## # 55 Drop Database

```sql
DROP DATABASE company_db;
```





etha git la post pannu