CREATE OR REPLACE VIEW vw_base_produtos AS
    SELECT
        products.product_id AS produto_id,
        products.product_name AS nome_produto,
        products.category AS categoria,
        products.brand AS marca,
        price_history.price AS preco,
        price_history.discount_percentage AS desconto_porcentual,
        stock_history.stock AS estoque,
        stock_history.availability_status AS status_disponibilidade,
        price_history.collection_date AS data_coleta
    FROM products
    JOIN price_history
        ON products.product_id = price_history.product_id
    JOIN stock_history
        ON stock_history.product_id = products.product_id
        AND stock_history.collection_date = price_history.collection_date;