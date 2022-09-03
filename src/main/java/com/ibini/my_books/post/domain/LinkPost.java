package com.ibini.my_books.post.domain;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class LinkPost {

//    link_id      VARCHAR2(100)       NOT NULL, --일련번호(원본포스트번호_연결할포스트번호)
//    root_post_no      NUMBER(10)       NOT NULL,    -- root 포스트 번호
//    link_post_no    NUMBER(10)     NOT NULL,      --post_no와 연결할 포스트 번호
    private String linkId;
    private Long rootPostNo;
    private Long linkPostNo;

    public LinkPost(Long rootPostNo, Long linkPostNo) {
        this.rootPostNo = rootPostNo;
        this.linkPostNo = linkPostNo;
        this.linkId = rootPostNo+"_"+linkPostNo;
    }

    public String getLinkId() {
        return rootPostNo+"_"+linkPostNo;
    }
}
