-- insert 후 커밋 필수!!!
INSERT INTO tbl_member(account,password,user_name,email) VALUES('ibini', '1234', '이비니', 'ibini@ibini.com'  );

insert into prj_category VALUES (0, '미분류');
insert into prj_category VALUES (1, '웹소설');
insert into prj_category VALUES (2, '웹툰');
insert into prj_category VALUES (3, 'e-book');
insert into prj_category VALUES (4, '도서');
insert into prj_category VALUES (5, '만화책');

insert into prj_platform (platform_id, account, platform_name) VALUES (0, 'ibini', '미분류');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '카카오페이지');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '네이버시리즈');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '리디북스');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '다음웹툰');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '네이버웹툰');

insert into prj_genre VALUES (0, 'ibini', '미분류');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '판타지');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '로맨스');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '무협');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '아포칼립스');

commit;

select * from tbl_member;
select * from prj_category;
select * from prj_platform;
select * from prj_genre;



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
('https://twitter.com/pledis_17/status/1104727597496164352/photo/1', 1, 'ibini', 'aaaaa')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://twitter.com/pledis_17/status/1104727597496164352/photo/2', 1, 'ibini', 'ccccc')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://twitter.com/pledis_17/status/1104727597496164352/photo/3', 1, 'ibini', 'eeeee')
;
insert into PRJ_POST_IMG
(FILE_NAME, POST_NO, ACCOUNT, ORIGINAL_FILE_NAME)
VALUES
('https://twitter.com/pledis_17/status/965079451775131653/photo/2', 1, 'ibini', 'fffff')
;
commit;