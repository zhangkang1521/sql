-- ״̬0����ȡ1��ʹ��2��ʹ��3�ѹ���4�Ѷ���
select *
          FROM XXD_REDENVELOPE_RECORD 
         WHERE USERID = 114432
         
select * from  XXD_REDENVELOPE_RECORD where redcode='41f65622-ac7a-4120-aa0e-eb627c5530001'
         
         41f65622-ac7a-4120-aa0e-eb627c553875

select ID,WORKMONEY from xxd_account_log where userid = ? and pcode = ? and busiid = ? and operatortype = ?	Params:[114432, 1004, OS20160715008, regisRewardType]
         
--��Ӻ��        
INSERT INTO XXD_REDENVELOPE_RECORD(
 REDENVELOPID,REDCODE,FACEVALUE,VALIDDATE,QUOTA,LIMITTYPE,PLATFORM,ISOVERLAY,NAME,SOURCE,ISGIVEN,USERID,STATUS,CREATOR,ADDTIME,
ADDIP,LASTMODIFY,UPDATETIME) 
VALUES 
  (
   seq_REDENVELOPE_RECORD.nextval,'41f65622-ac7a-4120-aa0e-eb627c5530003',	10,	sysdate,	100,	1,	9,
   '0',	'���ֺ��10Ԫ', 	1,	'0',	114432,
   1, 0	,sysdate, '127.0.0.1', 0, sysdate
  )


        

-- ��Ԫ�� ��� 
select * from xxd_account_log al 
inner join XXD_OPTIMIZE_USERSCHEME ou on al.busiid=ou.schemeid
where ou.userid=114432 and al.operatortype='regisRewardType'

select * from nls_database_parameters

ALTER TABLE XXD_REDENVELOPE_RECORD
ADD  BUSITYPE NUMBER
ADD  BUSIID varchar(50);

COMMENT ON COLUMN XXD_REDENVELOPE_RECORD.BUSITYPE IS '���ҵ������ 1��ɢ�� 2��Ԫ��';
comment on column XXD_REDENVELOPE_RECORD.BUSIID is 'ҵ��id��ɢ��Ͷ�ʴ洢tenderDetailId,��Ԫ��Ͷ�ʴ洢userSchemeId��';


ALTER TABLE XXD_REDENVELOPE_RECORD
DROP COLUMN  BUSITYPE
DROP COLUMN BUSIID

start transaction
select * from xxd_eurocup

-- ���� ���긴��->������
UPDATE xxd_borrow SET STATUS=4 WHERE BORROWID='BW201607149709' AND STATUS=4

commit





