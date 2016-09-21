create table tb_user(
  id number(12) primary key,
  username varchar2(50),
  gender varchar2(1),
  age number(3)
)

alter table scott.tb_user add balance number(16,2)

insert into tb_user(id, username, gender, age) values(1, 'zk', 'M', 20);
insert into tb_user(id, username, gender, age) values(2, 'zy', 'F', 12);
insert into tb_user(id, username, gender, age) values(3, 'zq', 'M', 16);

select * from tb_user;


create index idx_tb_user_0 on scott.tb_user(age,balance)
create unique index idx_tb_user_1 on scott.tb_user(username);
create bitmap index idx_tb_user_2 on scott.tb_user(gender);

select * from all_indexes where table_name ='EMP'

drop index idx_tb_user_2

select u.*,rowid from scott.tb_user u where username='zk'

