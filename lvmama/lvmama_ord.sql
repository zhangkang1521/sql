-- ֧��״̬�� payment_status: PAYED TRANSFERRED
-- Ԥ�� payment_target:PREPAID 
-- ��Դ��ˣ� info_status:INFOPASS resource_status: AMPLE
select   *
-- order_id,PAYMENT_TARGET,INFO_STATUS,RESOURCE_STATUS 
from lvmama_ord.ORD_ORDER where order_id in(62965767)
62974314

update ORD_ORDER set payment_status='PREPAID' WHERE ORDER_ID=62972665



select --  *
   main_item,PRICE_CONFIRM_STATUS,Supp_Settlement_Entity_Code,Expired_Refund_Flag,Perform_Status,supplier_id,MANAGER_ID,UPDATE_TIME
from lvmama_ord.ORD_ORDER_ITEM where order_id=62980430

UPDATE  ORD_ORDER_ITEM SET supplier_id=3411 where order_id=62972665

select distinct(PRICE_CONFIRM_STATUS) from ORD_ORDER_ITEM

-- ��̯ apportion_amount -> ORDER_ITEM_ACTUAL_RECEIVED
select * from lvmama_ord.ORDER_ITEM_APPORTION_STATE
where order_id=62972665

-- ����״̬��ʱ��
select * from lvmama_ord.ORD_TICKET_PERFORM
where order_item_id=62976122

-- ������޸�
select * from lvmama_ord.ORD_SETTLEMENT_PRICE_RECORD
where order_item_id=2024888395

select * from ORD_ORDER_AMOUNT_ITEM
where order_id=62965767

-- ��Ʒ����
select * from biz_category

-- ������ˮ��
select * from lvmama_ver.intf_pass_code

select * from lvmama_ord.ORD_PASS_CODE
where order_item_id=

-- ��Ϣ��¼
select * from lvmama_ord.JMS_ORDER_MESSAGE_INFO 
where order_id=62975985
where order_item_id=2039839454