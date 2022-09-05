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