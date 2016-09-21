ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss';

-- ���� 
-- ���״̬:0.�ݴ�; 1.�����;2.Ͷ����;3.���긴��;4.������;5.�������;   6��ǩԼ��ѧ�ӱ꣩;-1.����;-2.������;-3.���ʧ��-4ǩԼʧ��
-- ���ʽpaymentmethod 1.�ȶϢ; 2����Ϣ���������ǰ��¸�Ϣ���ڻ�����   5 ���¸�Ϣ���ڻ��� 6 ������Ϣ ���ڻ���  4������Ϣ
 -- �������1���ñ�2�Ƽ���3��ֵ��4�뻹��5������6��Ѻ��7���±�8������ 9���̴� 10�·��� 11ݼӢ��12������ 13ƱС�� 14������ 15���ڴ� 16���ֱ� 17������Ʋ�Ʒ
-- ��Ľ����㷽ʽ1��ͳģʽ2creditģʽ
select borrowid,userid,type,substr(name,0,15) as name,account,loanaccount,accountyes,apr,paymentmethod as pmethod,TIMELIMIT,period,periodUnit as pUnit,status,addtime,version,pledgeType
FROM XXD_BORROW
--WHERE TYPE=17
--where name like '%����%'
where borrowid='BW201609149967'
order by addtime desc;

update xxd_borrow set pledgetype=1 where borrowid='BW201609149967'

-- Ͷ����Ϣ�� Ͷ��״̬:-1.Ͷ��ʧ��;0.Ͷ����;1.������;2.�������;3��ǩԼ;-2ǩԼʧ�� -3 ��Ԫ���˳���״̬��Ϊ����
SELECT TENDERID,BORROWID,USERID,CURUSERID,ISOPTIMIZE,SCHEMEID,EFFECTIVEMONEY,ENDTIME,STATUS,COLLECTAMOUNT,COLLECTINTEREST,COLLECTEDAMOUNT,COLLECTEDINTEREST,COLLECTEDFINE
FROM  XXD_BORROW_TENDER
WHERE BORROWID='BW201609199974'
--and userid=115641
--WHERE TENDERID='BT2016081698515'
order by addtime desc;


-- ����ƻ� ����״̬��Ĭ��ֵ0:0.δ����; 1.�ѻ��� 2.��ǰ�� 3��ǩԼ -1ǩԼʧ��
-- ϵͳ�渶״̬��Ĭ��ֵ0:0.δ�渶;1.�ѵ渶;2.�渶�󻹿�
SELECT REPAYMENTID,PORDER,REPAYMENTACCOUNT AS "account",REPAYMENTCAPITAL AS CAPITAL,REPAYMENTINTEREST AS INTEREST,
REPAYMENTYESACCOUNT as yesAcco,REPAYMENTYESCAPITAL as yesCapi,REPAYMENTYESINTEREST as yesInte,REPAYMENTTIME,STATUS,webstatus,REPAYMENTYESTIME,webtime,laterdays,laterinterest
FROM XXD_BORROW_REPAYMENT
WHERE BORROWID='BW201608029828'
order by porder asc


-- ����ƻ�
-- ����״̬��Ĭ��0��0δ�黹;1.�ѹ黹;2.��վ�渶;3.�渶�󻹿�;4.��ǰ����5��ǩԼ-1ǩԼʧ��
SELECT * FROM XXD_BORROW_COLLECTION
WHERE BORROWID='BW201609149962'
--and porder=4
--and tenderid='BT2016090651751'
ORDER BY  PORDER,TENDERID ASC


-- ��������feeType:1����׼�������궳�ᣬ������������� 2��Ϣ��ѯ�ѣ�������ȡ�� 3��Ϣ�����(������ȡ) 4���� 5�������ܷ�
-- ��������opttype 1�۳�2����
-- ����ֵ���㷽��calmethod 1���ù���2�Զ���
-- ��ȡ�ڵ�chargenode:1����ͨ�� 2���ڻ��� 3�������4��ǰ����
-- ��ȡ״̬status 0δ��ȡ 1����ȡ 2���� 3�Ѷ��� 4�ѷ���5���践��
SELECT borrowfeeid, borrowid,feetype,fee,realfee,calmethod,optype,chargenode,returnnode,returnfee,realreturnfee,feerate,status,porder,addtime
FROM XXD_BORROW_FEE
where borrowid='BW201608029828'

delete from XXD_BORROW_FEE where borrowfeeid='BF20160909014972'

-- ���ڷ���
SELECT *  FROM XXD_BORROW_LATERINTEREST  
WHERE BORROWID='BW201608029828'

DELETE FROM XXD_BORROW_LATERINTEREST 
WHERE BORROWID='BW201609149962' AND REPAYMENTID='BR2016080932394'

-- ���󻹿�
-- -- ��������1��¼����2���ڻ���3���ڻ�����ⷣϢ4��������
SELECT offlinerepayid,rechargeid,amount,rechargedate,borrowid,repaytype,terms,putintime
FROM XXD_BORROW_OFFLINEREPAY
order by offlinerepayid desc

select * from xxd_borrow_offlinerepay t  left join xxd_account_recharge r on t.rechargeid=r.rechargeid  where t.rechargeId='AR2016093014258' and r.status=1 and t.terms is null

update XXD_BORROW_OFFLINEREPAY set repaytype=3 where offlinerepayid=385
