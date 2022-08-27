-- 이제 insert into 하지 말고 사이트 내 기능으로 생성할 수 있습니다
-- 회원가입, 새 포스트 쓰기
-- 회원가입하면 기본으로 계정당 기본 장르, 플랫폼 생성됨
-- insert 후 커밋 필수!!!

insert into tbl_post
( post_no,    account,    genre_id,    ca_id,    platform_id,   post_title,    post_writer,    publish_status,    publish_cycle,    ep_id,    cur_ep,    total_ep,    star_rate)
VALUES
( seq_tbl_post.nextval,    'ibini',    1,    1,    1,    '테스트 제목',    '테스트 작가',    1,    '월, 금',    1,    0,    111,    1);
insert into tbl_post
( post_no,    account,    genre_id,    ca_id,    platform_id,   post_title,    post_writer,    publish_status,    publish_cycle,    ep_id,    cur_ep,    total_ep,    star_rate)
VALUES
( seq_tbl_post.nextval,    'ibini',    2,    2,    2,    '테스트 제목2',    '테스트 작가2',    2,    '매달 2일',    2,    22,    222,    2);
commit;


--이미지
set DEFINE off;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME, THUMBNAIL)
VALUES
('https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large', 1, 'ibini', 'aaaaa', 'true')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://pbs.twimg.com/media/D1THmoQUcAEXX43?format=jpg&name=4096x4096', 1, 'ibini', 'bbbbb')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://pbs.twimg.com/media/D1TH4BrU0AE4IAP?format=jpg&name=4096x4096', 1, 'ibini', 'ccccc')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME, THUMBNAIL)
VALUES
('https://pbs.twimg.com/media/D1THoPIUwAACVU0?format=jpg&name=4096x4096', 2, 'ibini', 'eeeee', 'true')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://pbs.twimg.com/media/FagFBNhUsAUzvho?format=jpg&name=4096x4096', 2, 'ibini', 'fffff')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://pbs.twimg.com/media/FagjF-LUYAExD_7?format=jpg&name=900x900', 2, 'ibini', 'fffff')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://pbs.twimg.com/media/FZ8Ufq4akAA2aOs?format=jpg&name=900x900', 2, 'ibini', 'fffff')
;
commit;

select * from tbl_member;
select * from tbl_post;
select * from prj_platform;
select * from prj_genre;


--INSERT INTO tbl_member
--    (account, user_id, password, user_name, email)
--VALUES
--    ('ibini', 'ibini', '1234', '이비니', 'ibini@ibinibooks.com');
--INSERT INTO tbl_member
--    (account, user_id, password, user_name, email)
--VALUES
--    (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_member.nextval, 4, '0'), 'test', '1234', '테스트', 'test@test.com');
--commit;



--insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '미분류');
--insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '판타지');
--insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '로맨스');
--insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '무협');
--insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '아포칼립스');
--commit;

--insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '미분류');
--insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '카카오페이지');
--insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '네이버시리즈');
--insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '리디북스');
--insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '카카오웹툰');
--insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '네이버웹툰');
--commit;


