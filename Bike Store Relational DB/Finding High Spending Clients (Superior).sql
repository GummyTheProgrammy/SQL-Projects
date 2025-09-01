-- Consulta Otimizada para Alto Desempenho
-- Usa JOINs e filtra após a agregação
SELECT DISTINCT
    c.first_name,
    c.last_name,
    c.city,
    c.state
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN stores AS s
    ON o.store_id = s.store_id
WHERE s.store_name = 'Santa Cruz Bikes' -- Primeiro filtro para reduzir os dados
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.state,
    o.order_id
HAVING SUM(oi.quantity * oi.list_price * (1 - oi.discount)) > 1000;