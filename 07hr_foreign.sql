--무결성 제약조선 (not null, unique, primary key ,foreign key)


--1.not null
--2.unoque 제약조건 --primary key제약조건과 똑같다 (다른것 null허용_

drop table emp02;
CREATE table emp02
as
SELECT * FROM employees;

desc emp02;
--제약조건 설정 employees_id primary key
--phone_number not null제약조건을 설정한다.
alter table emp02
    MODIFY phone_number varchar2(20) CONSTRAINT nn_emp02_phone not null; 

alter table emp02
 add CONSTRAINT pk_emp02_id primary key(employee_id);
 
 alter table emp02
 add CONSTRAINT uk_emp02_phone UNIQUE(phone_number);
 
--phone_number not null 제약조건을 삭제한다.
alter table emp02
 drop CONSTRAINT nn_emp02_phone;
desc emp02;

--table emp03생성
CREATE table emp03(
    empno number(4),
    empname varchar2(20) not null,
    job varchar2(20),
    CONSTRAINT uk_emp03_no UNIQUE(empno)
);

insert into emp03 values(null,'name','programer');
insert into emp03 values(1234,'name','programer');
insert into emp03 values(null,'name2','programer2');
delete from emp03 where empname ='name2';

update emp03 set empno = 0 where empno is null;
 
SELECT * FROM emp03;
 
alter table emp03
    MODIFY empno number(4) not null;
    
--데이터 딕셔너리(dba)
SELECT * FROM user_constraints where table_name = 'EMP02';
SELECT * FROM user_cons_columns where table_name = 'EMP02';
SELECT * FROM user_tables;

--3.primary key(null 허용없음, 중복허용하지 않음) == 자동 인덱스 설정

--4.foreign key (참조 무결성 제약조건)

-- table설계 (dep)부서 설계 테이블 (부서번호 deptno pk .부서명uk 지역명 not null)
--제약조건이름(pk: pk_테이블명_컬럼명약어 ,not null: nn~ ,unique:uk_~~)
CREATE table dept(
    deptno number(4),
    deptname varchar2(10),
    deptIoc varchar2(20),
    CONSTRAINT pk_dept_no PRIMARY key(deptno),
    CONSTRAINT uk_dept_name UNIQUE(deptname)

);
insert into dept values(10,'관리과','서울');
insert into dept values(20,'관리과2','서울2');
insert into dept values(30,'관리과3','서울3');
insert into dept values(40,'관리과4','서울4');
insert into dept values(50,'관리과5','서울5');
insert into dept values(60,'관리과6','서울6');
insert into dept values(70,'관리과7','서울7');
DELETE FROM dept where deptno = 30;
SELECT * FROM dept;



--사원테이블 (emp) dept 참조테이블설정, (사원번호: empid,사원명empname,직급 jobid,급여salary,부서번호(FK))
drop table dept;

CREATE table emp(
    empid number(4),
    empname varchar2(10),
    job varchar2(10),
    salary number(10),
    deptno number(4),
    CONSTRAINT pk_emp_id PRIMARY key(empid),
    constraint fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) 
    on delete cascade 
    
);

--제약조건수정(fk_emp_dept_no 삭제를 하고, 다시 재설정)
alter table emp
    drop CONSTRAINT fk_emp_dept_no;
ALTER table emp
    add constraint fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) on delete set null;
    
    

--값 넣기(check 제약조건
alter table emp
    add emp_gender char(1) default 'M' ;
 desc emp;   
 SELECT * FROM user_constraints where table_name = 'EMP';
 
 -- emp 테이블에 gender check 제약조건이 작동되는지 확인할것
 insert into emp values(6,'asd','각설이2',50040,30,'M');

  
  --emp 테이블에 score 제약조건걸기
 alter table emp
    add score number(4)check(score between 0 and 100);
 
 --ckeck 제약조건
alter table emp
    add constraint ck_emp_gender CHECK(emp_gender in ('M','F','O')); 

insert into emp values(1,'myj','백수',100,40);
insert into emp values(2,null,'각설이',500000,30);
insert into emp values(3,null,'거지',4300,null);
insert into emp values(4,'myj2','백수2',40,10);
insert into emp values(5,'asd','각설이2',50040,30);

SELECT * FROM emp;
update emp set deptno = 50 where empid = 1;
delete from dept where deptno = 40;
delete from emp where empno = 30;
--foreing key 5가지 옵션종류
--NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다.
--CASCADE : 참조 테이블의 튜플이 삭제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 변경되면 관련 튜플의 속성 값도 모두 변경된다.
--SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의관련 튜플의 속성 값을 NULL로 변경한다.
--SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 변경한다.
--RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가