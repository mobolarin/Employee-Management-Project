# Employee-Management-Project
-- This is a group project by Team D of SQL Study Group for an Employee Management System (EMS)

# INTRODUCTION
The Employee Management System (EMS) is a SQL-based project that simulates how organisations manage employee information within a relational database.
The system models key HR components such as employees, departments, job roles, salary records, attendance tracking, and performance reviews.

The goal of the project is to design a structured database schema and use SQL queries to retrieve, filter, and analyse employee-related data.

This project focuses entirely on SQL and relational database design, demonstrating core data management and querying skills used in real HR information systems.

# PROBLEM STATEMENT
Organisations need structured systems to manage employee data efficiently. Without a well-designed database, it becomes difficult to track employee records, analyse performance, monitor attendance, or generate HR reports.

This project addresses that problem by designing a relational Employee Management System database that allows HR teams to:

1. Store employee and department information
2. Track salary history
3. Monitor attendance records
4. Review employee performance
5. Generate HR insights through SQL queries

# DATA SOURCE
Dataset Description
The database consists of the following tables:

EMPLOYEES
Stores core employee information.
Key fields: EmployeeID, FirstName, LastName, DateOfBirth, Email, HireDate, JobID, DepartmentID, ManagerID, Status

DEPARTMENTS
Stores information about company departments.
Fields: DeptID, DeptName, Location

JOBS
Defines job roles and salary ranges.
Fields: JobID, JobTitle, MinSalary, MaxSalary

SALARIES
Tracks salary history for employees.
Fields: SalaryID, EmployeeID, SalaryAmount, FromDate, ToDate

ATTENDANCE
Stores daily employee attendance records.
Fields: AttendanceID, EmployeeID, AttendanceDate, Status, CheckInTime, CheckOutTime

PERFORMANCE
Stores performance review information.
Fields: PerformanceID, EmployeeID, ReviewDate, Rating (1–5), Comments

# METHODS

# FINDINGS
# RECOMMENDATION
