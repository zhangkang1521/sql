'/*************************  订单 *************************/'
-- (有settle_entity_id) settle_entity_Id + supplier_id + contract_id + settlement_Clasification + SBU
-- (没有entity) target_id, Filiale_Name
-- recon_state SUCCESS UN_RECON FAIL
SELECT  *
  -- order_id,order_item_meta_id,supplier_id,settle_Entity_Id,target_id,quantity,budget_quantity,budget_total_settlementl_price,total_settlement_price,ORDER_ITEM_ACTUAL_RECEIVED,
  -- settlement_id,budget_settlement_id, supplier_type,performstatus,order_payment_status,settlement_status,order_status,STATUS,confirmed_total_Settlement_Price,confirmed_budget_total_Settlement_Price
  FROM set_settlement_item
  
 -- where settlement_id=30000434
WHERE order_id IN( 62980593)

DELETE FROM set_settlement_item WHERE order_id=62976037


INSERT INTO set_settlement_item(settlement_item_id,order_id,order_status,order_payment_time,order_create_time,order_payment_status,order_contact_person,order_coupon_amount,pass_code,pass_serialno,pass_extid,order_refund,refund_memo,order_item_prod_id,product_id,product_name,product_type,product_branch_id,product_branch_name,product_price,filiale_name,order_item_meta_id,order_item_meta_payed_amount,meta_product_id,meta_product_name,meta_branch_id,meta_branch_name,meta_product_manager,settlement_price,actual_settlement_price,supplier_id,TARGET_ID,product_quantity,quantity,visit_time,sub_product_type,settlement_status,settlement_id,join_settlement_time,total_settlement_price,STATUS,settlement_type,product_sub_product_type,update_time,adjustment_amount,refunded_amount,ought_pay,count_settle_amount,adjustment_remark,update_remark,business_name,meta_filiale_name,setsettlement_period,distributorid,bu_code,main_bu_code,performstatus,company_id,traveling_person,recon_state,recon_memo,recon_id,clear_date,budget_unit_settlement_price,budget_quantity,budget_flag,budget_total_settlementl_price,budget_settlement_id,supplier_name,settle_name,contact_mobile_no,check_out_date,suggest_play_time,main_product_id,main_product_name,grogshop_number,room_night,notify_state,pass_add_code,perform_quantity,output_tax_rate,notax_order_amount,output_tax_amount,notax_count_settle_amount,notifytype,pass_time,updatetime,TRAVEL_GROUP_CODE,actual_Pay,price_confirm_status,group_settle_flag,coupon_amount,promotion_amount,distributor_amount,manual_change_amount,budget_sales_amount,buget_adult,budget_children,CONTRACT_ID,SETTLEMENT_CLASIFICATION,SETTLEMENT_METHODS,EBK_NO,EFFECTED_DATE,EXPIRY_DATE,SETTLE_ENTITY_STATUS,ACCOUNT_NAME,BANK_NAME,BANK_ACCOUNT_NO,SETTLE_ENTITY_ID,SETTLE_CYCLE,SBU,ORDER_SBU,product_sub_type,main_product_sub_type,SUPPLIER_TYPE,SUB_COMPANY_NAME,SUB_COMPANY_ID,ITEM_REFUNDED_AMOUNT,currency,confirmed_actual_settlement_price,confirmed_settlement_price,confirmed_total_settlement_price,confirmed_refunded_amount,confirmed_count_settle_amount,confirmed_budget_unit_settlement_price,confirmed_budget_total_settlement_price,confirmed_notax_count_settle_amount,exchange_rate,contract_code,order_is_term_bill,ORDER_ITEM_ROOM_NIGHT,ORDER_ITEM_ACTUAL_RECEIVED,ORDE_ITEM_SALE_AMOUNT,ORDER_SALE_AMOUNT,ORDER_ITEM_TOUR_TYPE,DISTRIBUTOR_NAME,SUPPLIER_ORDER_CODE,BANK_ADDRESS,SWIFT_CODE,booker_name,booker_mobile,booker_email,traveller_num,invoice_status,user_id,IS_TEST_ORDER,EXPIRED_REFUND_FLAG)
VALUES('39295766','57467764','NORMAL','2017-12-03 20:39:05.0','2017-12-03 20:39:02.0','PAYED','万先生','0','[''1GPUq9z61P'']','2017120377441416','4060205169119171203203943001','0',NULL,'2040178294','181676','总统府','11','6885748','手机讲解','500','SH_FILIALE','2040178294','500','181676','总统府','6885748','手机讲解','顾源','400','400','32355','23892','1','1','2017-12-03 00:00:00.0',NULL,'UNSETTLEMENTED','0',NULL,'400','NORMAL','ORDER',NULL,'2017-12-03 20:42:16.0',NULL,NULL,'500','400',NULL,'生成结算单','NEW_SUPPLIER_BUSINESS','SH_FILIALE','PERMONTH','4','TICKET_BU','TICKET_BU','PERFORM','XINGLV','万先生',NULL,NULL,NULL,'2017-12-10 00:00:00.0',NULL,NULL,NULL,NULL,'0','北京橙桔信息技术有限公司','北京橙桔信息技术有限公司-景区玩乐事业群-月结-故宫讲解','15077822125',NULL,'2017-12-03 00:00:00.0','181676','总统府',NULL,NULL,NULL,NULL,NULL,'0.06',NULL,NULL,'377','QRCODE','2017-12-03 20:42:15.0','2017-12-03 20:42:16.0',NULL,'500','PRICE_CONFIRMED','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28378','PERMONTH','SETTLEMENT_PRICE',NULL,'2017-07-24','2020-07-23',NULL,'北京橙桔信息技术有限公司','民生银行北京知春路支行','150825586','23892','0','TICKET_BU','TICKET_BU','11','11','LVMAMA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BJ-XLJQ-201708-0007','0',NULL,'500','500',NULL,NULL,NULL,NULL,NULL,NULL,'万先生','15077822125',NULL,'1','UNBILL','ff80808138b37a610138d708d32552e8','N',NULL)


SELECT * FROM set_o2o_settlement_item


UPDATE set_o2o_settlement_item SET settlement_id=30000434 WHERE order_id=77487455

-- 订单回退
UPDATE set_settlement_item SET settlement_status='UNSETTLEMENTED',settlement_id=0,budget_settlement_id=0,confirmed_budget_total_Settlement_Price=NULL,confirmed_total_Settlement_Price=NULL
 WHERE order_id=57063297;
DELETE FROM set_settlement WHERE settlement_id IN(30000466,30000467)



'/*************************  结算单 *************************/'
-- settlement_clasification: ADVANCE_PAYMENT:维金预存款 BUYOUT:维金买断 ,查看supplier_id是否有子公司
SELECT  *  
  -- settlement_id,target_id,settlement_clasification,sub_company_id,supplier_id,sbu,settlement_amount,payed_amount,deduction_amount, recon_id ,SETTLEMENT_CHANNEL,set_Settlement_Status,settlement_flag,isValid
FROM set_settlement 
-- where recon_id=60016020001
 WHERE settlement_id IN(30000480)
WHERE SETTLEMENT_CHANNEL='FINANCE'  AND deduction_amount!=0

UPDATE set_o2o_settlement SET set_settlement_status='UNCONFIRM' WHERE settlement_id IN(30000434)

SELECT * FROM set_o2o_settlement

show create table set_settlement_item



'/*************************  对账单 *************************/'  
-- operator_status: PENDING_DISPOSE:待处理 PROCESSING:处理中 FINISHED:处理完
SELECT * FROM set_settlement_recon
WHERE recon_id=60017091915015626 

DELETE FROM set_settlement_recon WHERE recon_id=6001707210275


'/*************************  抵扣 *************************/'
-- `change_remark` 调价描述(0:结算完成前调价 1:结算完成后调价)'
-- change_flag 正常:NORMAL、买断:BUYOUT 结算后取的是结算单settlement_flag(财务系统设置)，结算前是Normal(vst传过来的永远是这个)
 SELECT --  *
     change_id,order_item_id,target_id,settlement_id,budget_settlement_id,old_total_settlement_price, new_total_settlement_price,old_buyout_price,change_remark,change_flag
     ,supplier_id,order_id
 FROM settlement_price_change
 order by change_id desc
 -- where change_id=958
--  WHERE settlement_id=34121
WHERE order_id=62965767
 WHERE target_id = 1
WHERE target_id=? AND settlement_id=0 AND change_remark=1 AND change_flag='NORMAL'

update settlement_price_change set settlement_id=30000434 where change_id=2


-- 改成可使用抵扣
UPDATE settlement_price_change SET target_id=3333,settlement_id=0, change_remark='1',change_flag='NORMAL' WHERE change_id=2

'/*************************  理赔 *************************/'  
SELECT * FROM settlement_claim
WHERE settlement_id IS NOT NULL
WHERE batch_id=10201607200147


'/*************************  事件 *************************/'

SELECT * FROM settle_event
WHERE 


'/*************************  查询条件 *************************/'
  

SELECT *  FROM settlement_query_params
WHERE settlement_type = 'O2O_SET_SETTLEMENT_ITEM'
ORDER BY sort ASC
 


'/*************************  供应商 *************************/'  
SELECT -- *
 supplier_id,supplier_name,sub_company_id 
FROM etl_vst_supp_supplier
WHERE supplier_id=16855





'/*************************  o2o子公司 *************************/' 

SELECT * FROM etl_o2o_subco_info
WHERE id=21




-- 结算对象 
SELECT * FROM etl_vst_supp_settlement_entities
-- WHERE NAME LIKE '%测试%'
WHERE id=3402

-- 结算规则
SELECT * FROM etl_vst_supp_settle_rule



-- 查询
SELECT 
  COUNT(
    setsettlem0_.settlement_item_id
  ) AS col_0_0_ 
FROM
  set_settlement_item setsettlem0_ 
WHERE setsettlem0_.SUPPLIER_TYPE = 'LVMAMA' 
  AND (
    COALESCE(
      setsettlem0_.ITEM_REFUNDED_AMOUNT,
      0
    ) <> COALESCE(
      setsettlem0_.ITEM_REFUNDED_AMOUNT,
      0
    ) 
    OR setsettlem0_.order_status <> 'CANCEL' 
    OR setsettlem0_.ORDER_ITEM_ACTUAL_RECEIVED IS NULL 
    OR setsettlem0_.ITEM_REFUNDED_AMOUNT IS NULL 
    OR setsettlem0_.ORDER_ITEM_ACTUAL_RECEIVED <> setsettlem0_.ITEM_REFUNDED_AMOUNT
  ) -- 全额退款
  AND setsettlem0_.order_payment_status = 'PAYED'  -- 已支付
  AND (
    setsettlem0_.group_settle_flag = 'N' 
    OR setsettlem0_.group_settle_flag IS NULL
  ) -- 团结算
  
  

-- 回退确认 然后再判断price_change有settlement_id,说明被使用了，回退不了
SELECT 
  a.*
  
FROM
  settlement_price_change a,
  set_settlement_item b 
WHERE a.order_id = b.order_id 
  and a.order_item_id = b.order_item_meta_id 
  AND b.settlement_id = '30000480' 