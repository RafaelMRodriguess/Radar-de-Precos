CREATE OR REPLACE VIEW vw_ranking_produtos AS
    WITH preco_produto AS(
        SELECT
            products.product_name AS nome_produto,
            price_history.price AS preco
        FROM products
        JOIN price_history
            ON products.product_id = price_history.product_id
    ),
    ranking AS(
        SELECT *,
            ROW_NUMBER()OVER(ORDER BY preco DESC) AS ranking
        FROM preco_produto
    )
    SELECT *
    FROM ranking
    WHERE ranking <= 10;