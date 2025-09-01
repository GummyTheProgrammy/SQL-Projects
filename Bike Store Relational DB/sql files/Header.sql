SELECT
    *
FROM orders AS o  -- Tabela principal: pedidos
JOIN customers AS c
    ON o.customer_id = c.customer_id  -- Junção com a tabela de clientes, usando o ID do cliente
JOIN stores AS s
    ON o.store_id = s.store_id  -- Junção com a tabela de lojas, usando o ID da loja
JOIN staffs AS st
    ON o.staff_id = st.staff_id -- Junção com a tabela de funcionários, usando o ID do funcionário
LIMIT 10;