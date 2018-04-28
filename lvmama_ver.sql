------------------------------------------------ 标准产品管理 ----------------------------------------------
-- 15:跟团游
select * from PROD_PRODUCT pp
where pp.CATEGORY_ID = 15 and pp.ABANDON_FLAG = 'N' and pp.CATEGORY_ID != 1 and pp.CATEGORY_ID != 32
order by pp.product_id desc

select * from prod_product where product_id=2986869

------------------------------------------------ 标准产品管理 ----------------------------------------------

SELECT DISTINCT b.*
FROM (SELECT pp.product_id
	FROM prod_product pp, prod_product_prop ppp, biz_category_prop bcp
	WHERE pp.product_id = ppp.product_id
		AND ppp.prop_id = bcp.prop_id
		AND pp.category_id = 3
		AND pp.cancel_flag = 'Y'
		AND pp.sale_flag = 'Y'
		AND 1 = 1
	) a, prod_product b
WHERE a.product_id = b.product_id

select * from ORD_MUL_PRICE_RATE