select * from xxd_employee
where name like '张琪'
where employeeid in(25,3902,3716)

update xxd_employee set oastatus=0,isdkey=0,password='96e79218965eb72c92a549dd5a330112',safepassword='96e79218965eb72c92a549dd5a330112' where employeeid=3903
update xxd_employee set supervisor=3902 where employeeid=3903

-- positno 是否是管理岗位
select * from xxd_position

select * from xxd_department

select * from xxd_offline_performance
order by yearmonth

delete from xxd_offline_performance where yearmonth=''

delete from xxd_offline_performance


select * from xxd_RoyaltyRate_performence

select * from xxd_vip_appro;
select * from xxd_employee
where jobnum='IT001'


select * from xxd_performance_statistics

update xxd_performance_statistics 
set employeeid=3902
where id=2

select nvl(sum(amount),0),nvl(sum(yearperformance), 0)
from xxd_performance_statistics
where employeeid=25 and isonline=1 and to_char(addtime,'yyyymm')='201612'

select 

delete from xxd_vip_appro

-- OA状态,0 试用1 正式2 临时3 试用延期4 解聘5 离职6 退休7 无效8 在职9 全部
select * from xxd_employee where status = 1 and oastatus in (0,1,2,3,8,9)



-- 散标债权 业绩
SELECT 
      upper(va.servicenum) AS jobNum,
       TO_CHAR(bt.addtime, 'yyyymm') AS thisMonth,
       round(sum(nvl(bt.effectivemoney, 0))) AS s_performance,
       round(sum(
       CASE WHEN TYPE IN (13,17) THEN nvl(bt.effectivemoney, 0) * (b.period/ 360) -- 按天
       WHEN PAYMENTMETHOD = 6 THEN nvl(bt.effectivemoney, 0) * b.period * 3 / 12 -- 按季
       WHEN PAYMENTMETHOD IN (5,7,8) THEN nvl(bt.effectivemoney, 0) * (decode(bt.terms,NULL,b.period,bt.terms) / 12) -- 按月
       ELSE nvl(bt.effectivemoney, 0) * (decode(bt.terms,NULL,b.period,bt.terms) / 12) END), 2) AS y_performance
FROM xxd_borrow b, xxd_vip_appro va,
  (SELECT bt.tenderid,
          bt.borrowid,
          DECODE(tpr.packid, NULL, bt.curuserid, tpr.userid) AS userid,
          DECODE(tpr.packid, NULL, bt.effectivemoney, tpr.AMOUNT) AS effectivemoney,
          decode(tpr.packid, NULL, bt.addtime, tpr.addtime) AS addtime,
          tpr.terms AS terms
   FROM xxd_borrow_tender bt,
     (SELECT tr.tenderid,
             tr.amount,
             tp.packid,
             tp.userid,
             tp.addtime,
             tp.terms
      FROM xxd_trade_request tr,
           xxd_trade_pack tp
      WHERE tr.requestid = tp.requestid
        AND tr.status = 2
        AND tp.inmethod = 1) tpr
   WHERE bt.tenderid = tpr.tenderid(+)
     AND bt.isoptimize = 0
     AND (bt.schemeId IS NULL
          OR bt.schemeId='0')
     AND bt.status IN (1,
                       2)) bt
WHERE b.borrowid = bt.borrowid
  AND va.userid = bt.userid
  AND va.status = 1
  AND b.status IN (4,
                   5)
  AND to_char(bt.addTime,'YYYYMM') IN ('201610')
GROUP BY va.SERVICENUM,
         TO_CHAR(bt.addtime, 'yyyymm')
         
SELECT 
       TO_CHAR(bt.addtime, 'yyyymm') AS thisMonth,
       round(nvl(bt.effectivemoney, 0)) AS s_performance,
       bt.userid
FROM xxd_borrow b,
  (SELECT bt.tenderid,
          bt.borrowid,
          DECODE(tpr.packid, NULL, bt.curuserid, tpr.userid) AS userid, -- 有人接债权，则算到接债权人头上
          DECODE(tpr.packid, NULL, bt.effectivemoney, tpr.AMOUNT) AS effectivemoney,
          decode(tpr.packid, NULL, bt.addtime, tpr.addtime) AS addtime,
          tpr.terms AS terms
   FROM xxd_borrow_tender bt,
     (SELECT tr.tenderid,
             tr.amount,
             tp.packid,
             tp.userid,
             tp.addtime,
             tp.terms
      FROM xxd_trade_request tr,
           xxd_trade_pack tp
      WHERE tr.requestid = tp.requestid
        AND tr.status = 2
        AND tp.inmethod = 1) tpr
   WHERE bt.tenderid = tpr.tenderid(+)
     AND bt.isoptimize = 0
     AND (bt.schemeId IS NULL
          OR bt.schemeId='0')
     AND bt.status IN (1,
                       2)) bt
WHERE b.borrowid = bt.borrowid
  AND b.status IN (4, 5)
  AND to_char(bt.addTime,'YYYYMM') IN ('201610')
       
-- -- 散标债权 业绩 end         

-- 新元宝
SELECT ROUND(nvl(t.s_performance,0),2) AS s_performance,
       ROUND(nvl(t.y_performance,0),2) AS y_performance,
       va.SERVICENUM AS jobnum
FROM
  (SELECT ou.userid,
          round(SUM((CASE WHEN ou.status = 6
                     AND trunc(ou.enddate)>trunc(ou.addtime) THEN ceil(MONTHS_BETWEEN(add_months(ou.opendate, os.CLOSETERM), ou.enddate)) * ou.account * (-1) WHEN ou.status = 6
                     AND trunc(ou.enddate)=trunc(ou.addtime) THEN 0 ELSE ou.account* os.CLOSETERM END) / 12), 2) AS y_performance,
          round(sum((CASE WHEN ou.status = 6 AND trunc(ou.enddate)>trunc(ou.addtime) 
                            THEN ou.account * (-1) 
                    WHEN ou.status = 6 AND trunc(ou.enddate)=trunc(ou.addtime) 
                            THEN 0 
                    ELSE ou.account END)), 2) AS s_performance
   FROM XXD_OPTIMIZE_USERSCHEME ou,
        XXD_OPTIMIZE_SCHEME os
   WHERE ou.schemeid = os.schemeid
     AND ou.status NOT IN (0,
                           5)
     AND TO_CHAR(ou.opendate,'YYYYMM') <= '201610'
     AND (TO_CHAR(ou.addtime,'YYYYMM')='201610'
          OR (ou.status = 6
              AND TO_CHAR(ou.enddate,'YYYYMM')='201610'))
     AND ou.opendate<=sysdate
   GROUP BY ou.userid) t ,
                       xxd_user u,
                       xxd_vip_appro va
WHERE t.userid = u.userid
  AND u.userid=va.userid
  AND va.status=1
  
  -- 简化
  SELECT ou.userid,
          round((CASE WHEN ou.status = 6 AND trunc(ou.enddate)>trunc(ou.addtime) 
                        THEN ceil(MONTHS_BETWEEN(add_months(ou.opendate, os.CLOSETERM), ou.enddate)) * ou.account * (-1) 
                      WHEN ou.status = 6 AND trunc(ou.enddate)=trunc(ou.addtime) 
                        THEN 0 
                      ELSE ou.account* os.CLOSETERM END) / 12, 2) AS y_performance,
          round((CASE WHEN ou.status = 6 AND trunc(ou.enddate)>trunc(ou.addtime)  -- 提前退出 负业绩
                            THEN ou.account * (-1) 
                    WHEN ou.status = 6 AND trunc(ou.enddate)=trunc(ou.addtime)  --当天退出为0
                            THEN 0 
                    ELSE ou.account END), 2) AS s_performance
   FROM XXD_OPTIMIZE_USERSCHEME ou,
        XXD_OPTIMIZE_SCHEME os
   WHERE ou.schemeid = os.schemeid
     AND ou.status NOT IN (0,5) -- 0待扣款1投标中5撤销6提前退出7到期退出 8退出中
     AND TO_CHAR(ou.opendate,'YYYYMM') <= '201610'
     AND ( TO_CHAR(ou.addtime,'YYYYMM')='201610' -- 10月份加入
          OR (ou.status = 6 AND TO_CHAR(ou.enddate,'YYYYMM')='201610')) -- 10月份提前退出
     AND ou.opendate<=sysdate
   --GROUP BY ou.userid

-- 新元宝 end

-- 日日盈
SELECT va.SERVICENUM AS jobNum,
       ROUND(SUM(nvl(t.y_performance, 0)), 2) AS y_performance,
       ROUND(SUM(nvl(t.s_performance, 0)), 2) AS s_performance
FROM
  (SELECT userid,
          sum(fu.account/12) AS y_performance,
          sum(fu.account) AS s_performance
   FROM xxd_fund_usertotal fu
   WHERE createdate< trunc(add_months(last_day(to_date('201610', 'yyyyMM')), 0) + 1)
   GROUP BY userid) t,
                    xxd_user u,
                    xxd_vip_appro va
WHERE u.userid = va.userid
  AND t.userid = u.userid
  AND va.status = 1
GROUP BY va.servicenum

select trunc(add_months(last_day(to_date('201610', 'yyyyMM')), 0) + 1) from dual

-- 日日盈 end

-- 线下理财业绩 --
SELECT ROUND(SUM(nvl(MONEY,0)),2) AS s_performance,
       ROUND(SUM(ROUND((endTime-startTime)/30)/12*nvl(MONEY,0)),2) AS y_performance,
       e.jobnum,
       to_char(op.startTime, 'YYYYMM') AS thisMonth
FROM xxd_employee e
INNER JOIN XXD_OFFLINE_USERMANAGE xu ON e.EMPLOYEEID=xu.EMPLOYEEID
INNER JOIN xxd_offline_userproduct op ON xu.userid=op.userid
WHERE xu.status=1
  AND op.status='3'
  AND to_char(op.startTime, 'YYYYMM') IN ('201610')
GROUP BY e.jobnum,
         to_char(op.startTime, 'YYYYMM')
-- 线下理财业绩 --    

-- 线上净值业绩 --
SELECT ROUND(SUM(nvl(b.account,0)),2) s_performance,
       ROUND(SUM(nvl(b.account,0)*nvl(b.timeLimit,0)/12),2) y_performance,
       va.SERVICENUM,
       to_char(b.addTime,'YYYYMM') AS thisMonth
FROM xxd_borrow b
LEFT JOIN xxd_borrow_approved ba ON b.borrowid = ba.borrowId
LEFT JOIN xxd_vip_appro va ON va.userId=b.userId
WHERE ba.status =4
  AND b.status = 5
  AND b.type=3 -- 净值标
  AND va.status=1
  AND to_char(b.addTime,'YYYYMM') IN ('201610')
GROUP BY va.SERVICENUM,
         to_char(b.addTime,'YYYYMM')
-- 线上净值业绩 end --       

select id, employeeid,jobnum,servicenum,departmentid,userid,busiid,busitype,amount,period,periodUnit,yearPerformance,addtime,collectiontime
from xxd_performance_statistics


select seq_performance_statistics.nextval from dual

create sequence seq_performance_statistics
start with 1
increment by 1


insert into xxd_performance_statistics(id, employeeid,jobnum,servicenum,departmentid,userid,busiid,busitype,amount,period,periodUnit,yearPerformance,addtime,collectiontime)
values(seq_performance_statistics.nextval, 1, 1, 'IT001', 1, 114432, 'TD001', 'CZD', 3000, 3, 'MONTH', 1250, sysdate, sysdate)


select * from xxd_employee
where jobnum='IT001'

select nvl(sum(amount),0) as amount,nvl(sum(yearperformance), 0) as yearPerformancefrom xxd_performance_statistics where employeeid=? and isonline=? and to_char(addtime,'yyyymm')=?
