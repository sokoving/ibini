package com.ibini.my_books.member.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class KakaoUserInfoDTO {
    private String nickName;
    private String email;
}
