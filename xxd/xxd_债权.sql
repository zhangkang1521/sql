-- ծȨת��
-- ״̬ 0������1ת����2�ɹ�3ʧ��4����5���ڣ�ϵͳ��6֧����
-- ����ʽ��1�û�����2ϵͳ����  1857701
SELECT * FROM XXD_TRADE_REQUEST
WHERE USERID=1857701
WHERE TENDERID='BT2016080397398'
order by addtime desc

-- inmethod��1ɢ������2��Ԫ������
SELECT * FROM XXD_TRADE_PACK
where requestid in (select requestid  from XXD_TRADE_REQUEST where tenderid='BT2016080125313')
