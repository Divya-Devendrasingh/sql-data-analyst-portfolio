-- Customers who have NOT placed any orders
SELECT c.name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
