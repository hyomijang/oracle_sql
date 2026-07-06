--1.테이블 스페이스(테이블 저장할 공간) 생성하기 (시스템 관리자)
-- 저장공간 이름 first01.dbf 사이즈 10M
CREATE TABLESPACE firstData
datafile 'C:\oraclex\oradata\XE\first01' size 10M;

--저장공간삭제
drop TABLESPACE firstData