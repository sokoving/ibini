-- insert 후 커밋 필수!!!
INSERT INTO tbl_member(account,password,user_name,email) VALUES('ibini', '1234', '이비니', 'ibini@ibini.com'  );
commit;

insert into tbl_post
( post_no,    account,    genre_id,    ca_id,    platform_id,   post_title,    post_writer,    publish_status,    publish_cycle,    ep_id,    cur_ep,    total_ep,    star_rate)
VALUES
( seq_tbl_post.nextval,    'ibini',    1,    1,    1,    '테스트 제목',    '테스트 작가',    1,    '월, 금',    1,    0,    111,    1);
commit;

insert into prj_platform (platform_id, account, platform_name) VALUES (0, 'ibini', '미분류');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '카카오페이지');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '네이버시리즈');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '리디북스');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '카카오웹툰');
insert into prj_platform (platform_id, account, platform_name) VALUES (seq_prj_platform.nextval, 'ibini', '네이버웹툰');
commit;

insert into prj_genre VALUES (0, 'ibini', '미분류');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '판타지');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '로맨스');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '무협');
insert into prj_genre VALUES (seq_prj_genre.nextval, 'ibini', '아포칼립스');
commit;

select * from tbl_member;
select * from prj_platform;
select * from prj_genre;