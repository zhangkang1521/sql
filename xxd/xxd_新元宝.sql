
-- 新元宝
-- status 状态0待发布1销售中2封闭期3开放期5撤销7封闭期结束
SELECT -- *
schemeid,pname,account,remacount,opensalebegin,opensaleend,closeterm,minapr,maxapr,remacount,blevel,status,version
FROM XXD_OPTIMIZE_SCHEME
--where schemeid='OS20161104457'
order by createdate desc




update XXD_OPTIMIZE_SCHEME set pname='20161111999期' where schemeid='OS20161110012'

update XXD_OPTIMIZE_SCHEME set opensaleend=to_date('2016-11-10 14:04:22','yyyy-mm-dd hh24:mi:ss') where schemeid='OS20161110011'



select * from XXD_PRODUCT_FLOAT_APR
WHERE PRODID='OS20161103002'

update XXD_PRODUCT_FLOAT_APR set pc=0 where id=80

insert into XXD_PRODUCT_FLOAT_APR(id,prodid,prodtype,pc,app,webapp)
values(SEQ_PRODUCT_FLOAT_APR.nextval, 'OS20161103002', 'PLAN', 0.55, 0, 0)


-- 新元宝投标记录 
-- 状态0待扣款1投标中5撤销6提前退出7到期退出 8退出中
SELECT * FROM XXD_OPTIMIZE_USERSCHEME
where schemeid='OS20161104457'
--where userschemeid='OU2016092601844'
order by addtime desc



delete from XXD_OPTIMIZE_USERSCHEME where  schemeid  in('OS20161010548')
 
 
 select ou.userschemeid,round(ou.account * os.minapr *os.closeterm/12/100, 2) as expectedInterest
 from XXD_OPTIMIZE_USERSCHEME ou
 inner join XXD_OPTIMIZE_SCHEME os on ou.schemeid=os.schemeid and os.version='v2.0'
 





update XXD_OPTIMIZE_USERSCHEME set remaccount=remaccount+10 where userschemeid='OU2016100501838'
UPDATE XXD_ACCOUNT SET USABLE=usable+10 WHERE USERID=114432 AND PCODE=1004;

SELECT * FROM XXD_OPTIMIZE_USERDETAIL
--where floatapr is null
where userschemeid='OU2016110501888'
order by addtime asc

update XXD_OPTIMIZE_USERDETAIL set apr=null,floatapr=null where userschemeid='OU2016070101505'

-- 新元宝退出债权记录
SELECT * FROM XXD_OPTIMIZE_TRADE
where schemeid='SJ201607125006'




-- 新元宝自动投标 条件 已经进入锁定期 没有退出
SELECT *   FROM XXD_OPTIMIZE_SCHEME WHERE OPENSALEEND < SYSDATE AND ADD_MONTHS(OPENSALEEND,CLOSETERM) >= SYSDATE 
AND BLEVEL=1 AND MINAPR<=7







-- 新增新元宝
INSERT INTO XXD_V6_TEST.XXD_OPTIMIZE_SCHEME (ACCOUNT, BLEVEL, CLOSETERM, CREATEDATE, CREATEIP, CREATOR, DESCRIPTION,
EARNESTMAX, EARNESTPERCENT, FORFEITPERCENT, LASTMODIFY, LEASTAMOUNT, MAXAPR, MINAPR,
MODIFYDATE, MOSTAMOUNT, OPENSALEBEGIN, OPENSALEEND, PNAME,
PRESALEBEGIN, PRESALEEND, PRESALEPAYEND, 
REMACOUNT, STATUS, STEP, TENDERDESC, TYPE, VERSION, SCHEMEID)
VALUES (5000, 1, 1, SYSDATE, '127.0.0.1', 25, 'xxx',
0, 0, 1, NULL, 100, 7, 7, 
NULL, 1000000, SYSDATE, sysdate+5/(24*60), '新元宝-吃系统债权-12', 
SYSDATE, SYSDATE,SYSDATE, 
5000, 0, 1, 1, 4, 'v2.0', 'OS20161110012');




insert into XXD_PRODUCT_FLOAT_APR(id,prodid,prodtype,floataprtype,floatapr)
values(SEQ_PRODUCT_FLOAT_APR.nextval, 'OS20160929103', 'PLAN', 'WEBAPP', 2)




-- 新元宝清数据
delete from XXD_OPTIMIZE_SCHEME;
delete from XXD_OPTIMIZE_USERSCHEME;
delete from XXD_OPTIMIZE_USERDETAIL;
delete from xxd_account_log;
delete from xxd_redis_msg;




select * from xxd_sysconfig
where syskey like '%SYSTEM_USERID%'

select *
from XXD_ACTIVITY activity0_ where activity0_.ACTIVITYCODE='october-vip-activity' and activity0_.STATUS=2

insert into xxd_activity
  (ID,ACTIVITYNAME,ACTIVITYCODE,STARTTIME,ENDTIME,
  ACTIVITYTYPE,PROMOTIONTYPE,STATUS,
  ONLINESTARTTIME,addtime,addempid,modifytime,MODIFYEMPID)
values
  (SEQ_ACTIVITY.nextval,'会员活动','october-vip-activity',to_date('2016-10-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),to_date('2016-10-22 23:59:59', 'yyyy-mm-dd hh24:mi:ss'),
  1,1,2,
  to_date('2016-10-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),sysdate,1,sysdate,1)

update xxd_activity set activitycode='october-vip-activity' where id=107

-- SYSTEM_STEP_USERID SYSTEM_USERID YYP_SYS_USERID
select * from xxd_sysconfig
where syskey like '%SYS%'