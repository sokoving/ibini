package com.ibini.my_books.hashtag.domain;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class HashtagDomain {
    private int tagNo;  // 태그 번호
    private Long postNo;    // 태그가 속해 있는 포스트 번호
    private String tagName;     // 태그 내용
    private String account;     // 태그를 저장한 계정 이름
}
