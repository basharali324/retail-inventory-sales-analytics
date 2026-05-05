"""
Data quality checks for the Retail Inventory & Sales Analytics Dashboard.
Run from the project root:
    python python/data_quality_checks.py
"""

from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parents[1]
DATA_DIR = BASE_DIR / "data"

sales = pd.read_csv(DATA_DIR / "sales.csv", parse_dates=["sale_date"])
products = pd.read_csv(DATA_DIR / "products.csv")
stores = pd.read_csv(DATA_DIR / "stores.csv")
inventory = pd.read_csv(DATA_DIR / "inventory.csv", parse_dates=["snapshot_date"])

checks = {
    "sales_rows": len(sales),
    "products_rows": len(products),
    "stores_rows": len(stores),
    "inventory_rows": len(inventory),
    "missing_sales_product_ids": sales.loc[~sales["product_id"].isin(products["product_id"]), "product_id"].nunique(),
    "missing_sales_store_ids": sales.loc[~sales["store_id"].isin(stores["store_id"]), "store_id"].nunique(),
    "negative_units_sold": int((sales["units_sold"] < 0).sum()),
    "negative_stock_on_hand": int((inventory["stock_on_hand"] < 0).sum()),
    "duplicate_sales_ids": int(sales["sale_id"].duplicated().sum()),
}

print("Retail Analytics Data Quality Summary")
print("=" * 45)
for check_name, value in checks.items():
    print(f"{check_name}: {value}")

if all(value == 0 for key, value in checks.items() if key.startswith("missing") or key.startswith("negative") or key.startswith("duplicate")):
    print("\nStatus: PASS - no critical data quality issues found.")
else:
    print("\nStatus: REVIEW REQUIRED - investigate flagged checks before reporting.")
