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