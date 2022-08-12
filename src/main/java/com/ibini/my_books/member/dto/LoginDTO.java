package com.ibini.my_books.member.dto;

import lombok.*;
import org.springframework.stereotype.Service;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@ToString
public class LoginDTO {
    //로그인 할때 클라이언트가 전송하는 데이터만 있는 클래스
    private String account;
    private String password;
    private boolean autoLogin;


}
