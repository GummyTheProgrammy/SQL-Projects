SELECT
    p.product_name,
    b.brand_name AS brand,
    p.list_price,
    SUM(oi.quantity) AS total_quantity_sold,
    
    -- Receita Total arredondada para 2 casas
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS total_revenue,
    
    -- Desconto Total arredondado para 2 casas
    ROUND(SUM(oi.quantity * oi.list_price * oi.discount), 2) AS total_discount
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
JOIN brands AS b
    ON p.brand_id = b.brand_id
GROUP BY
    p.product_name,
    b.brand_name,
    p.list_price
ORDER BY
    total_revenue DESC
LIMIT 10;