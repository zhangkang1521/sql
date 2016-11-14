 select
                '新元宝' || os.closeterm || '个月' title1,
                os.pname title2,
                add_months(os.opensaleend,
                os.closeterm) REPAYTIME,
                '1/1' PORDER,
                ou.account REPAYCAPITAL,
                decode(ou.status,
                1,
                ou.expectedInterest,
                FLOATPROFIT+BALANCEMONEY) REPAYINTEREST,
                decode(ou.status,
                1,
                0,
                1) status    
            from
                xxd_optimize_userscheme ou,
                xxd_optimize_scheme os   
            where
                ou.schemeid = os.schemeid     
                and ou.userid = 114433    
                and os.version = 'v2.0' 
                
select decode(5, 1, 'a', 2, 'b') from dual                


SELECT XXBDEPLOYID,
          CNAME,
          TOTALACCOUNT,
          NUMCOUNT,
          SUBACCOUNT,
          APR,
          TIMELIMIT,
          LOWESTTENDER,
          MOSTTENDER,
          STYLE,
          STATUS,
          ADDTIME,
          DEPLOYTIME,
          LASTMODFY,
          MODIFYTIME,
          TENDNUM,
          TENDSUM,
          UNTENDNUM,
          UNTENDSUM,
          FLOWNUM,
          FLOWSUM,
          NOTICE_ID1,
          NOTICE_ID2,
          NOTICE_ID3,
          NOTICE_ID4,
          NOTICE_ID5,
          ISSTATISTICS VALIDDAYS
   FROM XXD_XXBAO_BORROW t
   WHERE 1=1
     AND t.btype = 2
     and timelimit=3
   ORDER BY t.ADDTIME DESC
 
  AND ((s.version='v1.0' and s.minapr<9) or (s.version='v2.0')) 
ORDER BY FN_RANDOM

select us.status, us.SCHEMEID, us.ACCOUNT, us.REMACCOUNT, us.USERID from xxd_optimize_userscheme us,xxd_optimize_scheme s  
where us.schemeid = s.schemeid and us.status = 1 and remaccount>0 AND ((s.version='v1.0' and s.minapr<=117) or (s.version='v2.0'))  
and s.OPENSALEEND < sysdate and add_months(s.OPENSALEEND,s.CLOSETERM) >= sysdate 
--and (case when us.account<? then us.remaccount         
--when us.remaccount < us.account * ?  then us.remaccount         else us.account * ? end) >= ? 
--and exists (select 1 from xxd_account xa where userid=us.userid and pcode='1004' and usable>= ?) 
and s.version = 'v2.0'






-- 债权转让详情 --
SELECT tr.requestid,tr.tenderid,xb.borrowid,xb.name borrowName, xb.paymentMethod,xb.period,xb.periodunit, tr.funds,xb.type borrowType,xb.apr AS rateyear,
to_char(t.nextRepaymentTime,'yyyy-MM-dd') nextRepaymentTime,to_char(tp.addTime,'yyyy.MM.dd') outTime,tr.note,tr.userid,bt.effectiveMoney,tr.status,tr.rate, tr.transFee, 
tr.apr,tr.reqMethod ,tr.status,decode(tr.status,2,tp.terms,t.remainNumber) remainNumber ,(xb.timeLimit-decode(tr.status,2,tp.terms,t.remainNumber)) receivedNumber ,
                                                                                                                                                                                                                                                                                                                                                                                                                                                    decode(tr.status,2,tp.collectamount,t.repaymentAmount) repaymentAmount ,
                                                                                                                                                                                                                                                                                                                                                                                                                                                    decode(tr.status,2,tp.collectInterest,t.repaymentInterest) repaymentInterest ,
                                                                                                                                                                                                                                                                                                                                                                                                                                                    decode(tr.status,2,tr.amount,t.repayCapital) repayCapital
FROM xxd_trade_request tr
LEFT JOIN
  (SELECT requestid,
          addTime,
          collectamount,
          collectinterest,
          terms
   FROM xxd_trade_pack) tp ON tp.requestid = tr.requestid
INNER JOIN
  (SELECT tenderid,
          borrowid,
          effectiveMoney
   FROM xxd_borrow_tender) bt ON tr.tenderid=bt.tenderid
INNER JOIN
  (SELECT *
   FROM xxd_borrow) xb ON bt.borrowid=xb.borrowid
LEFT JOIN
  (SELECT tenderid,
          count(*) remainNumber,
          min(repayTime) nextRepaymentTime,
          sum(repayAccount) repaymentAmount,
          sum(repayInterest) repaymentInterest,
          sum(repayCapital) repayCapital
   FROM xxd_BORROW_COLLECTION
   WHERE status=0
   GROUP BY tenderid) t ON t.tenderid=bt.tenderid
WHERE tr.requestId='TR2016110901677'
  AND xb.TYPE IN (1,
                  2,
                  8,
                  9,
                  11,
                  12,
                  10,
                  13,
                  14)
-- 债权转让详情 end --      




----------------------------- BorrowQueryDao.java line:442 --------------------------------
 select
        a.earn+b.earn 
    from
        (select
            nvl(round(sum(us.account*sc.minapr*closeterm/12/100),
            2),
            0) as earn  
        from
            xxd_optimize_scheme sc,
            xxd_optimize_userscheme us   
        where
            sc.schemeid = us.schemeid 
            and sc.version='v2.0' 
            and us.userid = 114432
            and us.status = 7   
            and us.enddate>=to_date(to_char(sysdate,'yyyy')||'0101 00:00:00','yyyymmdd hh24:mi:ss') )a,
        (select
            nvl(round(sum(us.account*sc.minapr*decode(sign(floor(us.enddate-sc.opensaleend)-sc.closeterm*30),
            1,
            sc.closeterm*30,
            floor(us.enddate-sc.opensaleend))/360/100),
            2),
            0) as earn  
        from
            xxd_optimize_scheme sc,
            xxd_optimize_userscheme us   
        where
            sc.schemeid = us.schemeid 
            and sc.version='v2.0' 
            and us.userid = 114432 
            and us.status = 6  )b



select sum(floatprofit+balancemoney)
from  xxd_optimize_userscheme
where userid=114432
  
  select to_date(to_char(sysdate,'yyyy')||'0101 00:00:00','yyyymmdd hh24:mi:ss') from dual
  
------------------------------------------------------------------------------------------------

---------------------------BorrowQueryDao.java line: 1091----------------------------------------------------------------------
 select
        a.earn+b.earn 
    from
        (select
            nvl(round(sum(us.account*sc.minapr*closeterm/12/100),
            2),
            0) as earn  
        from
            xxd_optimize_scheme sc,
            xxd_optimize_userscheme us   
        where
            sc.schemeid = us.schemeid 
            and sc.version='v2.0' 
            and us.userid = 114432
            and us.status = 7   
            and to_char(us.enddate,'yyyymm') = '201701')a,
        (select
            nvl(round(sum(us.account*sc.minapr*decode(sign(floor(us.enddate-sc.opensaleend)-sc.closeterm*30),
            1,
            sc.closeterm*30,
            floor(us.enddate-sc.opensaleend))/360/100),
            2),
            0) as earn  
        from
            xxd_optimize_scheme sc,
            xxd_optimize_userscheme us   
        where
            sc.schemeid = us.schemeid 
            and sc.version='v2.0' 
            and us.userid = 114432 
            and us.status = 6  
            and to_char(us.enddate,'yyyymm') = '201610')b
            
select nvl(sum(floatprofit+balancemoney),0)
from  xxd_optimize_userscheme us,xxd_optimize_scheme sc
where sc.schemeid = us.schemeid 
and sc.version='v2.0' 
and userid=114432 
and  to_char(us.enddate,'yyyymm') = '201701'       
            
------------------------------------------------------------------------------ 

--------------------------UserSchemeDao.java line:289----------------------------------------------------
  select
        * 
    from
        ( select
            yy.username ,
            yy.realname ,
            xx.account ,
            to_char(xx.addtime,
            'yyyy-mm-dd hh24:mi:ss') addtime,
            to_char(xx.enddate,
            'yyyy-mm-dd hh24:mi:ss') enddate,
            xx.realprofit ,
            xx.expectedprofir ,
            (xx.expectedprofir-xx.realprofit) as shortprofit 
        from
            ( select
                us.userid,
                us.account,
                sc.minapr,
                us.addtime,
                us.enddate,
                (l.workmoney-us.account) as realprofit,
                --trunc(us.account*sc.minapr*sc.closeterm/12/100,
                --2) as expectedprofir 
                us.expectedinterest as expectedprofir
            from
                xxd_optimize_userscheme us,
                xxd_account_log l,
                xxd_optimize_scheme sc                   
            where
                us.userid = l.userid                    
                and us.schemeid = l.schemeid                    
                and us.schemeid = sc.schemeid                   
                and us.status = 7                    
                --and us.enddate >= to_date('2016-01-01 01:00:00','yyyy-mm-dd hh24:mi:ss')                   
                --and us.enddate <= to_date('2018-01-01 01:00:00','yyyy-mm-dd hh24:mi:ss')                   
                and us.collectiontype = 1
                and sc.version = 'v1.0'
                and l.operatortype = 'xplan_quit_usable_inner_out'                   )xx,
            (select
                u.userid,
                u.username,
                bs.realname 
            from
                xxd_user u 
            left join
                xxd_user_baseinfo bs 
                    on u.userid = bs.userid) yy 
        where
            xx.userid = yy.userid 
            and xx.realprofit<xx.expectedprofir
        ) 
    union
    all (
        select
            yy.username ,
            yy.realname ,
            us.account ,
            to_char(us.addtime,
            'yyyy-mm-dd hh24:mi:ss') addtime,
            to_char(us.enddate,
            'yyyy-mm-dd hh24:mi:ss') enddate,
            xx.realprofit ,
            trunc(us.account*sc.minapr*sc.closeterm/12/100,
            2) as expectedprofir ,
            trunc(us.account*sc.minapr*sc.closeterm/12/100,
            2)-xx.realprofit as shortprofit                   
        from
            xxd_optimize_scheme sc,
            xxd_optimize_userscheme us,
            (select
                l.userid,
                l.schemeid,
                sum(l.workmoney) realprofit                   
            from
                xxd_optimize_userscheme us,
                xxd_account_log l                   
            where
                us.schemeid = l.schemeid 
                and us.userid = l.userid 
                --and us.collectiontype = 2 
                and us.status = 7                   
               -- and us.enddate >= to_date('2016-01-01 01:00:00','yyyy-mm-dd hh24:mi:ss')                   
               -- and us.enddate <= to_date('2018-01-01 01:00:00','yyyy-mm-dd hh24:mi:ss')                   
                and l.remark like '%还款利息%' 
                and l.pcode = '1001'                   
            group by
                l.userid,
                l.schemeid)xx,
            (select
                u.userid,
                u.username,
                bs.realname 
            from
                xxd_user u 
            left join
                xxd_user_baseinfo bs 
                    on u.userid = bs.userid) yy                  
        where
            yy.userid = xx.userid 
            and sc.schemeid = xx.schemeid                    
            and xx.userid = us.userid 
            and xx.schemeid = us.schemeid                    
            and xx.realprofit < trunc(us.account*sc.minapr*sc.closeterm/12/100,2)
            and sc.version='v2.0'
        )  
--------------------------UserSchemeDao.java line:289 end ----------------------------------------------------

SELECT usd.*
   FROM xxd_optimize_scheme sc,
        xxd_optimize_userscheme us,
        XXD_OPTIMIZE_USERDETAIL usd
   WHERE sc.schemeid = us.schemeid
     AND   us.userSchemeId = usd.userSchemeId
     AND sc.version='v2.0'
     AND us.userid = 114432
     AND us.status = '6' AND us.enddate>=to_date(to_char(sysdate,'yyyy')||'0101 00:00:00','yyyymmdd hh24:mi:ss')

SELECT to_date(to_char(sysdate,'yyyy')||'0101 00:00:00','yyyymmdd hh24:mi:ss') FROM DUAL




select (nvl(br.repaymentaccount,0) - nvl(br.repaymentyesaccount,0) + nvl(feevalue,0)) sum
                  from xxd_borrow_repayment br
                left join (select sum(bf.fee - bf.realfee) feevalue, borrowid, porder 
                           from xxd_borrow_fee bf 
                     group by bf.borrowid, bf.porder) fsum 
          on br.borrowid = fsum.borrowid 
     AND BR.PORDER = FSUM.PORDER
where br.repaymentid = 'BR2016082532509'


   SELECT    FEETYPE,      FEE,   CHARGENODE,    MAX(PORDER) PORDER      FROM XXD_BORROW_FEE       
   WHERE BORROWID = 'BW201609129828'
   GROUP BY FEETYPE,FEE,CHARGENODE
   order by feetype asc
   
   
   
   -- 垫付 
   select br.repaymentId,br.borrowId,RepaymentAccount,RepaymentCapital,RepaymentInterest,repaymentTime,br.porder,br.userId,b.type
    FROM XXD_BORROW_REPAYMENT BR LEFT JOIN XXD_BORROW B ON (BR.BORROWID = B.BORROWID)
    WHERE B.TYPE IN (2,6,8,9,10,11,12,13,14,15) AND BR.WEBSTATUS=0 AND BR.STATUS=0 AND TO_DATE('2016/09/16-23:59:59','yyyy/mm/dd-hh24:mi:ss')>BR.REPAYMENTTIME
    order by repaymentTime
    
SELECT REPAYMENTID,PORDER,REPAYMENTACCOUNT AS "account",REPAYMENTCAPITAL AS CAPITAL,REPAYMENTINTEREST AS INTEREST,
REPAYMENTYESACCOUNT as yesAcco,REPAYMENTYESCAPITAL as yesCapi,REPAYMENTYESINTEREST as yesInte,REPAYMENTTIME,STATUS,webstatus,REPAYMENTYESTIME,webtime,laterdays,laterinterest
FROM XXD_BORROW_REPAYMENT
where borrowid='BR2016081532460'

UPDATE XXD_BORROW_REPAYMENT SET STATUS=1 WHERE REPAYMENTID='BR2016081532452'

SELECT *　FROM XXD_SYSCONFIG
where syskey like '%STEP%'

-- 系统债权转让
    
SELECT BT.*,
      
FROM xxd_borrow b,
     xxd_borrow_tender bt
LEFT JOIN
  (SELECT tenderid,
          count(*) remainNumber,
          MIN(repayTime) nextRepaymentTime
   FROM xxd_borrow_collection
   WHERE status = 0
   GROUP BY tenderid) t ON bt.tenderid = t.tenderid
WHERE B.BORROWID = BT.BORROWID
  AND BT.CURUSERID = 1857701
  AND BT.TENDERID='BT2016081698515'
  AND FLOOR(NEXTREPAYMENTTIME - SYSDATE) > 5 -- 下期还款日前5天不能转让
  AND NEXTREPAYMENTTIME < (CASE WHEN B.TYPE = 9 AND B.PAYMENTMETHOD = 1 
                                      THEN ADD_MONTHS(SYSDATE, 1) -- 新商贷等额本息 提前还款不能转让
                                WHEN(b.type = 9 AND b.PAYMENTMETHOD != 1)
                                          OR b.type IN (10,
                                         13,
                                         14) 
                                THEN ADD_MONTHS(SYSDATE, 12) END) -- 新商贷不是等额本息 或 车贷 房贷 票小宝 不限制
SELECT tenderid,
          count(*) remainNumber,
          MIN(repayTime) nextRepaymentTime
   FROM XXD_BORROW_COLLECTION
   WHERE STATUS = 0 and tenderid='BT2016081698515'
   GROUP BY TENDERID    
   

SELECT 
CASE WHEN B.TYPE = 9 AND B.PAYMENTMETHOD = 1 
                  THEN ADD_MONTHS(SYSDATE, 1) 
WHEN(b.type = 9 AND b.PAYMENTMETHOD != 1) OR b.type IN (10,13,14) 
                  THEN ADD_MONTHS(SYSDATE, 12) END
FROM XXD_BORROW B
where borrowid='BW201608162476'

-- 资金记录
SELECT busiid,
             to_char(addtime,'yyyy-mm-dd hh24:mi:ss') addtime,
             operatortype,
             moneytype,
             workmoney,
             usable,
             frozen,
             collection,
             repayment,
             accounttotal,
             remark,
             id
      FROM xxd_account_log
      WHERE status=0
        AND isshow=0
        AND OPERATORTYPE IS NOT NULL
        AND PCODE = '1001'
        AND userId=114363
      ORDER BY id DESC
      
select t.borrowid,t.repaymentid,t.userid,t.porder,to_char(t.repaymenttime,'yyyy-mm-dd') repaymenttime,to_char(a.rechargedate,'yyyy-mm-dd') rechargedate,t.webstatus,a.repaytype,a.offlinerepayid 
FROM XXD_BORROW_REPAYMENT T
LEFT JOIN XXD_BORROW_OFFLINEREPAY A ON A.BORROWID = T.BORROWID
 WHERE A.RECHARGEID = 'AR2016090114262' AND T.PORDER = (SELECT MIN(RP.PORDER) 
 from xxd_borrow_repayment rp where rp.status = 0 and rp.borrowid = a.borrowid)
 


SELECT br.*   
FROM xxd_borrow_repayment br
LEFT JOIN
  (SELECT sum(bf.fee - bf.realfee) feevalue,
          borrowid,
          porder
   FROM xxd_borrow_fee bf
   GROUP BY bf.borrowid,
            bf.porder) fsum ON br.borrowid = fsum.borrowid
AND br.porder = fsum.porder
WHERE (nvl(feevalue,0) > 0
       OR (BR.REPAYMENTACCOUNT > BR.REPAYMENTYESACCOUNT))
  AND BR.BORROWID = 'BW201609019787'
  AND br.status = 0
  AND TRUNC(SYSDATE + 28) > TRUNC(BR.REPAYMENTTIME)
ORDER BY br.porder 


SELECT br.REPAYMENTID,
       br.BORROWID,
       br.USERID,
       br.PORDER,
       br.REPAYMENTACCOUNT,
       br.REPAYMENTINTEREST,
       br.REPAYMENTCAPITAL,
       br.REPAYMENTTIME,
       br.STATUS,
       br.REPAYMENTYESTIME,
       br.REPAYMENTYESACCOUNT,
       br.REPAYMENTYESINTEREST,
       br.REPAYMENTYESCAPITAL,
       br.WEBSTATUS,
       br.WEBTIME,
       br.LATERDAYS,
       br.LATERINTEREST,
       br.PENALSUM,
       br.ISPAYMENT,
       br.ADDTIME,
       br.ADDIP
FROM xxd_borrow_repayment br
LEFT JOIN
  (SELECT sum(bf.fee - bf.realfee) feevalue,
          borrowid,
          porder
   FROM xxd_borrow_fee bf
   GROUP BY bf.borrowid,
            bf.porder) fsum ON br.borrowid = fsum.borrowid
AND br.porder = fsum.porder
WHERE (nvl(feevalue,0) = 0
       AND (br.repaymentaccount = br.repaymentyesaccount))
  AND br.borrowid = 'BW201609019787'
  AND br.status = 0
  AND TRUNC(SYSDATE) >= TRUNC(BR.REPAYMENTTIME)
ORDER BY br.porder


-- 重置罚息基数
UPDATE xxd_borrow_laterinterest bl
SET bl.lastmodify=0,
    bl.modifydate=sysdate,
    bl.modifyip='127.0.0.1',
                bl.baseamount =
  (SELECT nvl(br.repaymentaccount, 0) - nvl(br.repaymentyesaccount, 0) + nvl(bf.fee, 0) - nvl(bf.realfee, 0)
   FROM xxd_borrow_repayment br
   LEFT JOIN xxd_borrow_fee bf ON bf.borrowid = br.borrowid
   AND br.porder = bf.porder
   AND bf.feetype = 3
   WHERE br.repaymentid = bl.repaymentid)
WHERE bl.repaymentid = 'BR2016091438021'
  AND bl.laterdate >= to_char(sysdate,'yyyymmdd') -- 大于实际还款时间的重置
 
  
  --
  SELECT nvl(br.repaymentaccount, 0) - nvl(br.repaymentyesaccount, 0) + nvl(bf.fee, 0) - nvl(bf.realfee, 0)
   FROM xxd_borrow_repayment br
   LEFT JOIN xxd_borrow_fee bf ON bf.borrowid = br.borrowid
   AND br.porder = bf.porder
   AND bf.feetype = 3
   WHERE br.repaymentid = 'BR2016091438021'
  
  
-- 重置罚息
update xxd_borrow_laterinterest bl
   set bl.lastmodify    = 0,
       bl.modifydate    = sysdate,
       bl.modifyip      = '127.0.0.1',
       bl.laterinterest = (select (case
                                    when (trunc(to_date(bl2.laterdate,
                                                        'yyyymmdd')) -
                                         trunc(br.repaymenttime)) = 3 then
                                     4
                                    else
                                     1
                                  end) * 0.003 * bl2.baseamount
                             from xxd_borrow_repayment     br,
                                  xxd_borrow_laterinterest bl2
                            where br.repaymentid = bl2.repaymentid
                              and bl2.laterinterestid = bl.laterinterestid)
 where bl.repaymentid = ?
   and bl.laterdate >= to_char(?, 'yyyymmdd') -- 大于实际还款时间的重置

     0.003, BR2016091438021, 2016-10-18 00:00:00.0
     
     select (case
              when (trunc(to_date(bl2.laterdate, 'yyyymmdd')) - trunc(br.repaymenttime)) = 3 
                then 4
             else 1
             end) * 0.003 * bl2.baseamount
   from xxd_borrow_repayment     br, xxd_borrow_laterinterest bl2
   where br.repaymentid = bl2.repaymentid
         and bl2.laterinterestid = bl.laterinterestid
         and br.repaymentid='BR2016091438021'
         
-- 获取债权转让详情

SELECT tr.requestid,
       tr.tenderid,
       xb.borrowid,
       xb.name borrowName,
       xb.paymentMethod,
       xb.period,
       xb.periodUnit,
       tr.funds,
       xb.type borrowType,
       xb.apr AS rateyear,
       to_char(t.nextRepaymentTime,'yyyy-MM-dd') nextRepaymentTime,
       to_char(tp.addTime,'yyyy.MM.dd') outTime,
       tr.note,
       tr.userid,
       bt.effectiveMoney,
       tr.status,
       tr.rate,
       tr.transFee,
       tr.apr,
       tr.reqMethod,
       decode(tr.status,2,tp.terms,t.remainNumber) remainNumber,
       (xb.timeLimit-decode(tr.status,2,tp.terms,t.remainNumber)) receivedNumber,
       decode(tr.status,2,tp.collectamount,t.repaymentAmount) repaymentAmount,
       decode(tr.status,2,tp.collectInterest,t.repaymentInterest) repaymentInterest,
       decode(tr.status,2,tr.amount,t.repayCapital) repayCapital
FROM xxd_trade_request tr
LEFT JOIN
  (SELECT requestid,
          addTime,
          collectamount,
          collectinterest,
          terms
   FROM xxd_trade_pack) tp ON tp.requestid = tr.requestid
INNER JOIN
  (SELECT tenderid,
          borrowid,
          effectiveMoney
   FROM xxd_borrow_tender) bt ON tr.tenderid=bt.tenderid
INNER JOIN
  (SELECT borrowid,
          name,
          timeLimit,
          TYPE,
          apr,
          paymentMethod,
          period,
          periodUnit
   FROM xxd_borrow) xb ON bt.borrowid=xb.borrowid
LEFT JOIN
  (SELECT tenderid,
          count(*) remainNumber,
          min(repayTime) nextRepaymentTime,
          sum(repayAccount) repaymentAmount,
          sum(repayInterest) repaymentInterest,
          sum(repayCapital) repayCapital
   FROM xxd_BORROW_COLLECTION
   WHERE status=0
   GROUP BY tenderid) t ON t.tenderid=bt.tenderid
WHERE tr.requestId='TR2016110433771'
  AND xb.type IN (1,
                  2,
                  8,
                  9,
                  11,
                  12,
                  10,
                  13,
                  14)
         
-- 新元宝投债权
SELECT us.status,
       us.SCHEMEID,
       us.ACCOUNT,
       us.REMACCOUNT,
       us.USERID
FROM xxd_optimize_userscheme us,
     xxd_optimize_scheme s
WHERE us.schemeid = s.schemeid
  AND us.status = 1  -- 投标中
  AND remaccount>0 
  AND ((s.version='v1.0'
        AND s.minapr<=7)
       OR (s.version='v2.0'))
  AND s.OPENSALEEND < sysdate
  AND add_months(s.OPENSALEEND,s.CLOSETERM) >= sysdate
  AND (CASE
           WHEN us.account<20000 THEN us.remaccount
           WHEN us.remaccount < us.account * 0.2 THEN us.remaccount
           ELSE us.account * 0.2
       END) >= 10000
  AND EXISTS
    (SELECT 1
     FROM xxd_account xa
     WHERE userid=us.userid
       AND pcode='1004'
       AND usable>= 10000)
  AND s.version = 'v2.0'
     
select * from xxd_sysconfig where syskey like '%OP%'
    