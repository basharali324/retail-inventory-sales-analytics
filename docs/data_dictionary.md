# Data Dictionary

## sales.csv

| Column | Description |
|---|---|
| sale_id | Unique sales transaction identifier |
| sale_date | Date of sale |
| store_id | Store where transaction occurred |
| product_id | Product sold |
| units_sold | Units sold in transaction |
| discount_pct | Discount applied as decimal value |

## products.csv

| Column | Description |
|---|---|
| product_id | Unique product identifier |
| product_name | Product name |
| category | Product category |
| subcategory | Product subcategory |
| unit_cost | Product cost price |
| unit_price | Product selling price |

## stores.csv

| Column | Description |
|---|---|
| store_id | Unique store identifier |
| store_name | Store name |
| region | UK region grouping |
| city | City location |

## inventory.csv

| Column | Description |
|---|---|
| snapshot_date | Inventory snapshot date |
| store_id | Store identifier |
| product_id | Product identifier |
| stock_on_hand | Current stock on hand |
| reorder_level | Minimum stock level before reorder |
