package com.ibini.my_books.postnote.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class PostMemo {

    private Long memoNo;         // 메모 번호
    private Long postNo;         // 포스트 번호
    private String content;      // 내용
    private Date regDatetime;    // 작성일자, 시간
    private Date modDatetime;    // 수정일자, 시간
    private String account;      // 작성 account

    //커스텀 필드
    private String PrettierDate;
}
