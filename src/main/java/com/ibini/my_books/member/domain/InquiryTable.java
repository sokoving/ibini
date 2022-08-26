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
}
