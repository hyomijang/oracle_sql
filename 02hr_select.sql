--select문 기능

-- 1.departments 레코드를 조사
select * from departments;


--<문제> EMPLOYEES 테이블의 모든 내용 출력
select * from  EMPLOYEES;

--2. departments 테이블에서 id // name 필드만 출력
select department_id, department_name from departments;


--<문제> 사원의 이름과 급여와 입사일자 만을 출력하는 SQL 문을 작성해보자.
--힌트 : 사원 정보가 저장된 테이블은 EMPLOYEES이고, 사원이름 칼럼은 FIRST_NAME, LAST_NAME과,
--급여 칼럼은 SALARY, 입사일자 칼럼은 HIRE_DATE이다
select FIRST_NAME,LAST_NAME,SALARY,HIRE_DATE from  EMPLOYEES;

--3.컬럼이름에 별칭 붙히기 
select FIRST_NAME as a,LAST_NAME as b,SALARY as c,HIRE_DATE from  EMPLOYEES;
select FIRST_NAME  이름,LAST_NAME as b,SALARY as c,HIRE_DATE from  EMPLOYEES;

--4.연결연산자 (concatenation):자바에서 문자열 + 숫자 
SELECT * from employees;
--사원번호는 100 이고 사원의 이름은 Stenven 이메일 주소는 sking입니다.
select '사원번호는'|| employee_id ||'이고 사원의 이름은'||first_name ||'입니다' from employees;

--5. 중복된 데이터를 한번씩만 출력하는 기능
SELECT DISTINCT job_id FROM employees;

--<문제>직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID) 출력하되 중복되지 않고
--한번씩 출력하는 쿼리문을 작성하자

SELECT  DISTINCT DEPARTMENT_ID FROM employees;

--6.조건문 (if => where)
--급여를 3000 이상 받는 직원을 대상 출력
SELECT first_name,salary FROM employees where salary >= 3000;


--<문제> EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
--<문제> EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번과 이름, 급여를 출력
--하라.

SELECT * FROM employees WHERE department_id = 110 ;
SELECT job_id,first_name,last_name,salary FROM employees where salary <= 5000;


--7. 이름이 이름(FIRST_NAME)이 'Lex'인 직원
SELECT * FROM employees WHERE first_name = 'Lex';

SELECT * FROM employees;

--<문제> 이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라.
SELECT employee_id,job_id,first_name,last_name FROM employees where first_name = 'John';

--8. 날짜 데이터 조회
--반드시 단일 따옴표 안에 표시 한다. 년/월/일 형식으로 기술한다.
--<예> 2008년 이후에 입사한 직원

SELECT * FROM employees WHERE hire_date > '2008/01/01';
desc employees;

--9. AND조건
--AND 연산자 : 여러 조건을 모두 만족해야 할 경우 AND 연산자를 사용한다.
--<예> 부서번호가 100번이고 직급이 FI_MGR인 직원
SELECT * FROM employees where department_id = 100 and job_id = 'FI_MGR';

--<문제>급여가 5000에서 10000이하 직원 정보 출력
SELECT * FROM employees where salary >= 5000 and salary <=10000;


--<문제> 직원번호가 134이거나 201이거나 107인 직원 정보 출력
SELECT * FROM employees where employee_id= 134 or employee_id= 201 or employee_id=107;

//10. NOT 연산자
--반대되는 논리값을 구한다.
--<예> 부서번호가 100번이 아닌 직원
SELECT * FROM employees WHERE not department_id = 100; 
SELECT * FROM employees WHERE  department_id != 100;  --강추
SELECT * FROM employees WHERE  department_id <> 100;
SELECT * FROM employees WHERE  department_id ^= 100;

//<문제> 직급이 FI_MGR가 아닌 직원
SELECT * FROM employees where  job_id != 'FI_MGR';

//11. BETWEEN AND 연산자
--특정 범위 내에 속하는 데이터를 알아보려고 할 때 BETWEEN AND 연산자를 사용한다.
--<예> 급여가 2000에서부터 3000까지의 범위에 속한 사원
SELECT * FROM employees where salary BETWEEN 2000 and 3000 ;


--<문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라.
--(AND 연산자와 BETWEEN AND 연산자 사용 두개모두 사용해서 보여줄것)
SELECT * FROM employees where salary >=2500 and salary <=4500;
SELECT * FROM employees where salary BETWEEN 2500 and 4500; 


//12. IN 연산자
--동일한 칼럼이 여러 개의 값 중에 하나인지를 살펴보기 위해서 간단하게 표현할 수 있는 IN연산자를
--사용한다 <예>직원번호가 67이거나 101이거나 184인 사원
SELECT * FROM employees where employee_id = 67 or employee_id = 101 or  employee_id = 184;
SELECT * FROM employees where employee_id IN(67,101,184);

--/<문제> 커미션비율이 0.3 이거나 0.05 이거나 0.1 중의 하나인 직원의 직원번호,
--이름, 급여, 커미션 비율을 출력하라. (OR 연산자와 IN 연산자 사용 모두 사용해볼것)
SELECT first_name,last_name,salary,commission_pct FROM employees where commission_pct=0.3 or commission_pct=0.05 or commission_pct=0.1;
SELECT first_name,last_name,salary,commission_pct FROM employees where commission_pct in (0.3,0.05,0,1);

//13. LIKE 연산자
--검색하고자 하는 값을 정확히 모를 경우 와일드카드와 함께 사용하여 원하는 내용을 검색하는 연산자.
--<예> K로 시작하는 사원
SELECT * FROM employees where first_name like 'K%';
--<예> 이름 중에 k를 포함하는 사원
SELECT * FROM employees where first_name like '%k%';
--<예> 이름이 k로 끝나는 사원
SELECT * FROM employees where first_name like '%k';
--<예> 이름의 두 번째 글자가 d인 사원
SELECT * FROM employees where first_name like '_d%';



//<문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라.
SELECT employee_id,first_name FROM employees where not first_name like '%a%';
SELECT employee_id,first_name,last_name FROM employees where not first_name like '%a%'and not last_name like '%a%';
SELECT employee_id, first_name FROM employees WHERE  upper(first_name) NOT LIKE '%A%';


//14.9) NULL을 위한 연산자
--오라클에서는 칼럼에 NULL값이 저장되는 것을 허용한다.
--NULL은 미확정, 알 수 없는(unknown) 값을 의미한다. 0(Zero)도 빈 공간도 아닌 어떤 값이 존재하기는
--하지만 어떤 값인지를 알아낼 수 없는 것을 의미한다. NULL은 연산, 할당, 비교가 불가능하다.
--<예> 100 + NULL = NULL

--<예> 커미션을 받지 않는 사원에 대한 검색 (비교불가) (commission_pct = NULL => commission_pct is NULL)
SELECT * FROM employees where commission_pct = NULL; //X
SELECT * FROM employees where commission_pct is NULL; 
--부정형 찾기
SELECT * FROM employees where commission_pct is not NULL; 

--<문제> 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라
SELECT first_name,last_name,job_id,employee_id,manager_id FROM employees where manager_id is null;

//15.10) 정렬을 위한 ORDER BY 필드명 asc ,ORDER BY 필드명 dssc
--① 오름차순 정렬을 위한 ASC
--<예>사번을 기준으로 오름차순으로 정렬
SELECT * FROM employees order by employee_id asc;
SELECT * FROM employees order by employee_id desc;

select * from employees where department_id <>100 order by employee_id asc;
select * from employees where department_id !=100 order by employee_id asc;

--<문제> 직원번호, 이름, 급여를 급여가 높은 순으로 출력하라.
SELECT employee_id,first_name,last_name,salary FROM employees ORDER by salary desc;

--<문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.
SELECT employee_id,first_name,last_name,hire_date FROM  employees order by hire_date  desc;