CREATE OR REPLACE VIEW vw_top10_maiores_descontos AS
    SELECT
        products.product_name AS nome_produto,
        products.category AS categoria,
        products.brand AS marca,
        price_history.discount_percentage AS desconto_percentual
    FROM products
    JOIN price_history
        ON products.product_id = price_history.product_id
    ORDER BY price_history.discount_percentage DESC
    LIMIT 10;