-- 新增菜单
insert into xxd_menu_resource (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '0923', 'sms/recordList.do', 2, '09', '短信验证码发送状态查询', 1, '', '', '', 1, sysdate, 1, sysdate, 25);

-- 增加权限
insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || '权限',xmr.menuid,xmr.name || '权限说明',1,1,sysdate,0,sysdate,0 
from xxd_menu_resource xmr
where xmr.url is not null and xmr.menucode='0923';


SELECT * FROM XXD_PERMISSION WHERE MENUID IN(10998)
delete from XXD_PERMISSION WHERE MENUID IN(10998)

SELECT * FROM XXD_MENU_RESOURCE
WHERE NAME LIKE '%日日盈%'

update XXD_MENU_RESOURCE set name='日日盈' where menuid=10699

delete from XXD_MENU_RESOURCE where menuid=10998


SELECT * FROM XXD_MENU_RESOURCE
where name like '%车%'


SELECT * FROM XXD_MENU_RESOURCE 
where   menucode in('113201','111101')

SELECT * FROM XXD_MENU_RESOURCE
WHERE MENUCODE LIKE '51%' AND LENGTH(MENUCODE)=4 
and menucode in('1111', '1132')
order by menucode

delete from XXD_MENU_RESOURCE where menucode='113201'

-- 财务中心 新增菜单
INSERT INTO XXD_MENU_RESOURCE (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '1132', null, 2, '11', '步步高升', 2, '', '', '', 1, sysdate, 1, sysdate, 25);

INSERT INTO XXD_MENU_RESOURCE (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '113201', 'step/stepAccount.do', 3, '1132', '步步高升账户管理', 1, '', '', 'step', 1, sysdate, 25, sysdate, 25);

insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || '权限',xmr.menuid,xmr.name || '权限说明',1,1,sysdate,0,sysdate,0 
FROM XXD_MENU_RESOURCE XMR
where xmr.url is not null and xmr.menucode='113201';



-- 产品管理 修改 新增菜单
UPDATE XXD_MENU_RESOURCE SET NAME='不固定周期理财产品' WHERE MENUCODE='51';
UPDATE XXD_MENU_RESOURCE SET NAME='日日盈基金列表' WHERE MENUCODE='5101';

INSERT INTO XXD_MENU_RESOURCE (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '5102', 'step/stepList.do', 3, '51'
, '步步高升账户理财', 1, '', '', 'step', 1, sysdate, 25, sysdate, 25);

insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || '权限',xmr.menuid,xmr.name || '权限说明',1,1,sysdate,0,sysdate,0 
FROM XXD_MENU_RESOURCE XMR
where xmr.url is not null and xmr.menucode='5102';