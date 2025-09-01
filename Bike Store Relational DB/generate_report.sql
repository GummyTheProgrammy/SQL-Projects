-- Arquivo: generate_report.sql
-- Gerar um relatório de receita anual

SELECT
    EXTRACT(YEAR FROM o.order_date) AS sales_year,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    sales_year
ORDER BY
    sales_year;