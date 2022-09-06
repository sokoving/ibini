-- =========== tbl_member
-- sql 회원 테이블
CREATE TABLE tbl_member
(
    account             VARCHAR2(50)     NOT NULL,          -- 회원 관리 번호(수정X, 시스템 입력)
    user_id             VARCHAR2(50)     NOT NULL UNIQUE,   -- 회원 아이디(수정X, 회원 입력)
    password            VARCHAR2(150)    NOT NULL,          -- 비밀번호
    user_name           VARCHAR2(20)     NOT NULL,          -- 닉네임(수정O, 회원 입력)
    email               VARCHAR2(100)    NOT NULL UNIQUE,   -- 유저 이메일 주소
    post_amount         NUMBER(3)        NULL,      -- 한 페이지에 띄울 포스트 수	ex) 50
    sort                VARCHAR2(50)     NULL,      -- 정렬 기준
    auth                VARCHAR2(20)     DEFAULT 'COMMON',  -- 권한 (COMMON, ADMIN)
    join_date           DATE             DEFAULT SYSDATE,   -- 가입날짜
    last_login          DATE             DEFAULT SYSDATE,   -- 마지막 로그인 날짜
    email_verification  VARCHAR2(20)     DEFAULT 'false',   -- 이메일 인증여부
    session_id          VARCHAR2(200)    DEFAULT 'none',    -- 세션 아이디
    limit_time          DATE,                               -- 세션 만료일
     PRIMARY KEY (account)
);

DROP SEQUENCE seq_tbl_member;
CREATE SEQUENCE seq_tbl_member;

-- 마리아 디비
CREATE TABLE tbl_member
(
    account             VARCHAR(50)     NOT NULL,          --회원 관리 번호(수정X, 시스템 입력)
    user_id             VARCHAR(50)     NOT NULL UNIQUE,   --회원 아이디(수정X, 회원 입력)
    password            VARCHAR(150)    NOT NULL,          --비밀번호
    user_name           VARCHAR(20)     NOT NULL,          --닉네임(수정O, 회원 입력)
    email               VARCHAR(100)    NOT NULL UNIQUE,   --유저 이메일 주소
    post_amount         INT(3)        NULL,      --한 페이지에 띄울 포스트 수	ex) 50
    sort                VARCHAR(50)     NULL,      --정렬 기준
    auth                VARCHAR(20)     DEFAULT 'COMMON',  --권한 (COMMON, ADMIN)
    join_date           DATETIME        DEFAULT current_timestamp,   --가입날짜
    last_login          DATETIME        DEFAULT current_timestamp,   --마지막 로그인 날짜
    email_verification  VARCHAR(20)     DEFAULT 'false',   --이메일 인증여부
    session_id          VARCHAR(200)    DEFAULT 'none',    --세션 아이디
    limit_time          DATETIME,                               --세션 만료일
     PRIMARY KEY (account)
);

DROP SEQUENCE seq_tbl_member;
CREATE SEQUENCE seq_tbl_member START WITH 1 INCREMENT BY 1;


-- =========== tbl_manage_member
-- TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_member.nextval, 4, '0')

-- sql 회원 관리 테이블
	CREATE TABLE tbl_manage_member
	(
	    user_id             VARCHAR2(50)     NOT NULL,   --회원 아이디
	    email               VARCHAR2(100)    NOT NULL UNIQUE, -- 회원 이메일
	    user_condition       VARCHAR2(150)    DEFAULT 'true',    --회원의 가입 상태
	     PRIMARY KEY (user_id)
	);

-- 마리아 회원 관리 테이블
    	CREATE TABLE tbl_manage_member
    	(
    	    user_id             VARCHAR(50)     NOT NULL,   --회원 아이디
    	    email               VARCHAR(100)    NOT NULL UNIQUE, -- 회원 이메일
    	    user_condition       VARCHAR(150)    DEFAULT 'true',    --회원의 가입 상태
    	     PRIMARY KEY (user_id)
    	);

-- =========== tbl_manage_break_away

-- sql 회원 탈퇴 사유 관리 테이블
CREATE TABLE tbl_manage_break_away
	(
	    user_id             VARCHAR2(50)     NOT NULL,   --회원 아이디
	    reason_num       NUMBER(9)    NOT NULL,          --탈퇴사유 번호
	     PRIMARY KEY (user_id)
	);

-- 마리아 회원 탈퇴 사유 관리 테이블
CREATE TABLE tbl_manage_break_away
	(
	    user_id             VARCHAR(50)     NOT NULL,   --회원 아이디
	    reason_num       INT(9)    NOT NULL,          --탈퇴사유 번호
	     PRIMARY KEY (user_id)
	);

-- =========== tbl_manage_inquiry

-- sql 회원 문의사항 관리 테이블
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

--  마리아 회원 문의사항 관리 테이블
	CREATE TABLE tbl_manage_inquiry
	(
	serial_number       VARCHAR(50)     NOT NULL,          --회원 관리 번호(수정X, 시스템 입력)
	user_id             VARCHAR(50)     NOT NULL ,   --회원 아이디(수정X)
	inquiry_title         VARCHAR(70)    NOT NULL,          --문의사항 제목
	inquiry            VARCHAR(2000)    NOT NULL,          --문의사항
	inquiry_date      DATETIME          DEFAULT current_timestamp,   --문의사항(등록일자)
	answer            VARCHAR(2000)     NULL,          --답변
	answer_date       DATETIME              NULL,   --답변 등록일자
	 PRIMARY KEY (serial_number)
	);

-- =========== tbl_reason_break_away

-- sql 탈퇴사유 내용 관리 테이블
	CREATE TABLE tbl_reason_break_away
	(
	    reason_num       NUMBER(9)    NOT NULL,          --탈퇴사유 번호
	    out_reason      VARCHAR2(1000)     NOT NULL ,   -- 탈퇴 이유
	     PRIMARY KEY (reason_num)
	);

    CREATE SEQUENCE seq_tbl_reason_break_away;
    DROP SEQUENCE seq_tbl_reason_break_away;

-- 마리아 탈퇴사유 내용 관리 테이블
	CREATE TABLE tbl_reason_break_away
	(
	    reason_num       INT(9)    NOT NULL,          --탈퇴사유 번호
	    out_reason      VARCHAR(1000)     NOT NULL ,   -- 탈퇴 이유
	     PRIMARY KEY (reason_num)
	);

	DROP SEQUENCE seq_tbl_reason_break_away;
    CREATE SEQUENCE seq_tbl_reason_break_away START WITH 1 INCREMENT BY 1;


-- =========== login_list

-- sql 로그인 기록
CREATE TABLE login_list(
   login_num      NUMBER(10),       --일련번호
   account       VARCHAR2(50),      --회원 관리 번호
   login_log     DATE    DEFAULT SYSDATE,   --로그인이력
     PRIMARY KEY (login_num)
);

DROP SEQUENCE seq_login_list;
CREATE SEQUENCE seq_login_list;

-- 마리아 로그인 기록
CREATE TABLE login_list(
   login_num      INT(10),       --일련번호
   account       VARCHAR(50),      --회원 관리 번호
   login_log     DATETIME    DEFAULT current_timestamp,   --로그인이력
     PRIMARY KEY (login_num)
);
