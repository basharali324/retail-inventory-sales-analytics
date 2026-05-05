-- Retail Inventory & Sales Analytics Dashboard
-- 01_create_tables.sql

CREATE TABLE dim_product (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_cost DECIMAL(10,2),
    unit_price DECIMAL(10,2)
);

CREATE TABLE dim_store (
    store_id VARCHAR(20) PRIMARY KEY,
    store_name VARCHAR(100),
    region VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE fact_sales (
    sale_id VARCHAR(20) PRIMARY KEY,
    sale_date DATE,
    store_id VARCHAR(20),
    product_id VARCHAR(20),
    units_sold INT,
    discount_pct DECIMAL(5,2),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

CREATE TABLE fact_inventory (
    snapshot_date DATE,
    store_id VARCHAR(20),
    product_id VARCHAR(20),
    stock_on_hand INT,
    reorder_level INT,
    PRIMARY KEY (snapshot_date, store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
