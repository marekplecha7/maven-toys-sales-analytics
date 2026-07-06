# Data Cleaning

## Goal

To create cleaned SQL views that will be used as the source for Power BI.

Original tables will not be modified.

## Planned cleaned views

- vw_products_clean
- vw_sales_clean
- vw_inventory_clean
- vw_stores_clean

## Main transformations

| Table | Column | Transformation | Status |
|---|---|---|---|
| Products | Product_Cost | Remove `$` and convert to DECIMAL(10,2) | ✅ Done |
| Products | Product_Price | Remove `$` and convert to DECIMAL(10,2) | ✅ Done |
| Sales | Units | Convert to INT | ✅ Done |
| Inventory | Stock_On_Hand | Convert to INT | ✅ Done |