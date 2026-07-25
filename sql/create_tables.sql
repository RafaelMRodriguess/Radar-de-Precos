--CRIAÇÃO DA TABELA DE PRODUTOS
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    sku VARCHAR(50) NOT NULL,
    weight DECIMAL(10, 2) NOT NULL,
    minimum_order_quantity INT NOT NULL,
    tags VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

--CRIAÇÃO DA TABELA DE PRECOS
CREATE TABLE price_history (
    product_history_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES products(product_id),
    price DECIMAL(10, 2) NOT NULL,
    discount_percentage DECIMAL(10, 2) NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    collection_date TIMESTAMP NOT NULL
);

--CRIAÇÃO DA TABELA DE ESTOQUE
CREATE TABLE stock_history (
    stock_history_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES products(product_id),
    availability_status VARCHAR(50) NOT NULL,
    collection_date TIMESTAMP NOT NULL
);
