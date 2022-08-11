package com.ibini.my_books.post.domain;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

// 조인용 도메인(id와 id에 따른 이름값이 같이 출력된다)
public class PostWithName {

    /* p: post,    g: genre,   pf: platform
    p.post_no,    p.account,    p.genre_id,     g.genre_name,
    p.ca_id,    p.platform_id,  pf.platform_name, pf.platform_bg_color, pf.platform_font_color,
    p.post_title,    p.post_writer,    p.publish_status,    p.publish_cycle,
    p.ep_id,    p.cur_ep,    p.total_ep,    p.reg_date,    p.update_date,    p.star_rate
     */

    // tbl_post
    private Long postNo;            //  포스트 번호   NUMBER(10)  NOT NULL,
    private String account;         // 유저아이디    VARCHAR2(50)  NOT NULL,
    private int genreId;           // 장르아이디    NUMBER(3) NULL,
    private int caId;             // 카테고리아이디   NUMBER(3)  DEFAULT 0,
    private int platformId;       // 연재플랫폼아이디   NUMBER(3)  DEFAULT 0,
    private String postTitle;     // 책제목    VARCHAR2(100) NOT NULL,
    private String postWriter;    // 작가    VARCHAR2(100) NOT NULL,
    private int publishStatus;    // 연재상태   NUMBER(1) DEFAULT 0,
    private String publishCycle;  // 연재주기   VARCHAR2(100) NULL,
    private int epId;             // 회차아이디   NUMBER(1) NULL,
    private int curEp;            // 현재 회차    NUMBER(5) DEFAULT 0,
    private int totalEp;           // 총회차   NUMBER(5) DEFAULT 0,
    private Date regDate;          // 등록일자   DATE  DEFAULT SYSDATE,
    private Date updateDate;       // 수정일자    DATE               DEFAULT SYSDATE ,
    private int starRate;          // 별점   NUMBER(1)          NULL,


    //  prj_genre
    private String genreName;


    // prj_platform
    private String platformName;
    private String platformBgColor;
    private String platformFontColor;

}
