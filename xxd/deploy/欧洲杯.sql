
-- 欧洲杯活动竞猜表
-- 用户投资新元宝后，往答题表插入一条记录
-- 竞猜后，将冠军球队id，亚军球队id更新
CREATE TABLE XXD_EUROCUP(
    ID NUMBER PRIMARY KEY,
    USERID NUMBER(10),
    CHAMPIONID NUMBER(2),
    RUNNERID NUMBER(2),
    TENDERTIME DATE,
    SUBMITTIME DATE,
    TERMINALVER  VARCHAR2(300),
    CREATEIP VARCHAR2(15)
);

COMMENT ON TABLE XXD_EUROCUP IS '欧洲杯活动竞猜表';
COMMENT ON COLUMN XXD_EUROCUP.ID IS 'ID';
COMMENT ON COLUMN XXD_EUROCUP.USERID IS '用户id';
COMMENT ON COLUMN XXD_EUROCUP.CHAMPIONID IS '冠军球队id';
COMMENT ON COLUMN XXD_EUROCUP.RUNNERID IS '亚军球队id';
COMMENT ON COLUMN XXD_EUROCUP.TENDERTIME IS '投资时间';
COMMENT ON COLUMN XXD_EUROCUP.SUBMITTIME IS '竞猜时间';
COMMENT ON COLUMN XXD_EUROCUP.TERMINALVER IS '终端信息';
COMMENT ON COLUMN XXD_EUROCUP.CREATEIP IS 'ip';

-- 一个用户只可猜一次
create unique index uni_idx_eurocup_userid on XXD_EUROCUP(USERID);

CREATE SEQUENCE SEQ_EUROCUP 
START WITH 1
INCREMENT BY 1;

CREATE TABLE XXD_EUROCUP_TEAM(
        ID NUMBER(2) PRIMARY KEY,
        NAME VARCHAR(20),
        LOGO VARCHAR(100),
        CHAMPIONSUPPORT NUMBER default 0,
        RUNNERSUPPORT NUMBER default 0,
        PORDER NUMBER(2)   
);

COMMENT ON TABLE XXD_EUROCUP_TEAM IS '欧洲杯球队表';

COMMENT ON COLUMN XXD_EUROCUP_TEAM.ID IS 'ID';
COMMENT ON COLUMN XXD_EUROCUP_TEAM.NAME IS '球队名称';
COMMENT ON COLUMN XXD_EUROCUP_TEAM.LOGO IS 'logo路径';
COMMENT ON COLUMN XXD_EUROCUP_TEAM.CHAMPIONSUPPORT IS '冠军支持数';
COMMENT ON COLUMN XXD_EUROCUP_TEAM.RUNNERSUPPORT IS '亚军支持数';
COMMENT ON COLUMN XXD_EUROCUP_TEAM.PORDER IS '排序';

create unique index UNI_IDX_EUROCUP_TEAM on XXD_EUROCUP_TEAM(NAME);



INSERT INTO XXD_EUROCUP_TEAM(ID,NAME,LOGO,PORDER)
values(1, '法国','1.png', 10);
INSERT INTO XXD_EUROCUP_TEAM(ID,NAME,LOGO,PORDER)
values(2, '威尔士','2.png', 20);
insert into XXD_EUROCUP_TEAM(id,name,logo,porder)
values(3, '葡萄牙','3.png', 30);
INSERT INTO XXD_EUROCUP_TEAM(ID,NAME,LOGO,PORDER)
values(4, '德国','4.png', 40);

select * from XXD_EUROCUP_TEAM

UPDATE XXD_EUROCUP_TEAM SET CHAMPIONSUPPORT=234,RUNNERSUPPORT=3 WHERE ID=1;
UPDATE XXD_EUROCUP_TEAM SET CHAMPIONSUPPORT=235,RUNNERSUPPORT=3 WHERE ID=2;
UPDATE XXD_EUROCUP_TEAM SET CHAMPIONSUPPORT=342,RUNNERSUPPORT=3 WHERE ID=3;
update XXD_EUROCUP_TEAM set CHAMPIONSUPPORT=0,RUNNERSUPPORT=0 where id=4;


select * from XXD_EUROCUP_TEAM;

update XXD_EUROCUP_TEAM set porder=35 where 


SELECT SEQ_EUROCUP.NEXTVAL FROM DUAL

select * from xxd_fund

DELETE FROM XXD_EUROCUP;
UPDATE XXD_EUROCUP_TEAM SET CHAMPIONSUPPORT=0,RUNNERSUPPORT=0;





update xxd_sysconfig set syskeyvalue='2016-07-10 23:30:00' where syskey='EURO_CUP_END_TIME'

insert into xxd_sysconfig(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('EURO_CUP_START_TIME', '2015-07-06 10:00:00', '欧洲杯活动开始时间',sysdate, 0, sysdate, 0);

insert into xxd_sysconfig(syskey,syskeyvalue,notes,addtime,adduserid,modifydate,lastmodify)
values('EURO_CUP_END_TIME', '2016-07-10 23:30:00', '欧洲杯活动结束时间',sysdate, 0, sysdate, 0);

select syskeyvalue from xxd_sysconfig where syskey='EURO_CUP_END_TIME'



update XXD_EUROCUP set championid=null,runnerid=null
where id=3

update XXD_EUROCUP set championid=null,runnerid=1

select * from XXD_EUROCUP_team

select * from XXD_EUROCUP 

delete from XXD_EUROCUP where id=1



select * from XXD_OPTIMIZE_USERSCHEME
SELECT * FROM XXD_OPTIMIZE_USERDETAIL 



-- 新增菜单
insert into xxd_menu_resource (MENUID, MENUCODE, URL, CLEVEL, SUBMENUCODE, NAME, ISEND, NOTES, NAVTAB, REL, STATUS, CREATEDATE, CREATOR, MODIFIEDDATE, MODIFER)
values (SEQ_MENU_RESOURCE.NEXTVAL, '280605', 'commonReport/queryCommonReportList/V_EUROCUP.do', 3, '2806', '欧洲杯活动猜奖记录', 1, '', '', '', 1, sysdate, 1, sysdate, 25);

-- 增加权限
insert into xxd_permission (permissionid,name,menuid,notes,status,limits,createdate,creator,modifieddate,modifer) 
select Seq_Permission.nextval,xmr.name || '权限',xmr.menuid,xmr.name || '权限说明',1,1,sysdate,0,sysdate,0 
from xxd_menu_resource xmr
where xmr.url is not null and xmr.menucode='280605';

select * from xxd_common_report

insert into xxd_common_report(reportid,repname,viewname,displaycolumn,columnlist,parmnum,parmnote,parmlist)
values('rep0003', '欧洲杯活动猜奖记录','V_EUROCUP',
'用户名,投资金额,所猜冠军,所猜亚军,猜奖时间','USERNAME,TENDERSUM,CHAMPIONNAME,RUNNERNAME,SUBMITTIME',2,'冠军,亚军','CHAMPIONNAME=''?'' | RUNNERNAME=''?''')

delete from xxd_common_report where reportid='rep0003'


DROP VIEW V_EUROCUP

  CREATE VIEW V_EUROCUP ("USERID", "USERNAME", "TENDERSUM", "CHAMPIONID", "CHAMPIONNAME", "RUNNERID", "RUNNERNAME", "SUBMITTIME") AS 
  select tender.userid,u.username,tender.tenderSum,euro.championid,team.name as championName,euro.runnerid,team2.name as runnerName,euro.submittime
from
        (select scheme.userid,sum(detail.account) as tenderSum
        from XXD_OPTIMIZE_USERSCHEME scheme 
        inner join XXD_OPTIMIZE_USERDETAIL detail on scheme.userschemeid=detail.userschemeid
        where detail.addtime>=to_date((select syskeyvalue from xxd_sysconfig where syskey='EURO_CUP_START_TIME'), 'yyyy-mm-dd hh24:mi:ss') 
        and detail.addtime<=to_date((select syskeyvalue from xxd_sysconfig where syskey='EURO_CUP_END_TIME'), 'yyyy-mm-dd hh24:mi:ss')
        group by scheme.userid) tender
inner join XXD_EUROCUP euro on tender.userid=euro.userid
inner join xxd_user u on u.userid=euro.userid
INNER JOIN XXD_EUROCUP_TEAM  TEAM ON TEAM.ID=EURO.CHAMPIONID
INNER JOIN XXD_EUROCUP_TEAM  TEAM2 ON TEAM2.ID=EURO.RUNNERID;


select * from v_eurocup





