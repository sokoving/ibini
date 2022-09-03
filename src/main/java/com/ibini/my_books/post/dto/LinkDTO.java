package com.ibini.my_books.post.dto;

import com.ibini.my_books.post.domain.LinkPost;
import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class LinkDTO {

    private Long rootPostNo;
    private List<PostWithName> linkPostList;

}