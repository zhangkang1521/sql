drop table dept60_bonuses
-- merge �÷�
create table dept60_bonuses(
employee_id number(12) primary key,
bonus_amt number(12,2)
);

insert into dept60_bonuses(employee_id,bonus_amt) values(103, 0);
insert into dept60_bonuses(employee_id,bonus_amt) values(104, 100);
insert into dept60_bonuses(employee_id,bonus_amt) values(105, 0);



merge into dept60_bonuses b
using (
  select employee_id,salary from employees
  where department_id=60
) e 
on (b.employee_id = e.employee_id)
when matched then -- ƥ���Ͽ��Ը��»�ɾ��
  update set b.bonus_amt = e.salary*0.2
  where b.bonus_amt = 0
  delete where e.salary > 7500
when not matched then -- û��ƥ���� ���Բ���
  insert (b.employee_id,b.bonus_amt)
  values (e.employee_id, e.salary*0.1)
  where e.salary<4500

select employee_id,salary from employees
where department_id=60

select * from   dept60_bonuses