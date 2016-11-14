 
 -- 日日盈
 -- 状态:1待发布2已发布3结束4提前退出
 SELECT * FROM XXD_FUND
 
 select * from xxd_fund_apr
 
 UPDATE XXD_FUND SET LASTBALANCE='20161025'
  update xxd_fund set isbalance=1
  
  
select * from xxd_fund_usertrade  
 where userid =114446

select * from xxd_system_holiday
--order by id desc
--order by systemdate desc
WHERE systemdate = '20161025'

insert into xxd_system_holiday(id,systemdate,isholiday,addtime,adduserid,addip) values(407,'20161025', 0, sysdate, 0, '127.0.0.1')
insert into xxd_system_holiday(id,systemdate,isholiday,addtime,adduserid,addip) values(408,'20161026', 1, sysdate, 0, '127.0.0.1')
insert into xxd_system_holiday(id,systemdate,isholiday,addtime,adduserid,addip) values(409,'20161027', 0, sysdate, 0, '127.0.0.1')