package com.ibini.my_books.postnote.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class PostMemo {

    private Long memoNo;    // 메모 번호
    private Long postNo;    // 포스트 번호
    private String content; // 내용
    private Date regDate;   // 작성일자
    private Date modDate;   // 수정일자
}
