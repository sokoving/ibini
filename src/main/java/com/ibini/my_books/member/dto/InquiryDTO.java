package com.ibini.my_books.member.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InquiryDTO {

    private String userId;
    private String inquiryTitle;
    private String inquiry;

}
