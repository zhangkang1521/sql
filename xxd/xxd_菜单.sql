-- �����˵�
insert into xxd_menu_resource (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '0923', 'sms/recordList.do', 2, '09', '������֤�뷢��״̬��ѯ', 1, '', '', '', 1, sysdate, 1, sysdate, 25);

-- ����Ȩ��
insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || 'Ȩ��',xmr.menuid,xmr.name || 'Ȩ��˵��',1,1,sysdate,0,sysdate,0 
from xxd_menu_resource xmr
where xmr.url is not null and xmr.menucode='0923';


SELECT * FROM XXD_PERMISSION WHERE MENUID IN(10998)
delete from XXD_PERMISSION WHERE MENUID IN(10998)

SELECT * FROM XXD_MENU_RESOURCE
WHERE NAME LIKE '%����ӯ%'

update XXD_MENU_RESOURCE set name='����ӯ' where menuid=10699

delete from XXD_MENU_RESOURCE where menuid=10998


SELECT * FROM XXD_MENU_RESOURCE
where name like '%��%'


SELECT * FROM XXD_MENU_RESOURCE 
where   menucode in('113201','111101')

SELECT * FROM XXD_MENU_RESOURCE
WHERE MENUCODE LIKE '51%' AND LENGTH(MENUCODE)=4 
and menucode in('1111', '1132')
order by menucode

delete from XXD_MENU_RESOURCE where menucode='113201'

-- �������� �����˵�
INSERT INTO XXD_MENU_RESOURCE (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '1132', null, 2, '11', '��������', 2, '', '', '', 1, sysdate, 1, sysdate, 25);

INSERT INTO XXD_MENU_RESOURCE (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '113201', 'step/stepAccount.do', 3, '1132', '���������˻�����', 1, '', '', 'step', 1, sysdate, 25, sysdate, 25);

insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || 'Ȩ��',xmr.menuid,xmr.name || 'Ȩ��˵��',1,1,sysdate,0,sysdate,0 
FROM XXD_MENU_RESOURCE XMR
where xmr.url is not null and xmr.menucode='113201';



-- ��Ʒ���� �޸� �����˵�
UPDATE XXD_MENU_RESOURCE SET NAME='���̶�������Ʋ�Ʒ' WHERE MENUCODE='51';
UPDATE XXD_MENU_RESOURCE SET NAME='����ӯ�����б�' WHERE MENUCODE='5101';

INSERT INTO XXD_MENU_RESOURCE (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '5102', 'step/stepList.do', 3, '51'
, '���������˻����', 1, '', '', 'step', 1, sysdate, 25, sysdate, 25);

insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || 'Ȩ��',xmr.menuid,xmr.name || 'Ȩ��˵��',1,1,sysdate,0,sysdate,0 
FROM XXD_MENU_RESOURCE XMR
where xmr.url is not null and xmr.menucode='5102';