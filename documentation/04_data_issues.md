

# Data Issues indentified prior to cleaning

| Issue                                                        | Severity | Impact                                                         | Planned Solution                           | Status  |
| ------------------------------------------------------------ | -------- | -------------------------------------------------------------- | ------------------------------------------ | ------- |
| `Sales.Units` stored as `NVARCHAR`                           | Medium   | Numeric calculations require conversion.                       | Convert to `INT` in cleaned layer.         | ✅ Done |
| `Inventory.Stock_On_Hand` stored as `NVARCHAR`               | Medium   | Sorting and aggregations require conversion.                   | Convert to `INT` in cleaned layer.         | ✅ Done |
| `Products.Product_Cost` stored as `NVARCHAR` containing `$`  | High     | Cannot compare prices or calculate margins without conversion. | Remove `$` and convert to `DECIMAL(10,2)`. | ✅ Done |
| `Products.Product_Price` stored as `NVARCHAR` containing `$` | High     | Cannot perform numerical analysis directly.                    | Remove `$` and convert to `DECIMAL(10,2)`. | ✅ Done |


