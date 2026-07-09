create table CUSTOMERS (
    CUSTOMERID number(4),
    CUSTOMER_NAME varchar2(10)CONSTRAINT nn_costomar_name not null,
    AGE number(3)CONSTRAINT nn_costomars_age not null,
    PHONE varchar2(15)CONSTRAINT nn_costomars_name not null,
    CONSTRAINT pk_customars_costomer_id PRIMARY key( CUSTOMERID ),
    CONSTRAINT ck_customars_costomer_age check(AGE >= 1 and AGE <=130) 
    
);

create table ORDERS (
    ORDERID number (4),
    CUSTOMERID number(4),
    PRODUCT_NAME varchar2(50)CONSTRAINT nn_orders_product_name not null,
    PRICE number(38) default 0 ,
    CONSTRAINT pk_order_id PRIMARY key( ORDERID ),
    CONSTRAINT fk_order1_customar_id foreign key(CUSTOMERID) REFERENCES CUSTOMERS( CUSTOMERID )
    on DELETE set null
);
drop table ORDERS;
drop table CUSTOMERS;
desc ORDERS
SELECT * FROM CUSTOMERS;

INSERT INTO CUSTOMERS VALUES (101,'고길동',65,'010-1234-5678');
INSERT INTO CUSTOMERS VALUES (102,'이순자',72 ,'010-9876-5432');
INSERT INTO CUSTOMERS VALUES (103,'박정호',61,'010-5555-4444');
INSERT INTO CUSTOMERS VALUES (104,'정명숙',68,'010-2222-3333');


INSERT INTO ORDERS VALUES (1,101,'갤럭시 S24', 1150000);
INSERT INTO ORDERS VALUES (2,102,'아이폰 15', 1250000);
INSERT INTO ORDERS VALUES (3,103,'갤럭시 워치 6',350000);
INSERT INTO ORDERS VALUES (4,104,'효도라디오', 25000);

SELECT c.CUSTOMER_NAME, o.PRODUCT_NAME,o.price FROM CUSTOMERS c inner join orders o on c.CUSTOMERID = o.CUSTOMERID;

SELECT c.CUSTOMER_NAME, o.PRODUCT_NAME,o.price FROM CUSTOMERS c inner join orders o on c.CUSTOMERID = o.CUSTOMERID
where o.price >= 1000000;




SELECT c.CUSTOMER_NAME AS "고객명", 
SUM(o.PRICE) AS "총구매액"
FROM CUSTOMERS c
INNER JOIN ORDERS o ON c.CUSTOMERID = o.CUSTOMERID
GROUP BY c.CUSTOMER_NAME
ORDER BY "총구매액" DESC;

