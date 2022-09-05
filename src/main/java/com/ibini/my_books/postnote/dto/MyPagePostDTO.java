package com.ibini.my_books.postnote.dto;

import lombok.*;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPagePostDTO {

    // tbl_post
    private Long postNo;         // 포스트 번호
    private String account;      // 계정 번호
    private String postTitle;    // 포스트 제목
    private int epId;            // 에피소드(회차/페이지/권/%) 분류 번호

    // prj_post_img
    private String thumbImg;     // 썸네일 이미지 경로
}
