package com.ibini.my_books.post.dto;

import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.util.CategoryUtil;
import com.ibini.my_books.util.CommonUtil;
import com.ibini.my_books.util.EpIdUtil;
import com.ibini.my_books.util.PublishStatusUtil;
import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

// 조인용 도메인(id와 id에 따른 이름값이 같이 출력된다)
public class PostWithName {

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
    private Date regDate;          // 등록일자(KST 표준시)  DATE  DEFAULT SYSDATE,
    private Date updateDate;       // 수정일자(KST 표준시)    DATE               DEFAULT SYSDATE ,
    private int starRate;          // 별점   NUMBER(1)          NULL,

    private String caName;      // 카테고리 이름
    private String publishStatusName;    // 연재상태명
    private String epName;      // 회차 구분명(ex. 페이지)
    private String epName2;   // 회차 구분명 (ex. p)

    FormattingDateDTO shortDate;    // 포매팅한 날짜 DTO (yyyy.MM.dd)
    private String oneLineTag;      // 포스트의 해시태그 한 줄로(PostService에서 세팅할 것)

    //  prj_genre
    private String genreName;

    // prj_platform
    private String platformName;
    private String platformBgColor;
    private String platformFontColor;

    // prj_post_img
    private String thumbImg;        // 썸네일 이미지 경로(표지)


//   아이디로 이름을 세팅해주는 메서드
    public void setting(){
        this.caName = CategoryUtil.CATEGORY_MAP.get(this.caId);

        this.epName = EpIdUtil.EP_ID_MAP.get(this.epId);
        this.epName2 = EpIdUtil.EP_NAME_MAP.get(epName);

        this.publishStatusName = PublishStatusUtil.PUBLISH_STATUS_MAP.get(this.publishStatus);

        this.shortDate = new FormattingDateDTO();
        this.shortDate.setDateDTO(regDate, updateDate);
    }

}
