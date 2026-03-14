# Employee Management System Project
This is a group project by Team D of SQL Study Group for an Employee Management System (EMS)

# Introduction
The Employee Management System (EMS) is a SQL-based project that simulates how organisations manage employee information within a relational database.
The system models key HR components such as employees, departments, job roles, salary records, attendance tracking, and performance reviews.

The goal of the project is to design a structured database schema and use SQL queries to retrieve, filter, and analyse employee-related data.

This project focuses entirely on SQL and relational database design, demonstrating core data management and querying skills used in real HR information systems.

# Problem Statement
Organisations need structured systems to manage employee data efficiently. Without a well-designed database, it becomes difficult to track employee records, analyse performance, monitor attendance, or generate HR reports.

This project addresses that problem by designing a relational Employee Management System database that allows HR teams to:

1. Store employee and department information
2. Track salary history
3. Monitor attendance records
4. Review employee performance
5. Generate HR insights through SQL queries

# Tools Used

# Data Source

Dataset Description

The database consists of the following tables:

EMPLOYEES: Stores information about each employee.

Fields: EmployeeID, FirstName, LastName, DateOfBirth, Email, HireDate, JobID, DepartmentID, ManagerID, Status

DEPARTMENTS: Stores department details.

Fields: DeptID, DeptName, Location

JOBS: Stores job roles and salary ranges.

Fields: JobID, JobTitle, MinSalary, MaxSalary

SALARIES; Tracks employee salary history.

Fields: SalaryID, EmployeeID, SalaryAmount, FromDate, ToDate

ATTENDANCE: Tracks daily attendance of employees.

Fields: AttendanceID, EmployeeID, AttendanceDate, Status, CheckInTime, CheckOutTime

PERFORMANCE: Tracks employee performance reviews.

Fields: PerformanceID, EmployeeID, ReviewDate, Rating, Comments

# Database Schema & ER Design

Query Results/eer diagram.png 

# Methods

Step 1: Database Design

Created the project database and initialised the workspace.

Step 2: Table Creation/Design

Designed and created tables using SQL CREATE TABLE statements with appropriate constraints and relationships. Tables created include: Employees, Departments, Jobs, Salaries, Attendance, Performance

Step 3: Data Exploration 

Queries were used to retrieve and filter employee information and understand the dataset.

Step 4: Data Filtering

Query using comparison and logical operators to simulate how HR identifies performance, trends, and patterns. 

Step 5: Data Organisation

Track top performers, departmental distributions, and generate paginated dashboards.

# Findings

3a. There are 285 employees in total.

3b. There are 238 active employees. 

3c. There are 24 absent employees.

3d. There are 57 employees in the Finance department, and only 46 are active.

4a. There are 27 employees earning more than 100,000.

4b. There are 163 employees in the Finance & Human Resources departments.

4c. There are 5 inactive employees. 42 are on leave.

4d. There were 163 employees present in attendance only in Jan 2026.

4e. There are 57 employees in the Finance department, and only 46 are active.

5a. 

5b. There are 285 unique departments in the organisation.

5c. 

5d. The top 5 performers were female data analysts, 2 in the Finance department and 1 in the Human Resources department.

5e. The next 5 (6-10) were the same 3 women: Sophia Miller, Mia Hernandez and Harper Taylor.

ACTIVE VS. INACTIVE 
238 employees are active, 5 are inactive, and 42 are on leave.

DEPARTMENTAL INSIGHTS

# Recommendation
