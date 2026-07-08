-- join
--1.cross join(두 개의 테이블을 크로스한다.)
SELECT count(*) FROM employees; --107
SELECT count(*) FROM departments; --27

SELECT count(*) FROM employees,departments where first_name like '%a%';

--ANSI 협회정한 cross join
SELECT * FROM employees,departments;
SELECT * FROM employees cross join departments;

--2.inner join(employees 테이블과 ,departments 테이블을 조인해서 보여주시오)
-- pk :departement.departement_id , fk : employees.department.id
-- first_name, email,job,연봉,부서명,부서위치를 출력하는 조인문을 작성하시오
-- 판매처만 보여주는 조건문 작성 shipping dusqhddl 5000이상
--ANSI 협회정한 inner join

SELECT e.first_name,e.email,e.job_id,e.salary,d.department_name,d.location_id FROM employees e, departments d
where e.department_id = d.department_id 
and d.department_name = 'Shipping'and e.salary >=5000 ;

SELECT e.first_name,e.email,e.job_id,e.salary,d.department_name,d.location_id FROM employees e inner join departments d 
on e.department_id = d.department_id 
where d.department_name = 'Shipping'and e.salary >=5000 ;
    
SELECT * FROM user_cons_columns where table_name='EMPLOYEES';

--2-1 inner join USING을 이용한 조인 조건 지정
SELECT * FROM employees e inner join departments d using(department_id);



--3.outer join
--right outer join (+) left outer join
SELECT e.first_name,d.department_id,d.department_name FROM employees e, departments d
where e.department_id(+) = d.department_id order by d.department_id asc;

SELECT * FROM departments ORDER by department_id asc;

--ANSI 협회정한 left outer join
SELECT e.first_name,d.department_id,d.department_name FROM employees e left outer join departments d
on e.department_id = d.department_id order by d.department_id asc;

--ANSI 협회정한 right outer join
SELECT e.first_name,d.department_id,d.department_name FROM employees e right outer join departments d
on e.department_id = d.department_id order by d.department_id asc;

--4. self join (한개의 테이블을 두개로 분리시킨다. 한 개 pk 다른한개 fk)_
--employees를 self join을 통해서 사원의 정보다 사원의 사수의 정보를 출력하는 쿼리문 작성하시오.

SELECT e1.first_name,e2.first_name FROM employees e1 , employees e2
    where  e1.manager_id = e2.employee_id ;

-- non equl join(두 개의 테이블이 아무관계없다 FK를 가지고 있지 않다)
-- 등급을 나타내는 table 생성 
create table gradebl(
    grade number(1)not null,
    minsalary number not null,
    maxsalary number not null,
    constraint pk_grabl_grade primary key(grade)
);

insert into gradebl values(1,2000,5000);
insert into gradebl values(2,1000,2000);
insert into gradebl values(3,10000,5000);
insert into gradebl values(4,20000,50000);
insert into gradebl values(5,20,3000);
insert into gradebl values(6,200,9000);

commit;

SELECT * FROM gradebl;

-- 공통컬럼이 없는 employees 테이블과 gradedepi 조인을  해서 사원 이름과  사원의 얼급 월급등급을 출력

SELECT 
    e.first_name, e.salary, g.grade FROM employees e JOIN gradebl g 
    ON e.salary BETWEEN g.minsalary AND g.maxsalary;