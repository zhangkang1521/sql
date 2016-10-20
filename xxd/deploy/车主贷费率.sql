comment on column XXD_BORROW_FEE.feeType is '1监管费2信息服务费3账户管理费4保费5车辆保管费'

update xxd_borrow set PERIOD = timelimit;
update xxd_borrow set PERIODUNIT = 'DAY' where type = 13;
update xxd_borrow set PERIODUNIT = 'MONTH' where paymentmethod in (1,2,5);
UPDATE XXD_BORROW SET PERIODUNIT = 'SEASON' WHERE PAYMENTMETHOD = 6;
update xxd_borrow set PERIODUNIT = 'DAY' where type = 17;