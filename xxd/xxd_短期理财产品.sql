
-- ͨ����ƶ���  �޶�����
-- ״̬��0δ��Ч1����2ͣ��
select * from xxd_commprod_define
where status=1

SELECT * FROM XXD_COMMPROD_DEPLOY
where status=1


DELETE FROM XXD_BORROW_TENDER WHERE USERID=114446;
commit;

update XXD_COMMPROD_DEPLOY set tendsum=0
where deployid='QT2016362200024'


UPDATE XXD_COMMPROD_DEFINE SET LIMITNUM=3000 WHERE PRODSPELL='monthgold';

update XXD_COMMPROD_DEPLOY set startdate=to_date('2016-10-27 10:00:00', 'yyyy-mm-dd hh24:mi:ss'),enddate=to_date('2016-11-1 10:55:35', 'yyyy-mm-dd hh24:mi:ss') 
where deployid='YJ2016251900172';
commit;

update XXD_COMMPROD_DEPLOY set amount=110000,tendsum=0 where deployid='QT2016362200024'

DELETE FROM XXD_BORROW_TENDER WHERE USERID=114446;



-- ���� ��Ʒ���� ���� һ��������Ʒ��Ӧ������
SELECT * FROM XXD_COMMPORD_MAPPING
where borrowid='BW201609229983'

SELECT * FROM XXD_COMMPORD_NOTICE
where borrowid='BW201609229983'

