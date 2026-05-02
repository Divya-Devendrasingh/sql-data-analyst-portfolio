-- Customers who made more than 1 order
SELECT c.customer_id, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;

-- Customers with total spending greater than 6000
SELECT c.customer_id, SUM(o.amount) AS total_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.amount) > 6000;
