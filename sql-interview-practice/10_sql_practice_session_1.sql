/*
===========================================================
SQL INTERVIEW PRACTICE - SESSION 1
Questions : 10
Level     : Intermediate
Topics    : Subqueries, CTEs, Window Functions, CASE WHEN,
            Joins, Aggregations, Running Totals
===========================================================
*/


------------------------------------------------------------
QUESTION 1
------------------------------------------------------------
Question:
Find all employees whose salary is greater than the
overall average salary of the company.

Solution:
------------------------------------------------------------

SELECT *
FROM EMPLOYEES
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEES
);


------------------------------------------------------------
QUESTION 2
------------------------------------------------------------
Question:
Find employees whose salary is greater than their
department's average salary.

Requirement:
Use a CTE.

Solution:
------------------------------------------------------------

WITH DEPT_AVG_SALARY AS (
    SELECT
        DEPARTMENT_ID,
        AVG(SALARY) AS AVG_SALARY
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
SELECT
    E.*
FROM EMPLOYEES E
JOIN DEPT_AVG_SALARY D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.SALARY > D.AVG_SALARY;


------------------------------------------------------------
QUESTION 3
------------------------------------------------------------
Question:
Find the highest-paid employee in each department.

Requirement:
Use DENSE_RANK() and return all employees tied for the
highest salary.

Solution:
------------------------------------------------------------

WITH RankedEmployees AS (
    SELECT
        NAME,
        DEPARTMENT_ID,
        SALARY,
        DENSE_RANK() OVER (
            PARTITION BY DEPARTMENT_ID
            ORDER BY SALARY DESC
        ) AS DR
    FROM EMPLOYEES
)
SELECT *
FROM RankedEmployees
WHERE DR = 1;


------------------------------------------------------------
QUESTION 4
------------------------------------------------------------
Question:
For each employee, display their salary and the salary
of the previous employee within the same department,
ordered by salary from lowest to highest.

Return:
NAME, DEPARTMENT_ID, SALARY, PREVIOUS_SALARY

Solution:
------------------------------------------------------------

SELECT
    NAME,
    DEPARTMENT_ID,
    SALARY,
    LAG(SALARY) OVER (
        PARTITION BY DEPARTMENT_ID
        ORDER BY SALARY
    ) AS PREVIOUS_SALARY
FROM EMPLOYEES;


------------------------------------------------------------
QUESTION 5
------------------------------------------------------------
Question:
Calculate the running total of sales for each customer,
ordered by sale date.

Return:
CUSTOMER_ID, SALE_DATE, AMOUNT, RUNNING_TOTAL

Solution:
------------------------------------------------------------

SELECT
    CUSTOMER_ID,
    SALE_DATE,
    AMOUNT,
    SUM(AMOUNT) OVER (
        PARTITION BY CUSTOMER_ID
        ORDER BY SALE_DATE
    ) AS RUNNING_TOTAL
FROM SALES;


------------------------------------------------------------
QUESTION 6
------------------------------------------------------------
Question:
Find the second-highest salary in the entire company.

Requirement:
Use a subquery.
Do not use LIMIT, TOP, or window functions.

Solution:
------------------------------------------------------------

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < (
    SELECT MAX(SALARY)
    FROM EMPLOYEES
);


------------------------------------------------------------
QUESTION 7
------------------------------------------------------------
Question:
Create a salary status for every employee:

Salary > 60,000       -> HIGH
Salary 50,000-60,000  -> MEDIUM
Salary < 50,000       -> LOW

Return:
NAME, SALARY, SALARY_STATUS

Solution:
------------------------------------------------------------

SELECT
    NAME,
    SALARY,
    CASE
        WHEN SALARY > 60000 THEN 'HIGH'
        WHEN SALARY BETWEEN 50000 AND 60000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS SALARY_STATUS
FROM EMPLOYEES;


------------------------------------------------------------
QUESTION 8
------------------------------------------------------------
Question:
Find the top 2 highest-paid employees from each department.

Requirements:
- Use a CTE
- Use DENSE_RANK()
- Include ties

Return:
NAME, DEPARTMENT_ID, SALARY

Solution:
------------------------------------------------------------

WITH HIGHEST_PAID AS (
    SELECT
        NAME,
        DEPARTMENT_ID,
        SALARY,
        DENSE_RANK() OVER (
            PARTITION BY DEPARTMENT_ID
            ORDER BY SALARY DESC
        ) AS DR
    FROM EMPLOYEES
)
SELECT *
FROM HIGHEST_PAID
WHERE DR <= 2;


------------------------------------------------------------
QUESTION 9
------------------------------------------------------------
Question:
Find each customer's total order amount.

Tables:
Customers(customer_id, name)
Orders(order_id, customer_id, amount)

Return:
CUSTOMER_ID, NAME, TOTAL_AMOUNT

Requirement:
Use JOIN + GROUP BY.

Solution:
------------------------------------------------------------

SELECT
    C.CUSTOMER_ID,
    C.NAME,
    SUM(O.AMOUNT) AS TOTAL_AMOUNT
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.NAME;


------------------------------------------------------------
QUESTION 10
------------------------------------------------------------
Question:
Find the highest sale amount for each customer, but return
the complete sale record:

SALE_ID, CUSTOMER_ID, SALE_DATE, AMOUNT

If two sales have the same highest amount, return both.

Requirement:
Use a window function.

Solution:
------------------------------------------------------------

WITH RankedSales AS (
    SELECT
        SALE_ID,
        CUSTOMER_ID,
        SALE_DATE,
        AMOUNT,
        RANK() OVER (
            PARTITION BY CUSTOMER_ID
            ORDER BY AMOUNT DESC
        ) AS R
    FROM SALES
)
SELECT
    SALE_ID,
    CUSTOMER_ID,
    SALE_DATE,
    AMOUNT
FROM RankedSales
WHERE R = 1;


===========================================================
END OF SQL INTERVIEW PRACTICE - SESSION 1
===========================================================
