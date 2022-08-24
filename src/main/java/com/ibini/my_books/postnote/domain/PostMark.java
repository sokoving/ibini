package com.ibini.my_books.postnote.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class PostMark {

    private Long markNo;         // 북마크 번호
    private Long postNo;         // 포스트 번호
    private Long episodeNo;      // 에피소드 (회차, 페이지, 권, %)
    private String content;      // 내용
    private Date regDateTime;    // 작성일자, 시간
    private Date modDateTime;    // 수정일자, 시간
    private String regAccount;   // 작성 account
    private String modAccount;   // 수정 account
}
