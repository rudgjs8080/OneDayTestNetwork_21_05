-- DB 생성
create database TodoList;
show databases;

-- 사용자 등록
create user liuser@localhost;
create user liuser@'%';
-- DB 정보 확인위해 DB 접근
use MySQL;
-- table 확인
show tables;
desc user;
select host, user from user;
-- 권한 부여 및 확인
show grants for 'liuser';
grant all privileges on *.* to
'liuser';
-- password 변경
alter user 'liuser'
identified with mysql_native_password
by '1234';




