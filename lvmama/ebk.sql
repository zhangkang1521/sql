SELECT -- *
   settlement_item_id,order_id,order_item_meta_id,budget_flag,settlement_Clasification,settle_entity_id,settle_name,
    quantity,total_settlement_price,actual_Pay,
   settlement_id,budget_settlement_id,    recon_id,recon_State,notify_state,recon_memo
   ,ITEM_REFUNDED_AMOUNT,supplier_id,target_id,settlement_status,PRICE_CONFIRM_STATUS,STATUS,supplier_type,clear_date,meta_product_manager
FROM set_settlement_item
-- WHERE order_id=  60000012943
 WHERE recon_id=60017101014505650
 
 SELECT SUM(setsettlem0_.total_settlement_price) AS col_0_0_ FROM set_settlement_item setsettlem0_ 
WHERE (setsettlem0_.settlement_item_id IN (3013113)) AND setsettlem0_.recon_id=6001612122510 
AND setsettlem0_.settlement_id=0 
 
 
'/*************************  对账单 *************************/'  
-- recon_status: PENDING_DISPOSE:待处理 PROCESSING:处理中 FINISHED:处理完 
-- operator_status: LVMM_USE:驴妈妈财务人员核对中 SUPP_USE  UN_USE
SELECT * FROM set_settlement_recon
WHERE recon_id=60017092010205636 

SELECT * FROM set_settlement_query
WHERE order_id=62937403

-- 查询供应商的结算对象
SELECT enti.id,enti.name
FROM etl_vst_supp_supplier supp
INNER JOIN etl_vst_supp_settle_rule rule ON supp.supplier_id=rule.supplier_id
INNER JOIN etl_vst_supp_settlement_entities  enti ON rule.settle_rule_id=enti.SUPP_SETTLE_RULE_ID
WHERE supp.supplier_id=3411

SELECT supp.supplier_id,COUNT(*)
FROM etl_vst_supp_supplier supp
INNER JOIN etl_supp_contract cont ON supp.supplier_id=cont.supplier_id
INNER JOIN etl_vst_supp_settlement_entities  enti ON cont.CONTRACT_ID=enti.CONTRACT_ID
GROUP BY supplier_id


-- ebk订单

SELECT 
  setsettlem0_.*
FROM
  set_settlement_item setsettlem0_ 
WHERE (
    setsettlem0_.PRICE_CONFIRM_STATUS IS NULL 
    OR setsettlem0_.PRICE_CONFIRM_STATUS = 'PRICE_CONFIRMED'
  ) 
--  AND setsettlem0_.supplier_id = 3411 
  AND setsettlem0_.visit_time >= '2017-01-01 00:00:00' 
  AND setsettlem0_.clear_date < '2017-12-04
00:00:00' 
  AND (setsettlem0_.recon_id IS NULL) 
  AND (
    setsettlem0_.status IN ('NORMAL', 'CANCEL')
  ) 
  AND (
    setsettlem0_.settlement_status IN ('UNSETTLEMENTED')
  ) 
  AND setsettlem0_.SUPPLIER_TYPE = 'LVMAMA' 
  AND (
    COALESCE(
      setsettlem0_.ITEM_REFUNDED_AMOUNT,
      0
    ) <> 0
    OR setsettlem0_.order_status <> 'CANCEL' 
    OR setsettlem0_.ORDER_ITEM_ACTUAL_RECEIVED IS NULL 
    OR setsettlem0_.ITEM_REFUNDED_AMOUNT IS NULL 
    OR setsettlem0_.ORDER_ITEM_ACTUAL_RECEIVED <> setsettlem0_.ITEM_REFUNDED_AMOUNT
  ) 
  AND setsettlem0_.order_payment_status = 'PAYED' 
  AND (
    setsettlem0_.group_settle_flag = 'N' 
    OR setsettlem0_.group_settle_flag IS NULL
  ) 
ORDER BY setsettlem0_.order_create_time DESC 
LIMIT 10 

update set_settlement_item set supplier_id=3411 where order_id=62969404

SELECT 1 FROM DUAL WHERE COALESCE(3, 0)!=3
select 1 from dual where COALESCE(1, 0)!=3

select * from set_settlement_item

select order_id,ORDER_ITEM_ACTUAL_RECEIVED,ITEM_REFUNDED_AMOUNT from set_settlement_item where order_id in(300005,300006,300007,300008)
 -- and ITEM_REFUNDED_AMOUNT!=null 
 and (ORDER_ITEM_ACTUAL_RECEIVED > ITEM_REFUNDED_AMOUNT )
 

UPDATE  set_settlement_item SET ORDER_ITEM_ACTUAL_RECEIVED=10,ITEM_REFUNDED_AMOUNT=10 WHERE order_id=300005;
UPDATE  set_settlement_item SET ORDER_ITEM_ACTUAL_RECEIVED=10,ITEM_REFUNDED_AMOUNT=null WHERE order_id=300006;
UPDATE  set_settlement_item SET ORDER_ITEM_ACTUAL_RECEIVED=NULL,ITEM_REFUNDED_AMOUNT=NULL WHERE order_id=300007;
UPDATE  set_settlement_item SET ORDER_ITEM_ACTUAL_RECEIVED=10,ITEM_REFUNDED_AMOUNT=5 WHERE order_id=300008;

