package com.ibini.my_books.hashtag.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class HashtagDto {

    // hashtag
    private String account;
    private String tagName;
    // post
    private int postNo;
    private String postTitle;
    private String postWriter;
    //platform
    private String platformName;

}
