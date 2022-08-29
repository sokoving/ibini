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
    post_no           NUMBER(10)       NOT NULL,    --포스트 번호(pk)
    account           VARCHAR2(50)     NOT NULL,    --회원 관리 번호
    genre_id          NUMBER(9)        DEFAULT 0,   --장르 아이디 : (기본값+유저 추가) 0:미분류, 1:판타지, 2:로맨스, 3:무협, 4:아포칼립스
    ca_id             NUMBER(9)        DEFAULT 0,   --카테고리 아이디 : (CategoryUtil 고정)0:미분류, 1:웹소설, 2:웹툰, 3:e-book, 4:도서 5:만화책
    platform_id       NUMBER(9)        DEFAULT 0,   --연재플랫폼아이디 : (기본값+유저 추가)0:미분류, 1.카카오페이지, 2:네이버시리즈, 3:리디북스, 4:카카오웹툰, 5:네이버웹툰
    post_title        VARCHAR2(100)    NOT NULL,    --책제목
    post_writer       VARCHAR2(100)    NOT NULL,    --작가
    publish_status    NUMBER(5)        DEFAULT 0,   --연재상태 : (PublishStatusUtil 고정)0:미분류 1:연재 , 2: 휴재,  3: 완결
    publish_cycle     VARCHAR2(100)    NULL,        --연재주기 : (사용자 입력 ex) 월,수,금
    ep_id             NUMBER(5)        DEFAULT 0,   --회차 아이디 : (EpIdUtil 고정)0:회차, 1:페이지, 2:권수, 3:퍼센트
    cur_ep            NUMBER(5)        DEFAULT 0,   --현재 회차
    total_ep          NUMBER(5)        DEFAULT 0,   --전체 회차
    reg_date          DATE             DEFAULT SYSDATE, --포스트 등록일자
    update_date       DATE             DEFAULT SYSDATE, --포스트 수정일자
    star_rate         NUMBER(1)        DEFAULT 0,   --별점 1~5
    favorite             NUMBER(9)       NULL,      --즐겨찾기
     PRIMARY KEY (post_no)
);
DROP SEQUENCE seq_tbl_post;
CREATE SEQUENCE seq_tbl_post;

CREATE TABLE tbl_member
(
    account             VARCHAR2(50)     NOT NULL,          --회원 관리 번호(수정X, 시스템 입력)
    user_id             VARCHAR2(50)     NOT NULL UNIQUE,   --회원 아이디(수정X, 회원 입력)
    password            VARCHAR2(150)    NOT NULL,          --비밀번호
    user_name           VARCHAR2(20)     NOT NULL,          --닉네임(수정O, 회원 입력)
    email               VARCHAR2(100)    NOT NULL UNIQUE,   --유저 이메일 주소
    post_amount         NUMBER(3)        NULL,      --한 페이지에 띄울 포스트 수	ex) 50
    sort                VARCHAR2(50)     NULL,      --정렬 기준
    auth                VARCHAR2(20)     DEFAULT 'COMMON',  --권한 (COMMON, ADMIN)
    join_date           DATE             DEFAULT SYSDATE,   --가입날짜
    last_login          DATE             DEFAULT SYSDATE,   --마지막 로그인 날짜
    email_verification  VARCHAR2(20)     DEFAULT 'false',   --이메일 인증여부
    session_id          VARCHAR2(200)    DEFAULT 'none',    --세션 아이디
    limit_time          DATE,                               --세션 만료일
     PRIMARY KEY (account)
);
DROP SEQUENCE seq_tbl_member;
CREATE SEQUENCE seq_tbl_member;
-- TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_member.nextval, 4, '0')

CREATE TABLE prj_genre
(
    genre_id      NUMBER(9)        NOT NULL,    --장르 아이디
    account       VARCHAR2(50)     NOT NULL,    --회원 관리 번호
    genre_name    VARCHAR2(100)    NOT NULL,    --장르명
     PRIMARY KEY (genre_id)
);
DROP SEQUENCE seq_prj_genre;
CREATE SEQUENCE seq_prj_genre;

CREATE TABLE prj_platform
(
    platform_id          NUMBER(9)         NOT NULL,    --플랫폼아이디
    account              VARCHAR2(50)      NOT NULL,    --회원 관리 번호
    platform_name        VARCHAR2(50)      NOT NULL,    --플랫폼 이름
    platform_bg_color    VARCHAR2(50)      DEFAULT 'rgb(108,117,125)',   --플랫폼 배지 배경색
    platform_font_color  VARCHAR2(50)      DEFAULT 'rgb(255,255,255)',   --플랫폼 배지 글자색
     PRIMARY KEY (platform_id)
);
DROP SEQUENCE seq_prj_platform;
CREATE SEQUENCE seq_prj_platform;

CREATE TABLE prj_post_memo
(
    memo_no     NUMBER(10)      NOT NULL,       --메모 번호
    post_no     NUMBER(10)      NOT NULL,       --포스트 번호
    content     CLOB            NOT NULL,       --메모내용
    reg_datetime    DATE             DEFAULT SYSDATE,   --작성일자
    mod_datetime    DATE             DEFAULT SYSDATE,   --수정일자
    reg_account    VARCHAR2(50)      NOT NULL,      --작성자 계정(회원관리번호)
    mod_account    VARCHAR2(50)      NOT NULL,      --수정자 계정(회원관리번호)
     PRIMARY KEY (memo_no)
);
DROP SEQUENCE seq_prj_post_memo;
CREATE SEQUENCE seq_prj_post_memo;

CREATE TABLE prj_post_mark
(
    mark_no       NUMBER(10)      NOT NULL,         --북마크 번호
    post_no       NUMBER(10)      NOT NULL,         --포스트 번호
    episode_no    NUMBER(10)      NOT NULL,         --에피소드 번호(회차,페이지)
    content       CLOB            NOT NULL,         --북마크 내용
    reg_datetime    DATE             DEFAULT SYSDATE,   --작성일자
    mod_datetime    DATE             DEFAULT SYSDATE,   --수정일자
    reg_account    VARCHAR2(50)      NOT NULL,      --작성자 계정(회원관리번호)
    mod_account    VARCHAR2(50)      NOT NULL,      --수정자 계정(회원관리번호)
     PRIMARY KEY (mark_no)
);
DROP SEQUENCE seq_prj_post_mark;
CREATE SEQUENCE seq_prj_post_mark;

CREATE TABLE prj_post_img
(
    file_name             VARCHAR2(150)   NOT NULL,         --파일 경로
    post_no               NUMBER(10)      NOT NULL,         --포스트 번호
    account               VARCHAR2(50)    NOT NULL,         --회원 관리 번호
    original_file_name    VARCHAR2(150)   NULL,             --원본 파일명
    reg_date              DATE            DEFAULT SYSDATE,  --이미지 등록일
    thumbnail             VARCHAR2(150)   DEFAULT 'false',  --썸네일 여부
     PRIMARY KEY (file_name)
);

CREATE TABLE prj_hashtag
(
    tag_no      NUMBER(10)       NOT NULL,
    post_no     NUMBER(10)       NOT NULL,
    tag_name    VARCHAR2(100)    NOT NULL,
    account     VARCHAR2(50)     NOT NULL,
     PRIMARY KEY (tag_no)
);
DROP SEQUENCE seq_prj_hashtag;
CREATE SEQUENCE seq_prj_hashtag;

CREATE TABLE login_list(
   login_num      NUMBER(10),       --일련번호
   account       VARCHAR2(50),      --회원 관리 번호
   login_log     DATE    DEFAULT SYSDATE,   --로그인이력
     PRIMARY KEY (login_num)
);
DROP SEQUENCE seq_login_list;
CREATE SEQUENCE seq_login_list;

CREATE TABLE prj_link_post(
   link_no      VARCHAR2(100)       NOT NULL, --일련번호(회원관리번호_원본포스트번호_연결할포스트번호)
   post_no      NUMBER(10)       NOT NULL,    --포스트 번호
   account      VARCHAR2(50)     NOT NULL,    --회원 관리 번호
   link_post    NUMBER(10)     NOT NULL,      --post_no와 연결할 포스트 번호
     PRIMARY KEY (link_no)
);

	CREATE TABLE tbl_manage_member
	(
	    user_id             VARCHAR2(50)     NOT NULL UNIQUE,   --회원 아이디
	    user_condition       VARCHAR2(150)    DEFAULT 'true',    --회원의 가입 상태
	     PRIMARY KEY (user_id)
	);

	CREATE TABLE tbl_manage_break_away
	(
	    user_id             VARCHAR2(50)     NOT NULL,   --회원 아이디
	    reason_num       NUMBER(9)    NOT NULL,          --탈퇴사유 번호
	     PRIMARY KEY (user_id)
	);

	CREATE TABLE tbl_manage_inquiry
	(
	serial_number       VARCHAR2(50)     NOT NULL,          --회원 관리 번호(수정X, 시스템 입력)
	user_id             VARCHAR2(50)     NOT NULL ,   --회원 아이디(수정X)
	inquiry_title         VARCHAR2(70)    NOT NULL,          --문의사항 제목
	inquiry            VARCHAR2(2000)    NOT NULL,          --문의사항
	inquiry_date           DATE             DEFAULT SYSDATE,   --문의사항(등록일자)
	answer            VARCHAR2(2000)     NULL,          --답변
	answer_date           DATE              NULL,   --답변 등록일자
	 PRIMARY KEY (serial_number)
	);
	DROP SEQUENCE seq_tbl_manage_inquiry;
    CREATE SEQUENCE seq_tbl_manage_inquiry;


	CREATE TABLE tbl_reason_break_away
	(
	    reason_num       NUMBER(9)    NOT NULL,          --탈퇴사유 번호
	    out_reason      VARCHAR2(1000)     NOT NULL UNIQUE,   -- 탈퇴 이유
	     PRIMARY KEY (reason_num)
	);


