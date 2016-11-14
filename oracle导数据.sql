select * from DBA_TABLESPACES

-- 创建表空间
CREATE TABLESPACE xxd 
datafile 'E:\orcl\xxd.dbf' 
size 1024m 
autoextend on; 

-- 创建用户
CREATE USER zy
identified by 123456
DEFAULT TABLESPACE xxd ; 

-- 授权
grant connect,resource,dba to zy; 

select * from dba_users

-- 导入导出数据
exp zk/123456@localhost/zk FILE=F:\zk.dmp OWNER=(zk)
imp system/123456@localhost/ZK fromuser=zk touser=zy file=F:\zk.dmp

-- 解锁
alter user xxd_batch account unlock;

alter user hr identified by 123456;