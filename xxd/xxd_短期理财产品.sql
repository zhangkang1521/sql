
-- ͨ����ƶ���  �޶�����
-- ״̬��0δ��Ч1����2ͣ��
select * from xxd_commprod_define
where status=1

SELECT * FROM XXD_COMMPROD_DEPLOY
where status=1


UPDATE XXD_COMMPROD_DEFINE SET LIMITNUM=3000 WHERE PRODSPELL='monthgold';

update XXD_COMMPROD_DEPLOY set mosttender=3000 where deployid='YJ2016532700171'

update XXD_COMMPROD_DEPLOY set status=2 where deployid='QT2016342700022'

-- ��ѯͶ�������½������Ͷ����Ϣ
select * from xxd_borrow_tender
where borrowid in(
  select borrowid from xxd_borrow
  where content in('�½�����','monthgold')
) and userid=114432
order by addtime desc 

delete from xxd_borrow_tender where borrowid in(
  select borrowid from xxd_borrow
  where content in('�½�����','monthgold')
) and userid=114432


-- ��ѯ �����ʤ Ͷ����Ϣ
select * from xxd_borrow_tender
where borrowid in(
  select borrowid from xxd_borrow
  where content in('�����ʤ','sevengold')
) --and userid=114446
order by addtime desc 

SELECT * FROM XXD_COMMPORD_MAPPING
where borrowid='BW201601048793'

SELECT * FROM XXD_COMMPROD_DEPLOY
where deployid='QT2016510400003'



 SELECT BT.EFFECTIVEMONEY, BT.ADDTIME, U.NICKNAME AS USERNAME      
 FROM XXD_BORROW_TENDER BT      
 INNER JOIN XXD_BORROW B ON BT.BORROWID=B.BORROWID    
 INNER JOIN XXD_USER U ON BT.USERID=U.USERID 
 WHERE B.TYPE=17 AND bt.status>0 AND B.CONTENT ='sevengold'
 ORDER BY BT.ADDTIME DESC