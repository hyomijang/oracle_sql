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

insert into board( boardNo,title,content,writer)values(board_seq.nextval,'title','content','zeus');

SELECT * FROM user_tables;
SELECT * FROM user_sequences;
SELECT * FROM user_constraints;