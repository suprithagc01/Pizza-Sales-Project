select Sum(total_price) as Total_Revenue
from pizza_sales

Select Sum(total_price)/count(distinct order_id) as Average_order_Value
from pizza_sales

 Select sum(quantity) as Total_pizza_sold from pizza_sales

Select * from pizza_sales

select count(distinct order_id) as Total_orders_placed from pizza_sales

Select cast(cast(sum(quantity) as decimal(10,2))/Cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizza_per_order from pizza_sales

/* Daily trends for total orders*/

Select Datename(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales 
group by datename(DW, order_date)

/* hourly trend for total order*/

select Datepart(Hour, order_time) as order_hours , count(distinct order_id) as Total_orders
from pizza_sales 
group by Datepart(Hour, order_time) 
order by Datepart(Hour, order_time) ASC

/*Percentage of sales by Pizza category*/

Select pizza_category, sum( total_price)*100/(select sum(total_price) from pizza_sales) as PCT, Sum(Total_price) as Total_sales
from pizza_sales
Group by pizza_category

/* Total Pizza sold by pizza category*/

Select pizza_category, Sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_category

/* Top 5 best sellers*/

select Top 5 pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by sum(quantity) 

/* bottom 5 */

select Top 5 pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by sum(quantity)Desc 

