package com.ibini.my_books.post.repository;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PostMapperTest {

    @Autowired
    PostMapper mapper;

    @Test
    @DisplayName("포스트가 DB에 저장돼야 한다")
    void saveTest(){
        Post p = new Post();
        p.setAccount("ibini");
        p.setGenreId(2);
        p.setCaId(2);
        p.setPlatformId(2);
        p.setPostTitle("test title");
        p.setPostWriter("테스트 제목 3");
        p.setPublishStatus(2);
        p.setPublishCycle("매월 3일");
        p.setEpId(1);
        p.setCurEp(10);
        p.setTotalEp(100);
        p.setStarRate(5);

        boolean flag = mapper.save(p);

        assertTrue(flag);
    }

    @Test
    @DisplayName("포스트 전체 목록이 조회돼야 한다")
    void findAllPostTest(){
        String account = "ibini";
        List<Post> allPost = mapper.findAllPost(account);
        for (Post post : allPost) {
            System.out.println(post);
        }
    }

    @Test
    @DisplayName("포스트, 장르, 플랫폼 테이블이 조인돼서 모두 조회돼야 한다")
    void findAllPostWithNameTest(){
        String account = "ibini";
        List<PostWithName> all = mapper.findAllPostWithName(account);
        for (PostWithName p : all) {
            System.out.println(p);
        }
    }

    @Test
    @DisplayName("원하는 포스트 하나가 조회돼야 한다")
    void findOnePostTest(){
        Long postNo = 3L;
        Post p = mapper.findOnePost(postNo);
        System.out.println("p = " + p);

        assertEquals(postNo, p.getPostNo());
    }

    @Test
    @DisplayName("장르, 플랫폼이 조인된 포스트 하나가 조회돼야 한다")
    void fineOnePostWithName(){
        Long postNo = 49L;
        PostWithName p = mapper.fineOnePostWithName(postNo);
        System.out.println("p = " + p);

        assertNotNull(p.getGenreName());
    }

    @Test
//    @Transactional
//    @Rollback
    @DisplayName("원하는 포스트 하나가 DB에서 삭제돼야 한다")
    void removeTest(){
        Long postNo = 3L;
        boolean flag = mapper.remove(postNo);
        assertTrue(flag);
    }

    @Test
    @DisplayName("포스트 데이터가 DB에서 수정돼야 한다")
    void modifyTest(){
        Post p = new Post();
        p.setPostNo(2L);
        p.setAccount("ibini");
        p.setGenreId(3);
        p.setCaId(3);
        p.setPlatformId(3);
        p.setPostTitle("수정 제목 2");
        p.setPostWriter("수정 작가 2");
        p.setPublishStatus(3);
        p.setPublishCycle("매월 2일");
        p.setEpId(3);
        p.setCurEp(30);
        p.setTotalEp(300);
        p.setStarRate(3);

        boolean flag = mapper.modify(p);
        System.out.println("p = " + p);
        assertTrue(flag);
    }

    @Test
    @DisplayName("포스트 테이블에 저장된 모든 행의 수를 반환한다")
    void getTotalCountTest(){
        String account = "ibini";
        int cnt = mapper.getTotalCount(account);
        System.out.println("cnt = " + cnt);
        assertEquals(7, cnt);
    }

    @Test
    @DisplayName("포스트 조회할 때 검색과 페이징이 적용돼야 한다")
    void findAllWithSearch(){
        SearchPost sp = new SearchPost();
        sp.setAccount("2209080001");
        sp.setSTitle("세븐틴");
//        sp.setPageNum(2);
//        sp.setAmount(10);
        System.out.println("sp = " + sp);

        List<PostWithName> sList = mapper.searchAllPostWithName(sp);
        for (PostWithName s : sList) {
            s.pubSetting();
            System.out.println(s);
        }
    }

    @Test
    @DisplayName("검색이 적용된 총 포스트 수를 조회한다")
    void getTotalCountWithSearch(){
        SearchPost sp = new SearchPost();
        sp.setAccount("2209080001");
        sp.setSTitle("세븐틴");
        sp.setAmount(10);
        System.out.println("sp = " + sp);

        int tc = mapper.getTotalCountWithSearch(sp);
        System.out.println("tc = " + tc);
        List<PostWithName> sList = mapper.searchAllPostWithName(sp);
        System.out.println("sList.size= " + sList.size());

        assertEquals(sList.size(), tc);
    }

}