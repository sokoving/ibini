package com.ibini.my_books.post.dto;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class PostSaveDTO {

    private Long postNo;            //  포스트 번호   NUMBER(10)  NOT NULL,
    private String account;         // 유저아이디    VARCHAR2(50)  NOT NULL,

    private int caId;             // 카테고리아이디   NUMBER(3)  DEFAULT 0,
    private int genreId;           // 장르아이디    NUMBER(3) NULL,
    private String genreName;      //  장르명  VARCHAR2(100)    NOT NULL
    private int platformId;       // 연재플랫폼아이디   NUMBER(3)  DEFAULT 0,
    private String platformName;

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


}
