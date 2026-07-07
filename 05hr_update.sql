--update
--UPDATE table_name 
-- SER column_name1 = value1, coulmn_name2 =value2, ... where condittions;

--employees 테이블 emp 복사
create table emp2
as
SELECT * FROM employees;

desc emp;
SELECT * FROM emp;

-- 제약조건걸고 해제하는기능
---emp employees_id pk 제약조건입력
alter table emp
add constraint pk_emp_emp_id Primary key(employee_id);

alter table emp
drop constraint pk_emp_emp_id;
desc emp;
SELECT * FROM emp;
-- phone number not null 제약조건
ALTER TABLE emp 
MODIFY (phone_number CONSTRAINT nn_emp_phone NOT NULL);

select * from user_constraints where table_name = 'EMP';

---제약조건 drop
alter table emp
drop constraint nn_emp_phone;


--emp 모든 사원의 부서번호를 30번으로 수정하자.

desc emp;
UPDATE emp set DEPARTMENT_ID =30;
SELECT * FROM emp;

--DML (select,delete,update,insert)=>rollback,commit대상이 된다.

--commit
rollback;

-- 모든 사원의 급여를 10% 인상한다.
desc emp;
alter table emp
add salary_copy number(8,2);

update emp set  salary_copy  = salary;

update emp set salary_copy = salary_copy * 1.1;

---입사일을 오늘 날짜로 수정
alter table emp
add hire_date_copy date;

UPDATE emp set hire_date_copy = hire_date;
UPDATE emp set hire_date_copy  = sysdate;
SELECT * FROM emp;

---emp2 테이블 부서번호가 10번 사원의 부서번호 30번으로 수정
SELECT * FROM emp2;
update emp2 set department_id = 30 where department_id=10;
--- 급여가 3000이상인 사원만 급여 10%인상
update emp2 set salary = salary * 1.1 where salary >= 3000;

-- 2007년에 입사한 사원의 입사일을 오늘로 수정한다.
-- substr('03/06/17',0,2
SELECT * FROM emp2 where substr (hire_date,1,2)= 26;
update emp2 set hire_date = sysdate where substr (hire_date,1,2)= 07;

--LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다
update emp2 set salary = 17000 , commission_pct = 0.45 where last_name = 'Russell'
 