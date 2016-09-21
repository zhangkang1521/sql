drop table small_customers;
drop table medium_customers;
drop table large_customers;

create table small_customers
(
customer_id number(12,0) primary key,
sum_order number(16,2)
);
create table medium_customers
(
customer_id number(12,0) primary key,
sum_order number(16,2)
);
create table large_customers
(
customer_id number(12,0) primary key,
sum_order number(16,2)
);

truncate table large_customers

-- 多表插入,将一个标的数据按条件分别插入不同的表中 insert (all | first) 
-- first:匹配一个条件就结束（if else if else if ... else）
-- all：匹配多个条件(if if ... else)
insert first
when sum_order<10000 then
  into small_customers
when sum_order<100000 then 
  into medium_customers
else
  into large_customers
select customer_id,sum(order_total) sum_order
from orders
group by customer_id

select customer_id,sum(order_total) sum_order
from orders
group by customer_id

select * from small_customers
select * from medium_customers
select * from large_customers

