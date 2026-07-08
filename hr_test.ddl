-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2026-07-08 12:35:22 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



CREATE USER hr IDENTIFIED BY account

unlock;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE hr.customar (
    cno   NUMBER(4) NOT NULL,
    cage  NUMBER(3),
    cname CHAR(5 BYTE),
    phone NUMBER(15),
    adree VARCHAR2(20 BYTE)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_customar_no ON
    hr.customar (
        cno
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.customar
    ADD CONSTRAINT pk_customar_no PRIMARY KEY ( cno )
        USING INDEX hr.pk_customar_no;

CREATE TABLE department2 (
    deptid    INTEGER NOT NULL,
    deptname  VARCHAR2(30 BYTE) NOT NULL,
    deptloc   VARCHAR2(30 BYTE) NOT NULL,
    deptphone CHAR(15 BYTE) NOT NULL
)
LOGGING;

COMMENT ON COLUMN department2.deptloc IS
    '부서위치입니다.';

COMMENT ON COLUMN department2.deptphone IS
    '부서 연락처입니다';

ALTER TABLE department2 ADD CONSTRAINT department2_pk PRIMARY KEY ( deptid );

CREATE TABLE emplyees2 (
    empid   INTEGER NOT NULL,
    empname CHAR(10 BYTE) NOT NULL,
    deptid  INTEGER NOT NULL
)
LOGGING;

ALTER TABLE emplyees2 ADD CONSTRAINT emplyees2_pk PRIMARY KEY ( empid );

CREATE TABLE hr.lend (
    ircode    NUMBER(5) NOT NULL,
    cno       NUMBER(4),
    vcode     NUMBER(5),
    idate     DATE,
    rplandate DATE,
    itotalpay NUMBER(7)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_lend_ir_code ON
    hr.lend (
        ircode
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.lend
    ADD CONSTRAINT pk_lend_ir_code PRIMARY KEY ( ircode )
        USING INDEX hr.pk_lend_ir_code;

CREATE TABLE hr.video (
    vcode      NUMBER(5) NOT NULL,
    vtitle     VARCHAR2(50 BYTE),
    vgerner    VARCHAR2(30 BYTE),
    vpay       NUMBER(7),
    vlendstate NUMBER(1),
    vcompany   VARCHAR2(50 BYTE),
    vdate      DATE,
    vage       NUMBER(3)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE hr.video
    ADD CONSTRAINT ck_video_v_state CHECK ( vlendstate IN ( 'N', 'Y' ) );

CREATE UNIQUE INDEX hr.pk_video_code ON
    hr.video (
        vcode
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.video
    ADD CONSTRAINT pk_video_code PRIMARY KEY ( vcode )
        USING INDEX hr.pk_video_code;

ALTER TABLE emplyees2
    ADD CONSTRAINT emplyees2_department2_fk
        FOREIGN KEY ( deptid )
            REFERENCES department2 ( deptid )
                ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE hr.lend
    ADD CONSTRAINT fk_lend_customar_no
        FOREIGN KEY ( cno )
            REFERENCES hr.customar ( cno )
                ON DELETE SET NULL
            NOT DEFERRABLE;

ALTER TABLE hr.lend
    ADD CONSTRAINT fk_lend_video_code
        FOREIGN KEY ( vcode )
            REFERENCES hr.video ( vcode )
                ON DELETE SET NULL
            NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             3
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
