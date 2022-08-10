package com.ibini.my_books.member.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ModifyDTO {
    private String account;
    private String password;
    private String email;

}
