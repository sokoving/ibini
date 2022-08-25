package com.ibini.my_books.member.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AutoLoginDTO {

    private String account;
    private String userId;
    private String sessionId;
    private Date limitTime;
}
