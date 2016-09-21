
drop table tb_menu;
create table tb_menu(
 id number(10) primary key, --����id
 title varchar2(50), --����
  parent number(10) --parent id
)

insert into tb_menu(id, title, parent) values(1, '���˵�1',null);
insert into tb_menu(id, title, parent) values(2, '���˵�2',null);

insert into tb_menu(id, title, parent) values(3, 'һ���˵�11',1);
insert into tb_menu(id, title, parent) values(4, 'һ���˵�12',1);

insert into tb_menu(id, title, parent) values(5, 'һ���˵�21',2);
insert into tb_menu(id, title, parent) values(6, 'һ���˵�22',2);
insert into tb_menu(id, title, parent) values(7, 'һ���˵�23',2);

insert into tb_menu(id, title, parent) values(11, '�����˵�111',3);
insert into tb_menu(id, title, parent) values(12, '�����˵�112',3);
insert into tb_menu(id, title, parent) values(13, '�����˵�113',3);

insert into tb_menu(id, title, parent) values(14, '�����˵�121',4);
insert into tb_menu(id, title, parent) values(15, '�����˵�122',4);

-- ������������ڵ�
select * from tb_menu m 
start with m.id=3
connect by m.parent=prior m.id;

-- �������ڽڵ�
select * from tb_menu m 
start with m.id=13 
connect by prior m.parent=m.id;

-- �鸸�׽ڵ�
select * from tb_menu 
where id=(select parent from tb_menu where id=13)

select m1.* from tb_menu m1
inner join tb_menu m2 on m1.id=m2.parent
where m2.id=13

-- ���ֵܽڵ�
select * from tb_menu 
where parent=(
  select parent from tb_menu
  where id=13)
  
select * from tb_menu m
where exists (select * from tb_menu m2 where m.parent=m2.parent and m2.id=13)

select m1.* from tb_menu m1
inner join tb_menu m2 on m1.parent=m2.parent
where m2.id=13

-- ��ѯͬ���˵� with as �����Ӳ�ѯ
with tmp as(
      select a.*, level leaf        
      from tb_menu a                
      start with a.parent is null     
      connect by a.parent = prior a.id)
select *                               
from tmp                             
where leaf = (select leaf from tmp where id = 13);

with tmp as (select * from tb_menu)
select * from tmp where id=11

select m.*,level from tb_menu m
start with m.parent is null
connect by m.parent= prior m.id

-- �г�ȫ·��
select sys_connect_by_path (title, '/')
from tb_menu
where id = 13
start with parent is null
connect by parent = prior id

select sys_connect_by_path (title, '/')
from tb_menu
start with id = 13
connect by prior parent = id;

-- ��ǰ�ڵ�ĸ��ڵ�
select *
from tb_menu
where parent is null
start with id = 13
connect by prior parent = id;


-- �Ƿ�ΪҶ�ӽڵ�
select connect_by_isleaf, tb_menu.*
from tb_menu
start with parent is null
connect by parent = prior id;

select * from tb_menu 
where parent=1
