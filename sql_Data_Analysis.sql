drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY ,
category VARCHAR(120),
name  VARCHAR(150) NOT NULL ,
mrp NUMERIC(10,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER ,
discountSellingPrice NUMERIC(8,2),
weightInGms INTEGER ,
outOfStock BOOLEAN ,
quantity integer 
);

---------DATA EXPLORATION------
--count of row
select count(*) from zepto;

--Data view
select * from zepto;

--Check for null values
select * from zepto where
name is null
or mrp is null
or category is null
or discountpercent is null
or availablequantity is null
or discountsellingprice is null
or weightingms is null 
or outofstock is null
or quantity is null ;

--different category of product
select distinct category from zepto
order by category;

--product out of stock vs in stock 
select outofstock ,count(sku_id)
from zepto
group by outofstock;

--product name repeated
select name, count(sku_id) as "number of sku"
from zepto
group by name 
having count(sku_id) > 1
order by count(sku_id) desc;

--------DATA CLEANING----
select * from zepto
where mrp =0 or discountsellingprice = 0;

delete from zepto 
where mrp = 0;

----Convert paise into rupees
update zepto 
set mrp = mrp/100.0,
discountsellingprice =discountsellingprice/100.0;

select mrp,discountsellingprice from zepto;

---------BUSINESS INSIGHTS-----

---Find the top 10 best-value products based on the discount percentage.
select distinct name ,mrp,discountsellingprice,discountpercent
from zepto
order by discountpercent desc
limit 10;

---Product of high prices that are out of stock.
select distinct name , mrp
from zepto
where outofstock = 'True'
order by mrp desc
limit 10;

---Estimated revenue of each category
select category ,
sum(discountsellingprice * availablequantity) as total_revenue
from zepto
group by category 
order by total_revenue;

---Products with high Mrp that has low discount 
select distinct  name , mrp ,discountpercent 
from zepto
where mrp >500 and discountpercent <10
order by mrp desc, discountpercent desc;

---Top 5 category offering the highest average discount percentage
select category,
round(avg(discountpercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

---Price per gram of the product  and sort by best value
select distinct name , weightingms , discountsellingprice , round(discountsellingprice/weightingms,2) as price_per_gram
from zepto
where weightingms >=100
order by price_per_gram;

---Grouping the products into category -low,medium,bulk based on weight
select distinct name ,weightingms,
case when weightingms < 1000 then 'Low'
when weightingms <5000 then 'Medium'
else 'Bulk'
end as weight_category
from zepto
order by weight_category;

---Total Inventory weight per category
select category ,
sum(weightingms*availablequantity) as total_weight
from zepto
group by category
order by total_weight desc ;
------------------------------------
select * from zepto
order by discountsellingprice desc;

