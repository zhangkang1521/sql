select * from DBA_TABLESPACES

-- ������ռ�
CREATE TABLESPACE xxd 
datafile 'E:\orcl\xxd.dbf' 
size 1024m 
autoextend on; 

-- �����û�
CREATE USER xxd_v6_test 
identified by xxd_v6_test 
DEFAULT TABLESPACE xxd ; 

-- ��Ȩ
grant connect,resource,dba to xxd_v6_test; 

select * from dba_users

-- ���뵼������
EXP SYSTEM/123456@LOCALHOST/ORCL FILE=D:\SCOTT.DMP OWNER=(SCOTT)
imp system/123456@localhost/ZK fromuser=xxd_v6_test touser=xxd_v6_test file=E:/v6_test.dmp

-- ����
alter user hr account unlock;

alter user hr identified by 123456;