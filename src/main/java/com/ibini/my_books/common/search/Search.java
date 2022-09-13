package com.ibini.my_books.common.search;

import com.ibini.my_books.common.paging.Page;
import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Search extends Page {


    private String type;    // 검색 조건
    private String keyword; // 검색 키워드
}
