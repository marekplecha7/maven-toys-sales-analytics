
-- +++ store_id, product_id, stock_on_hand
select * from [dbo].[inventory]

-- +++ PRODUCT_ID, product_name, product_category, product_cost, product_price
select * from [dbo].[products]

-- +++++ sale_ID, date, store_ID, product_ID, Units
select * from [dbo].[sales]

-- STORE_ID, store_name, store_city, store_location, store_open_date
select * from [dbo].[stores]


--- COUNTS

--1593
select * from [dbo].[inventory]
select count(*) from [dbo].[inventory]

--35
select count(*) from [dbo].[products]

-- 829262
select count(*) from [dbo].[sales]

-- 50
select count(*) from [dbo].[stores]

------------- Checking if the values in colums are unique  ---------------


select * from [dbo].[products]

select Product_ID 
where PRODUCT_ID = null

from [dbo].[products]


select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_TYPE = 'PRIMARY KEY' and TABLE_NAME = 'products'

select count(Product_ID) "DuplicateCount", Product_ID from [dbo].[products]
group by Product_ID 
having count(Product_ID) > 1
-- PRODUCT_ID in Products UNIQUE


select count(Sale_ID) "DuplicateCount", Sale_ID from [dbo].[sales]
group by Sale_ID
having count(Sale_ID) > 1
-- SALE_ID in Sales UNIQUE

select count(Store_ID) "DuplicateCount", Store_ID from [dbo].[stores]
group by Store_ID
having count(Store_ID) > 1
-- Store_ID in Stores UNIQUE


select * from [dbo].[inventory]
select Count(*) as DuplicateCount, Store_ID, Product_ID 
from [dbo].[inventory]
group by Store_ID, Product_ID
having count(*) > 1
-- A pair Store_ID, Product_ID in Inventory is UNIQUE.



--------------- Checking the completness of tables (if contain NULL values or not) ---------------



--PRODUCTS
select * from [dbo].[products]

select
sum(case when product_ID is null then 1 else 0 end) as product_ID_Null,
sum(case when product_name is null OR TRIM(product_name) = '' then 1 else 0 end) as product_name_Null,
sum(case when product_category is null OR TRIM(product_category) = '' then 1 else 0 end) as product_category_Null,
sum(case when product_cost is null then 1 else 0 end) as product_cost_Null,
sum(case when product_price is null then 1 else 0 end) as product_price_null
from [dbo].[products]
---NO NULL VALUE---


-- STORES
select * from [dbo].[stores]

select
	sum(case when Store_ID is null then 1 else 0 end) as store_ID_Null,
	sum(case when store_name is null OR TRIM(store_name) = '' then 1 else 0 end) as store_name_Null,
	sum(case when store_city is null OR TRIM(store_city) = '' then 1 else 0 end) as store_city_Null,
	sum(case when store_location is null OR TRIM(store_location) = '' then 1 else 0 end) as store_location_Null,
	sum(case when store_open_date is null then 1 else 0 end) as store_open_date_null
from [dbo].[stores]
---NO NULL VALUE---


-- SALES
select * from [dbo].[sales]

select
	sum(case when sale_ID is null then 1 else 0 end) as sale_ID_Null,
	sum(case when Date is null then 1 else 0 end) as Date_Null,
	sum(case when store_ID is null then 1 else 0 end) as store_ID_Null,
	sum(case when product_ID is null then 1 else 0 end) as product_ID_Null,
	sum(case when Units is null then 1 else 0 end) as Units_null
from [dbo].[sales]
---NO NULL VALUE---


-- INVENTORY
select * from [dbo].[inventory]

select
	sum(case when store_ID is null then 1 else 0 end) as store_ID_Null,
	sum(case when product_ID is null then 1 else 0 end) as product_ID_Null,
	sum(case when stock_on_hand is null then 1 else 0 end) as stock_on_hand_null
from [dbo].[inventory]
---NO NULL VALUE---




--------------- Checking the referential integrity ---------------




--Sales.Product_ID     → Products.Product_ID
--Sales.Store_ID       → Stores.Store_ID
--Inventory.Product_ID → Products.Product_ID
--Inventory.Store_ID   → Stores.Store_ID




---- Sales.Product_ID → Products.Product_ID
select top 10 * from [dbo].[sales]
select top 10 * from [dbo].[products]


SELECT DISTINCT
    t1.Product_ID
FROM [dbo].[sales] AS t1
LEFT JOIN [dbo].[products] AS t2
    ON t1.Product_ID = t2.Product_ID
where t2.Product_ID is null
-- Every Product_ID in Sales has a corresponding record in Products.


---- Sales.Store_ID       → Stores.Store_ID
select top 10 * from [dbo].[sales]
select top 10 * from [dbo].[stores]

select distinct
t1.Store_ID
from [dbo].[sales] as t1
left join
[dbo].[stores] as t2
on t1.Store_ID = t2.Store_ID
where t2.Store_ID is null
-- Every Store_ID in Sales has a corresponding record in Stores.


---- Inventory.Product_ID → Products.Product_ID 
select top 10 * from [dbo].[inventory]
select top 10 * from [dbo].[products]

select distinct 
t1.Product_ID
from [dbo].[inventory] as t1
left join [dbo].[products] as t2
on t1.Product_ID = t2.Product_ID
where t2.Product_ID is null
-- Every Product_ID in Inventory has a corresponding record in Products.


---- Inventory.Store_ID   → Stores.Store_ID 
select top 10 * from [dbo].[inventory]
select top 10 * from [dbo].[stores]

select distinct 
t1.Store_ID
from [dbo].[inventory] as t1
left join [dbo].[stores] as t2
on t1.Store_ID = t2.Store_ID
where t2.Store_ID is null
-- Every Product_ID in Inventory has a corresponding record in Products.
