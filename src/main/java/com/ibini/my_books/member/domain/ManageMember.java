package com.ibini.my_books.member.domain;

import lombok.*;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@ToString
//회원관리 테이블
public class ManageMember {
    private String userId;
    private boolean userCondition;

}
