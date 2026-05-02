-- Total number of orders per customer
SELECT c.customer_id, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Average order amount per customer
SELECT c.customer_id, AVG(o.amount) AS avg_order_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id;
