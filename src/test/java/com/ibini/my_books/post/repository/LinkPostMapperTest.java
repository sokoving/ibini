package com.ibini.my_books.post.repository;

import com.ibini.my_books.post.domain.LinkPost;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class LinkPostMapperTest {

    @Autowired
    LinkPostMapper mapper;

    @Test
    @DisplayName("링크 연결돼야 함(데이터 저장)")
    void connectPostTest() {
//    boolean connectPost(LinkPost linkPost);
        Long rootPostNo = 50L;
        Long linkPostNo = 45L;
        LinkPost lp = new LinkPost(rootPostNo, linkPostNo);
        System.out.println("lp = " + lp);
        boolean flag = mapper.connectPost(lp);
        assertTrue(flag);

    }

    @Test
    @DisplayName("링크 해제돼야 함(데이터 삭제)")
    void disconnectPostTest() {
//    boolean disconnectPost(String linkId);
        Long rootPostNo = 50L;
        Long linkPostNo = 45L;
        LinkPost lp = new LinkPost(rootPostNo, linkPostNo);
        System.out.println("lp = " + lp);
        boolean flag = mapper.disconnectPost(lp.getLinkId());
        assertTrue(flag);
    }


    @Test
    @DisplayName("루트 포스트에 연결된 링크 포스트 전체 조회돼야 함")
    void getLinkLIstTest() {
        // List<LinkPost> getLinkLIst(Long rootPostNo);
        Long rootPostNo = 2L;
        List<LinkPost> linkLIst = mapper.getLinkLIst(rootPostNo);
        for (LinkPost linkPost : linkLIst) {
            System.out.println(linkPost);
        }
        assertEquals(0, linkLIst.size());
    }


    @Test
    @DisplayName("루트 포스트에 연결된 포스트 수 조회")
    void getCountTest() {
        // int getCount(Long rootPostNo);
        Long rootPostNo = 45L;
        int result = mapper.getCount(rootPostNo);
        System.out.println("result = " + result);
        assertEquals(3, result);
    }

    @Test
    @DisplayName("중복 링크인지 확인한다")
    void isLinkedTest(){
//    boolean isLinked(LinkPost linkPost);
        Long rootPostNo = 50L;
        Long linkPostNo = 51L;
        LinkPost lp = new LinkPost(rootPostNo, linkPostNo);
        System.out.println("lp = " + lp);
        int result = mapper.isLinked(lp);
        assertEquals(1, result);

    }
}