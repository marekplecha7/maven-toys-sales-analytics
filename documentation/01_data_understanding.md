# Data Understanding


## Tables

### Sales

Description: A fact table in which each row relates to sale of one item.

Columns: sale_ID, date, store_ID, product_ID, units

Row count: 829262

Initial observations: 
- Seems like a fact table
- Sale_ID has unique values only.
  - Each row in the Sales table represents a single sale of a single product.
- Units are stored as NVARCHAR values. Before numerical analysis, these fields require conversion to numeric data types.

---

### Products

Description: A dimension table with the descriptive information regarding each product in the inventory of the store.

Columns: product_id, product_name, product_category, product_cost, product_price

Row count: 35

Initial observations:
- Seems like a dimension table
- Product_id has unique values only.
- Product_Cost and Product_Price are stored as NVARCHAR values containing a currency symbol ($). Before numerical analysis, these fields require conversion to numeric data types.


---

### Stores

Description: A dimension table with the desriptive information about each store that sells products.

Columns: store_ID, store_name, store_city, store_location, store_open_date

Row count: 50

Initial observations:
- Seems like a dimension table.
- Store_ID has unique values only.
 

---

### Inventory

Description: A fact table that contains the current stock level of each product in each store.

Columns: store_id, product_id, stock_on_hand

Row count: 1593

Initial observations:
- Seems like a fact table.
- The store_ids probably aren't unique, the codes are repeated many times.
- The combination of store_id and product_id may be unique.
- Stock_on_hand are stored as NVARCHAR values. Before numerical analysis, these fields require conversion to numeric data types.


## Relationships

## Initial Observations