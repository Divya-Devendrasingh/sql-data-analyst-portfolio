/*
===========================================================
02_aggregate_functions_practice.sql

Topic      : Aggregate Functions
Questions  : 10

Dataset    : Employees
===========================================================
*/

------------------------------------------------------------
DATASET
------------------------------------------------------------

Employees

| employee_id | employee_name | department | salary | joining_date |
|------------:|---------------|------------|-------:|--------------|
| 101 | Alice   | HR        | 45000 | 2022-01-15 |
| 102 | Bob     | IT        | 65000 | 2021-03-20 |
| 103 | Charlie | Sales     | 55000 | 2023-02-01 |
| 104 | David   | Finance   | 70000 | 2020-09-10 |
| 105 | Emma    | HR        | 48000 | 2022-11-18 |
| 106 | Frank   | IT        | 60000 | 2021-07-25 |
| 107 | Grace   | Sales     | 52000 | 2023-04-12 |
| 108 | Henry   | Finance   | 75000 | 2019-08-30 |

============================================================
Question 1
============================================================

Question:
Find the total number of employees.

Solution:

SELECT COUNT(*) AS TotalEmployees
FROM Employees;

============================================================
Question 2
============================================================

Question:
Find the total salary paid to all employees.

Solution:

SELECT SUM(salary) AS TotalSalary
FROM Employees;

============================================================
Question 3
============================================================

Question:
Find the average salary of all employees.

Solution:

SELECT AVG(salary) AS AverageSalary
FROM Employees;

============================================================
Question 4
============================================================

Question:
Find the highest salary.

Solution:

SELECT MAX(salary) AS HighestSalary
FROM Employees;

============================================================
Question 5
============================================================

Question:
Find the lowest salary.

Solution:

SELECT MIN(salary) AS LowestSalary
FROM Employees;

============================================================
Question 6
============================================================

Question:
Find the salary range (Highest Salary - Lowest Salary).

Solution:

SELECT
MAX(salary) - MIN(salary) AS SalaryRange
FROM Employees;

============================================================
Question 7
============================================================

Question:
Find the number of employees working in the HR department.

Solution:

SELECT COUNT(*) AS TotalHR
FROM Employees
WHERE department = 'HR';

============================================================
Question 8
============================================================

Question:
Find the total salary of employees working in the IT department.

Solution:

SELECT SUM(salary) AS TotalITSalary
FROM Employees
WHERE department = 'IT';

============================================================
Question 9
============================================================

Question:
Find the average salary of employees in the Finance department.

Solution:

SELECT AVG(salary) AS FinanceAverageSalary
FROM Employees
WHERE department = 'Finance';

============================================================
Question 10
============================================================

Question:
Find the difference between the average salary and the minimum salary.

Solution:

SELECT
AVG(salary) - MIN(salary) AS Difference
FROM Employees;
