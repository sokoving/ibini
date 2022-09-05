package com.ibini.my_books.member.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PageFindOneDTO {
    private String userId;
    private int pageNum;
    private int amount;

}
