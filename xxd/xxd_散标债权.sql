ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss';

-- 借款表 
-- 借款状态:0.暂存; 1.审核中;2.投标中;3.满标复审;4.还款中;5.还款结束;   6待签约（学子标）;-1.流标;-2.被撤销;-3.审核失败-4签约失败
-- 还款方式paymentmethod 1.等额本息; 2：付息还本（就是按月付息到期还本）   5 按月付息到期还本 6 按季付息 到期还本  4还本付息
 -- 标的类型1信用标2推荐标3净值标4秒还标5调剂标6抵押标7新新宝8新生贷 9新商贷 10新房贷 11菁英贷12信网贷 13票小宝 14车主贷 15分期贷 16新手标 17短期理财产品
-- 标的金额计算方式1传统模式2credit模式
select borrowid,userid,type,substr(name,0,15) as name,account,loanaccount,accountyes,apr,paymentmethod as pmethod,TIMELIMIT,period,periodUnit as pUnit,status,addtime,version,pledgeType
FROM XXD_BORROW
--WHERE TYPE=17
--where name like '%车主%'
where borrowid='BW201609149967'
order by addtime desc;

update xxd_borrow set pledgetype=1 where borrowid='BW201609149967'

-- 投标信息表 投标状态:-1.投标失败;0.投标中;1.还款中;2.还款结束;3待签约;-2签约失败 -3 新元宝退出，状态改为撤销
SELECT TENDERID,BORROWID,USERID,CURUSERID,ISOPTIMIZE,SCHEMEID,EFFECTIVEMONEY,ENDTIME,STATUS,COLLECTAMOUNT,COLLECTINTEREST,COLLECTEDAMOUNT,COLLECTEDINTEREST,COLLECTEDFINE
FROM  XXD_BORROW_TENDER
WHERE BORROWID='BW201609199974'
--and userid=115641
--WHERE TENDERID='BT2016081698515'
order by addtime desc;


-- 还款计划 还款状态，默认值0:0.未还款; 1.已还款 2.提前还 3待签约 -1签约失败
-- 系统垫付状态，默认值0:0.未垫付;1.已垫付;2.垫付后还款
SELECT REPAYMENTID,PORDER,REPAYMENTACCOUNT AS "account",REPAYMENTCAPITAL AS CAPITAL,REPAYMENTINTEREST AS INTEREST,
REPAYMENTYESACCOUNT as yesAcco,REPAYMENTYESCAPITAL as yesCapi,REPAYMENTYESINTEREST as yesInte,REPAYMENTTIME,STATUS,webstatus,REPAYMENTYESTIME,webtime,laterdays,laterinterest
FROM XXD_BORROW_REPAYMENT
WHERE BORROWID='BW201608029828'
order by porder asc


-- 收益计划
-- 待收状态，默认0；0未归还;1.已归还;2.网站垫付;3.垫付后还款;4.提前还款5待签约-1签约失败
SELECT * FROM XXD_BORROW_COLLECTION
WHERE BORROWID='BW201609149962'
--and porder=4
--and tenderid='BT2016090651751'
ORDER BY  PORDER,TENDERID ASC


-- 费用类型feeType:1风险准备金（满标冻结，还款结束返还） 2信息咨询费（满标收取） 3信息服务费(按期收取) 4保费 5车辆保管费
-- 操作类型opttype 1扣除2冻结
-- 费用值计算方法calmethod 1费用规则2自定义
-- 收取节点chargenode:1复审通过 2按期还款 3还款结束4提前还款
-- 收取状态status 0未收取 1已收取 2减免 3已冻结 4已返还5不予返还
SELECT borrowfeeid, borrowid,feetype,fee,realfee,calmethod,optype,chargenode,returnnode,returnfee,realreturnfee,feerate,status,porder,addtime
FROM XXD_BORROW_FEE
where borrowid='BW201608029828'

delete from XXD_BORROW_FEE where borrowfeeid='BF20160909014972'

-- 逾期罚金
SELECT *  FROM XXD_BORROW_LATERINTEREST  
WHERE BORROWID='BW201608029828'

DELETE FROM XXD_BORROW_LATERINTEREST 
WHERE BORROWID='BW201609149962' AND REPAYMENTID='BR2016080932394'

-- 贷后还款
-- -- 还款类型1补录还款2逾期还款3逾期还款并减免罚息4正常还款
SELECT offlinerepayid,rechargeid,amount,rechargedate,borrowid,repaytype,terms,putintime
FROM XXD_BORROW_OFFLINEREPAY
order by offlinerepayid desc

select * from xxd_borrow_offlinerepay t  left join xxd_account_recharge r on t.rechargeid=r.rechargeid  where t.rechargeId='AR2016093014258' and r.status=1 and t.terms is null

update XXD_BORROW_OFFLINEREPAY set repaytype=3 where offlinerepayid=385
