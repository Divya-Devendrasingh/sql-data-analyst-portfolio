/*
===========================================================
07_cte_practice.sql

Topic      : Common Table Expressions (CTEs)
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
Find employees earning more than their department average salary.

Solution:

WITH DeptAvg AS
(
    SELECT employee_id,
           employee_name,
           department_id,
           salary,
           AVG(salary) OVER(PARTITION BY department_id) AS avg_salary
    FROM Employees
)

SELECT *
FROM DeptAvg
WHERE salary > avg_salary;

============================================================
Question 2
============================================================

Question:
Display employees earning below their department average salary.

Solution:

WITH DeptAvg AS
(
    SELECT *,
           AVG(salary) OVER(PARTITION BY department_id) AS avg_salary
    FROM Employees
)

SELECT *
FROM DeptAvg
WHERE salary < avg_salary;

============================================================
Question 3
============================================================

Question:
Find employees receiving the highest salary in each department.

Solution:

WITH SalaryRank AS
(
    SELECT *,
           DENSE_RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS dr
    FROM Employees
)

SELECT *
FROM SalaryRank
WHERE dr = 1;

============================================================
Question 4
============================================================

Question:
Find employees receiving the second highest salary in each department.

Solution:

WITH SalaryRank AS
(
    SELECT *,
           DENSE_RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS dr
    FROM Employees
)

SELECT *
FROM SalaryRank
WHERE dr = 2;

============================================================
Question 5
============================================================

Question:
Display the top 3 highest-paid employees in each department.

Solution:

WITH SalaryRank AS
(
    SELECT *,
           DENSE_RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS dr
    FROM Employees
)

SELECT *
FROM SalaryRank
WHERE dr <= 3;

============================================================
Question 6
============================================================

Question:
Display department-wise total salary and show only departments
whose total salary exceeds 100000.

Solution:

WITH DeptSalary AS
(
SELECT department_id,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department_id
)

SELECT *
FROM DeptSalary
WHERE total_salary > 100000;

============================================================
Question 7
============================================================

Question:
Display department-wise employee count.

Solution:

WITH DeptCount AS
(
SELECT department_id,
       COUNT(*) AS total_employees
FROM Employees
GROUP BY department_id
)

SELECT *
FROM DeptCount;

============================================================
Question 8
============================================================

Question:
Find employees earning above the company average salary.

Solution:

WITH CompanyAverage AS
(
SELECT AVG(salary) AS avg_salary
FROM Employees
)

SELECT *
FROM Employees
WHERE salary >
(
SELECT avg_salary
FROM CompanyAverage
);

============================================================
Question 9
============================================================

Question:
Display employee name along with department name using a CTE.

Solution:

WITH EmployeeDept AS
(
SELECT
e.employee_name,
d.department_name,
e.salary
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id
)

SELECT *
FROM EmployeeDept;

============================================================
Question 10
============================================================

Question:
Find departments having more than two employees.

Solution:

WITH DeptCount AS
(
SELECT department_id,
       COUNT(*) AS total_employees
FROM Employees
GROUP BY department_id
)

SELECT *
FROM DeptCount
WHERE total_employees > 2;
