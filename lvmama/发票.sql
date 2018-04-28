SELECT 
 *,
 SUM(setsettlem0_.room_night)
FROM
  set_settlement_item  setsettlem0_
WHERE (setsettlem0_.order_status IN ('NORMAL', 'FINISHED')) 
  AND setsettlem0_.order_payment_status = 'PAYED'
  AND (
    setsettlem0_.invoice_status IN ('UNBILL', 'PART_BILLED') 
    OR setsettlem0_.invoice_status IS NULL
  ) 
--  and setsettlem0_.booker_name = ? 
GROUP BY setsettlem0_.order_id 


SELECT 
  invoiceord0_.invoice_order_merge_id AS invoice_1_25_,
  invoiceord0_.create_time AS create_t2_25_,
  invoiceord0_.invoice_apply_channel AS invoice_3_25_,
  invoiceord0_.invoice_apply_type AS invoice_4_25_,
  invoiceord0_.operator_id AS operator5_25_,
  invoiceord0_.operator_name AS operator6_25_,
  invoiceord0_.remark AS remark7_25_,
  invoiceord0_.status AS status8_25_,
  invoiceord0_.total_invoice_amount AS total_in9_25_,
  invoiceord0_.update_time AS update_10_25_ 
FROM
  invoice_order_merge invoiceord0_ 
  LEFT OUTER JOIN invoice_order invoiceord1_ 
    ON invoiceord0_.invoice_order_merge_id = invoiceord1_.invoice_order_merge_id 
  LEFT OUTER JOIN invoice invoicelis2_ 
    ON invoiceord0_.invoice_order_merge_id = invoicelis2_.invoice_order_merge_id 
WHERE invoiceord0_.status = 'UNBILL' 
GROUP BY invoiceord0_.invoice_order_merge_id 
ORDER BY invoiceord0_.create_time DESC 

SELECT * FROM invoice_order_merge WHERE invoice_order_merge_id= 1709221156484912240

SELECT * FROM invoice_order

SELECT * FROM invoice WHERE invoice_order_merge_id=1709221156484912240

SELECT * FROM invoice_address WHERE invoice_id=200002

SELECT * FROM invoice_event WHERE object_id=1709221156484912240

select orde.*
from invoice inv
inner join invoice_order_merge mer on inv.invoice_order_merge_id=mer.invoice_order_merge_id
inner join invoice_order orde on mer.invoice_order_merge_id=orde.invoice_order_merge_id
where inv.invoice_no=

select * from invoice_order_relation

select * from invoice_order_relation
group by  invoice_order_id
having count(*) > 1




