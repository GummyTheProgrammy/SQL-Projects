SELECT 'brands' AS table_name, COUNT(*) AS total_rows FROM brands
UNION ALL
SELECT 'categories' AS table_name, COUNT(*) AS total_rows FROM categories
UNION ALL
SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'order_items' AS table_name, COUNT(*) AS total_rows FROM order_items
UNION ALL
SELECT 'orders' AS table_name, COUNT(*) AS total_rows FROM orders
UNION ALL
SELECT 'products' AS table_name, COUNT(*) AS total_rows FROM products
UNION ALL
SELECT 'staffs' AS table_name, COUNT(*) AS total_rows FROM staffs
UNION ALL
SELECT 'stocks' AS table_name, COUNT(*) AS total_rows FROM stocks
UNION ALL
SELECT 'stores' AS table_name, COUNT(*) AS total_rows FROM stores
ORDER BY total_rows DESC;