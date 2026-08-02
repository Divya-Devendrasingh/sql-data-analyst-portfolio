/*
===========================================================
05_case_when_coalesce_practice.sql

Topic      : CASE WHEN & COALESCE
Questions  : 10

Datasets   : Employees, Customers, Orders
===========================================================
*/

------------------------------------------------------------
DATASET 1
------------------------------------------------------------

Employees

| employee_id | employee_name | department | salary |
|------------:|---------------|------------|-------:|
| 101 | Alice   | HR        | 45000 |
| 102 | Bob     | IT        | 65000 |
| 103 | Charlie | Sales     | 55000 |
| 104 | David   | Finance   | 70000 |
| 105 | Emma    | HR        | 48000 |
| 106 | Frank   | IT        | 60000 |
| 107 | Grace   | Sales     | 52000 |

------------------------------------------------------------
DATASET 2
------------------------------------------------------------

Customers

| customer_id | customer_name |
|------------:|---------------|
| 1 | John |
| 2 | Alice |
| 3 | Bob |
| 4 | Emma |

------------------------------------------------------------
DATASET 3
------------------------------------------------------------

Orders

| order_id | customer_id | amount |
|---------:|------------:|-------:|
| 101 | 1 | 5000 |
| 102 | 1 | 2500 |
| 103 | 2 | 8000 |
| 104 | 3 | 3000 |

============================================================
Question 1
============================================================

Question:
Classify employees as High Salary or Low Salary.
(High Salary >= 60000)

Solution:

SELECT
employee_name,
salary,
CASE
    WHEN salary >= 60000 THEN 'High Salary'
    ELSE 'Low Salary'
END AS SalaryCategory
FROM Employees;

============================================================
Question 2
============================================================

Question:
Classify employees into three salary categories:
Low (<50000)
Medium (50000–60000)
High (>60000)

Solution:

SELECT
employee_name,
salary,
CASE
    WHEN salary < 50000 THEN 'Low'
    WHEN salary BETWEEN 50000 AND 60000 THEN 'Medium'
    ELSE 'High'
END AS SalaryLevel
FROM Employees;

============================================================
Question 3
============================================================

Question:
Display Bonus Percentage.

Salary > 60000 → 20%
Otherwise → 10%

Solution:

SELECT
employee_name,
salary,
CASE
    WHEN salary > 60000 THEN '20%'
    ELSE '10%'
END AS Bonus
FROM Employees;

============================================================
Question 4
============================================================

Question:
Replace NULL total purchase amount with 0.

Solution:

SELECT
c.customer_name,
COALESCE(SUM(o.amount),0) AS TotalAmountSpent
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

============================================================
Question 5
============================================================

Question:
Display customer name and total orders.
If there are no orders, display 0.

Solution:

SELECT
c.customer_name,
COALESCE(COUNT(o.order_id),0) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

============================================================
Question 6
============================================================

Question:
Display customer name and use IFNULL instead of COALESCE.

Solution:

SELECT
c.customer_name,
IFNULL(SUM(o.amount),0) AS TotalAmountSpent
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

============================================================
Question 7
============================================================

Question:
Display employee salary status.

Above 60000 → Excellent
50000–60000 → Good
Below 50000 → Needs Improvement

Solution:

SELECT
employee_name,
salary,
CASE
    WHEN salary > 60000 THEN 'Excellent'
    WHEN salary BETWEEN 50000 AND 60000 THEN 'Good'
    ELSE 'Needs Improvement'
END AS Performance
FROM Employees;

============================================================
Question 8
============================================================

Question:
Display employees whose salary is above the company average.

Solution:

SELECT
employee_name,
salary,
CASE
    WHEN salary >
    (
        SELECT AVG(salary)
        FROM Employees
    )
    THEN 'Above Average'
    ELSE 'Below Average'
END AS SalaryStatus
FROM Employees;

============================================================
Question 9
============================================================

Question:
Display "No Orders" if the customer has not placed any order.

Solution:

SELECT
customer_name,
CASE
    WHEN customer_id NOT IN
    (
        SELECT customer_id
        FROM Orders
    )
    THEN 'No Orders'
    ELSE 'Has Orders'
END AS OrderStatus
FROM Customers;

============================================================
Question 10
============================================================

Question:
Display department-wise employee count.
If no employees exist in a department, display 0.

Solution:

SELECT
d.department_name,
COALESCE(COUNT(e.employee_id),0) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
