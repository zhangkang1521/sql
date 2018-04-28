' ---------------------------------------------- 结算项 ----------------------------------------------'
-- 结算类型 订单：ORDER_ITEM 拆单：SPLIT_ITEM 抵扣单：DEDUCTION_ITEM 调整单：ADJUST_ITEM 理赔单:CLAIM_ITEM
62986443 支付消息未发
SELECT * FROM fs_settle_item
-- where order_id in(62986939)  
WHERE bill_id IN (8001706181326167973) 

UPDATE fs_settle_item SET settle_item_status='UNSETTLEMENTED'  WHERE order_id=56537543

SELECT * FROM fs_settle_item_extra
 WHERE order_item_id =2031780491
 WHERE customer_phone IN( 18653336588,13540640732)
 
 UPDATE fs_settle_item_extra SET customer_id='340827199203092333' WHERE order_item_id=2028618572
 
UPDATE  fs_settle_item SET VERSION=NULL WHERE order_id=49487864

SELECT * FROM etl_vst_ord_order
WHERE order_id=62984860

SELECT * FROM etl_vst_ord_order_item
WHERE order_id=62984860

SELECT * FROM fs_settle_item
ORDER BY payment_time DESC

SHOW INDEX FROM fs_settle_item

' ---------------------------------------------- 对账单 ----------------------------------------------'
-- RECONING 62869400 629
SELECT * FROM fs_settle_bill
-- where supplier_id=3138
-- where id=8001706181326167966
WHERE settle_bill_no ='180205175941688652'

SELECT * FROM fs_settle_bill_entity
WHERE bill_id=9001706181326168514

SELECT * FROM fs_settle_bill_summary_entity
WHERE settle_entity_id=19062

SELECT * FROM etl_vst_supp_settlement_entities
WHERE id=19109



SELECT * FROM etl_supp_contract
WHERE contract_id=401





SELECT * FROM fs_transfer
ORDER BY id DESC

SELECT * FROM fs_ekp_pay_apply
WHERE bill_id=8001706181326168002
ORDER BY id DESC






' ---------------------------------------------- 对账 ----------------------------------------------'

-- 所有对账字段
SELECT * FROM fs_recon_field

-- 上传记录
SELECT *  FROM fs_upload_record 
-- where id=786
WHERE supplier_id=3138
ORDER BY id DESC

DELETE FROM fs_upload_record WHERE supplier_id=3138

-- 供应商订单
SELECT * FROM fs_supplier_order
 WHERE batch_no=877
-- where id=499358
WHERE supplier_id=3138

DELETE FROM fs_supplier_order WHERE supplier_id=3138


-- 供应商模板 
SELECT * FROM fs_supplier_order_template
WHERE  supplier_id=3138

UPDATE fs_supplier_order_template SET sbu=NULL WHERE supplier_id=3138



delete from fs_supplier_order_template where supplier_id=3138

-- 模板字段
select * from fs_supplier_order_template_field where template_id=163

delete from fs_supplier_order_template_field WHERE template_id=47


-- 对账逻辑
SELECT * FROM fs_supplier_order_recon WHERE template_id=163

delete FROM fs_supplier_order_recon WHERE template_id=158

-- 对账依据字段
select * from fs_supplier_order_recon_field where recon_id in(354)

delete from fs_supplier_order_recon_field where recon_id=337


-- 取消勾兑
delete from fs_supplier_order WHERE supplier_id=3138;
update fs_settle_item SET blend_status='UNBLENDED',supplier_settle_price=null WHERE  supplier_id=3138;
update fs_settle_bill set supplier_upload_batch_no=null where supplier_id=3138;


update fs_supplier_order SET blend_status='UNBLENDED',bill_id=0 where batch_no=877;

-- 勾兑关系记录
select * from fs_supplier_settle_bill_rela
where bill_id in (8001706181326167881)

delete from fs_supplier_settle_bill_rela where bill_id IN (8001706181326167881)

select * from fs_supplier_order_settle_item_rela
where batch_no=877

delete from fs_supplier_order_settle_item_rela where batch_no=877


 
 select * from fs_less_order_rela
 order by id desc
 
 delete from fs_less_order_rela


-- 对账excel
select item.id,item.order_id, ex.supplier_order_id,  
ex.customer_name, ex.customer_phone, ex.customer_id,
ex.pass_extid, ex.pass_serialno, ex.pass_code, ex.pass_add_code,
item.settle_price/100 AS settle_price
from fs_settle_item item
left join fs_settle_item_extra ex on item.order_item_id=ex.order_item_id
where bill_id in(8001706181326167881,8001706181326167894)

SELECT  item.order_id,ex.pass_extid,item.settle_price/100 AS settle_price
FROM fs_settle_item item
LEFT JOIN fs_settle_item_extra ex ON item.order_item_id=ex.order_item_id
WHERE bill_id IN(8001706181326167881,8001706181326167894)



' ---------------------------------------------- 审核 ----------------------------------------------'
SELECT * FROM fs_documents
ORDER BY id DESC

SELECT * FROM fs_settle_status_change
-- where order_id=56537543
ORDER BY id DESC


SELECT * FROM fs_order_supplier_change
ORDER BY id 

' ---------------------------------------------- 用户 ----------------------------------------------'
SELECT * FROM etl_prem_user
WHERE email LIKE '%jing%'


-- 切换sas
select * from fs_supplier
where supplier_id=3409 and settle_entity_id=18484

select * from fs_notification
order by id desc

select * from fs_notification_bill

select * from etl_vst_pay_payment


select * from fs_transfer

delete from fs_transfer
