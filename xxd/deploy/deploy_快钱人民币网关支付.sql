
-- ���������������� ��Ǯ֧��
insert into XXD_PARTNER(PARTNERID,PARTNERNAME,PARTNERAUTH, remark, type,createdate,creator,MODIFIEDDATE,MODIFER,status)
values (34,'��Ǯ֧��','BILL99','��Ǯ֧������',1,sysdate,0,sysdate,0,1);

-- ��Ǯ֧����ֵurl
insert into XXD_SYSCONFIG(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('RECHARGE_BILL99_URL','/bill99/gotoPay.html','��Ǯ���ϳ�ֵ�ڲ�URL'��sysdate,0, sysdate,0);


-- ��Ǯ�����з���
insert into xxd_payment_rate(PAYRATEID,BANKCODE,PARTNERID,paycode,rate,right_rate,right_conn,createdate,createip,creator,lastmodify,modifydate,type)
values(SEQ_PAYMENT_RATE.NEXTVAL,'abc', 34, 'ABC',0.00001,0,0,SYSDATE,'127.0.0.1',0,0,SYSDATE,1);

insert into xxd_payment_rate(PAYRATEID,BANKCODE,PARTNERID,paycode,rate,right_rate,right_conn,createdate,createip,creator,lastmodify,modifydate,type)
values(SEQ_PAYMENT_RATE.NEXTVAL,'cib', 34, 'CIB',0.00001,0,0,SYSDATE,'127.0.0.1',0,0,SYSDATE,1);