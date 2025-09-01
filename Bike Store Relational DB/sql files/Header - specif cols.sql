SELECT
    o.order_id,
    o.order_date,
    c.first_name AS customer_first_name,
    s.store_name
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN stores AS s
    ON o.store_id = s.store_id
LIMIT 10;