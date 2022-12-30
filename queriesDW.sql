----------------------------------
-- Data Warehouse OLAP Queries --
----------------------------------
use dw;
-- Q1. Determine the top 3 store names who generated highest sales in September, 2017.
select s.store_name, sum(tr.sales)
from stores s, transactions tr, times ti
where s.store_id = tr.store_id
and ti.time_id = tr.time_id
and ti.t_month = 9
and ti.t_year = 2017
group by s.store_name
order by sum(tr.sales) desc
limit 0,3;

-- Q2. Find Top 10 suppliers that generated most revenue over the weekends. Just Explain how can we forecast the top suppliers for the next weekend?
select s.supplier_name, sum(tr.sales)
from suppliers s, transactions tr, times ti
where s.supplier_id = tr.supplier_id
and ti.time_id = tr.time_id
and (lower(dayname(ti.t_date)) = "sunday" or lower(dayname(ti.t_date)) = "saturday")
group by s.supplier_name
order by sum(tr.sales) desc
limit 0,10;
-- Just Explain how can we forecast the top suppliers for the next weekend?
-- explanation: We can forecast the top suppliers for the next weekend by taking into account the top suppliers for the previous weekend and the top suppliers for the previous week. We can also take into account the top suppliers for the previous month and the top suppliers for the previous year.

-- Q3. Present total sales of all products supplied by each supplier with respect to quarter and month.
select sup.supplier_name, ti.t_quarter, MONTHNAME(ti.t_date) ,sum(tr.sales)
from suppliers sup, times ti, transactions tr
where sup.supplier_id = tr.supplier_id
and ti.time_id = tr.time_id
group by sup.supplier_name ,ti.t_quarter, ti.t_month
order by sup.supplier_name,sum(tr.sales) desc;

-- Q4. Present total sales of each product sold by each store. The output should be organised store wise and then product wise under each store.
select st.store_name, p.product_name, sum(tr.sales)
from stores st, products p, transactions tr
where p.product_id = tr.product_id
and st.store_id = tr.store_id
group by  st.store_name,p.product_name
order by st.store_name;

-- Q5. Present the quarterly sales analysis for all stores using drill down query concepts.
select st.store_name, ti.t_quarter, sum(tr.sales)
from stores st, times ti, transactions tr
where st.store_id = tr.store_id
and ti.time_id = tr.time_id
group by st.store_name, ti.t_quarter;

-- Q6. Find the 5 most popular products sold over the weekends.
select DISTINCT(p.product_name), sum(tr.quantity)
from products p, transactions tr, times ti
where p.product_id = tr.product_id
and ti.time_id = tr.time_id
and (lower(dayname(ti.t_date)) = "sunday" or lower(dayname(ti.t_date)) = "saturday")
group by p.product_name
order by sum(tr.quantity) desc
limit 0,5;

-- Q7. Perform ROLLUP operation to store, supplier, and product. Explain your query results in a few lines.
select st.store_name, sup.supplier_name, p.product_name, tr.sales
from stores st, suppliers sup, products p, transactions tr
where p.product_id = tr.product_id
and st.store_id = tr.store_id
and sup.supplier_id = tr.supplier_id
group by st.store_name, sup.supplier_name, p.product_name with rollup;
-- explanation: the above query will give the total sales of each store, supplier and product. It will also give the total sales of each store and supplier and the total sales of each store.
-- the roll up operation will give the total sales of each store, supplier and product. It will also give the total sales of each store and supplier and the total sales of each store.

-- Q8. Extract total sales of each product for the first and second half of year 2017 along with its total yearly sales.
select DISTINCT(p.product_name),ceil(ti.t_quarter/2) as Half,sum(tr.sales)
from products p, times ti, transactions tr
where p.product_id = tr.product_id
and ti.time_id = tr.time_id
and ti.t_year = 2017
group by p.product_name,Half,ti.t_year with rollup;

-- Q9. Find an anomaly in the data warehouse dataset. Write a query to show that anomaly and explain the anomaly in your project report.
-- find duplicate names of products
select product_name, count(product_name)
from products
group by product_name
having count(product_name) > 1;
-- explanation: the above query shows that there are duplicate names of products in the products table. This is an anomaly in the data warehouse dataset.


-- Q10. Create a materialised view with name “STORE_PRODUCT_ANALYSIS” that presents store and product wise sales. The results should be ordered by store name and then product name. How the materialized view helps in OLAP query optimisation?
-- since we can't create materialized views directly, we'll have to create table
-- reference: https://linuxhint.com/materialized-views-mysql/


drop table if exists `store_product_analysis`;
create table store_product_analysis as
select st.store_name, p.product_name, sum(tr.sales)
from stores st, products p, transactions tr
where p.product_id = tr.product_id
and st.store_id = tr.store_id
group by  st.store_name,p.product_name
order by st.store_name;
-- explanation: the query above will create a table called store_product_analysis which will store the results of the query. This will help in speeding up the query as the results are already stored in the table. This is useful in OLAP queries as they are usually complex and take a lot of time to execute.




