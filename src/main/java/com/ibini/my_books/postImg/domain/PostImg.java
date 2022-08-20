package com.ibini.my_books.postImg.domain;

import lombok.*;
import java.util.Date;

@Setter @Getter @ToString
//@EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class PostImg {

    private String fileName;        // 이미지 풀경로
    private Long postNo;            // 이미지가 속한 포스트 번호
    private String account;         // 이미지 올린 계정명
    private String originalFileName;    // 이미지 원래 이름
    private Date regDate;           // 파일 등록일
    private String thumbnail;       // 썸네일 여부
}
