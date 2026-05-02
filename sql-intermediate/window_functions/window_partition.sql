-- Rank orders within each customer
SELECT customer_id, order_id, amount,
       DENSE_RANK() OVER (
           PARTITION BY customer_id
           ORDER BY amount DESC
       ) AS rank_within_customer
FROM Orders;
