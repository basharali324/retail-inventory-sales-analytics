-- 03_inventory_kpis.sql
-- Calculates stock cover, sell-through and inventory value.

WITH daily_sales AS (
    SELECT
        product_id,
        store_id,
        sale_date,
        SUM(units_sold) AS units_sold
    FROM fact_sales
    GROUP BY product_id, store_id, sale_date
),
last_30_days_sales AS (
    SELECT
        product_id,
        store_id,
        SUM(units_sold) AS units_sold_30d,
        SUM(units_sold) / 30.0 AS avg_daily_units_sold
    FROM daily_sales
    WHERE sale_date >= DATE '2026-04-01'
    GROUP BY product_id, store_id
)
SELECT
    i.snapshot_date,
    st.region,
    st.store_name,
    p.category,
    p.product_name,
    i.stock_on_hand,
    i.reorder_level,
    ROUND(i.stock_on_hand * p.unit_cost, 2) AS stock_value,
    COALESCE(s.units_sold_30d, 0) AS units_sold_30d,
    ROUND(COALESCE(s.avg_daily_units_sold, 0), 2) AS avg_daily_units_sold,
    ROUND(i.stock_on_hand / NULLIF(s.avg_daily_units_sold, 0), 1) AS stock_cover_days,
    ROUND(COALESCE(s.units_sold_30d, 0) / NULLIF(i.stock_on_hand + COALESCE(s.units_sold_30d, 0), 0), 4) AS sell_through_rate
FROM fact_inventory i
JOIN dim_product p ON i.product_id = p.product_id
JOIN dim_store st ON i.store_id = st.store_id
LEFT JOIN last_30_days_sales s
    ON i.product_id = s.product_id
   AND i.store_id = s.store_id;
