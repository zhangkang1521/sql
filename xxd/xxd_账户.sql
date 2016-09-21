-- 账户
SELECT * FROM XXD_ACCOUNT
where userid in (114363) and pcode in ('1001','1006');


SELECT * FROM XXD_ACCOUNT where userid=114642;

UPDATE XXD_ACCOUNT SET USABLE=0,FROZEN=0,COLLECTION=0,REPAYMENT=0,ACCOUNTTOTAL=0 WHERE USERID=114432 AND PCODE=1006;
update xxd_account set usable=10000000,frozen=0,collection=0,repayment=0,accounttotal=10000000 where userid=114363 and pcode=1001;

update xxd_account set usable=1000,frozen=0,accounttotal=1000 where userid=114446 and pcode='1001'

update xxd_account set usable=usable-10 where userid=114432 and pcode=1001;

-- 资金类型（1转出，2转入，3内部转出，4内部转入，5冻结，6解冻）
SELECT REMARK ,busitime,ID,USERID,BUSIID,PCODE,USABLE,WORKMONEY,FROZEN,OPERATORTYPE,MONEYTYPE,SCHEMEID,STATUS,ISSHOW
FROM XXD_ACCOUNT_LOG
WHERE  userid=114363
ORDER BY ADDTIME DESC;

SELECT REMARK ,busitime,ID,USERID,BUSIID,PCODE,USABLE,WORKMONEY,FROZEN,OPERATORTYPE,MONEYTYPE,SCHEMEID,STATUS,ISSHOW
FROM XXD_ACCOUNT_LOG
WHERE  userid=114432
ORDER BY ADDTIME DESC

delete from XXD_ACCOUNT_LOG where busitime>sysdate

-- 状态：1冻结 2解冻
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
values('OPERATETYPE', 'deduct_car_manage_fee', '设备及保管费',  1, sysdate, '127.0.0.1', 1, 1, sysdate );



-- redis 消息 处理状态 1已发送2已处理
-- topic : step_quit_topic: 步步高升退出 create_sysuser_trade_apply_topic 系统发起债权转让 redis_msg_recheck_success_channel 满标
-- recharge_trigger_repay_topic 贷后还款
select id,topic,addtime,operatetime,status,message
FROM XXD_REDIS_MSG
--where topic='create_sysuser_trade_apply_topic'
order by addtime desc

delete from XXD_REDIS_MSG


-- 逾期处理
update xxd_borrow_repayment set status=1
where userid=114363
and repaymenttime<sysdate and status=0

-- 流标改时间
UPDATE XXD_BORROW
SET ENDTIME=TO_DATE('2016-06-29 17:00:00','yyyy-mm-dd hh24:mi:ss') 
where borrowid='BW201606299670'


-- 判断是否为新手
select * from xxd_borrow_tender where userid=114446;
select * from xxd_optimize_userscheme where userid=114446;
select * from xxd_trade_pack where userid=114446;
select * from xxd_fund_usertrade where userid=114446;

DELETE FROM XXD_BORROW_TENDER WHERE USERID=114446;
delete from xxd_optimize_userscheme where userid=114446;




-- 密码

SELECT * FROM XXD_USER WHERE USERID=50


SELECT * FROM XXD_COMPANY
where id='c0c7c76d30bd3dcaefc96f40275bdc0a'

SELECT * FROM XXD_COMPANY
where id='e46b30a36541851f7a2e317154c6ab78'

-- 修改密码为 a111111 b111111
UPDATE XXD_COMPANY SET PROPERTY1='da04abc873aa7c0b8feb4d786f29782e',PROPERTY2='54bf63d268ea9d27b206158d3ce06f21'
WHERE ID='c0c7c76d30bd3dcaefc96f40275bdc0a'


-- 解锁
select b.username,b.sid,b.serial#,logon_time  
from v$locked_object a,v$session b  
where a.session_id = b.sid order by b.logon_time; 

ALTER SYSTEM KILL SESSION'37,22755';

SELECT * FROM XXD_USER_BASEINFO
where userid=114363

SELECT * FROM XXD_DIC_COMMON
where typecode='BORROW_PAYMENTMETHOD'

