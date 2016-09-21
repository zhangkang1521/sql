select * from DBA_TABLESPACES

-- 创建表空间
CREATE TABLESPACE xxd 
datafile 'E:\orcl\xxd.dbf' 
size 1024m 
autoextend on; 

-- 创建用户
CREATE USER xxd_v6_test 
identified by xxd_v6_test 
DEFAULT TABLESPACE xxd ; 

-- 授权
grant connect,resource,dba to xxd_v6_test; 

select * from dba_users

-- 导入导出数据
EXP SYSTEM/123456@LOCALHOST/ORCL FILE=D:\SCOTT.DMP OWNER=(SCOTT)
imp system/123456@localhost/ZK fromuser=xxd_v6_test touser=xxd_v6_test file=E:/v6_test.dmp

-- 解锁
alter user hr account unlock;

alter user hr identified by 123456;