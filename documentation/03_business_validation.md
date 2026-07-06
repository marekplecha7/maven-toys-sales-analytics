# Business Validation

| Check                         | Reason                                                                           | Result   |
| ----------------------------- | -------------------------------------------------------------------------------- | -------- |
| Units >=1                      | Products sold with units less than 1 may indicate data errors.                   | ✅ Passed |
| Product_Price > 0             | Products sold below or equal to 0 may indicate data errors or exceptional business cases. | ✅ Passed |
| Product_Cost > 0              | Products that cost below or equal to 0 may indicate data errors or exceptional business cases. | ✅ Passed |
| Product_Price > Product_Cost | Products sold below or equal to cost may indicate data errors or exceptional business cases. | ✅ Passed |
| Stock_On_Hand >= 0              | Products that have negative stock may indicate data errors. | ✅ Passed |
| Store open date <= the current date | The store open date should not occur in future. | ✅ Passed |
| Sales date <= the current date | Sales should not occur in future. | ✅ Passed |
| Sales date >= store open date | Sales should not occur before the store was opened. | ✅ Passed |
| Was every product sold? | Products with no sales may indicate low demand, recently introduced products or missing sales records. | ✅ Passed |
| Did every store sold at least one item? | Stores with no sales may indicate missing transactional data or recently opened locations. | ✅ Passed |
| All products in the catalogue are mentioned in the inventory. | Products that aren't mentioned in the inventory at all may indicate data errors  | ✅ Passed |
| Products with total stock = 0 | Identifies products unavailable in all stores. | ✅ Passed, 0 such products found|
| Highest single-sale quantity | Observing for any outliers in the data as it could indicate data error or unusual business behaviour. | Maximum value: 30 units. No unusually large single transactions observed. | 
| Highest stock of one product available in a store | Observing for any outliers in the data as it could indicate data error or unusual business behaviour. | Maximum value: 139 stock. No unusually large single stock observed. | 
| Unusually large/small prices | Observing for any outliers in the data as it could indicate data error or unusual business behaviour. | Observed Price Range: Maximum value: $39.99; Minimum value: $2.99; Median: $12.99. No unusual outliers found. |

