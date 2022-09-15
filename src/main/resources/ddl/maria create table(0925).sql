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
    post_title        VARCHAR(100)    NOT NULL,         	-- 책제목
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
    PRIMARY KEY (memo_no)
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
    PRIMARY KEY (mark_no)
);

CREATE TABLE prj_genre
(
    genre_id      INT(9) auto_increment     NOT NULL,    -- 장르 아이디
    account       VARCHAR(50)     NOT NULL,    -- 회원 관리 번호
    genre_name    VARCHAR(100)    NOT NULL,    -- 장르명
    PRIMARY KEY (genre_id)
);
insert into prj_genre (account, genre_name) VALUES ('admin', '미분류'); -- 관리용 항목(테이블 만들 때 넣어주세요)
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
insert into prj_platform (account, platform_name) VALUES ('admin', '미분류');  -- 관리용 항목(테이블 만들 때 넣어주세요)
select * FROM prj_platform;


-- =========== tbl_member ===== mariaDB
DROP TABLE tbl_member;
-- 마리아 디비
CREATE TABLE tbl_member
(
    account             VARCHAR(50)     NOT NULL,         	-- 회원 관리 번호(수정X, 시스템 입력)
    user_id             VARCHAR(50)     NOT NULL UNIQUE,   -- 회원 아이디(수정X, 회원 입력)
    password            VARCHAR(150)    NOT NULL,          -- 비밀번호
    user_name           VARCHAR(20)     NOT NULL,          -- 닉네임(수정O, 회원 입력)
    email               VARCHAR(100)    NOT NULL UNIQUE,   -- 유저 이메일 주소
    post_amount         INT(3)        NULL,      -- 한 페이지에 띄울 포스트 수	ex) 50
    sort                VARCHAR(50)     NULL,      -- 정렬 기준
    auth                VARCHAR(20)     DEFAULT 'COMMON',  -- 권한 (COMMON, ADMIN)
    join_date           DATETIME        DEFAULT current_timestamp,   -- 가입날짜
    last_login          DATETIME        DEFAULT current_timestamp,   -- 마지막 로그인 날짜
    email_verification  VARCHAR(20)     DEFAULT 'false',   -- 이메일 인증여부
    session_id          VARCHAR(200)    DEFAULT 'none',    -- 세션 아이디
    limit_time          DATETIME,                               -- 세션 만료일
     PRIMARY KEY (account)
);

DROP SEQUENCE seq_tbl_member;
CREATE SEQUENCE seq_tbl_member START WITH 1 INCREMENT BY 1;

-- 마리아 DB member 테이블 관리자 계정 추가
insert into
 tbl_member
   (account, user_id, password, user_name, email, auth)
            values
            ('admin','admin', '12345678', '관리자', 'yanbam@naver.com', 'ADMIN');


-- =========== tbl_manage_member
-- TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_member.nextval, 4, '0')
-- 마리아 회원 관리 테이블
DROP TABLE tbl_manage_member;
    	CREATE TABLE tbl_manage_member
    	(
    	    user_id             VARCHAR(50)     NOT NULL,   -- 회원 아이디
    	    email               VARCHAR(100)    NOT NULL UNIQUE, -- 회원 이메일
    	    user_condition       VARCHAR(150)    DEFAULT 'true',    -- 회원의 가입 상태
    	     PRIMARY KEY (user_id)
    	);

-- 마리아 DB manage_member 테이블 관리자 계정추가
insert into tbl_manage_member (user_id, email)
            values('admin','yanbam@naver.com');

-- =========== tbl_manage_break_away
-- 마리아 회원 탈퇴 사유 관리 테이블
DROP TABLE tbl_manage_break_away;
CREATE TABLE tbl_manage_break_away
	(
	    user_id             VARCHAR(50)     NOT NULL,   -- 회원 아이디
	    reason_num       INT(9)    NOT NULL,          -- 탈퇴사유 번호
	     PRIMARY KEY (user_id)
	);

-- =========== tbl_manage_inquiry

-- sql 회원 문의사항 관리 테이블

--  마리아 회원 문의사항 관리 테이블
DROP TABLE tbl_manage_inquiry;
	CREATE TABLE tbl_manage_inquiry
	(
	serial_number       VARCHAR(50)     NOT NULL,          -- 회원 관리 번호(수정X, 시스템 입력)
	user_id             VARCHAR(50)     NOT NULL ,   -- 회원 아이디(수정X)
	inquiry_title         VARCHAR(70)    NOT NULL,          -- 문의사항 제목
	inquiry            VARCHAR(2000)    NOT NULL,          -- 문의사항
	inquiry_date      DATETIME          DEFAULT current_timestamp,   -- 문의사항(등록일자)
	answer            VARCHAR(2000)     NULL,          -- 답변
	answer_date       DATETIME              NULL,   -- 답변 등록일자
	 PRIMARY KEY (serial_number)
	);

-- =========== tbl_reason_break_away

-- 마리아 탈퇴사유 내용 관리 테이블
DROP TABLE tbl_reason_break_away;
	CREATE TABLE tbl_reason_break_away
	(
	    reason_num       INT(9)    NOT NULL,          -- 탈퇴사유 번호
	    out_reason      VARCHAR(1000)     NOT NULL ,   -- 탈퇴 이유
	     PRIMARY KEY (reason_num)
	);

DROP SEQUENCE seq_tbl_reason_break_away;
CREATE SEQUENCE seq_tbl_reason_break_away START WITH 1 INCREMENT BY 1;

    -- tbl_reason_break_away 시퀀스 생성후 꼭 기본 탈퇴사유 3개 넣어야 함. 안그러면 시퀀스 때문에 오류 발생.
     	INSERT INTO tbl_reason_break_away
        VALUES (NEXTVAL(seq_tbl_reason_break_away), '서비스 이용 불편');

        INSERT INTO tbl_reason_break_away
        VALUES (NEXTVAL(seq_tbl_reason_break_away),'관리 및 피드백이 잘 안됨');

        INSERT INTO tbl_reason_break_away
        VALUES (NEXTVAL(seq_tbl_reason_break_away),'에러가 많음');


-- =========== login_list

-- 마리아 로그인 기록
DROP table login_list;
CREATE TABLE login_list(
   login_num      INT(10),       -- 일련번호
   account       VARCHAR(50),      -- 회원 관리 번호
   login_log     DATETIME    DEFAULT current_timestamp,   -- 로그인이력
     PRIMARY KEY (login_num)
);
DROP SEQUENCE seq_login_list;
CREATE SEQUENCE seq_login_list;