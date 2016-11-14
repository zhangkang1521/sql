-- btype:标的类型1：新新宝2：新手标 
-- STYLE 还款形式:1.等额本息;2.付息还本;3.其他还款方式;
-- 状态：0未发布1已发布-1已撤标
select * from xxd_xxbao_borrow
where btype=2 
order by addtime desc

update xxd_xxbao_borrow set deploytime =sysdate where xxbdeployid='XB2016110800162'

select * from xxd_xxbao_borrow 
where  deploytime<=to_date('2016-11-08 14:24:43', 'yyyy-mm-dd hh24:mi:ss') and deploytime>=to_date('2016-11-08 14:04:43', 'yyyy-mm-dd hh24:mi:ss')
and status=0 and btype=2

DELETE FROM XXD_BORROW_TENDER WHERE USERID=114446;commit;

update xxd_xxbao_borrow set timelimit=1,style=9 where xxbdeployid='XB2016110700158'

select * from xxd_borrow_xxbmaping
where xxbdeployid='XB2016110700155'

select * from xxd_sysconfig
where syskey like '%SC%'

 select * from xxd_partner
 where partnername like '%生菜%'