-- 债权转让
-- 状态 0待发布 1转让中 2成功 3失败4撤销5过期（系统）6支付中
-- 发起方式：1用户发起2系统发起  1857701
SELECT * FROM XXD_TRADE_REQUEST
--WHERE USERID=1857701
--- TENDERID='BT2016102059311'
where requestid='TR2016110836778'
order by addtime desc

delete from XXD_TRADE_REQUEST where requestid='TR2016110901673'

-- inmethod：1散标买入2新元宝买入
SELECT * FROM XXD_TRADE_PACK
where requestid in ('TR2016103129448')



-- redis 消息 处理状态 1已发送2已处理
-- topic : step_quit_topic: 步步高升退出 create_sysuser_trade_apply_topic 系统发起债权转让 redis_msg_recheck_success_channel 满标
-- recharge_trigger_repay_topic 贷后还款 borrow_webservice_commprod_tender_topic 短期理财产品投标
select id,topic,addtime,operatetime,status,message
FROM XXD_REDIS_MSG
where topic like '%trade_to_buy_topic%' 
and message like '%TR2016110835557%'
and status=1
order by id desc
