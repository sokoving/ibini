package com.ibini.my_books.member.domain;

import lombok.*;
import org.springframework.stereotype.Service;

import java.util.Date;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@ToString
public class Member {

    private String account;
    private String password;
    private String userId;
    private String userName;
    private String Email;
    private int postAmount;
    private String sort;
    private Auth auth;
    private Date joinDate;
    private Date lastLogin;
    private String emailVerification;
    private String sessionId;
    private Date limitTime;

    //커스텀 필드
    private String PrettierDate;

}
