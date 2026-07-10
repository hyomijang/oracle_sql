create table board(
     boardNo number,
	 title varchar2(200)not null,
	 content varchar2(1000),
     writer  varchar2(50)not null,
	 regDate date  DEFAULT sysdate not null,
     
     CONSTRAINT pk_board_no PRIMARY key (boardNo)
);

create sequence Board_seq
start with 1
increment by 1
NOCYCLE
CACHE 2;

rollback;
-- 1. 테이블 안의 데이터만 싹 비웁니다. (구조는 남음)
TRUNCATE TABLE board;


-- 2. 기존에 쓰던 꼬인 시퀀스(번호표 발행기)를 삭제합니다.
DROP SEQUENCE Board_seq;

drop table board;

insert into board( boardNo,title,content,writer)values(Board_seq.nextval,'title','content','zeus');
SELECT * FROM board;
rollback;
SELECT * FROM user_tables;
SELECT * FROM user_sequences;
SELECT * FROM user_constraints;