select * from xxd_sysconfig
where syskey like '%qtds%'



insert into xxd_sysconfig(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('qtds_warn_email', 'zhangkang@xinxindai.com,wanggang@xinxindai.com', '七天大胜预警邮箱',sysdate, 0, sysdate, 0);

insert into xxd_sysconfig(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('qtds_warn_phone', '13524335507,18755605072', '七天大胜预警手机号码',sysdate, 0, sysdate, 0);

insert into xxd_sysconfig(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('qtds_warn_threshold', '100000', '七天大胜预警值',sysdate, 0, sysdate, 0);



update xxd_sysconfig set syskeyvalue='100000' where syskey='qtds_warn_threshold'

select * from xxd_sysconfig
where syskey like '%qtds%'
