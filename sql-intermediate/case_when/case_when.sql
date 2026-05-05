-- Categorize orders
SELECT order_id, amount,
       CASE
           WHEN amount >= 7000 THEN 'High'
           WHEN amount BETWEEN 4000 AND 6999 THEN 'Medium'
           ELSE 'Low'
       END AS category
FROM Orders;

-- Above / Below average
SELECT order_id, amount,
       CASE
           WHEN amount > (SELECT AVG(amount) FROM Orders)
           THEN 'Above Avg'
           ELSE 'Below Avg'
       END AS order_flag
FROM Orders;
