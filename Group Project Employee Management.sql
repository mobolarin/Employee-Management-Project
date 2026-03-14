
-- 1. Create a Database
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;
SHOW DATABASES;
SHOW TABLES;

-- 2a. Create Jobs Table: Stores job roles and salary ranges.
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY AUTO_INCREMENT,
    JobTitle VARCHAR(50) UNIQUE NOT NULL,
    MinSalary DECIMAL(15,2),
    MaxSalary DECIMAL(15,2)
);

-- 2b. Departments Table: Stores department details.
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);

-- 2c. Employees Table: Stores information about each employee.
select * from employees;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('M','F')),
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE,
    HireDate DATE NOT NULL,
    JobID INT,
    DepartmentID INT,
    ManagerID INT,
    Status VARCHAR(20) CHECK(Status IN ('Active','Inactive','On Leave')),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DeptID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- 2d. Salaries Table: Tracks employee salary history.
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    SalaryAmount DECIMAL(15,2) NOT NULL,
    FromDate DATE NOT NULL,
    ToDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 2e. Attendance Table: Tracks daily attendance of employees.
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    AttendanceDate DATE NOT NULL,
    Status VARCHAR(20) CHECK(Status IN ('Present','Absent','Leave')),
    CheckInTime TIME,
    CheckOutTime TIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 2f. Performance Table: Tracks employee performance reviews.
CREATE TABLE Performance (
    PerformanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    ReviewDate DATE NOT NULL,
    Rating INT CHECK(Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Check Table Structure
DESCRIBE Employees;
DESCRIBE Departments;
DESCRIBE Jobs;
DESCRIBE Salaries;
DESCRIBE Attendance;
DESCRIBE Performance;

-- 3a. Show the records of employee by their full names and email 
SELECT CONCAT(FirstName,' ', LastName) AS Full_name, email
FROM employees;

-- 3b. Find active employees only 
SELECT * FROM employees
WHERE Status = 'Active';

-- 3c. Find employees who are absent 
SELECT * FROM attendance
WHERE Status = 'Absent';

-- 3d. Find employees from the finance department who are still active --
SELECT *
FROM employees AS E
JOIN departments AS D
ON D.DeptID = E.DepartmentID
WHERE DeptName = 'Finance' AND Status = 'Active';

-- 4a. Employee records of those paid above one hundred thousand 
SELECT *
FROM employees AS E
JOIN salaries AS S
ON E.EmployeeID = S.EmployeeID
WHERE SalaryAmount > 100000;

-- 4b. Employees from the HR and Finance department 
SELECT * 
FROM employees AS E
JOIN departments AS D
ON D.DeptID = E.DepartmentID
WHERE DeptName IN ('Finance', 'Human Resources');

-- 4c. Export records of employees aren’t active
SELECT * FROM employees
WHERE Status = 'Inactive';

-- 4d. Attendance records of employees who were present in attendance only in Jan 2026
SELECT * 
FROM employees AS E
JOIN attendance AS A
ON E.EmployeeID = A.EmployeeID
WHERE A.AttendanceDate LIKE '2026-01-%'
AND A.Status = 'Present';

-- 4e. Employees from finance department who are still active
SELECT *
FROM employees AS E
JOIN departments AS D
ON D.DeptID = E.DepartmentID
WHERE DeptName = 'Finance' AND Status = 'Active';

-- 5a. Order Employees by last name in alphabetical order
SELECT * FROM employees
ORDER BY LastName;

-- 5b. Show records of employees with the Highest Salaries First
SELECT * 
FROM employees AS E
JOIN salaries AS S
ON E.EmployeeID = S.EmployeeID
ORDER BY S.SalaryAmount DESC;

-- 5c. What are the Unique Departments in the organisation?
SELECT DISTINCT DeptName AS Unique_Depts
FROM departments;

-- 5d. Top 5 Performers
SELECT * 
FROM employees AS E
JOIN performance AS P 
ON E.EmployeeID = P.EmployeeID
ORDER BY Rating DESC
LIMIT 0,5;

 -- 5e. Next 5 Employees (Pagination)
SELECT * 
FROM employees AS E
JOIN performance AS P 
ON E.EmployeeID = P.EmployeeID
ORDER BY Rating DESC
LIMIT 5,5;

-- Additional Analysis
-- 1. Employees per Department
SELECT D.DeptName, COUNT(E.EmployeeID) AS Employee_Count
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DeptID
GROUP BY D.DeptName
ORDER BY Employee_Count DESC;

-- 2. Average Salary by Department
SELECT D.DeptName, AVG(S.SalaryAmount) AS Avg_Salary
FROM Employees E
JOIN Salaries S ON E.EmployeeID = S.EmployeeID
JOIN Departments D ON E.DepartmentID = D.DeptID
GROUP BY D.DeptName
ORDER BY Avg_Salary DESC;

-- 3. Performance Rating Distribution
SELECT Rating, COUNT(*) AS Number_of_Employees
FROM Performance
GROUP BY Rating
ORDER BY Rating DESC;