# Retail Inventory & Sales Analytics

## Overview

A comprehensive retail analytics portfolio project demonstrating how raw sales and inventory data can be transformed into a clean reporting layer for Power BI dashboards using SQL, Python and dimensional modelling.

![Retail Analytics Dashboard](dashboard/Retail%20Analytics%20Dashboard.png)

## Business Problem

Retail and supply chain teams need reliable visibility of sales performance, stock cover, sell-through, inventory turnover and replenishment priorities. Many teams still rely on manual Excel reporting that is error-prone and time-consuming to maintain.

This project demonstrates best practices in data modelling, KPI definition and business intelligence design to enable data-driven decision making across the retail operations.

## Business Questions Answered

1. **Which categories and stores are driving sales and margin?** - Identify top performers and underperforming segments
2. **Which products are at risk of stock-out?** - Proactive inventory management to avoid lost sales
3. **Which products are overstocked and tying up working capital?** - Optimize cash flow and reduce holding costs
4. **What is the sell-through rate by product/category/store?** - Measure product velocity and market fit
5. **Which replenishment priorities should operations focus on this week?** - Operationalize insights into action

## Dashboard Pages

The Power BI dashboard includes six integrated pages:

1. **Executive Overview** - High-level KPIs including revenue, gross margin, units sold, stock value and risk flags
2. **Sales Performance** - Trends, category contribution, top/bottom products and store comparison analysis
3. **Inventory Health** - Stock cover, stock-on-hand, inventory turnover and ageing risk assessment
4. **Replenishment Priorities** - Stock-out risk, reorder flags and recommended priority list for operations
5. **Category Performance** - Sell-through rates, margin contribution and slow-moving category identification
6. **Data Quality Checks** - Missing product/store records, negative stock flags and reconciliation validation

## Key KPIs

- **Sales Metrics**: Total Sales, Units Sold, Revenue Trend
- **Profitability**: Gross Margin, Gross Margin %
- **Inventory**: Stock on Hand, Stock Value, Stock Cover Days
- **Performance**: Sell-through Rate, Inventory Turnover
- **Risk Flags**: Out-of-stock Risk, Overstock Risk, Replenishment Priority Score

## Tools & Technologies

| Component | Tool | Purpose |
|-----------|------|---------|
| Data Warehouse | SQL | Reporting layer logic and KPI calculations |
| Data Preparation | Python / Pandas | ETL, data validation and quality checks |
| Visualization | Power BI | Interactive dashboards and insights |
| Data Model | Star Schema | Dimensional modelling for analytics |
| Domain | Retail & Supply Chain | Business KPI framework and logic |

## Data Model

### Fact Tables
- **fact_sales**: Transaction-level sales data (date, product, store, quantity, revenue, cost)
- **fact_inventory**: Stock-on-hand snapshots (date, product, store, quantity, value)

### Dimension Tables
- **dim_product**: Product catalog, category, subcategory, margin, supplier
- **dim_store**: Store location, region, manager, format
- **dim_date**: Calendar attributes, fiscal periods, day-of-week

## Example Insights

- **Stock-out Risk**: Products with high sales velocity and stock cover below 7 days are flagged for immediate replenishment
- **Overstock Risk**: Slow-moving products with stock cover above 60 days indicate potential capital efficiency issues
- **Margin Analysis**: Category margin analysis separates high-revenue products from genuinely profitable products
- **Store Comparison**: Store-level performance differences highlight where replenishment and promotion strategies should vary by region
- **Data Quality**: Source-to-report checks reduce decision-making risk from inconsistent manual processes

## Repository Structure

```
retail-inventory-sales-analytics/
├── dashboard/
│   └── Retail Analytics Dashboard.png    # Power BI dashboard screenshot
├── data/
│   ├── sales.csv                         # Raw transaction data
│   ├── products.csv                      # Product master data
│   ├── stores.csv                        # Store master data
│   └── inventory.csv                     # Inventory snapshots
├── sql/
│   ├── 01_create_tables.sql              # Database schema
│   ├── 02_sales_kpis.sql                 # Sales metric calculations
│   ├── 03_inventory_kpis.sql             # Inventory metric calculations
│   └── 04_replenishment_priority.sql     # Replenishment logic
├── python/
│   ├── data_quality_checks.py            # Validation framework
│   └── data_preparation.py               # ETL and transformations
├── docs/
│   ├── dashboard_wireframe.md            # Visual design specification
│   ├── data_dictionary.md                # Field definitions
│   └── dashboard_preview.svg             # Design mockup
├── README.md                             # This file
└── .gitignore
```

## Skills Demonstrated

- ✅ Power BI dashboard design and layout optimization
- ✅ SQL reporting layer architecture and performance optimization
- ✅ DAX measures and calculated columns for business logic
- ✅ Star schema dimensional modelling best practices
- ✅ Python ETL and data validation frameworks
- ✅ Retail and supply chain analytics domain knowledge
- ✅ Business insight storytelling and executive communication
- ✅ GitHub portfolio documentation and presentation
- ✅ Data quality frameworks and reconciliation logic

## Getting Started

1. **Raw Data**: Place CSV files in the `data/` folder
2. **Database Setup**: Execute SQL scripts in `sql/` folder in sequence
3. **Data Validation**: Run `python/data_quality_checks.py` to validate
4. **Connect Power BI**: Link to database and import data model
5. **Load Dashboard**: Open Power BI file and refresh from database

## Key Takeaways

This project demonstrates an end-to-end analytics solution that:
- Transforms raw operational data into business-ready insights
- Implements retail KPI frameworks for decision support
- Balances technical rigor (data quality) with business value
- Documents assumptions and enables stakeholder trust
- Scales from data collection to executive dashboards

---

**Author**: Bashar Ali  
**Last Updated**: May 16, 2026  
**Status**: Complete