
-------- Creating view vw_products_clean



SELECT
    Product_ID,
    Product_Name,
	Product_Category,
    TRY_CAST(REPLACE(Product_Cost, '$', '') AS decimal(10,2)) AS Product_Cost_Clean,
    TRY_CAST(REPLACE(Product_Price, '$', '') AS decimal(10,2)) AS Product_Price_Clean
FROM dbo.products

create view vw_products_clean as 
SELECT
    Product_ID,
    Product_Name,
	Product_Category,
    TRY_CAST(REPLACE(Product_Cost, '$', '') AS decimal(10,2)) AS Product_Cost_Clean,
    TRY_CAST(REPLACE(Product_Price, '$', '') AS decimal(10,2)) AS Product_Price_Clean
FROM dbo.products

SELECT * from vw_products_clean




-------- Creating view vw_sales_clean




select top 20 * from sales

select 
    Sale_ID,
    Date,
    Store_ID,
    Product_ID,
    TRY_CAST(Units AS int) AS Units_Clean
from dbo.sales
--TINYINT could be used, but INT makes more sense if it was built taking into account the future development of the company.

create view vw_sales_clean as
select 
    Sale_ID,
    Date,
    Store_ID,
    Product_ID,
    TRY_CAST(Units AS int) AS Units_Clean
from dbo.sales

SELECT top 20 * from vw_sales_clean
order by Units_Clean desc

SELECT
    MIN(Units_Clean) AS MinUnits,
    MAX(Units_Clean) AS MaxUnits
FROM dbo.vw_sales_clean


-------- Creating view vw_inventory_clean

select top 20 * from [dbo].[inventory]

SELECT
    Store_ID,
    Product_ID,
    TRY_CAST(Stock_on_Hand AS int) AS Stock_On_Hand_Clean
FROM [dbo].[inventory]

create view vw_inventory_clean as
SELECT
    Store_ID,
    Product_ID,
    TRY_CAST(Stock_on_Hand AS int) AS Stock_On_Hand_Clean
FROM [dbo].[inventory]


select top 20 * from vw_inventory_clean

select
    min(Stock_On_Hand_Clean) "MinStock",
    max(Stock_On_Hand_Clean) "MaxStock"
from vw_inventory_clean


-------- Creating view vw_stores_clean

select * from [dbo].[stores]

create view vw_stores_clean as
select 
    Store_ID,
    Store_Name,
    Store_City,
    Store_Location,
    Store_Open_Date
from [dbo].[stores]
 
select * from vw_stores_clean

----- FINAL DATA CHECKS


SELECT
    SUM(CASE WHEN Units_Clean IS NULL THEN 1 ELSE 0 END)
FROM vw_sales_clean
--passed

SELECT
    SUM(CASE WHEN Product_Cost_Clean IS NULL THEN 1 ELSE 0 END)
FROM vw_products_clean
--passed

SELECT
    SUM(CASE WHEN Product_Price_Clean IS NULL THEN 1 ELSE 0 END)
FROM vw_products_clean
--passed

SELECT
    SUM(CASE WHEN Stock_On_Hand_Clean IS NULL THEN 1 ELSE 0 END)
FROM vw_inventory_clean
--passed


SELECT
    AVG(Product_Price_Clean)
FROM vw_products_clean
--passed

SELECT
    AVG(Product_Cost_Clean)
FROM vw_products_clean
--passed

SELECT
    SUM(Units_Clean)
FROM vw_sales_clean;
--passed

