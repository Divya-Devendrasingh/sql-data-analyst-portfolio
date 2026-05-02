-- Latest order per customer
SELECT customer_id, order_id, order_date, amount
FROM (
    SELECT customer_id, order_id, order_date, amount,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date DESC
           ) AS rn
    FROM Orders
) t
WHERE rn = 1;
