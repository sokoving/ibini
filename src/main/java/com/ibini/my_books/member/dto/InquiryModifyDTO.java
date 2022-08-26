package com.ibini.my_books.member.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InquiryModifyDTO {
    private String serialNumber;
    private String inquiryTitle;
    private String inquiry;
}
