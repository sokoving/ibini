DROP TABLE prj_post_memo;
DROP TABLE prj_post_mark;
DROP TABLE prj_hashtag;
DROP TABLE prj_link_post;
DROP TABLE login_list;
DROP TABLE prj_post_img;
DROP TABLE tbl_post;
DROP TABLE prj_genre;
DROP TABLE prj_platform;
DROP TABLE tbl_member;

CREATE TABLE tbl_post
(
    post_no           INT(10)         AUTO_INCREMENT,    	-- 포스트 번호(pk)
    account           VARCHAR(50)     NOT NULL,   			-- 회원 관리 번호
    genre_id          INT(9)          DEFAULT 0,  			-- 장르 아이디 : (기본값+유저 추가) 0:미분류, 1:판타지, 2:로맨스, 3:무협, 4:아포칼립스
    ca_id             INT(9)          DEFAULT 0,  			-- 카테고리 아이디 : (CategoryUtil 고정)0:미분류, 1:웹소설, 2:웹툰, 3:e-book, 4:도서 5:만화책
    platform_id       INT(9)          DEFAULT 0,  			-- 연재플랫폼아이디 : (기본값+유저 추가)0:미분류, 1.카카오페이지, 2:네이버시리즈, 3:리디북스, 4:카카오웹툰, 5:네이버웹툰
    post_title        VARCHAR(100)    NOT NULL UNIQUE,    	-- 책제목
    post_writer       VARCHAR(100)    NOT NULL,  			-- 작가
    publish_status    INT(5)          DEFAULT 0,  			-- 연재상태 : (PublishStatusUtil 고정)0:미분류 1:연재 , 2: 휴재,  3: 완결
    publish_cycle     VARCHAR(100)    NULL,        			-- 연재주기 : (사용자 입력 ex) 월,수,금
    ep_id             INT(5)          DEFAULT 0,   			-- 회차 아이디 : (EpIdUtil 고정)0:회차, 1:페이지, 2:권수, 3:퍼센트
    cur_ep            INT(5)          DEFAULT 0,   			-- 현재 회차
    total_ep          INT(5)          DEFAULT 0,   			-- 전체 회차
    reg_date          DATETIME DEFAULT current_timestamp, 	-- 포스트 등록일자
    update_date       DATETIME DEFAULT current_timestamp, 	-- 포스트 수정일자
    star_rate         INT(1)           DEFAULT 0,   		-- 별점 1~5
    favorite          INT(9)           NULL,      		    -- 즐겨찾기
     PRIMARY KEY (post_no)
);

CREATE TABLE prj_post_img
(
    file_name             VARCHAR(150)   NOT NULL,         -- 파일 경로
    post_no               INT(10)        NOT NULL,         -- 번호
    account               VARCHAR(50)    NOT NULL,         -- 회원 관리 번호
    original_file_name    VARCHAR(150)   NULL,             -- 원본 파일명
    reg_date              DATETIME DEFAULT current_timestamp,  -- 이미지 등록일
    thumbnail             VARCHAR(150)   DEFAULT 'false',  -- 썸네일 여부
     PRIMARY KEY (file_name)
);

CREATE TABLE prj_hashtag
(
    tag_no      INT(10)       NOT NULL,
    post_no     INT(10)       NOT NULL,
    tag_name    VARCHAR(100)  NOT NULL,
    account     VARCHAR(50)   NOT NULL,
     PRIMARY KEY (tag_no)
);
DROP SEQUENCE seq_prj_hashtag;
CREATE SEQUENCE seq_prj_hashtag START WITH 1 INCREMENT BY 1;


CREATE TABLE prj_link_post(
   link_id        VARCHAR(100)   NOT NULL,   -- 일련번호(원본포스트번호_연결할포스트번호)
   root_post_no   INT(10)        NOT NULL,   -- root 포스트 번호
   link_post_no   INT(10)        NOT NULL,   -- post_no와 연결할 포스트 번호
     PRIMARY KEY (link_id)
);

CREATE TABLE prj_post_memo
(
    memo_no         INT(10)         AUTO_INCREMENT,             -- 메모 번호
    post_no         INT(10)         NOT NULL,                   -- 포스트 번호
    content         TEXT            NOT NULL,                   -- 메모내용
    reg_datetime    DATETIME        DEFAULT current_timestamp,  -- 작성일자
    mod_datetime    DATETIME        DEFAULT current_timestamp,  -- 수정일자
    account   		VARCHAR(50)     NOT NULL,                   -- 작성자 계정(회원관리번호)
    CONSTRAINT prj_post_memo PRIMARY KEY (memo_no)
);

CREATE TABLE prj_post_mark
(
    mark_no         INT(10)         AUTO_INCREMENT,             -- 북마크 번호
    post_no         INT(10)         NOT NULL,                   -- 포스트 번호
    episode_no      INT(10)         NOT NULL,                   -- 에피소드 번호(회차,페이지,권,퍼센트)
    content         TEXT            NOT NULL,                   -- 북마크 내용
    reg_datetime    DATETIME        DEFAULT current_timestamp,  -- 작성일자
    mod_datetime    DATETIME        DEFAULT current_timestamp,  -- 수정일자
    account         VARCHAR(50)     NOT NULL,                   -- 작성자 계정(회원관리번호)
    CONSTRAINT prj_post_mark PRIMARY KEY (mark_no)
);

CREATE TABLE prj_genre
(
    genre_id      INT(9) auto_increment     NOT NULL,    -- 장르 아이디
    account       VARCHAR(50)     NOT NULL,    -- 회원 관리 번호
    genre_name    VARCHAR(100)    NOT NULL,    -- 장르명
    PRIMARY KEY (genre_id)
);
select * FROM prj_genre;

CREATE TABLE prj_platform
(
    platform_id          INT(9) auto_increment        NOT NULL,    -- 플랫폼아이디
    account              VARCHAR(50)      NOT NULL,    -- 회원 관리 번호
    platform_name        VARCHAR(50)      NOT NULL,    -- 플랫폼 이름
    platform_bg_color    VARCHAR(50)      DEFAULT 'rgb(108,117,125)',   -- 플랫폼 배지 배경색
    platform_font_color  VARCHAR(50)      DEFAULT 'rgb(255,255,255)',   -- 플랫폼 배지 글자색
    PRIMARY KEY (platform_id)
);
select * FROM prj_platform;