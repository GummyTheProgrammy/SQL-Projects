-- Consulta de Exemplo com Baixo Desempenho
-- Usa uma subconsulta correlacionada para verificar cada cliente individualmente
SELECT
    c.first_name,
    c.last_name,
    c.city,
    c.state
FROM customers AS c
WHERE EXISTS (
    SELECT 1
    FROM orders AS o
    JOIN stores AS s
        ON o.store_id = s.store_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.customer_id = c.customer_id
      AND s.store_name = 'Santa Cruz Bikes' -- Filtro de exemplo
      AND (oi.quantity * oi.list_price * (1 - oi.discount)) > 1000
);