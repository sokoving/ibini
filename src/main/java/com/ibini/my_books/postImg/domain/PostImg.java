package com.ibini.my_books.postImg.domain;

import lombok.*;
import java.util.Date;

@Setter @Getter @ToString
//@EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class PostImg {

    private String fileName;
    private Long postNo;
    private String account;
    private String originalFileName;
    private Date regDate;
    private String thumbnail;
}
