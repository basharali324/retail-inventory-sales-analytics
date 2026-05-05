-- 04_replenishment_priority.sql
-- Flags stock-out and overstock risks for operations teams.

WITH inventory_health AS (
    SELECT
        i.snapshot_date,
        i.store_id,
        i.product_id,
        i.stock_on_hand,
        i.reorder_level,
        p.category,
        p.product_name,
        COALESCE(SUM(s.units_sold), 0) AS units_sold_30d,
        COALESCE(SUM(s.units_sold), 0) / 30.0 AS avg_daily_sales
    FROM fact_inventory i
    JOIN dim_product p ON i.product_id = p.product_id
    LEFT JOIN fact_sales s
        ON i.product_id = s.product_id
       AND i.store_id = s.store_id
       AND s.sale_date >= i.snapshot_date - INTERVAL '30 day'
       AND s.sale_date < i.snapshot_date
    GROUP BY
        i.snapshot_date,
        i.store_id,
        i.product_id,
        i.stock_on_hand,
        i.reorder_level,
        p.category,
        p.product_name
)
SELECT
    snapshot_date,
    store_id,
    product_id,
    category,
    product_name,
    stock_on_hand,
    reorder_level,
    ROUND(avg_daily_sales, 2) AS avg_daily_sales,
    ROUND(stock_on_hand / NULLIF(avg_daily_sales, 0), 1) AS stock_cover_days,
    CASE
        WHEN stock_on_hand <= reorder_level THEN 'Reorder Now'
        WHEN stock_on_hand / NULLIF(avg_daily_sales, 0) < 7 THEN 'Stock-out Risk'
        WHEN stock_on_hand / NULLIF(avg_daily_sales, 0) > 60 THEN 'Overstock Risk'
        ELSE 'Healthy'
    END AS inventory_status,
    CASE
        WHEN stock_on_hand <= reorder_level THEN 100
        WHEN stock_on_hand / NULLIF(avg_daily_sales, 0) < 7 THEN 80
        WHEN stock_on_hand / NULLIF(avg_daily_sales, 0) > 60 THEN 30
        ELSE 10
    END AS replenishment_priority_score
FROM inventory_health
ORDER BY replenishment_priority_score DESC, avg_daily_sales DESC;
