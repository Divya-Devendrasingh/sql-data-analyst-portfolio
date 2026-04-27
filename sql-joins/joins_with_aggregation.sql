-- Total order amount per customer
SELECT c.name, SUM(o.amount) AS total_order
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Customer with highest total spending
SELECT c.name, SUM(o.amount) AS total_spending
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spending DESC
LIMIT 1;

-- Number of orders per customer (including 0 orders)
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;
