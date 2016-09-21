ALTER TABLE XXD_message_site
--ADD CHANNEL VARCHAR2(100)
--ADD REALTIME NUMBER(38, 0)
add BORROWID varchar2(30)






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

     

    