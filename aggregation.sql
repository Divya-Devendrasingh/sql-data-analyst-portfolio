-- Total amount per customer
SELECT customer, SUM(amount) AS total_amount
FROM orders
GROUP BY customer;

-- Filter using HAVING
SELECT customer, SUM(amount) AS total_amount
FROM orders
GROUP BY customer
HAVING SUM(amount) > 5000;
