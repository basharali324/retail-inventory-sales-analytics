# Retail Inventory & Sales Analytics Dashboard

## Business Problem

Retail and supply chain teams need reliable visibility of sales performance, stock cover, sell-through, inventory turnover and replenishment priorities. Many teams still rely on manual Excel reporting, which slows decisions and creates inconsistent KPI definitions.

This project demonstrates how raw sales and inventory data can be transformed into a clean reporting layer for Power BI dashboards using SQL, Python and dimensional modelling.

## Business Questions Answered

1. Which categories and stores are driving sales and margin?
2. Which products are at risk of stock-out?
3. Which products are overstocked and tying up working capital?
4. What is the sell-through rate by product/category/store?
5. Which replenishment priorities should operations focus on this week?

## Tools Used

- SQL for reporting layer logic and KPI calculations
- Python / Pandas for data preparation and validation checks
- Power BI design specification for dashboard pages and DAX measures
- Star schema data modelling
- Retail and supply chain KPI framework

## Data Model

**Fact tables**

- `fact_sales`: transaction-level sales data
- `fact_inventory`: stock-on-hand snapshots

**Dimension tables**

- `dim_product`: product, category and margin details
- `dim_store`: store and region details
- `dim_date`: calendar attributes for analysis

## Dashboard Pages

1. **Executive Overview** - revenue, gross margin, units sold, stock value and high-risk SKUs
2. **Sales Performance** - trends, category contribution, top/bottom products and store comparison
3. **Inventory Health** - stock cover, stock-on-hand, inventory turnover and ageing risk
4. **Replenishment Priorities** - stock-out risk, reorder flags and recommended priority list
5. **Category Performance** - sell-through, margin contribution and slow-moving categories
6. **Data Quality Checks** - missing product/store records, negative stock and reconciliation flags

## Key KPIs

- Total Sales
- Units Sold
- Gross Margin
- Gross Margin %
- Stock on Hand
- Stock Value
- Stock Cover Days
- Sell-through Rate
- Inventory Turnover
- Out-of-stock Risk Flag
- Overstock Risk Flag
- Replenishment Priority Score

## Example Insights

- Products with high sales velocity and stock cover below 7 days are flagged as stock-out risks.
- Slow-moving products with stock cover above 60 days are flagged as overstock risks.
- Category margin analysis helps separate high-revenue products from genuinely profitable products.
- Store-level comparison highlights where replenishment and promotion decisions should differ by region.
- Source-to-report checks reduce the risk of decision-making from inconsistent manual spreadsheets.

## Repository Structure

```text
retail-inventory-sales-dashboard/
├── data/
│   ├── sales.csv
│   ├── products.csv
│   ├── stores.csv
│   └── inventory.csv
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_sales_kpis.sql
│   ├── 03_inventory_kpis.sql
│   └── 04_replenishment_priority.sql
├── python/
│   └── data_quality_checks.py
└── docs/
    ├── dashboard_wireframe.md
    ├── data_dictionary.md
    └── dashboard_preview.svg
```

## Skills Demonstrated

- Power BI dashboard planning
- SQL reporting layer design
- DAX-ready KPI definitions
- Retail and supply chain analytics
- Star schema modelling
- Data quality validation
- Business insight storytelling
- GitHub portfolio documentation
