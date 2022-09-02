package com.ibini.my_books.postnote.dto;

import lombok.Data;

import java.util.List;

@Data
public class PostMarkVo {

    private String postNo;
    private String title;

    private List<Mark> markList;

    @Data
    public static class Mark {

        private String markNo;
        private String markContent;
    }
}
