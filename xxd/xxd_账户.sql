-- �˻�
SELECT * FROM XXD_ACCOUNT
where userid in (114363) and pcode in ('1001','1006');


SELECT * FROM XXD_ACCOUNT where userid=114642;

UPDATE XXD_ACCOUNT SET USABLE=0,FROZEN=0,COLLECTION=0,REPAYMENT=0,ACCOUNTTOTAL=0 WHERE USERID=114432 AND PCODE=1006;
update xxd_account set usable=10000000,frozen=0,collection=0,repayment=0,accounttotal=10000000 where userid=114363 and pcode=1001;

update xxd_account set usable=1000,frozen=0,accounttotal=1000 where userid=114446 and pcode='1001'

update xxd_account set usable=usable-10 where userid=114432 and pcode=1001;

-- �ʽ����ͣ�1ת����2ת�룬3�ڲ�ת����4�ڲ�ת�룬5���ᣬ6�ⶳ��
SELECT REMARK ,busitime,ID,USERID,BUSIID,PCODE,USABLE,WORKMONEY,FROZEN,OPERATORTYPE,MONEYTYPE,SCHEMEID,STATUS,ISSHOW
FROM XXD_ACCOUNT_LOG
WHERE  userid=114363
ORDER BY ADDTIME DESC;

SELECT REMARK ,busitime,ID,USERID,BUSIID,PCODE,USABLE,WORKMONEY,FROZEN,OPERATORTYPE,MONEYTYPE,SCHEMEID,STATUS,ISSHOW
FROM XXD_ACCOUNT_LOG
WHERE  userid=114432
ORDER BY ADDTIME DESC

delete from XXD_ACCOUNT_LOG where busitime>sysdate

-- ״̬��1���� 2�ⶳ
SELECT * FROM XXD_ACCOUNT_FROZEN
--WHERE USERID=114363
where busiid='BW201609099824'
order by addtime desc

SELECT * FROM XXD_ACCOUNT_FROZEN_DETAIL
where frozenid=157962

delete from XXD_ACCOUNT_FROZEN WHERE USERID=114446

update XXD_ACCOUNT_FROZEN set status=2 where frozenid=151299

SELECT * FROM XXD_DIC_COMMON
where typecode like '%OPERATETYPE%' and pkey like 'dedu%'

--
INSERT INTO XXD_DIC_COMMON(TYPECODE,PKEY,PVALUE,STATUS,CREATEDATE,CREATEIP,CREATOR,LASTMODIFY,MODIFYDATE)
values('OPERATETYPE', 'deduct_car_manage_fee', '�豸�����ܷ�',  1, sysdate, '127.0.0.1', 1, 1, sysdate );



-- redis ��Ϣ ����״̬ 1�ѷ���2�Ѵ���
-- topic : step_quit_topic: ���������˳� create_sysuser_trade_apply_topic ϵͳ����ծȨת�� redis_msg_recheck_success_channel ����
-- recharge_trigger_repay_topic ���󻹿�
select id,topic,addtime,operatetime,status,message
FROM XXD_REDIS_MSG
--where topic='create_sysuser_trade_apply_topic'
order by addtime desc

delete from XXD_REDIS_MSG


-- ���ڴ���
update xxd_borrow_repayment set status=1
where userid=114363
and repaymenttime<sysdate and status=0

-- �����ʱ��
UPDATE XXD_BORROW
SET ENDTIME=TO_DATE('2016-06-29 17:00:00','yyyy-mm-dd hh24:mi:ss') 
where borrowid='BW201606299670'


-- �ж��Ƿ�Ϊ����
select * from xxd_borrow_tender where userid=114446;
select * from xxd_optimize_userscheme where userid=114446;
select * from xxd_trade_pack where userid=114446;
select * from xxd_fund_usertrade where userid=114446;

DELETE FROM XXD_BORROW_TENDER WHERE USERID=114446;
delete from xxd_optimize_userscheme where userid=114446;




-- ����

SELECT * FROM XXD_USER WHERE USERID=50


SELECT * FROM XXD_COMPANY
where id='c0c7c76d30bd3dcaefc96f40275bdc0a'

SELECT * FROM XXD_COMPANY
where id='e46b30a36541851f7a2e317154c6ab78'

-- �޸�����Ϊ a111111 b111111
UPDATE XXD_COMPANY SET PROPERTY1='da04abc873aa7c0b8feb4d786f29782e',PROPERTY2='54bf63d268ea9d27b206158d3ce06f21'
WHERE ID='c0c7c76d30bd3dcaefc96f40275bdc0a'


-- ����
select b.username,b.sid,b.serial#,logon_time  
from v$locked_object a,v$session b  
where a.session_id = b.sid order by b.logon_time; 

ALTER SYSTEM KILL SESSION'37,22755';

SELECT * FROM XXD_USER_BASEINFO
where userid=114363

SELECT * FROM XXD_DIC_COMMON
where typecode='BORROW_PAYMENTMETHOD'

