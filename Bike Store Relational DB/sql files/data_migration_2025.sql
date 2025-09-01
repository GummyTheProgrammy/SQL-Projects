-- Script de Migração de Dados de 2018
-- Este script importa novos dados para as tabelas do sistema, garantindo a ordem
-- correta para manter a integridade referencial.
-- Os arquivos CSV devem estar na mesma pasta que este script.

-- Importando novos clientes
\copy customers FROM 'new_customers_2025.csv' WITH (FORMAT CSV, HEADER);

-- Importando novos pedidos
\copy orders FROM 'new_orders_2025.csv' WITH (FORMAT CSV, HEADER);

-- Importando novos itens de pedido
\copy order_items FROM 'new_order_items_2025.csv' WITH (FORMAT CSV, HEADER);

-- Fim da migração
SELECT 'Migração de dados de 2025 concluída com sucesso!';