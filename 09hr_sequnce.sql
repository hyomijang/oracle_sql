--시퀀스 생성

--CREATE SEQUENCE sequence_name  --시퀀스 이름
--[START WITH n] ①              -- 시작값
--[INCREMENT BY n] ②            -- 증가값 +1    
--[{MAXVALUE n | NOMAXVALUE}] ③ --최대값 100
--[{MINVALUE n | NOMINVALUE}] ④ --최소값 0
--[{CYCLE | NOCYCLE}] ⑤         -- 1-> 100 그다음에 cycle 다시 1부터시작
--[{CACHE n | NOCACHE}] ⑥       -- 캐쉬메모리(속도향상)

--테이블 설계 + 시퀀스설계 + 인덱스설계 + (트리거 ,프로시져,함수 =>프로그램:조건문,반복문,예외처리)

--시퀀스 설계 (emp_seq 초기값0, 증가치 1,최대값100 ,최소값0, nocycle, cache2)

create SEQUENCE EMP_SEQ
start with 0
INCREMENT by 1
MINVALUE 0
maxvalue 1000
nocycle
CACHE 2;

---emp01 삭제를 진행하고 ,employees에서 id,first_name,hire_date 구조만 복사하시오
drop table emp01;
create table emp01
as
SELECT employee_id, first_name, hire_date
from employees
where 1= 0;

desc emp01;
SELECT * FROM emp01;

-- 시퀀스를 이용해서 데이터를 입력
insert into emp01 values(emp_seq.nextval,'kop',sysdate);
insert into emp01 values(emp_seq.nextval,'kop',sysdate);
insert into emp01 values(emp_seq.nextval,'kop',sysdate);
insert into emp01 values(emp_seq.nextval,'kop',sysdate);

SELECT * FROM uesr_table;
SELECT * FROM user_constraints;
SELECT * FROM user_cons_columns;
SELECT * FROM user_sequences;

-- emp_seq 가 현재 어느정도 진행되어있는지 확인
-- 가상테이블을 통해서 확인한다.
--CURRVAL : 현재 값을 반환
--NEXTVAL : 현재 시퀀스 값의 다음 값을 반환
SELECT emp_seq.nextval FROM dual;
SELECT emp_seq.currval FROM dual;

-- dep_seq
CREATE SEQUENCE DEP_SEQ
START WITH 10
INCREMENT BY 10
MINVALUE 0
MAXVALUE 30
NOCYCLE
CACHE 2;

--dept01 테이블삭제,새로생성한다.구조만 복사 (department_id , department_name, location_id)

drop table dept01;
create table dept01
as
SELECT department_id , department_name, location_id from departments
where 1= 0;

SELECT * FROM dept01;
-- dept01 데이터를 삽입한다
insert into dept01 values(dep_seq.nextval,'관리과',1);
insert into dept01 values(dep_seq.nextval,'총무과',2);
insert into dept01 values(dep_seq.nextval,'서무과',3);
insert into dept01 values(dep_seq.nextval,'인사과',4);

desc dept01;
SELECT * FROM dept01;

--dep_seq 값 maxvalue 초과되었으므로 1000 수정하시오.
--ALTER SEQRNENCE 시퀀스 네임
--ALTER SEQUENCE sequence_name
--[INCREMENT BY n]
--[{MAXVALUE n | NOMAXVALUE}]
--[{MINVALUE n | NOMINVALUE}]
--[{CYCLE | NOCYCLE}]
--[{CACHE n | NOCACHE}]
alter SEQUENCE dep_seq
    maxvalue 1000;

SELECT * FROM user_sequences;

--시퀀스 삭제
--drop sequence sequence_name;

--dep_sep 삭제하시오
drop Sequence dep_seq;
