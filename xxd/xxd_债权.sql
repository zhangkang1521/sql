-- ծȨת��
-- ״̬ 0������ 1ת���� 2�ɹ� 3ʧ��4����5���ڣ�ϵͳ��6֧����
-- ����ʽ��1�û�����2ϵͳ����  1857701
SELECT * FROM XXD_TRADE_REQUEST
--WHERE USERID=1857701
--- TENDERID='BT2016102059311'
where requestid='TR2016110836778'
order by addtime desc

delete from XXD_TRADE_REQUEST where requestid='TR2016110901673'

-- inmethod��1ɢ������2��Ԫ������
SELECT * FROM XXD_TRADE_PACK
where requestid in ('TR2016103129448')



-- redis ��Ϣ ����״̬ 1�ѷ���2�Ѵ���
-- topic : step_quit_topic: ���������˳� create_sysuser_trade_apply_topic ϵͳ����ծȨת�� redis_msg_recheck_success_channel ����
-- recharge_trigger_repay_topic ���󻹿� borrow_webservice_commprod_tender_topic ������Ʋ�ƷͶ��
select id,topic,addtime,operatetime,status,message
FROM XXD_REDIS_MSG
where topic like '%trade_to_buy_topic%' 
and message like '%TR2016110835557%'
and status=1
order by id desc
