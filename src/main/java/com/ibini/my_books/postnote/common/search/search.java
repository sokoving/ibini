package com.ibini.my_books.postnote.common.search;

import com.ibini.my_books.postnote.common.paging.Page;
import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class search extends Page {

    private String type;
    private String keyword;
}
