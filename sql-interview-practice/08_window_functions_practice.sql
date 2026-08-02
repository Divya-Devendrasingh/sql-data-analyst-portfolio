/*
===========================================================
08_window_functions_practice.sql

Topic      : Window Functions
Questions  : 1 - 15
===========================================================
*/

------------------------------------------------------------
DATASET
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

============================================================
Question 1
============================================================

Question:
Display the average salary of each department using a window function.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
AVG(salary) OVER(PARTITION BY department_id) AS department_average_salary
FROM Employees;

============================================================
Question 2
============================================================

Question:
Display the total salary of each department without using GROUP BY.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
SUM(salary) OVER(PARTITION BY department_id) AS department_total_salary
FROM Employees;

============================================================
Question 3
============================================================

Question:
Display the difference between an employee's salary and their department average.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
AVG(salary) OVER(PARTITION BY department_id) AS department_average_salary,
salary -
AVG(salary) OVER(PARTITION BY department_id)
AS salary_difference
FROM Employees;

============================================================
Question 4
============================================================

Question:
Display the highest salary in each department.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
MAX(salary) OVER(PARTITION BY department_id)
AS highest_salary
FROM Employees;

============================================================
Question 5
============================================================

Question:
Display the lowest salary in each department.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
MIN(salary) OVER(PARTITION BY department_id)
AS lowest_salary
FROM Employees;

============================================================
Question 6
============================================================

Question:
Assign row numbers to employees within each department based on salary (highest to lowest).

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
ROW_NUMBER() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS row_num
FROM Employees;

============================================================
Question 7
============================================================

Question:
Rank employees based on salary within each department.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
RANK() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS salary_rank
FROM Employees;

============================================================
Question 8
============================================================

Question:
Assign dense ranks to employees based on salary within each department.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
DENSE_RANK() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS dense_rank
FROM Employees;

============================================================
Question 9
============================================================

Question:
Display the top 3 highest-paid employees in every department.

Solution:

SELECT *
FROM
(
SELECT
employee_id,
employee_name,
department_id,
salary,
DENSE_RANK() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS dense_rank
FROM Employees
) t
WHERE dense_rank <= 3;

============================================================
Question 10
============================================================

Question:
Display the employee(s) receiving the second highest salary in every department.

Solution:

SELECT *
FROM
(
SELECT
employee_id,
employee_name,
department_id,
salary,
DENSE_RANK() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS dense_rank
FROM Employees
) t
WHERE dense_rank = 2;

============================================================
Question 11
============================================================

Question:
Display the previous salary of each employee within the same department.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
LAG(salary) OVER(
PARTITION BY department_id
ORDER BY salary
) AS previous_salary
FROM Employees;

============================================================
Question 12
============================================================

Question:
Display the next salary of each employee within the same department.

Solution:

SELECT
employee_id,
employee_name,
department_id,
salary,
LEAD(salary) OVER(
PARTITION BY department_id
ORDER BY salary
) AS next_salary
FROM Employees;

============================================================
Question 13
============================================================

Question:
Calculate the running total of sales for each customer.

Solution:

SELECT
sale_id,
customer_id,
sale_date,
amount,
SUM(amount) OVER(
PARTITION BY customer_id
ORDER BY sale_date
) AS running_total
FROM Sales;

============================================================
Question 14
============================================================

Question:
Display the running count of orders placed by each customer.

Solution:

SELECT
order_id,
customer_id,
order_date,
COUNT(*) OVER(
PARTITION BY customer_id
ORDER BY order_date
) AS running_order_count
FROM Orders;

============================================================
Question 15
============================================================

Question:
Display the latest order placed by each customer.

Solution:

SELECT *
FROM
(
SELECT
order_id,
customer_id,
order_date,
amount,
ROW_NUMBER() OVER(
PARTITION BY customer_id
ORDER BY order_date DESC
) AS rn
FROM Orders
) t
WHERE rn = 1;
