'###################### 聚合数据 ###################### '

-- 入账状态：in_account_status: 0：未入账 1：入账成功 2：入账失败

SELECT --  *
 merge_id,order_no,order_type,pay_channel,biz_type,is_pack_ship,bu_code,bankdate,pay_amount,insurance_split_amount,sub_company,transfer_original_order,in_account_status
FROM  auto_merge_vfin_vst 
-- WHERE merge_id=1


UPDATE auto_merge_vfin_vst SET in_account_status=0 WHERE merge_id=1


'###################### 入账规则 ######################'

SELECT * FROM auto_in_account_rule




SELECT * FROM auto_in_account_rule_detail
WHERE rule_id=10

UPDATE auto_in_account_rule_detail SET in_account_company=NULL WHERE rule_detail_id=56


SELECT * FROM auto_in_account_rule_type

-- subject_type 对应rule_type中的subject_type
SELECT * FROM auto_in_account_rule_subject



' ###################### 档案配置 ######################'

-- channel_code 对应聚合数据pay_channel，channel_contract对应入账规则合同
-- 统一支付按这个找subject_id
SELECT * FROM auto_in_account_payment_subject
WHERE channel_code='ALIPAY_APP'
WHERE valid='Y'

-- 会计科目
-- COMMON("1", "普通科目"), UNIFIED_PAYMENT("2", "统一支付科目"), SPECIAL("3", "特殊科目"),
--		UNIFIED_PREPAY("4", "统一预收科目"), UNIFIED_INCOME("5", "统一收入科目"), UNIFIED_COST("6", "统一成本科目"),
--		UNIFIED_PAYABLE("7", "统一应付科目");
select * from auto_in_account_subject
where subject_code='22030102'




-- 版本
select * from auto_in_account_version

-- 
select * from etl_vst_pay_payment_gateway

-- 凭证
select * from auto_in_account_voucher



'###################### 入账数据 ###################### '
SELECT * FROM auto_in_account
WHERE merge_id=1

WHERE in_account_seq_no = 7881162
DESC auto_in_account


SELECT * FROM auto_in_account_detail
WHERE in_account_seq_no IN( 19087)

DELETE FROM auto_in_account_detail  WHERE in_account_seq_no IN( 19087);

DELETE FROM auto_in_account WHERE merge_id=1


-- ###################### 字典 ###################### 
SELECT * FROM auto_in_account_dict
WHERE dict_type like '%isTransfer%'

 
VALUE LIKE '%订单号%'



select * from auto_voucher

