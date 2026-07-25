CREATE OR REPLACE VIEW vw_kpis AS
    SELECT
        products.product_id AS produto_id,
        products.product_name AS nome_produto,
        CASE
            WHEN category = 'beauty' THEN 'Beleza'
            WHEN category = 'fragrances' THEN 'Perfumes'
            WHEN category = 'furniture' THEN 'Móveis'
            WHEN category = 'groceries' THEN 'Mercearia'
            WHEN category = 'home-decoration' THEN 'Decoração'
            WHEN category = 'kitchen-accessories' THEN 'Acessórios de Cozinha'
            WHEN category = 'laptops' THEN 'Notebooks'
            WHEN category = 'mens-shirts' THEN 'Camisas Masculinas'
            WHEN category = 'mens-shoes' THEN 'Calçados Masculinos'
            WHEN category = 'mens-watches' THEN 'Relógios Masculinos'
            WHEN category = 'mobile-accessories' THEN 'Acessórios para Celular'
            WHEN category = 'motorcycle' THEN 'Motocicletas'
            WHEN category = 'skin-care' THEN 'Cuidados com a Pele'
            WHEN category = 'smartphones' THEN 'Smartphones'
            WHEN category = 'sports-accessories' THEN 'Acessórios Esportivos'
            WHEN category = 'sunglasses' THEN 'Óculos de Sol'
            WHEN category = 'tablets' THEN 'Tablets'
            WHEN category = 'tops' THEN 'Blusas'
            WHEN category = 'vehicle' THEN 'Veículos'
            WHEN category = 'womens-bags' THEN 'Bolsas Femininas'
            WHEN category = 'womens-dresses' THEN 'Vestidos Femininos'
            WHEN category = 'womens-jewellery' THEN 'Joias Femininas'
            WHEN category = 'womens-shoes' THEN 'Calçados Femininos'
            WHEN category = 'womens-watches' THEN 'Relógios Femininos'
            ELSE category
        END AS categoria,
        products.brand AS marca,
        price_history.price AS preco,
        price_history.discount_percentage AS desconto_percentual,
        stock_history.stock AS estoque,
        stock_history.availability_status AS status_disponibilidade,
        stock_history.collection_date AS data_coleta
    FROM products
    JOIN price_history 
        ON price_history.product_id = products.product_id
    JOIN stock_history
        ON stock_history.product_id = products.product_id
        AND stock_history.collection_date = price_history.collection_date;
        