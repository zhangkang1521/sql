SELECT * FROM XXD_STEP
update XXD_STEP set maxapr=12 

delete from XXD_STEP where stepid='ST201609013'



UPDATE XXD_STEP_JOIN SET ADDTIME=TO_DATE('2016-07-4 14:42:02', 'yyyy-mm-dd hh24:mi:ss') WHERE STEPJOINID='SJ2016083000027';
update xxd_step_join set redvalue=10 where stepjoinid='SJ2016080200005'


-- ��������Ͷ��
SELECT * FROM XXD_STEP_JOIN 
where status=1 and tenderaccount>0

update XXD_STEP_JOIN set tenderaccount=0 where tenderaccount>0 and status=1 and userid!=114432

-- ״̬0֧����1Ͷ����2����-1֧��ʧ��
SELECT * FROM XXD_STEP_JOIN
WHERE USERID=114432 
order by stepjoinid desc

update xxd_step_join set tenderaccount=tenderaccount+10 where stepjoinid='SJ2016082600022'





-- �˳�״̬��0.�˳��� 1.���˳� -1.�˳�ʧ�ܣ�
SELECT * FROM XXD_STEP_QUIT
--here stepjoinid='SJ2016081600193'
ORDER BY ADDTIME DESC




--delete from XXD_STEP_QUIT where stepquitid='SQ2016082407052'

update XXD_STEP_QUIT set addtime=add_months(addtime,-12) where stepquitid='SQ2016083000055'

SELECT * FROM XXD_OPTIMIZE_TRADE
where schemeid='SJ2016080100001'




SELECT * FROM XXD_DIC_COMMON
where PKEY like '%step%'

SELECT * FROM XXD_DIC_COMMON
where PKEY like '%plan%'


INSERT INTO XXD_DIC_COMMON(TYPECODE,PKEY,PVALUE,STATUS,CREATEDATE,CREATEIP,CREATOR,LASTMODIFY,MODIFYDATE)
values('OPERATETYPE', 'step_quit_usable_inner_in', '�ʽ��ڲ�ת��',  1, sysdate, '127.0.0.1', 1, 1, sysdate )

INSERT INTO XXD_DIC_COMMON(TYPECODE,PKEY,PVALUE,STATUS,CREATEDATE,CREATEIP,CREATOR,LASTMODIFY,MODIFYDATE)
values('OPERATETYPE', 'advance_quit_step_withdraw_redenvelop', '��ǰ�˳������������ջغ��',  1, sysdate, '127.0.0.1', 1, 1, sysdate )



SELECT * FROM XXD_SYSCONFIG
where syskey like '%STEP%'

INSERT INTO XXD_SYSCONFIG(SYSKEY,SYSKEYVALUE,NOTES,ADDTIME,ADDUSERID,MODIFYDATE,LASTMODIFY)
values('SHOW_STEP', 'true', '�Ƿ���ʾ��������',sysdate, 0, sysdate, 0);

update XXD_SYSCONFIG set syskeyvalue='1000000' where syskey='STEP_SPLIT_COUNT'

ALTER TABLE XXD_STEP_QUIT
add userid number(38,0)

ALTER TABLE XXD_STEP_JOIN
modify balancemoney default 0 not null;

SELECT * FROM XXD_STEP_JOIN
where balancemoney is null

update XXD_STEP_JOIN set balancemoney = 0 where balancemoney is null

ALTER TABLE XXD_STEP_QUIT
ADD HOLDDAY NUMBER(16, 0)
add balancemoney number(16,2);

COMMENT ON COLUMN XXD_STEP_QUIT.HOLDDAY IS '��������';
COMMENT ON COLUMN XXD_STEP_QUIT.balancemoney IS '�����ٲ����������ٲ������������ˣ�';







