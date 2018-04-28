
-- 订单

SELECT  -- *
 ORDER_ITEM_ID,ORDER_NO,main_bu_code,BU_DEPARTMENT,supplier_id,ORDER_STATUS 
FROM order_item_commision
WHERE order_item_id=2021729736



SELECT * FROM set_settlement_recon WHERE RECON_ID=6001603

 
 SELECT * FROM settlement_order_item_o2o_commision
 WHERE BATCH_ID=17040914052738538
 WHERE ORDER_ITEM_ID=2021692357
 
 -- 	UNSETTLEMENT("未结算") ,SETTLEMENTED("已结算");
SELECT target_id,main_bu_code,bu_code,settle_entity_id,commission_id,order_status
FROM set_o2o_settlement_item
WHERE order_id IN(982797)



UPDATE set_o2o_settlement_item SET order_status='CANCEL' WHERE order_id=652969



-- 结算单
SELECT  * 
-- COMMISION_ID,COMMISION_SETTLE_STATUS
FROM settlement_closure_o2o_commision
WHERE COMMISION_ID IN(17112916054560383)

UPDATE settlement_closure_o2o_commision SET BUSINESS_TYPE='SUPPLIER'  WHERE commision_id=17110814342447878


-- 抵扣单
SELECT * FROM settlement_deduction_o2o_commision
WHERE BUSINESS_type='SUPPLIER' AND STATUS='AUDITED'

UPDATE settlement_deduction_o2o_commision
SET original_Settlement_Price=120


-- 分社
select * from etl_o2o_branch_office

-- 门店
select * from etl_o2o_store



SHOW CREATE TABLE set_o2o_settlement_item



select * from settlement_query_params
WHERE settlement_type='O2O-COMMISSION-ORDER-SUPPLIER'
-- where settlement_type='FS_SET_SETTLEMENT_ITEM'
ORDER BY sort asc

update settlement_query_params set settlement_type='O2O-COMMISSION-SETTLEMENT-STORE' WHERE settlement_type='o2o-commission-settlement-store'

