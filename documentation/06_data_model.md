# Power BI Setup

## Data Source

Power BI is connected directly to the following SQL views:

- vw_sales_clean
- vw_products_clean
- vw_inventory_clean
- vw_stores_clean

The original source tables are not used in the report.

---

## Data Model

The model consists of:

**Dimensions**
- Products
- Stores

**Fact Tables**
- Sales
- Inventory

**Relationships**
```
Products (1) -> Sales (*)

Stores (1) -> Sales (*)

Products (1) -> Inventory (*)

Stores (1) -> Inventory (*)
```

**Cross filter direction:**
- Single

**All relationships are active.**