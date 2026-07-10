SELECT * FROM board;
SELECT * FROM board where boardno > 0 order by regdate desc;
desc board;


SELECT * FROM board where boardno =8;
DELETE FROM board WHERE boardno = 2;
rollback;

update board set title = 'aaa',content = 'aaa', writer = 'aaa' where boardno = 8;

