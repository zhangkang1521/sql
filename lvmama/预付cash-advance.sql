
-- 账户管理
SELECT * FROM o2o_cash_adv_acct
 WHERE id=201710177035
 WHERE sub_company_id=1047


-- 支出明细
SELECT * FROM o2o_acct_temp_order_item
ORDER BY update_time DESC
WHERE batch_id=167953


-- 账户明细
-- trade_type:交易类型:0-支出,1-收入 
-- approve_status: 审核状态:0-未审核,1-审核通过,2-审核拒绝 -1: 审核通过后删除
SELECT id,account_id,trade_type,cash_amount,account_balance,approve_status,update_time FROM o2o_cash_account_detail
WHERE account_id=201710177035
ORDER BY update_time DESC


UPDATE o2o_cash_account_detail SET account_balance=account_balance-4 WHERE account_id=201710177035 AND approve_status=1 AND update_time>'2017-10-18 13:59:19'
