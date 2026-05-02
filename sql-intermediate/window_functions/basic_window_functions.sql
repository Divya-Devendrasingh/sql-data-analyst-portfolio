-- ROW_NUMBER: Rank all orders by amount (highest first)
SELECT order_id, customer_id, amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM Orders;

-- RANK: Rank orders (with gaps for ties)
SELECT order_id, customer_id, amount,
       RANK() OVER (ORDER BY amount DESC) AS rnk
FROM Orders;

-- DENSE_RANK: Rank orders (no gaps)
SELECT order_id, customer_id, amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rnk
FROM Orders;
