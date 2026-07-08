--1.테이블 스페이스(테이블 저장할 공간) 생성하기 (시스템 관리자)
-- 저장공간 이름 first01.dbf 사이즈 10M
CREATE TABLESPACE firstData
datafile 'C:\oraclex\oradata\XE\first01.dbf' size 10M;

--저장공간추가 수정
ALTER TABLESPACE firstData
add datafile 'C:\oraclex\oradata\XE\first02.dbf' size 10M;

--저장공간 사이즈 수정
ALTER database
datafile 'C:\oraclex\oradata\XE\first02.dbf' resize 20M;

--저장공간삭제
drop TABLESPACE firstData including contents and datafiles;

--저장공간 자동설정(first01.dbf 기존용량이 부족하면 1M증가 시키고 최대 20M가능함)

alter database
datafile 'C:\oraclex\oradata\XE\first01.dbf'
AUTOEXTEND on
next 1M
MAXSIZE 20M;


--- 1.사용자 설정(아이디 :javauser pw: javauser , tablespace: firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE user javauser identified by javauser
DEFAULT TABLESPACE firstData
TEMPORARY TABLESPACE temp;

--2.사용자 권한설정(javauser에게 접속권한 , 테이블 curd기능부여)
grant CONNECT,RESOURCE to javauser;


--접속 요청을 진행한다.

--- 1.사용자 설정(아이디 :springuser pw: springuser , tablespace: firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE user springuser identified by springuser
DEFAULT TABLESPACE firstData
TEMPORARY TABLESPACE temp;

--2.사용자 권한설정(javauser에게 접속권한 , 테이블 curd기능부여)
grant CONNECT,RESOURCE to springuser;


--5.시퀀스 설정

CREATE SEQUENCE EMP_SEQ
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCYCLE
CACHE 2;



