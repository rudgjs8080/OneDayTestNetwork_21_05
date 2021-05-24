-- 관리자 접속

CREATE TABLESPACE listDB
DATAFILE 'C:/oraclexe/data/listDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K ;

create user listuser identified by listuser
default tablespace listDB;

grant dba to listuser;