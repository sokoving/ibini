package com.ibini.my_books.post.repository;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.dto.PostWithName;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
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
        Long rootPostNo = 18L;
        Long linkPostNo = 17L;
        LinkPost lp = new LinkPost(rootPostNo, linkPostNo);
        System.out.println("lp = " + lp);
        boolean flag = mapper.connectPost(lp);
        assertTrue(flag);

    }

    @Test
    @DisplayName("링크 해제돼야 함(데이터 삭제)")
    void disconnectPostTest() {
//    boolean disconnectPost(String linkId);
        Long rootPostNo = 45L;
        Long linkPostNo = 2L;
        LinkPost lp = new LinkPost(rootPostNo, linkPostNo);
        System.out.println("lp = " + lp);
        boolean flag = mapper.disconnectPost(lp.getLinkId());
        assertTrue(flag);
    }


    @Test
    @DisplayName("루트 포스트에 연결된 링크 포스트 전체 조회돼야 함")
    void getLinkLIstTest() {
        // List<LinkPost> getLinkLIst(Long rootPostNo);
        Long rootPostNo = 45L;
        List<LinkPost> linkLIst = mapper.getLinkList(rootPostNo);
        for (LinkPost linkPost : linkLIst) {
            System.out.println(linkPost);
        }
        assertEquals(3, linkLIst.size());
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
    void isLinkedTest() {
//    boolean isLinked(LinkPost linkPost);
        Long rootPostNo = 45L;
        Long linkPostNo = 1L;
        LinkPost lp = new LinkPost(rootPostNo, linkPostNo);
        System.out.println("lp = " + lp);
        int result = mapper.isLinked(lp);
        assertEquals(0, result);

    }

    @Test
    @DisplayName("linkId로 LinkPost 객체 만들기")
    void getLinkPostListTest() {
        String linkId = "48_49";

        String[] rootLink = linkId.split("_");
        LinkPost linkPost = new LinkPost(Long.parseLong(rootLink[0]), Long.parseLong(rootLink[1]));
        System.out.println("linkPost = " + linkPost);
    }

    @Test
    @DisplayName("rootPostNo에 연결된 전체 post의 postWithName 객체 리스트가 조회돼야 한다")
    void getLinkDTOLIstTest() {
        Long rootPostNo = 45L;
        List<PostWithName> linkDTOLIst = mapper.getLinkDTOList(rootPostNo);
        for (PostWithName ll : linkDTOLIst) {
            ll.setting();
            System.out.println(ll);
        }
        System.out.println("--------------------------------------------------");
        System.out.println("linkDTOLIst.size = " + linkDTOLIst.size());
    }

    @Test
    @DisplayName("링크 포스트로 등록할 포스트를 검색할 때 rootPostNo와 이미 등록된 포스트는 제외하고 조회된다")
    void getSearchListTest(){
        Long rootPostNo = 1L;
        SearchPost sp = new SearchPost();
        sp.setAccount("2209080001");
        sp.setRootPostNo(rootPostNo);
//        sp.setSTitle("세븐틴");
//        sp.setSWriter("세븐");
        System.out.println("sp = " + sp);
        List<PostWithName> sl = mapper.getSearchList(sp);
        for (PostWithName p : sl) {
            p.pubSetting();
            System.out.println(p);
            System.out.println(p.getPublishCycle());
        }
        System.out.println("sl.size() = " + sl.size());
        assertEquals(7, sl.size());
    }

    @Test
    @DisplayName("루트포스트번호가 포함된 모든 LinkPost를 조회한다")
    void getLinkForRemoveTest(){
        Long rootPostNo = 7L;
        List<LinkPost> linkForRemove = mapper.getLinkForRemove(rootPostNo);
        for (LinkPost linkPost : linkForRemove) {
            System.out.println(linkPost);
        }
        System.out.println("linkForRemove.size() = " + linkForRemove.size());
    }




}
