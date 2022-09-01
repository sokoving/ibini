package com.ibini.my_books.member.domain;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InquiryTable {
    private String serialNumber;
    private String userId;
    private String inquiryTitle;
    private String inquiry;
    private Date inquiryDate;
    private String answer;
    private Date answerDate;

    //커스텀필드
    private String inquiryPrettierDate; // 문의글 등록일자 날짜 포맷팅
    private String answerPrettierDate; // 답변글 등록일자 날짜 포맷팅

    private boolean newInquiryArticle;  // 문의글 신규 게시물 여부
    private boolean newAnswerArticle;  // 답변 신규 게시물 여부
}
