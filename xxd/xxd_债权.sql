-- 债权转让
-- 状态 0待发布1转让中2成功3失败4撤销5过期（系统）6支付中
-- 发起方式：1用户发起2系统发起  1857701
SELECT * FROM XXD_TRADE_REQUEST
WHERE USERID=1857701
WHERE TENDERID='BT2016080397398'
order by addtime desc

-- inmethod：1散标买入2新元宝买入
SELECT * FROM XXD_TRADE_PACK
where requestid in (select requestid  from XXD_TRADE_REQUEST where tenderid='BT2016080125313')
