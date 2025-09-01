CREATE OR REPLACE FUNCTION get_order_total_revenue(
    p_order_id INT
)
RETURNS NUMERIC AS $$
DECLARE
    v_total_revenue NUMERIC;
BEGIN
    SELECT
        SUM(quantity * list_price * (1 - discount))
    INTO v_total_revenue
    FROM order_items
    WHERE order_id = p_order_id;

    -- Retorna o valor calculado
    RETURN v_total_revenue;
END;
$$ LANGUAGE plpgsql;