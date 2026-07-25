CREATE OR REPLACE VIEW vw_posicionamento_categoria AS
    WITH preco_produto AS(
        SELECT
            products.product_name AS nome_produto,
            products.category AS categoria,
            price_history.price AS preco
        FROM products
        JOIN price_history
            ON price_history.product_id = products.product_id
    ),
    ranking AS (
        SELECT *,
            ROW_NUMBER()OVER(PARTITION BY categoria ORDER BY preco DESC) AS ranking
        FROM preco_produto
    )
    SELECT *
    FROM ranking
    WHERE ranking = 1
    ORDER BY categoria;