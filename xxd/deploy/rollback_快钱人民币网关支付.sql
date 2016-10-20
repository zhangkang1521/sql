-- 第三方合作伙伴 删除快钱
delete from XXD_PARTNER where PARTNERID=34;

-- 删除 快钱支付充值url
delete from XXD_SYSCONFIG where syskey='RECHARGE_BILL99_URL';

-- 删除快钱各银行费率
delete from xxd_payment_rate where PARTNERID=34;