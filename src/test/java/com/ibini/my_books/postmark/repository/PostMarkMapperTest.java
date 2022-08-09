package com.ibini.my_books.postmark.repository;

import com.ibini.my_books.postmark.domain.PostMark;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class PostMarkMapperTest {

    @Autowired PostMarkMapper postMarkMapper;

    @Test
    @DisplayName("마크 정보가 DB에 저장되어야 한다.")
    void saveTest() {

        PostMark postMark = new PostMark();
        postMark.setPostNo(1L);
        postMark.setEpisodeNo(4L);
        postMark.setContent("4회차의 북마크");

        postMarkMapper.save(postMark);
    }

    @Test
    @DisplayName("특정 마크를 조회해야 한다.")
    void findOneTest() {

        PostMark postMark = postMarkMapper.findOne(7L);

        assertEquals("2회차의 수정된 북마크", postMark.getContent());
    }

    @Test
    @DisplayName("마크 내용과 수정일자를 수정해야 한다.")
    void modifyTest() {

        long markNo = 8L;

        PostMark postMark = new PostMark();
        postMark.setEpisodeNo(4L);
        postMark.setContent("4회차의 수정된 북마크");
        postMark.setMarkNo(markNo);

        postMarkMapper.modify(postMark);

        PostMark modPostMark = postMarkMapper.findOne(markNo);

        assertEquals("4회차의 수정된 북마크", modPostMark.getContent());
    }

    @Test
    @DisplayName("마크가 삭제되어야 한다.")
    void removeTest() {

        boolean delFlag = postMarkMapper.remove(6L);

        assertTrue(delFlag);
    }

    @Test
    @DisplayName("포스트에 달린 마크가 전체 삭제되어야 한다.")
    void removeAllTest() {

        boolean delFlag = postMarkMapper.removeAll(1L);

        assertTrue(delFlag);
    }

    @Test
    @DisplayName("특정 포스트의 마크를 전체 조회하여야 한다.")
    void findAllTest() {

        List<PostMark> postMarkList = postMarkMapper.findAll(1L);
        postMarkList.forEach(System.out::println);

        assertEquals(3, postMarkList.size());
    }

    @Test
    @DisplayName("특정 게시물의 전체 마크 수가 조회되어야 한다.")
    void getPostMarkCountTest() {

        int totalCount = postMarkMapper.getPostMarkCount(1L);

        assertEquals(2, totalCount);
    }
}