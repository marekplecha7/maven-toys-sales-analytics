--------------- Business Validation ---------------


-- Are there any negative product prices?
-- Is any product cost higher than its selling price?
-- Can Units be equal to 0?
-- Can Stock_On_Hand be negative?
-- Are there any stores with a future opening date?
-- Are there any sales recorded in the future?
-- Were any sales made before the corresponding store opened?
-- Are there any products that have never been sold?
-- Are there any stores that have never made a sale?
-- Are there any products listed in the catalog that have no inventory records?
-- Are there any products that are out of stock across all stores?
-- Has any product been sold in an unusually high quantity in a single transaction?
-- Is there any product with an unusually high stock level in a single store?
-- Are there any product prices that significantly differ from the rest?


----Can Units be equal to 0?
select top 20 * from [dbo].[sales]

select * from [dbo].[sales]
where Units <1
--passed

----Are there any negative product prices?
select top 20 * from [dbo].[products]


--(changing the data type to be able to make the calculation).

with products_clean as (
SELECT
    Product_ID,
    Product_Name,
	Product_Category,
    TRY_CAST(REPLACE(Product_Cost, '$', '') AS decimal(10,2)) AS Product_Cost_Clean,
    TRY_CAST(REPLACE(Product_Price, '$', '') AS decimal(10,2)) AS Product_Price_Clean
FROM dbo.products
)
select * from products_clean
where Product_Cost_Clean <=0
--passed


----Is any product cost higher than its selling price?

with products_clean as (
SELECT
    Product_ID,
    Product_Name,
	Product_Category,
    TRY_CAST(REPLACE(Product_Cost, '$', '') AS decimal(10,2)) AS Product_Cost_Clean,
    TRY_CAST(REPLACE(Product_Price, '$', '') AS decimal(10,2)) AS Product_Price_Clean
FROM dbo.products
)
select * from products_clean
where Product_Cost_Clean >= Product_Price_Clean
--passed


----Can Stock_On_Hand be negative?

select * from [dbo].[inventory]
where Stock_On_Hand <0
--passed



----Are there any stores with a future opening date?

select * from [dbo].[stores]
where Store_Open_Date > GETDATE()

--or
select * from [dbo].[stores]
where Store_Open_Date > CAST(GETDATE() AS DATE)
--passed

----Are there any sales recorded in the future?
select * from [dbo].[sales]
where Date > CAST(GETDATE() AS DATE)
--passed


----Were any sales made before the corresponding store opened?

select
t1.Store_ID, t1.Date "Sale_Date",t2.Store_Open_Date
from [dbo].[sales] as t1
join 
[dbo].[stores] as t2
on
t1.Store_ID = t2.Store_ID
where t1.Date < t2.Store_Open_Date
--passed


----Are there any products that have never been sold?

SELECT DISTINCT
    t2.Product_ID
FROM [dbo].[sales] AS t1
RIGHT JOIN [dbo].[products] AS t2
    ON t1.Product_ID = t2.Product_ID
where t1.Product_ID is null
--passed 

----Are there any stores that have never made a sale?

select distinct
t2.Store_ID
from [dbo].[sales] as t1
right join
[dbo].[stores] as t2
on t1.Store_ID = t2.Store_ID
where t1.Store_ID is null
--passed



----Are there any products listed in the catalog that have no inventory records?
select distinct 
t1.Product_ID
from [dbo].[products] as t1
left join [dbo].[inventory] as t2
on t1.Product_ID = t2.Product_ID
where t2.Product_ID is null
--passed

----Are there any products that are out of stock across all stores?

WITH available_stock AS (
    SELECT
        product_ID,
        TRY_CAST(stock_on_hand AS decimal(10,0)) AS stock
    FROM dbo.inventory
)
SELECT
    product_ID,
    COUNT(*) AS stores_with_inventory_record,
    SUM(stock) AS total_stock
FROM available_stock
GROUP BY product_ID
HAVING SUM(stock) = 0;
--passed

---- Has any product been sold in an unusually high quantity in a single transaction?

select top 20 * from dbo.sales
order by Units desc
--Doesn't work because the column seems to be interpreted as text.


select top 100 TRY_CAST(Units AS int) AS Units_clean
from [dbo].[sales]
order by Units_clean desc

--OR

with clean as (
select TRY_CAST(Units AS int) AS Units_clean
from [dbo].[sales])

select top 100 (Units_clean) from clean
order by Units_clean desc



---- Is there any product with an unusually high stock level in a single store?

select * from [dbo].[inventory]
order by Stock_On_Hand desc
--Doesn't work because the column seems to be interpreted as text.


with invent_clean as (
SELECT
    Store_ID,
    product_ID,
    TRY_CAST(Stock_on_Hand AS int) AS STOCK
FROM [dbo].[inventory])

select  top 100 store_ID, t1.product_ID, STOCK, Product_Name
from invent_clean as t1
join
[dbo].[products] as t2
on t1.product_ID =  t2.Product_ID
order by STOCK desc

--passed


----Are there any product prices that significantly differ from the rest?

with products_clean as (
SELECT
    Product_ID,
    Product_Name,
	Product_Category,
    TRY_CAST(REPLACE(Product_Cost, '$', '') AS decimal(10,2)) AS Product_Cost_Clean,
    TRY_CAST(REPLACE(Product_Price, '$', '') AS decimal(10,2)) AS Product_Price_Clean
FROM dbo.products
)
select * from products_clean
order by Product_Price_Clean desc
--passed 
