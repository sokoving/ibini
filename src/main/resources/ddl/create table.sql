DROP TABLE prj_post_memo;
DROP TABLE prj_post_mark;
DROP TABLE prj_hashtag;
DROP TABLE login_list;
DROP TABLE prj_post_img;
DROP TABLE tbl_post;
DROP TABLE prj_genre;
DROP TABLE prj_platform;
DROP TABLE tbl_member;
DROP TABLE prj_category;


CREATE TABLE tbl_post
(
    post_no         NUMBER(10)        NOT NULL,
    user_id          VARCHAR2(50)     NOT NULL,
    genre_id       NUMBER(3)         NULL,
    ca_id            NUMBER(3)          DEFAULT 0,
    platform_id      NUMBER(3)          DEFAULT 0,
    post_title       VARCHAR2(100)     NOT NULL,
    post_writer      VARCHAR2(100)     NOT NULL,
    publish_status    NUMBER(1)      DEFAULT 0,
    publish_cycle    VARCHAR2(100)      NULL,
    ep_id            NUMBER(1)          NULL,
    cur_ep          NUMBER(5)        DEFAULT 0,
    total_ep       NUMBER(5)        DEFAULT 0,
    reg_date         DATE                DEFAULT SYSDATE,
    update_date    DATE               DEFAULT SYSDATE ,
    star_rate        NUMBER(1)          NULL,
     PRIMARY KEY (post_no)

);
DROP SEQUENCE seq_tbl_post;
CREATE SEQUENCE seq_tbl_post;

CREATE TABLE tbl_member
(
    user_id         VARCHAR2(50)             NOT NULL,
    password       VARCHAR2(150)          NOT NULL,
    user_name      VARCHAR2(20)          NOT NULL,
    user_email        VARCHAR2(100)        NOT NULL,
    post_amount    NUMBER(3)                  NULL,
    sort                  VARCHAR2(50)            NULL,
    authority             VARCHAR2(20)  DEFAULT 'COMMON' ,
    join_date             DATE DEFAULT SYSDATE ,
    last_login            DATE DEFAULT SYSDATE ,
    email_verification    VARCHAR2(20)          DEFAULT 'false',
     PRIMARY KEY (user_id)
);
DROP SEQUENCE seq_tbl_member;
CREATE SEQUENCE seq_tbl_member;

CREATE TABLE prj_genre
(
    genre_id      NUMBER(3)        NOT NULL,
    user_id       VARCHAR2(50)     NOT NULL,
    genre_name    VARCHAR2(100)    NOT NULL,
     PRIMARY KEY (genre_id)
);
DROP SEQUENCE seq_prj_genre;
CREATE SEQUENCE seq_prj_genre;

CREATE TABLE prj_category(
    ca_id NUMBER(3)
    , ca_name VARCHAR2(100)
    , PRIMARY KEY (ca_id)
);

CREATE TABLE prj_platform
(
    platform_id                  NUMBER(3)             NOT NULL,
    user_id                      VARCHAR2(50)    NOT NULL,
    platform_name                VARCHAR2(50)    NOT NULL,
    platform_bg_color    VARCHAR2(50)    DEFAULT '#6c757d',
    platform_font_color          VARCHAR2(50) DEFAULT '#fff',
     PRIMARY KEY (platform_id)
);
DROP SEQUENCE seq_prj_platform;
CREATE SEQUENCE seq_prj_platform;

CREATE TABLE prj_post_memo
(
    memo_no     NUMBER(10)      NOT NULL,
    post_no     NUMBER(10)      NOT NULL,

    content     CLOB            NOT NULL,
    reg_date    DATE             DEFAULT SYSDATE,
    mod_date    DATE             DEFAULT SYSDATE,
     PRIMARY KEY (memo_no)
);
DROP SEQUENCE seq_prj_post_memo;
CREATE SEQUENCE seq_prj_post_memo;

CREATE TABLE prj_post_mark
(
    mark_no       NUMBER(10)      NOT NULL,
    post_no       NUMBER(10)      NOT NULL,

    episode_no    NUMBER(10)      NOT NULL,
    content       CLOB            NOT NULL,
    reg_date      DATE             DEFAULT SYSDATE,
    mod_date      DATE             DEFAULT SYSDATE,
     PRIMARY KEY (mark_no)
);
DROP SEQUENCE seq_prj_post_mark;
CREATE SEQUENCE seq_prj_post_mark;

CREATE TABLE prj_post_img
(
    file_name             VARCHAR2(150)     NOT NULL,
    post_no             NUMBER(10)      NOT NULL,
    user_id               VARCHAR2(50)   NOT NULL,
    original_file_name    VARCHAR2(50)     NULL,
    reg_date DATE DEFAULT SYSDATE,
    thumbnail             VARCHAR2(150)   DEFAULT 'false',
     PRIMARY KEY (file_name)
);

CREATE TABLE prj_hashtag
(
    tag_no      NUMBER(10)       NOT NULL,
    post_no     NUMBER(10)       NOT NULL,
    tag_name    VARCHAR2(100)    NOT NULL,
    user_id     VARCHAR2(50)     NOT NULL,
     PRIMARY KEY (tag_no)
);
DROP SEQUENCE seq_prj_hashtag;
CREATE SEQUENCE seq_prj_hashtag;

CREATE TABLE login_list(
    login_num NUMBER(10)
    , user_id VARCHAR2(50)
    , login_log DATE DEFAULT SYSDATE,
     PRIMARY KEY (login_num)
);
DROP SEQUENCE seq_login_list;
CREATE SEQUENCE seq_login_list;