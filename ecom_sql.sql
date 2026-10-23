SELECT * FROM project.ecommmm;
#1
SELECT count(distinct(order_id)) as total_order
FROM ecommmm;

#2
SELECT count(distinct(customer_name)) as total_customer
 FROM ecommmm;
 
#3
SELECT count(distinct(product_id)) as total_products
FROM ecommmm;

#4
SELECT count(distinct(sku)) as total_sku 
FROM ecommmm;

#5
SELECT count(distinct(product_category)) as total_category
FROM ecommmm;

#6
SELECT order_date
FROM ecommmm
limit 10;

SELECT
date_format(str_to_date(order_date, '%d-%m-%Y'),'%Y-%m') AS sales_month,
    SUM(revenue) AS monthly_sales
FROM ecommmm
GROUP BY sales_month
ORDER BY sales_month;

#7
SELECT
YEAR(str_to_date(order_date,'%d-%m-%Y')) as sales_year,
     SUM(revenue) as yearly_sales
FROM ecommmm
GROUP BY YEAR(str_to_date(order_date,'%d-%m-%Y'))
ORDER BY sales_year;

#8
SELECT 
product_category,
SUM(revenue) as total_revenue
FROM
ecommmm
GROUP BY product_category
ORDER BY total_revenue DESC LIMIT 5;

SELECT count(distinct(product_category)) from ecommmm;

#9
SELECT sum(revenue) as total_revenue
FROM
ecommmm;

#10
SELECT sum(quantity) as total_quantity_sold
FROM
ecommmm;


#11
SELECT 
order_id,
customer_name,
product_name,
revenue,
profit
FROM
ecommmm
WHERE revenue > 1000
AND profit>0 ;

#12
SELECT * FROM ecommmm
ORDER BY revenue DESC 
LIMIT 10;

#13
SELECT 
sum(revenue) as total_revenue,
sum(profit) as total_profit,
sum(quantity) as total_quantity,
avg(discount) as average_discount,
count(*)
FROM ecommmm;

#14
SELECT 
product_name,
product_category,
discount,
revenue,
profit
FROM
ecommmm
WHERE profit<0 
AND discount>0.20;

#15
SELECT
order_id,
product_name,
profit, 
CASE
WHEN profit>500 THEN 'High Profit'
WHEN profit>0 AND profit<=500 THEN 'low Profit'
WHEN profit=0 THEN 'Break Even'
WHEN profit<0 THEN 'Loss'
END as profitabitity_category
FROM ecommmm;

#16
SELECT
order_id,
order_date,
ship_date,
ship_mode
FROM 
ecommmm
WHERE datediff(ship_date,order_date)>5; 

#17
SELECT
product_category,
sum(revenue) as total_revenue,
sum(profit) as total_profit,
sum(quantity) as total_quantity_sold
FROM 
ecommmm
GROUP BY product_category
ORDER BY total_revenue DESC ;

#18
SELECT
state,
sum(profit) as total_profit
FROM ecommmm
GROUP BY state
ORDER BY total_profit DESC
LIMIT 5;

#19
SELECT 
customer_type,
sum(revenue) as total_revenue,
sum(profit) as total_profit
FROM ecommmm
GROUP BY customer_type
HAVING sum(revenue)>5000;

#20

SELECT 
product_category,
sum(revenue) as total_revenue,
sum(profit) as total_profit
FROM ecommmm
GROUP BY product_category
HAVING sum(profit)<0;

#21
SELECT 
customer_id,
customer_name,
count(distinct product_name) as distinct_purchased_product
FROM ecommmm
GROUP BY customer_id,customer_name
HAVING count(distinct product_name) >5; 

#22
SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(profit) AS total_profit
FROM ecommmm
GROUP BY product_name
HAVING SUM(quantity) > 100
   AND SUM(profit) > 1000;
   
#23

SELECT * FROM ecommmm
WHERE revenue >
(SELECT avg(revenue) from ecommmm);

SELECT
product_id,
product_name,
sum(revenue) as total_revenue
from ecommmm
GROUP BY product_id,product_name


