
-- v2.0新元宝到期退出收益
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




-- 新增产品浮动利率表
CREATE TABLE XXD_PRODUCT_FLOAT_APR(
  ID NUMBER(12) PRIMARY KEY,
  PRODID VARCHAR2(20) NOT NULL,
  PRODTYPE VARCHAR2(10) NOT NULL,
  PC NUMBER(6,3) DEFAULT 0 NOT NULL,
  APP NUMBER(6,3) DEFAULT 0 NOT NULL,
  WEBAPP NUMBER(6,3) DEFAULT 0 NOT NULL
);
COMMENT ON TABLE XXD_PRODUCT_FLOAT_APR IS '产品浮动利率表';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.ID IS '主键';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.PRODID IS '产品id';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.PRODTYPE IS '产品类型';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.PC IS 'PC端加息值';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.APP IS 'APP端加息值';
COMMENT ON COLUMN XXD_PRODUCT_FLOAT_APR.WEBAPP IS 'WEBAPP端加息值';

 
create sequence SEQ_PRODUCT_FLOAT_APR
start with 1
increment by 1;


-- 新元宝加入新增浮动利率字段
alter table XXD_OPTIMIZE_USERSCHEME
ADD FLOATAPR NUMBER(6, 3) default 0 not null;

COMMENT ON COLUMN XXD_OPTIMIZE_USERSCHEME.FLOATAPR IS '浮动利率(冗余字段)';

-- 新元宝加入记录详情
ALTER TABLE XXD_OPTIMIZE_USERDETAIL
ADD CHANNEL VARCHAR(10)
ADD APR NUMBER(6，3) 
ADD FLOATAPR NUMBER(6, 3);

COMMENT ON COLUMN XXD_OPTIMIZE_USERDETAIL.CHANNEL IS '渠道';
COMMENT ON COLUMN XXD_OPTIMIZE_USERDETAIL.APR IS '利率';
COMMENT ON COLUMN XXD_OPTIMIZE_USERDETAIL.FLOATAPR IS '浮动利率';

-- 加入详情利率
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

