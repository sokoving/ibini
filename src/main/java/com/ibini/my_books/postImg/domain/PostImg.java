package com.ibini.my_books.postImg.domain;

import lombok.*;
import oracle.sql.DATE;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class PostImg {

    private String fileName;
    private int postNo;
    private String account;
    private String originalFileName;
    private DATE regDate;
    private String thumbnail;
}
