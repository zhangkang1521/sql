comment on column XXD_BORROW_FEE.feeType is '1��ܷ�2��Ϣ�����3�˻������4����5�������ܷ�'

update xxd_borrow set PERIOD = timelimit;
update xxd_borrow set PERIODUNIT = 'DAY' where type = 13;
update xxd_borrow set PERIODUNIT = 'MONTH' where paymentmethod in (1,2,5);
UPDATE XXD_BORROW SET PERIODUNIT = 'SEASON' WHERE PAYMENTMETHOD = 6;
update xxd_borrow set PERIODUNIT = 'DAY' where type = 17;