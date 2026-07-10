create table videos(
    video_id number(5),
    title varchar2(50)constraint nn_title not null,
    views number(10) constraint nn_views not null,
    upload_date date DEFAULT sysdate,
    constraint pk_video_id primary key(video_id) 
);


create table comments(
    comments_id number(3),
     video_id number(5),
     user_name varchar2(10)constraint nn_user_name not null,
     CONTENT varchar2(50)constraint nn_user_CONTENT not null,
     constraint pk_comments_id primary key(comments_id),
     constraint fk_videos_video_id FOREIGN key(video_id)
     REFERENCES videos(video_id) on delete set null
        
);

drop table comments;

insert into videos values(1001 ,'스마트폰 글자 크기 키우는 법',5200, date'2026-01-10');
insert into videos values(1002,	'보이스피싱 예방 필수 설정 3가지',12000, date '2026-01-15');
insert into videos values(1003,	'맛있는 돋보기 앱 추천 및 활용',850, date'2026-01-20');
insert into videos values(1004,	'단풍 구경하기 좋은 국내 여행지',3100, date'2026-01-25');

insert into comments values(1	,1001,	'박민석',	'덕분에 눈이 아주 시원해졌습니다!');
insert into comments values(2,	1001,	'이영희',	'친구들에게도 공유해 줬어요.');
insert into comments values(3,	1002,	'김정수',	'당장 설정했습니다. 감사합니다.');
insert into comments values(4,	1003,	'최순자',	'우리 나이에 꼭 필요한 앱이네요.');


SELECT v.title,c.user_name FROM videos v inner join comments c on v.video_id = c.video_id ;

SELECT v.title,c.user_name,v.views FROM videos v inner join comments c on v.video_id = c.video_id
where v.views >=5000;

SELECT c.user_name as "평론가",
v.views as "평론" 
FROM videos v 
inner join comments c on v.video_id = c.video_id 
group by  c.user_name order by "평론" desc;