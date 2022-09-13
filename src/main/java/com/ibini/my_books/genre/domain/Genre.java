package com.ibini.my_books.genre.domain;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Genre {
    private int rowNum;
    private int genreId;   // 장르 아이디   NUMBER(9)         NOT NULL
    private String account;     // 유저 아이디   VARCHAR2(50)     NOT NULL
    private String genreName;      //  장르명  VARCHAR2(100)    NOT NULL

}
