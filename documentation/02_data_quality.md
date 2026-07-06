# Data Quality Report

## PRODUCTS (35 rows)

### Uniqueness

| Product_ID unique | ✅ Yes |

### Completeness
```
| Product_ID NULL | 0 |
| Product_Name missing | 0 |
| Product_Category missing | 0 |
| Product_Cost NULL | 0 |
| Product_Price NULL | 0 |
```
No data completeness issues were identified in the Products table.

## STORES (50 rows)

### Uniqueness

| Store_ID unique | ✅ Yes |

### Completeness
```
| store_ID NULL | 0 |
| store_Name Empty | 0 |
| store_city Empty | 0 |
| store_location Empty | 0 |
| store_open_date NULL | 0 |
```
No data completeness issues were identified in the Stores table.

## SALES (829,262 rows)

### Uniqueness

| Sale_ID unique | ✅ Yes |

### Completeness
```
| sale_ID NULL | 0 |
| Date NULL | 0 |
| store_ID NULL | 0 |
| product_ID NULL | 0 |
| Units NULL | 0 |
```
No data completeness issues were identified in the Sales table.

## INVENTORY (1,593 rows)

### Uniqueness

| store_ID + product_ID combination unique | ✅ Yes |

### Completeness
```
| store_ID NULL | 0 |
| product_ID NULL | 0 |
| stock_on_hand NULL | 0 |
```
No data completeness issues were identified in the Inventory table.


## Referential integrity between tables
```
Sales.Product_ID     → Products.Product_ID
Sales.Store_ID       → Stores.Store_ID

Inventory.Product_ID → Products.Product_ID
Inventory.Store_ID   → Stores.Store_ID
```
```
| Sales.Product_ID exists in Products | ✅ Passed (0 orphan records) |

| Sales.Store_ID exists in Stores | ✅ Passed (0 orphan records) |

| Inventory.Product_ID exists in Products | ✅ Passed (0 orphan records) |

| Inventory.Store_ID exists in Stores | ✅ Passed (0 orphan records) |
```

