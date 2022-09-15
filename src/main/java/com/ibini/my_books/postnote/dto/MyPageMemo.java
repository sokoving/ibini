package com.ibini.my_books.postnote.dto;

import lombok.*;

import java.util.List;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPageMemo {

    // tbl_post
    private Long postNo;              // 포스트 번호
    private String account;           // 계정 번호
    private String postTitle;         // 포스트 제목
    private int epId;                 // 에피소드(회차/페이지/권/%) 분류 번호

    // prj_post_img
    private String thumbImg;          // 썸네일 이미지 경로

    private List<Memo> memoList;

    // 커스텀 필드
    private String shortPostTitle;

    @Setter
    @Getter
    @ToString
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Memo {

        // prj_post_memo
        private Long memoNo;           // 마크 번호
        private String content;        // 내용
        private String modDatetime;    // 수정일자, 시간
    }
}


