/*
===========================================================
01_sql_basics_practice.sql

Topic      : SQL Basics
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
Display all employee records.

Solution:

SELECT *
FROM Employees;

============================================================
Question 2
============================================================

Question:
Display only employee name and salary.

Solution:

SELECT employee_name,
       salary
FROM Employees;

============================================================
Question 3
============================================================

Question:
Find employees whose salary is greater than 60000.

Solution:

SELECT *
FROM Employees
WHERE salary > 60000;

============================================================
Question 4
============================================================

Question:
Find employees working in the IT department.

Solution:

SELECT *
FROM Employees
WHERE department = 'IT';

============================================================
Question 5
============================================================

Question:
Display employees whose salary is between 50000 and 70000.

Solution:

SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 70000;

============================================================
Question 6
============================================================

Question:
Find employees whose names start with the letter 'A'.

Solution:

SELECT *
FROM Employees
WHERE employee_name LIKE 'A%';

============================================================
Question 7
============================================================

Question:
Display employees ordered by salary in descending order.

Solution:

SELECT *
FROM Employees
ORDER BY salary DESC;

============================================================
Question 8
============================================================

Question:
Display employees ordered by joining date in ascending order.

Solution:

SELECT *
FROM Employees
ORDER BY joining_date;

============================================================
Question 9
============================================================

Question:
Display employees from HR or Finance departments.

Solution:

SELECT *
FROM Employees
WHERE department IN ('HR','Finance');

============================================================
Question 10
============================================================

Question:
Display unique department names.

Solution:

SELECT DISTINCT department
FROM Employees;
