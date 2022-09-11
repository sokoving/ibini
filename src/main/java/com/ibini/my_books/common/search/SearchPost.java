package com.ibini.my_books.common.search;

import com.ibini.my_books.common.paging.Page;
import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SearchPost extends Page {

    private String account; // 검색자 계정
    private Long rootPostNo; // 연관 포스트의 포스트 번호

    private String sTitle;  // 제목 검색 키워드
    private String sWriter;  // 작가 검색 키워드
    private Integer sGenre; // 검색할 장르 아이디
    private Integer sPlatform; // 검색할 플랫폼 아이디
    private Integer sPublishStatus; // 검색할 연재 상태 아이디
    private Integer sStarRate;  // 검색할 별점 수

}
