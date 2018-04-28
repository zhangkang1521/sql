-- ±£œ’≤È—Ø
SELECT DISTINCT 
  b.* 
FROM
  (
    (SELECT 
      pp.product_id 
    FROM
      prod_product pp,
      prod_product_prop ppp,
      biz_category_prop bcp 
    WHERE pp.product_id = ppp.product_id 
      AND ppp.prop_id = bcp.prop_id 
      AND pp.category_id = 3 
      AND pp.cancel_flag = 'Y' 
      AND pp.sale_flag = 'Y' 
      AND ((1 = 1)))
  ) a,
  prod_product b 
WHERE a.product_id = b.product_id 

select* from prod_product where product_id=246056

-- 578629(Long), INSURANCE_738(String), INSURANCE_739(String)
select a.* from supp_goods a, prod_product b, supp_goods_notime_time_price c 
where a.product_id = b.product_id and a.supp_goods_id = c.goods_id and a.PRODUCT_ID = 578629 and b.product_type not in ( 'INSURANCE_738' , 'INSURANCE_739' )

select * from supp_goods 
where supp_goods_id=967616
where product_id=578629

select * from SUPP_SUPPLIER where SUPPLIER_ID = 16855

select * from SUPP_GOODS_NOTIME_TIME_PRICE where   GOODS_ID = 2613700

