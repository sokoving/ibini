package com.ibini.my_books.member.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AnswerDTO {
    private String serialNumber;
    private String answer;
}
