CREATE OR REPLACE VIEW vw_historico_precos AS
    SELECT
        products.product_id AS produto_id,
        products.product_name AS nome_produto,
        products.category AS categoria,
        products.brand AS marca,
        price_history.price AS preco,
        price_history.discount_percentage AS desconto_percentual,
        price_history.collection_date AS data_coleta
    FROM products
    JOIN price_history
        ON products.product_id = price_history.product_id;