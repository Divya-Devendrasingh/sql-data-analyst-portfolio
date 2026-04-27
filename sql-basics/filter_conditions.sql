-- Multiple conditions (AND)
SELECT *
FROM employees
WHERE department = 'IT' AND salary > 60000;

-- Employees not in HR
SELECT name, department
FROM employees
WHERE department NOT IN ('HR');

-- Salary > 50000 and not from Sales
SELECT name, salary, department
FROM employees
WHERE salary > 50000 
  AND department != 'Sales';
