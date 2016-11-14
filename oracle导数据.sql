select * from DBA_TABLESPACES

-- ������ռ�
CREATE TABLESPACE xxd 
datafile 'E:\orcl\xxd.dbf' 
size 1024m 
autoextend on; 

-- �����û�
CREATE USER zy
identified by 123456
DEFAULT TABLESPACE xxd ; 

-- ��Ȩ
grant connect,resource,dba to zy; 

select * from dba_users

-- ���뵼������
exp zk/123456@localhost/zk FILE=F:\zk.dmp OWNER=(zk)
imp system/123456@localhost/ZK fromuser=zk touser=zy file=F:\zk.dmp

-- ����
alter user xxd_batch account unlock;

alter user hr identified by 123456;