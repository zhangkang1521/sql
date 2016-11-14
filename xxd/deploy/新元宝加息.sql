
-- v2.0��Ԫ�������˳�����
merge into XXD_OPTIMIZE_USERSCHEME a
using (
   select ou.userschemeid,round(ou.account * os.minapr *os.closeterm/12/100, 2) as expectedInterest
  from XXD_OPTIMIZE_USERSCHEME ou
  inner join XXD_OPTIMIZE_SCHEME os on ou.schemeid=os.schemeid and os.version='v2.0'
) b
on (a.userschemeid = b.userschemeid)
when matched then
update set a.expectedinterest = b.expectedInterest
where a.expectedinterest=0;




-- ������Ʒ�������ʱ�
CREATE TABLE XXD_PRODUCT_FLOAT_APR(
  ID NUMBER(12) PRIMARY KEY,
  PRODID VARCHAR2(20) NOT NULL,
  PRODTYPE VARCHAR2(10) NOT NULL,
  PC NUMBER(6,3) DEFAULT 0 NOT NULL,
  APP NUMBER(6,3) DEFAULT 0 NOT NULL,
  WEBAPP NUMBER(6,3) DEFAULT 0 NOT NULL
);
COMMENT ON TABLE XXD_PRODUCT_FLOAT_APR IS '��Ʒ�������ʱ�';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.ID IS '����';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.PRODID IS '��Ʒid';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.PRODTYPE IS '��Ʒ����';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.PC IS 'PC�˼�Ϣֵ';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.APP IS 'APP�˼�Ϣֵ';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.WEBAPP IS 'WEBAPP�˼�Ϣֵ';

 
create sequence SEQ_PRODUCT_FLOAT_APR
start with 1
increment by 1;


-- ��Ԫ�������������������ֶ�
alter table XXD_OPTIMIZE_USERSCHEME
ADD FLOATAPR NUMBER(6, 3) default 0 not null;

COMMENT ON COLUMN XXD_OPTIMIZE_USERSCHEME.FLOATAPR IS '��������(�����ֶ�)';

-- ��Ԫ�������¼����
ALTER TABLE XXD_OPTIMIZE_USERDETAIL
ADD CHANNEL VARCHAR(10)
ADD APR NUMBER(6��3) 
ADD FLOATAPR NUMBER(6, 3);

COMMENT ON COLUMN XXD_OPTIMIZE_USERDETAIL.CHANNEL IS '����';
COMMENT ON COLUMN XXD_OPTIMIZE_USERDETAIL.APR IS '����';
COMMENT ON COLUMN XXD_OPTIMIZE_USERDETAIL.FLOATAPR IS '��������';

-- ������������
merge into XXD_OPTIMIZE_USERDETAIL a
using (select ou.userschemeid,os.minapr
  from XXD_OPTIMIZE_USERSCHEME ou
  inner join XXD_OPTIMIZE_SCHEME os on ou.schemeid=os.schemeid and os.version='v2.0'
) b
on (a.userschemeid=b.userschemeid)
when matched then
update set 
a.apr = b.minapr,
a.floatapr = 0
where a.apr is null;

