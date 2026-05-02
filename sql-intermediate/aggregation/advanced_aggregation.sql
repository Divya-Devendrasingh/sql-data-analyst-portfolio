-- Customers with no orders
SELECT c.customer_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Customer with highest average order amount
SELECT c.customer_id, AVG(o.amount) AS avg_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY avg_amount DESC
LIMIT 1;

-- Total revenue per city
SELECT c.city, SUM(o.amount) AS total_revenue
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.city;
