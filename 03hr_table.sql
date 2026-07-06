CREATE TABLE TB_CUSTOMER(
    customer_cd char(7) not null, PRIMARY key,
    customer_nm varchar2(20)not null,
    mw_flg char(1) not null, 
    birth_day char(8) not null,
    phone_number varchar2(16),
    email varchar2(30),
    total_point number(10),
    reg_dttm char(14)
    
);

CREATE TABLE STUDENT_GRADE_PK (
    student_id char(10)     PRIMARY KEY,
    student_name VARCHAR2(10) NOT NULL,
    korean_score number(3)  DEFAULT 0, NOT NULL,
    english_score number(3) DEFAULT 0, NOT NULL,
    math_score number(3)    DEFAULT 0, NOT NULL,
    total_score number(5)   DEFAULT 0,
    average_score number(5) DEFAULT 0
    
)

CREATE TABLE STUDENT_GRADE_FK
as
SELECT * FROM STUDEN_GRADE_PK