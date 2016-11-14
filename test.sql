SELECT * from all_tables
where table_name = 'EMPLOYEES'

SELECT * from dba_synonyms
where owner='SYS'

select * from all_indexes
where table_name='TB_USER'

select * from tb_user

select count(*) from tb_user
select count(username) from scott.tb_user
select count(gender) from scott.tb_user



create index idx_tb_user_0 on scott.tb_user(username)

select e1.*, e2.avg_salary
from employees e1,
  (
    select department_id,avg(salary) as avg_salary
    from employees
    group by department_id   
  ) e2
where e1.department_id = e2.department_id  
and e1.salary > e2.avg_salary
and e1.department_id=60

select * from emp