/*
===========================================================
04_joins_practice.sql

Topic      : SQL Joins
Questions  : 10

Datasets   : Employees, Departments
===========================================================
*/

------------------------------------------------------------
DATASET 1
------------------------------------------------------------

Employees

| employee_id | employee_name | department_id | salary |
|------------:|---------------|---------------|-------:|
| 101 | Alice   | 1 | 45000 |
| 102 | Bob     | 2 | 65000 |
| 103 | Charlie | 3 | 55000 |
| 104 | David   | 2 | 70000 |
| 105 | Emma    | 4 | 48000 |
| 106 | Frank   | 2 | 60000 |
| 107 | Grace   | 5 | 52000 |

------------------------------------------------------------
DATASET 2
------------------------------------------------------------

Departments

| department_id | department_name |
|--------------:|-----------------|
| 1 | HR |
| 2 | IT |
| 3 | Sales |
| 4 | Finance |
| 6 | Marketing |

============================================================
Question 1
============================================================

Question:
Display employee names along with their department names.

Solution:

SELECT
e.employee_name,
d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

============================================================
Question 2
============================================================

Question:
Display all employees even if they don't have a matching department.

Solution:

SELECT
e.employee_name,
d.department_name
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id;

============================================================
Question 3
============================================================

Question:
Display all departments even if no employees belong to them.

Solution:

SELECT
e.employee_name,
d.department_name
FROM Employees e
RIGHT JOIN Departments d
ON e.department_id = d.department_id;

============================================================
Question 4
============================================================

Question:
Find employees who do not have a matching department.

Solution:

SELECT
e.employee_name,
e.department_id
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

============================================================
Question 5
============================================================

Question:
Find departments that do not have any employees.

Solution:

SELECT
d.department_name
FROM Employees e
RIGHT JOIN Departments d
ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

============================================================
Question 6
============================================================

Question:
Display employee name, department name, and salary.

Solution:

SELECT
e.employee_name,
d.department_name,
e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

============================================================
Question 7
============================================================

Question:
Display employees earning more than 60000 along with their department names.

Solution:

SELECT
e.employee_name,
d.department_name,
e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
WHERE e.salary > 60000;

============================================================
Question 8
============================================================

Question:
Count the number of employees in each department.

Solution:

SELECT
d.department_name,
COUNT(e.employee_id) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

============================================================
Question 9
============================================================

Question:
Find the total salary paid in each department.

Solution:

SELECT
d.department_name,
SUM(e.salary) AS TotalSalary
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

============================================================
Question 10
============================================================

Question:
Find the average salary of employees in each department.

Solution:

SELECT
d.department_name,
AVG(e.salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
