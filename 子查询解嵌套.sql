--  子查询 解嵌套 (查出所有管理者)
select e.* from oe.employees e
where e.employee_id in(
  select /*+ NO_UNNEST */ manager_id from oe.departments
)

select e.*,d.department_id from oe.employees e
left join oe.departments d on e.employee_id = d.manager_id
where d.manager_id is not null


-- 关联子查询 解嵌套 (查询工资高于同一部门平均工资的员工)
select e1.* 
from oe.employees e1
where e1.salary > (
  select /*+ NO_UNNEST */ avg(salary)
  from oe.employees e2
  where e2.department_id = e1.department_id
) 


  
select e1.*,e2.avg_sal
from oe.employees e1,
    (select department_id,avg(salary) avg_sal
     from oe.employees
     group by department_id
    ) e2
where e1.department_id = e2.department_id and e1.salary > e2.avg_sal 