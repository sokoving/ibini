package com.ibini.my_books.post.repository;

import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

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
        p.setPostTitle("테스트 제목 4");
        p.setPostWriter("테스트 제목 4");
        p.setPublishStatus(2);
        p.setPublishCycle("매일");

        boolean flag = mapper.save(p);

        assertTrue(flag);
    }

    @Test
    @DisplayName("포스트 전체 목록이 조회돼야 한다")
    void findAllPostTest(){
        List<Post> allPost = mapper.findAllPost();
        for (Post post : allPost) {
            System.out.println(post);
        }
    }

    @Test
    @DisplayName("포스트, 장르, 플랫폼 테이블이 조인돼서 모두 조회돼야 한다")
    void findAllPostWithNameTest(){
        List<PostWithName> all = mapper.findAllPostWithName();
        for (PostWithName p : all) {
            System.out.println(p);
        }
    }

    @Test
    @DisplayName("원하는 포스트 하나가 조회돼야 한다")
    void findOnePostTest(){
        Long postNo = 1L;
        Post p = mapper.findOnePost(postNo);
        System.out.println("p = " + p);

        assertEquals(postNo, p.getPostNo());
    }

    @Test
    @DisplayName("장르, 플랫폼이 조인된 포스트 하나가 조회돼야 한다")
    void fineOnePostWithName(){
        Long postNo = 1L;
        PostWithName p = mapper.fineOnePostWithName(postNo);
        System.out.println("p = " + p);

        assertNotNull(p.getGenreName());
    }

    @Test
    @Transactional
    @Rollback
    @DisplayName("원하는 포스트 하나가 DB에서 삭제돼야 한다")
    void removeTest(){
        Long postNo = 3L;
        boolean flag = mapper.remove(postNo);
        assertTrue(flag);
    }

    @Test
    @DisplayName("포스트 데이터가 DB에서 수정돼야 한다")
    void modifyTest(){
        Post p = mapper.findOnePost(1L);
        System.out.println("p = " + p);
        p.setPostTitle("수수수수수수수정 제목");
        p.setPlatformId(2);
        boolean flag = mapper.modify(p);
        System.out.println("p = " + p);
        assertTrue(flag);
    }

    @Test
    @DisplayName("포스트 테이블에 저장된 모든 행의 수를 반환한다")
    void getTotalCountTest(){
        int cnt = mapper.getTotalCount();
        System.out.println("cnt = " + cnt);
        assertEquals(4, cnt);
    }
}