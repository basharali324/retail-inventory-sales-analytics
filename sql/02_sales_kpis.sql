-- 02_sales_kpis.sql
-- Creates sales KPIs for Power BI reporting layer.

WITH sales_enriched AS (
    SELECT
        s.sale_date,
        s.store_id,
        st.store_name,
        st.region,
        s.product_id,
        p.product_name,
        p.category,
        p.subcategory,
        s.units_sold,
        p.unit_price,
        p.unit_cost,
        s.discount_pct,
        s.units_sold * p.unit_price * (1 - s.discount_pct) AS net_sales,
        s.units_sold * p.unit_cost AS cost_of_goods_sold,
        (s.units_sold * p.unit_price * (1 - s.discount_pct)) - (s.units_sold * p.unit_cost) AS gross_margin
    FROM fact_sales s
    JOIN dim_product p ON s.product_id = p.product_id
    JOIN dim_store st ON s.store_id = st.store_id
)
SELECT
    sale_date,
    region,
    store_name,
    category,
    subcategory,
    product_name,
    SUM(units_sold) AS total_units_sold,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(gross_margin), 2) AS gross_margin,
    ROUND(SUM(gross_margin) / NULLIF(SUM(net_sales), 0), 4) AS gross_margin_pct
FROM sales_enriched
GROUP BY
    sale_date,
    region,
    store_name,
    category,
    subcategory,
    product_name;
