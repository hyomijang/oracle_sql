--1. Insert문
--INSERT INTO table_name (column_vlaue, ...)VALUES(column_value)
-- 주의 : 컬럼명 갯수,values갯수가 맞아야한다.
--not null,primary key

CREATE TABLE DERT(
    DEPTNO NUMBER(2) PRIMARY key,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) not null

);


INSERT INTO DERT  VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DERT(deptno,dname,loc)  VALUES(14,'ACCOUNTING1','NEW YORK1');
INSERT INTO DERT(dname,loc)  VALUES('ACCOUNTING1','NEW YORK1');
INSERT INTO DERT(deptno,dname,loc)  VALUES(15,'ACCOUNTING3','NEW TARK');
INSERT INTO DERT(deptno,dname,loc)  VALUES(18,'ACCOUNT',null);
SELECT * FROM dert;
drop table dert;
desc dert;
SELECT * FROM tab where tname='dert';


    
--dname null값을 ' 임의값 ' 으로 변경했다.   
update dert set dname = '임시값' where dname is null;

--컬럼 (deptno, 사이즈 3로 변경 dname not null)변경
alter TABLE dert
    modify(deptno number(4),dname varchar(30) not null);
    
--문제
CREATE TABLE TB_CUSTOMER(
    CUSTOMER_CD NUMBER(7) PRIMARY key ,
    CUSTOMER_NM VARCHAR2(10) NOT NULL,
    MW_FLG CHAR(1) NOT NULL,
    BIRTH_DAY DATE NOT NULL,
    PHONE_NUMBER CHAR(14) ,
    EMAIL VARCHAR(20) NOT NULL,
    TOTAL_POINT NUMBER(10) DEFAULT 0  NOT NULL,
    REG_DTTM TIMESTAMP NOT NULL
);


drop table TB_CUSTOMER;
desc TB_CUSTOMER;
SELECT * FROM tb_customer;
SELECT * FROM user_tables;
SELECT * FROM user_contrains;


INSERT INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES ('2017053', '나경숙', 'W', DATE '1989-12-25', '010-4509-0043', 'ksna#boram.co.kr', 4500, TIMESTAMP '2017-02-10 18:09:30');



INSERT INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES ('2017108', '박승대', 'M', DATE '1989-11-30', NULL, 'sdpark@haso.com', 24500, TIMESTAMP '2017-05-20 18:16:30');


INSERT INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES ('2017042', '강원진', 'M', DATE '1981-06-03', '010-8202-8790', 'wjagamgh@navi.com', 280300, TIMESTAMP '2017-01-23 13:24:32');