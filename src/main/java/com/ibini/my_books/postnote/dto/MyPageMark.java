package com.ibini.my_books.postnote.dto;

import lombok.*;

import java.util.Date;
import java.util.List;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPageMark {

    // tbl_post
    private Long postNo;             // 포스트 번호
    private String account;          // 계정 번호
    private String postTitle;        // 포스트 제목
    private int epId;                // 에피소드(회차/페이지/권/%) 분류 번호

    // prj_post_img
    private String thumbImg;         // 썸네일 이미지 경로

    private List<Mark> markList;

    @Setter @Getter
    @ToString
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Mark {

        // prj_post_mark
        private Long markNo;          // 마크 번호
        private Long episodeNo;       // 에피소드 (회차, 페이지, 권, %)
        private String content;       // 내용
        private String modDatetime;   // 수정일자, 시간
    }
}
