/** 
  
 */

select * 
from oe.orders o,
    (select /*+ NO_MERGE */sales_rep_id
     from oe.orders
    ) o_view
where o.sales_rep_id = o_view.sales_rep_id(+)
and o.order_total > 100000;

select * from oe.orders
where order_total>100000

select * from oe.orders
where sales_rep_id=161 and order_total>100000

select * from oe.orders
where sales_rep_id is null and order_total>100000

-- 查出所有管理者id 子查询解嵌套
select e.* from oe.employees e
where e.employee_id in(
  select /*+ NO_UNNEST */ manager_id from oe.departments
)

select e.*,d.department_name from oe.employees e
left join oe.departments d on e.employee_id = d.manager_id
where d.manager_id is not null

select * from oe.employees
where employee_id=205

select * from oe.departments
--where manager_id=147
order by manager_id

-- 关联子查询
select * 
from oe.employees e1
where e1.salary > (
  sele
)
