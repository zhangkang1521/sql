

SELECT  COUNT(*)  FROM set_settlement_item WHERE (visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01');
DELETE FROM set_settlement_item WHERE (visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01');

SELECT  *  FROM fs_settle_item WHERE (visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01');


SELECT supplier_id,COUNT(*) FROM set_settlement_item
WHERE visit_time>='2017-11-01' AND visit_time<'2017-12-01'
GROUP BY supplier_id

SELECT * FROM set_settlement_item WHERE order_id=29503674

UPDATE set_settlement_item SET settlement_status='UNSETTLEMENTED',settlement_id=0,budget_settlement_id=0 
WHERE  (visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01');
                  

SHOW CREATE TABLE etl_vst_ord_order_item

DELETE FROM set_settlement_item WHERE ORDER_ID=37689153

TRUNCATE TABLE etl_vst_ord_order_item;



SELECT  supplier_id,COUNT(*)  FROM set_settlement_item WHERE visit_time>='2017-11-01' AND  visit_time<'2017-12-01'
GROUP BY supplier_id


SELECT COUNT(*) FROM fs_settle_item
WHERE supplier_id=3175

DELETE FROM FS_SETTLE_BILL

SELECT COUNT(*) FROM etl_vst_ord_order

SELECT * FROM etl_vst_supp_settle_rule

DELETE FROM fs_settle_item_extra WHERE order_item_id IN(2031274348,
)

SELECT * FROM etl_vst_ord_order_item
WHERE order_id=38133110

DELETE  FROM etl_vst_ord_order_item
WHERE order_id=38133110

SELECT * FROM etl_vst_supp_settlement_entities
WHERE supplier

-- 迁移脚本

-- 纯买断
INSERT INTO fs_settle_item( supplier_id,supplier_name,settle_entity_id,settle_entity_name,order_id,order_item_id,settle_price,settle_item_type,bill_id, settle_item_status,`note`,item_options,`description`,create_time,update_time,create_by,update_by,clear_date,approve_status,blend_status, settlement_clasification,split_flag,budget_flag,is_test_order,price_confirm_status,perform_status,expired_refund_flag,sbu,`version`,visit_time,pass_time, payment_time,quantity ) 
SELECT  t.supplier_id,t.supplier_name,t.TARGET_ID,t.settle_name,t.order_id,t.order_item_meta_id,IFNULL(confirmed_budget_total_settlement_price,t.budget_total_settlementl_price), 'ORDER_ITEM',IFNULL(t.budget_settlement_id,0),t.settlement_status,'系统迁移',NULL,NULL,t.order_create_time,t.update_time,'SYSTEM','SYSTEM',t.clear_date, 'APPROVED', CASE WHEN IFNULL(t.budget_settlement_id,0)=0 THEN 'UNBLENDED' ELSE 'AUTO_BLEND' END,t.SETTLEMENT_CLASIFICATION,'N',CASE WHEN t.budget_flag='Y' THEN 'Y' ELSE 'N' END,IFNULL(t.IS_TEST_ORDER,'N'),IFNULL(t.price_confirm_status,'UN_CONFIRMED'),IFNULL(t.performstatus,'UNPERFORM'),IFNULL(t.EXPIRED_REFUND_FLAG,'N'),IFNULL(t.SBU,'UNKNOW'),CURRENT_TIMESTAMP(6), t.visit_time,t.pass_time,NULL,t.quantity FROM set_settlement_item t  
WHERE   t.budget_total_settlementl_price IS NOT NULL AND t.supplier_type!='O2O' AND ((visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01'))

-- 非买断
INSERT INTO fs_settle_item( supplier_id,supplier_name,settle_entity_id,settle_entity_name,order_id,order_item_id,settle_price,settle_item_type,bill_id, settle_item_status,`note`,item_options,`description`,create_time,update_time,create_by,update_by,clear_date,approve_status,blend_status, settlement_clasification,split_flag,budget_flag,is_test_order,price_confirm_status,perform_status,expired_refund_flag,sbu,`version`,visit_time,pass_time, payment_time,quantity ) SELECT  t.supplier_id,t.supplier_name,t.TARGET_ID,t.settle_name,t.order_id,t.order_item_meta_id,IFNULL(t.confirmed_total_settlement_price,total_settlement_price), 'ORDER_ITEM',IFNULL(t.settlement_id,0),t.settlement_status,'系统迁移',NULL,NULL,t.order_create_time,t.update_time,'SYSTEM','SYSTEM',t.clear_date, 'APPROVED',CASE WHEN IFNULL(t.budget_settlement_id,0)=0 THEN 'UNBLENDED' ELSE 'AUTO_BLEND' END,t.SETTLEMENT_CLASIFICATION,'N',CASE WHEN t.budget_flag='Y' THEN 'Y' ELSE 'N' END,IFNULL(t.IS_TEST_ORDER,'N'),IFNULL(t.price_confirm_status,'UN_CONFIRMED'),IFNULL(t.performstatus,'UNPERFORM'),IFNULL(t.EXPIRED_REFUND_FLAG,'N'),IFNULL(t.SBU,'UNKNOW'),CURRENT_TIMESTAMP(6), t.visit_time,t.pass_time,NULL,t.quantity FROM set_settlement_item t 
 WHERE  IFNULL(t.budget_total_settlementl_price,0)=0 AND t.supplier_type!='O2O' AND ((visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01'))
 
 -- 混的
INSERT INTO fs_settle_item( supplier_id,supplier_name,settle_entity_id,settle_entity_name,order_id,order_item_id,settle_price,settle_item_type,bill_id, settle_item_status,`note`,item_options,`description`,create_time,update_time,create_by,update_by,clear_date,approve_status,blend_status, settlement_clasification,split_flag,budget_flag,is_test_order,price_confirm_status,perform_status,expired_refund_flag,sbu,`version`,visit_time,pass_time, payment_time,quantity ) SELECT  t.supplier_id,t.supplier_name,t.TARGET_ID,t.settle_name,t.order_id,t.order_item_meta_id, IFNULL(t.confirmed_total_settlement_price,total_settlement_price)-IFNULL(t.confirmed_budget_total_settlement_price,budget_total_settlementl_price), 'ORDER_ITEM',IFNULL(t.settlement_id,0),t.settlement_status,'系统迁移',NULL,NULL,t.order_create_time,t.update_time,'SYSTEM','SYSTEM',t.clear_date, 'APPROVED',CASE WHEN IFNULL(t.budget_settlement_id,0)=0 THEN 'UNBLENDED' ELSE 'AUTO_BLEND' END,t.SETTLEMENT_CLASIFICATION,'N','N',IFNULL(t.IS_TEST_ORDER,'N'),IFNULL(t.price_confirm_status,'UN_CONFIRMED'),IFNULL(t.performstatus,'UNPERFORM'),IFNULL(t.EXPIRED_REFUND_FLAG,'N'),IFNULL(t.SBU,'UNKNOW'),CURRENT_TIMESTAMP(6), t.visit_time,t.pass_time,NULL,t.quantity FROM set_settlement_item t  
WHERE t.budget_total_settlementl_price>0 AND t.total_settlement_price>t.budget_total_settlementl_price AND t.supplier_type!='O2O' AND ((visit_time>='2017-12-01' AND visit_time<'2018-01-01') OR  (visit_time>='2017-06-01' AND visit_time<'2017-11-01'))

-- 抵扣
INSERT INTO fs_settle_item( supplier_id,supplier_name,settle_entity_id,settle_entity_name,order_id,order_item_id,settle_price,settle_item_type,bill_id, settle_item_status,`note`,item_options,`description`,create_time,update_time,create_by,update_by,clear_date,approve_status,blend_status, settlement_clasification,split_flag,budget_flag,is_test_order,price_confirm_status,perform_status,expired_refund_flag,sbu,`version`,visit_time,pass_time, payment_time ) 
SELECT  t.supplier_id,NULL,t.TARGET_ID,NULL,t.order_id,t.order_item_id,IFNULL(IFNULL(new_total_buyout_price,t.new_total_settlement_price),0)-IFNULL(IFNULL(old_total_buyout_price,t.old_total_settlement_price),0), 'DEDUCTION_ITEM',IFNULL(t.settlement_id,t.budget_settlement_id),CASE WHEN  IFNULL(t.settlement_id,0)=0  AND IFNULL(t.budget_settlement_id,0)=0  THEN 'UNSETTLEMENTED' ELSE 'SETTLEMENTED' END ,t.change_id,NULL,'系统迁移',t.create_time,t.update_time,'SYSTEM','SYSTEM',NULL, 'APPROVED','UNBLENDED',NULL,'N','N','N','PRICE_CONFIRMED','','',t.SBU,CURRENT_TIMESTAMP(6),t.visit_time,NULL,NULL FROM settlement_price_change t  INNER JOIN set_settlement_item i ON t.order_item_id=i.order_item_meta_id  WHERE  t.supplier_id =? AND t.change_remark='1' AND IFNULL(i.supplier_type,'LVMAMA')!='O2O'

INSERT INTO fs_settle_item_extra ( order_item_id,order_id,order_item_actual_received,item_refunded_amount,coupon_amount,promotion_amount,distributor_amount, manual_change_amount,pass_add_code,pass_code,pass_serialno,pass_extid,pass_time,create_time,update_time,create_by, update_by,customer_name,customer_phone,customer_id,meta_product_manager,item_refunded_time,order_status ) 
SELECT  t.order_item_meta_id,t.order_id,t.ORDER_ITEM_ACTUAL_RECEIVED,t.ITEM_REFUNDED_AMOUNT,t.coupon_amount,t.promotion_amount,t.distributor_amount, t.manual_change_amount,t.pass_add_code,t.pass_code,t.pass_serialno,t.pass_extid,t.pass_time,NULL,t.update_time,'SYSTEM','SYSTEM', t.order_contact_person,t.contact_mobile_no,NULL,t.meta_product_manager,NULL,t.order_status 
FROM set_settlement_item t WHERE t.supplier_type!='O2O'

INSERT INTO fs_settle_bill ( id,supplier_id,supplier_name,settle_entity_id,settle_entity_name,sbu,cycle,total_num,settle_type,settle_bill_no,pay_status,settle_amount,order_amount,adjust_amount, claim_amount,deduct_amount,recon_type,settle_status,operator,supplier_recon_person,supplier_email,create_time,update_time,create_by,update_by ) 
SELECT  t.settlement_id,t.supplier_id,t.SUPPLIER_NAME,t.target_id,t.target_name,t.SBU,NULL,0,t.SETTLEMENT_CLASIFICATION,t.settlement_id,t.`status`,t.settlement_amount,t.settlement_amount-IFNULL(t.deduction_amount,0), 0,0,IFNULL(t.deduction_amount,0),NULL,'PAYED','SYSTEM',NULL,NULL,t.create_time,t.updatetime,'SYSTEM','SYSTEM'  FROM set_settlement t  WHERE t.supplier_id=?
SELECT sassupplie0_.supplier_id AS supplier1_29_0_, sassupplie0_.end_time AS end_time2_29_0_, sassupplie0_.start_time AS start_ti3_29_0_, sassupplie0_.sync_node AS sync_nod4_29_0_ FROM fs_supplier_sync_log sassupplie0_ WHERE sassupplie0_.supplier_id=?


-- 填写产品经理id
UPDATE fs_settle_item_extra extra 
INNER JOIN etl_vst_ord_order_item item ON extra.order_item_id=item.order_item_id
SET extra.manager_id = item.manager_id
WHERE extra.manager_id IS NULL AND extra.order_item_id=2035796128

UPDATE fs_settle_item_extra extra 
INNER JOIN etl_prem_user u ON extra.manager_id=u.user_id
SET  extra.manager_email=u.email



SELECT * FROM fs_settle_item_extra
WHERE order_item_id=2035796128

SELECT manager_id FROM etl_vst_ord_order_item WHERE order_item_id=2035796128

SELECT * FROM etl_prem_user WHERE user_id=3626

UPDATE fs_settle_item_extra SET manager_id=NULL WHERE order_item_id=2035796128

UPDATE fs_settle_item_extra SET manager_email=NULL WHERE order_item_id=2035796128