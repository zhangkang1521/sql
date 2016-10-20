ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss';
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
-- ���� 
-- ���״̬:0.�ݴ�; 1.�����;2.Ͷ����;3.���긴��;4.������;5.�������;   6��ǩԼ��ѧ�ӱ꣩;-1.����;-2.������;-3.���ʧ��-4ǩԼʧ��
-- ���ʽpaymentmethod 1.�ȶϢ; 2����Ϣ���������ǰ��¸�Ϣ���ڻ�����   5 ���¸�Ϣ���ڻ��� 6 ������Ϣ ���ڻ���  4������Ϣ
 -- �������1���ñ�2�Ƽ���3��ֵ��4�뻹��5������6��Ѻ��7���±�8������ 9���̴� 10�·��� 11ݼӢ��12������ 13ƱС�� 14������ 15���ڴ� 16���ֱ� 17������Ʋ�Ʒ
-- ��Ľ����㷽ʽ1��ͳģʽ2creditģʽ
select borrowid,userid,type,substr(name,0,15) as name,account,loanaccount,caltype,accountyes,apr,paymentmethod,TIMELIMIT,period,periodUnit,status,addtime,endtime,blevel,version,pledgeType
FROM XXD_BORROW
--WHERE TYPE=17
--where name like '%pxb%'
--where borrowid='BW201609121911'
order by addtime desc;

update xxd_borrow set name='��������-3' where borrowid='BW201609129831'

-- Ͷ����Ϣ�� Ͷ��״̬:-1.Ͷ��ʧ��;0.Ͷ����;1.������;2.�������;3��ǩԼ;-2ǩԼʧ�� -3 ��Ԫ���˳���״̬��Ϊ����
SELECT TENDERID,BORROWID,USERID,CURUSERID,ISOPTIMIZE,SCHEMEID,EFFECTIVEMONEY,ENDTIME,STATUS,COLLECTAMOUNT,COLLECTINTEREST,COLLECTEDAMOUNT,COLLECTEDINTEREST,COLLECTEDFINE
FROM  XXD_BORROW_TENDER
WHERE BORROWID='BW201609121911'
--and userid=115641
--WHERE TENDERID='BT2016081698515'
order by addtime desc;


-- ����ƻ� ����״̬��Ĭ��ֵ0:0.δ����; 1.�ѻ��� 2.��ǰ�� 3��ǩԼ -1ǩԼʧ��
-- ϵͳ�渶״̬��Ĭ��ֵ0:0.δ�渶;1.�ѵ渶;2.�渶�󻹿�
SELECT REPAYMENTID,PORDER,REPAYMENTACCOUNT AS "account",REPAYMENTCAPITAL AS CAPITAL,REPAYMENTINTEREST AS INTEREST,
REPAYMENTYESACCOUNT as yesAcco,REPAYMENTYESCAPITAL as yesCapi,REPAYMENTYESINTEREST as yesInte,REPAYMENTTIME,STATUS,webstatus,REPAYMENTYESTIME,webtime,laterdays,laterinterest
FROM XXD_BORROW_REPAYMENT
WHERE BORROWID='BW201609139838'
order by porder asc

-- ����ƻ�
-- ����״̬��Ĭ��0��0δ�黹;1.�ѹ黹;2.��վ�渶;3.�渶�󻹿�;4.��ǰ����5��ǩԼ-1ǩԼʧ��
SELECT * FROM XXD_BORROW_COLLECTION
WHERE BORROWID='BW201609139838'
--and porder=4
--and tenderid='BT2016090651751'
ORDER BY  PORDER,TENDERID ASC



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


-- ��������feeType:1����׼�������궳�ᣬ������������� 2��Ϣ��ѯ�ѣ�������ȡ�� 3��Ϣ�����(������ȡ) 4���� 5�������ܷ�
-- ��������opttype 1�۳�2����
-- ����ֵ���㷽��calmethod 1���ù���2�Զ���
-- ��ȡ�ڵ�chargenode:1����ͨ�� 2���ڻ��� 3�������4��ǰ����
-- ��ȡ״̬status 0δ��ȡ 1����ȡ 2���� 3�Ѷ��� 4�ѷ���5���践��
SELECT borrowfeeid, borrowid,feetype,fee,realfee,calmethod,optype,chargenode,returnnode,returnfee,realreturnfee,feerate,status,porder,addtime
FROM XXD_BORROW_FEE
where borrowid='BW201609129834'

delete from XXD_BORROW_FEE where borrowfeeid='BF20160909014972'

-- ���ڷ���
SELECT *  FROM XXD_BORROW_LATERINTEREST  
WHERE BORROWID='BW201609129837'

DELETE FROM XXD_BORROW_LATERINTEREST 
WHERE BORROWID='BW201608109723' AND REPAYMENTID='BR2016080932394'

-- ���󻹿�
-- -- ��������1��¼����2���ڻ���3���ڻ�����ⷣϢ4��������
SELECT offlinerepayid,rechargeid,amount,rechargedate,borrowid,repaytype,terms,putintime
FROM XXD_BORROW_OFFLINEREPAY
order by offlinerepayid desc

select * from xxd_borrow_offlinerepay t  left join xxd_account_recharge r on t.rechargeid=r.rechargeid  where t.rechargeId='AR2016093014258' and r.status=1 and t.terms is null

update XXD_BORROW_OFFLINEREPAY set repaytype=3 where offlinerepayid=385

select * from xxd_account_recharge




select * from xxd_fadada_userca


select * from xxd_fadada_signing
