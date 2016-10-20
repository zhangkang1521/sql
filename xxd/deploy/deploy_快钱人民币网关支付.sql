
-- 第三发合作伙伴添加 快钱支付
insert into XXD_PARTNER(PARTNERID,PARTNERNAME,PARTNERAUTH, remark, type,createdate,creator,MODIFIEDDATE,MODIFER,status)
values (34,'快钱支付','BILL99','快钱支付线上',1,sysdate,0,sysdate,0,1);

-- 快钱支付充值url
insert into XXD_SYSCONFIG(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('RECHARGE_BILL99_URL','/bill99/gotoPay.html','快钱线上充值内部URL'，sysdate,0, sysdate,0);


-- 快钱各银行费率
insert into xxd_payment_rate(PAYRATEID,BANKCODE,PARTNERID,paycode,rate,right_rate,right_conn,createdate,createip,creator,lastmodify,modifydate,type)
values(SEQ_PAYMENT_RATE.NEXTVAL,'abc', 34, 'ABC',0.00001,0,0,SYSDATE,'127.0.0.1',0,0,SYSDATE,1);

insert into xxd_payment_rate(PAYRATEID,BANKCODE,PARTNERID,paycode,rate,right_rate,right_conn,createdate,createip,creator,lastmodify,modifydate,type)
values(SEQ_PAYMENT_RATE.NEXTVAL,'cib', 34, 'CIB',0.00001,0,0,SYSDATE,'127.0.0.1',0,0,SYSDATE,1);