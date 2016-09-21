
drop table tb_menu;
create table tb_menu(
 id number(10) primary key, --主键id
 title varchar2(50), --标题
  parent number(10) --parent id
)

insert into tb_menu(id, title, parent) values(1, '根菜单1',null);
insert into tb_menu(id, title, parent) values(2, '根菜单2',null);

insert into tb_menu(id, title, parent) values(3, '一级菜单11',1);
insert into tb_menu(id, title, parent) values(4, '一级菜单12',1);

insert into tb_menu(id, title, parent) values(5, '一级菜单21',2);
insert into tb_menu(id, title, parent) values(6, '一级菜单22',2);
insert into tb_menu(id, title, parent) values(7, '一级菜单23',2);

insert into tb_menu(id, title, parent) values(11, '二级菜单111',3);
insert into tb_menu(id, title, parent) values(12, '二级菜单112',3);
insert into tb_menu(id, title, parent) values(13, '二级菜单113',3);

insert into tb_menu(id, title, parent) values(14, '二级菜单121',4);
insert into tb_menu(id, title, parent) values(15, '二级菜单122',4);

-- 查找所有子孙节点
select * from tb_menu m 
start with m.id=3
connect by m.parent=prior m.id;

-- 所有祖宗节点
select * from tb_menu m 
start with m.id=13 
connect by prior m.parent=m.id;

-- 查父亲节点
select * from tb_menu 
where id=(select parent from tb_menu where id=13)

select m1.* from tb_menu m1
inner join tb_menu m2 on m1.id=m2.parent
where m2.id=13

-- 查兄弟节点
select * from tb_menu 
where parent=(
  select parent from tb_menu
  where id=13)
  
select * from tb_menu m
where exists (select * from tb_menu m2 where m.parent=m2.parent and m2.id=13)

select m1.* from tb_menu m1
inner join tb_menu m2 on m1.parent=m2.parent
where m2.id=13

-- 查询同级菜单 with as 重用子查询
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

-- 列出全路径
select sys_connect_by_path (title, '/')
from tb_menu
where id = 13
start with parent is null
connect by parent = prior id

select sys_connect_by_path (title, '/')
from tb_menu
start with id = 13
connect by prior parent = id;

-- 当前节点的根节点
select *
from tb_menu
where parent is null
start with id = 13
connect by prior parent = id;


-- 是否为叶子节点
select connect_by_isleaf, tb_menu.*
from tb_menu
start with parent is null
connect by parent = prior id;

select * from tb_menu 
where parent=1
