/*
===========================================================
03_groupby_having_practice.sql

Topic      : GROUP BY & HAVING
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
Find the number of employees in each department.

Solution:

SELECT department,
       COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY department;

============================================================
Question 2
============================================================

Question:
Find the total salary of each department.

Solution:

SELECT department,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY department;

============================================================
Question 3
============================================================

Question:
Find the average salary of each department.

Solution:

SELECT department,
       AVG(salary) AS AverageSalary
FROM Employees
GROUP BY department;

============================================================
Question 4
============================================================

Question:
Find the highest salary in each department.

Solution:

SELECT department,
       MAX(salary) AS HighestSalary
FROM Employees
GROUP BY department;

============================================================
Question 5
============================================================

Question:
Find the lowest salary in each department.

Solution:

SELECT department,
       MIN(salary) AS LowestSalary
FROM Employees
GROUP BY department;

============================================================
Question 6
============================================================

Question:
Display departments having more than 1 employee.

Solution:

SELECT department,
       COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY department
HAVING COUNT(*) > 1;

============================================================
Question 7
============================================================

Question:
Display departments whose average salary is greater than 55,000.

Solution:

SELECT department,
       AVG(salary) AS AverageSalary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 55000;

============================================================
Question 8
============================================================

Question:
Display departments whose total salary is greater than 100000.

Solution:

SELECT department,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 100000;

============================================================
Question 9
============================================================

Question:
Find the number of employees and average salary in each department.

Solution:

SELECT department,
       COUNT(*) AS TotalEmployees,
       AVG(salary) AS AverageSalary
FROM Employees
GROUP BY department;

============================================================
Question 10
============================================================

Question:
Display departments where the highest salary is greater than 65,000.

Solution:

SELECT department,
       MAX(salary) AS HighestSalary
FROM Employees
GROUP BY department
HAVING MAX(salary) > 65000;
