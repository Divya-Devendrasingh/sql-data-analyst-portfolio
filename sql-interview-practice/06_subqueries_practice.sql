/*
===========================================================
06_subqueries_practice.sql

Topic      : Subqueries
Questions  : 10

Datasets   : Employees, Departments
===========================================================
*/

------------------------------------------------------------
DATASET 1
------------------------------------------------------------

Employees

| employee_id | employee_name | department_id | salary |
|------------:|---------------|--------------:|-------:|
| 101 | Alice   | 1 | 45000 |
| 102 | Bob     | 2 | 65000 |
| 103 | Charlie | 3 | 55000 |
| 104 | David   | 2 | 70000 |
| 105 | Emma    | 1 | 48000 |
| 106 | Frank   | 2 | 60000 |
| 107 | Grace   | 3 | 52000 |
| 108 | Henry   | 4 | 75000 |

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

============================================================
Question 1
============================================================

Question:
Find employees earning more than the company average salary.

Solution:

SELECT employee_name,
       salary
FROM Employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employees
);

============================================================
Question 2
============================================================

Question:
Find the employee(s) receiving the highest salary.

Solution:

SELECT employee_name,
       salary
FROM Employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employees
);

============================================================
Question 3
============================================================

Question:
Find employees working in the HR department.

Solution:

SELECT *
FROM Employees
WHERE department_id =
(
    SELECT department_id
    FROM Departments
    WHERE department_name = 'HR'
);

============================================================
Question 4
============================================================

Question:
Find employees earning more than the average salary of their own department.

Solution:

SELECT employee_name,
       department_id,
       salary
FROM Employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employees
    WHERE department_id = e.department_id
);

============================================================
Question 5
============================================================

Question:
Find employees working in the department having the highest average salary.

Solution:

SELECT *
FROM Employees
WHERE department_id =
(
SELECT department_id
FROM Employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1
);

============================================================
Question 6
============================================================

Question:
Find employees whose salary is equal to the minimum salary.

Solution:

SELECT employee_name,
       salary
FROM Employees
WHERE salary =
(
SELECT MIN(salary)
FROM Employees
);

============================================================
Question 7
============================================================

Question:
Find employees earning more than every employee in the HR department.

Solution:

SELECT employee_name,
       salary
FROM Employees
WHERE salary >
(
SELECT MAX(salary)
FROM Employees
WHERE department_id = 1
);

============================================================
Question 8
============================================================

Question:
Find departments whose average salary is greater than the company average salary.

Solution:

SELECT department_id,
       AVG(salary)
FROM Employees
GROUP BY department_id
HAVING AVG(salary) >
(
SELECT AVG(salary)
FROM Employees
);

============================================================
Question 9
============================================================

Question:
Find employees earning the second highest salary.

Solution:

SELECT employee_name,
       salary
FROM Employees
WHERE salary =
(
SELECT MAX(salary)
FROM Employees
WHERE salary <
(
SELECT MAX(salary)
FROM Employees
)
);

============================================================
Question 10
============================================================

Question:
Find employees who belong to departments having more than two employees.

Solution:

SELECT *
FROM Employees
WHERE department_id IN
(
SELECT department_id
FROM Employees
GROUP BY department_id
HAVING COUNT(*) > 2
);
