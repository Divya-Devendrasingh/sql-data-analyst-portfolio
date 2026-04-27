-- Get all employees
SELECT * 
FROM employees;

-- Get name and salary
SELECT name, salary
FROM employees;

-- Salary greater than 50,000
SELECT name, salary
FROM employees
WHERE salary > 50000;

-- Employees from IT department
SELECT *
FROM employees
WHERE department = 'IT';

-- Salary between 40k and 70k
SELECT name, salary
FROM employees
WHERE salary BETWEEN 40000 AND 70000;

-- Salary NOT between 30k and 60k
SELECT name, salary
FROM employees
WHERE salary NOT BETWEEN 30000 AND 60000;
