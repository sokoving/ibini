package com.ibini.my_books.hashtag.domain;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class HashtagDomain {
    private int tagNo;
    private Long postNo;
    private String tagName;
    private String account;
}
