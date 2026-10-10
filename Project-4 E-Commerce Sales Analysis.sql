USE ecommerce_project;
CREATE TABLE sales(
	order_id INT PRIMARY KEY,
    order_date DATE,
    product VARCHAR(50),
    category VARCHAR(50),
    city VARCHAR(50),
    quantity int,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2)
);
INSERT INTO sales
(order_id, order_date, product, category, city, quantity, sales, profit)
VALUES
(1001, '2026-01-01', 'Laptop', 'Electronics', 'Pune', 2, 90000, 12000),
(1002, '2026-01-03', 'Mouse', 'Accessories', 'Mumbai', 5, 5000, 1500),
(1003, '2026-01-05', 'Keyboard', 'Accessories', 'Pune', 3, 4500, 1200),
(1004, '2026-01-08', 'Monitor', 'Electronics', 'Delhi', 2, 30000, 5000),
(1005, '2026-01-12', 'Laptop', 'Electronics', 'Mumbai', 1, 45000, 6000),
(1006, '2026-01-15', 'Headphones', 'Accessories', 'Pune', 4, 8000, 2400),
(1007, '2026-01-20', 'Printer', 'Electronics', 'Delhi', 2, 20000, 3500),
(1008, '2026-01-25', 'Mouse', 'Accessories', 'Mumbai', 10, 10000, 3000),
(1009, '2026-02-02', 'Laptop', 'Electronics', 'Pune', 1, 45000, 6000),
(1010, '2026-02-05', 'Keyboard', 'Accessories', 'Delhi', 6, 9000, 2400),
(1011, '2026-02-10', 'Monitor', 'Electronics', 'Mumbai', 3, 45000, 7500),
(1012, '2026-02-15', 'Headphones', 'Accessories', 'Pune', 5, 10000, 3000),
(1013, '2026-02-20', 'Printer', 'Electronics', 'Delhi', 1, 10000, 1800),
(1014, '2026-02-25', 'Mouse', 'Accessories', 'Pune', 8, 8000, 2400),
(1015, '2026-03-03', 'Laptop', 'Electronics', 'Mumbai', 2, 90000, 12000),
(1016, '2026-03-08', 'Keyboard', 'Accessories', 'Pune', 4, 6000, 1600),
(1017, '2026-03-12', 'Monitor', 'Electronics', 'Delhi', 2, 30000, 5000),
(1018, '2026-03-18', 'Headphones', 'Accessories', 'Mumbai', 6, 12000, 3600),
(1019, '2026-03-22', 'Printer', 'Electronics', 'Pune', 2, 20000, 3500),
(1020, '2026-03-28', 'Mouse', 'Accessories', 'Delhi', 7, 7000, 2100);
select*from sales

SELECT product,sales,profit
FROM sales

SELECT*
FROM sales
WHERE city='Pune';

select*
from sales
where city='Pune' and category='Electronics';

select * from sales 
where city='Pune' or city='Mumbai';

select * from sales
where sales>20000;

select * from sales
where sales>=30000;

select * from sales
order by sales asc

select * from sales
order by sales desc limit 5

select distinct city from sales;

select * from sales
where city in ('Pune','Mumbai')

select * from sales
where sales between 10000 and 30000;

select sum(sales) as total_sales
from sales;

select avg(sales) as avg_sales
from sales;

select count(*) as total_orders
from sales;

select city, sum(sales) as total_sales
from sales 
group by city;

select product, sum(sales) as total_sales
from sales
group by product
order by total_sales desc
select 
	category,
	sum(sales) as total_sales,
	sum(profit) as total_profit
from sales
group by category
order by total_sales desc

select city,
sum(sales) as total_sales
from sales
group by city
having sum(sales)>150000

select * from sales
where product like 'L%';

select
min(sales) as min_sales,
max(sales) as max_sales
from sales

select 
	product,
	sum(profit) as total_profit
from sales
group by product
order by total_profit desc;

select product,
sum(quantity) as total_quantity
from sales 
group by product
order by total_quantity desc

select city,
sum(profit) as total_profit
from sales
group by city
order by total_profit desc

select category,
sum(quantity) as total_quantity
from sales
group by category
order by total_quantity desc

select * from sales
order by profit desc limit 1

select * from sales
order by sales desc limit 1

select avg(profit) as avg_profit
from sales

select * from sales
where profit<3000
order by profit asc

select 
month(order_date) as month,
sum(sales) as total_sales
from sales
group by month(order_date)
order by month

select 
month(order_date) as month,
sum(profit) as total_profit
from sales
group by month(order_date)
order by month

select * from sales
where order_date between '2026-01-01' and '2026-01-31'

select order_id,product,sales,
case 
when sales>=50000 then 'High'
when sales>=20000 then 'Medium'
else 'Low'
end as sales_level
from sales

select order_id,product,profit,
case
when profit>=5000 then 'High Profit'
when profit>=2500 then 'Medium Profit'
else 'Low Profit'
end as profit_level
from sales

select order_id,product,sales,
case
when sales>=25000 then 'Target Achieved'
else 'Target Not Achieved'
end as target_status
from sales

select * from sales
where sales > (select avg(sales)from sales);

create table products(
product varchar(50) primary key,
category varchar(50),
unit_price decimal(10,2)
)

insert into products (product, category, unit_price)
values
('Laptop','Electronics',45000),
('Mouse','Accessories',1000),
('Keyboard','Accessories',1500),
('Monitor','Electronics',15000),
('Headphones','Accessories',2000),
('Printer','Electronics',10000)

select * from products

select
s.order_id,
s.product,
s.city,
s.quantity,
s.sales,
p.unit_price
from sales as s
inner join products as p
on s.product = p.product

select
s.order_id,
s.product,
s.sales,
p.unit_price
from sales as s
left join products as p
on s.product = p.product

select
p.product,
p.unit_price,
sum(s.quantity) as units_sold,
sum(s.sales) as total_sales
from products as p
inner join sales as s 
on p.product = s.product
group by p.product,p.unit_price
order by total_sales desc

select
 product,
 sum(sales) as total_sales
from sales
group by product
having sum(sales) > 50000
order by total_sales desc

select
case
when sales>=50000 then 'High Sales'
else 'Low Sales'
end as sales_category,
count(*) as total_orders,
sum(sales) as total_sales
from sales
group by 
case 
when sales>=50000 then 'High Sales'
else 'Low Sales'
end

select 
order_id,
product,
sales,
row_number() over(
order by sales desc)
as row_num
from sales

select 
order_id,
product,
sales,
rank() over(
order by sales desc)
as sales_rank
from sales

use ecommerce_project 

select 
order_id,
product,
city,
sales,
rank() over(
partition by city
order by sales desc)
as city_rank
from sales

select 
city,
count(*) as total_orders,
sum(sales) as total_sales,
sum(profit) as total_profit,
round(avg(sales),2) as avg_order_value
from sales
group by city
order by total_sales desc

select order_id,product,sales
from sales
order by sales desc 
limit 3

select distinct city from sales

select 
p.product,
p.category,
sum(s.quantity) as units_sold,
sum(s.sales) as total_sales,
sum(s.profit) as total_profit,
rank() over(
order by sum(s.sales) desc) as sales_rank
from sales as s
inner join products as p
on s.product=p.product
group by p.product,p.category
order by total_sales desc

use ecommerce_project

select count(*) as total_orders from sales

select sum(sales) as total_sales from sales

select sum(profit) as total_profit from sales 

select count(*) as total_products from products
