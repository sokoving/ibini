package com.ibini.my_books.postmemo.repository;

import com.ibini.my_books.postmemo.domain.PostMemo;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class PostMemoMapperTest {

    @Autowired PostMemoMapper postMemoMapper;

    @Test
    @DisplayName("메모 정보가 DB에 저장되어야 한다.")
    void saveTest() {

        PostMemo postMemo = new PostMemo();
        postMemo.setPostNo(1L);
        postMemo.setContent("메모6");

        postMemoMapper.save(postMemo);
    }

    @Test
    @DisplayName("특정 메모를 조회해야 한다.")
    void findOneTest() {

        PostMemo postMemo = postMemoMapper.findOne(1L);

        assertEquals("메모1", postMemo.getContent());
    }

    @Test
    @DisplayName("메모 내용과 수정일자를 수정해야 한다.")
    void modifyTest() {

        long memoNo = 1L;

        PostMemo postMemo = new PostMemo();
        postMemo.setContent("메모1 수정");
        postMemo.setMemoNo(memoNo);

        postMemoMapper.modify(postMemo);

        PostMemo modPostMemo = postMemoMapper.findOne(memoNo);

        assertEquals("메모1 수정", modPostMemo.getContent());
    }

    @Test
    @DisplayName("메모가 삭제되어야 한다.")
    void removeTest() {

        boolean delFlag = postMemoMapper.remove(3L);

        assertTrue(delFlag);
    }

    @Test
    @DisplayName("포스트에 달린 메모가 전체 삭제되어야 한다.")
    void removeAllTest() {

        boolean delFlag = postMemoMapper.removeAll(1L);

        assertTrue(delFlag);
    }

    @Test
    @DisplayName("특정 게시물의 메모를 전체 조회하여야 한다.")
    void findAllTest() {

        List<PostMemo> postMemoList = postMemoMapper.findAll(1L);
        postMemoList.forEach(System.out::println);

        assertEquals(3, postMemoList.size());
    }

    @Test
    @DisplayName("특정 게시물의 전체 메모 수가 조회되어야 한다.")
    void getPostMemoCountTest() {

        int totalCount = postMemoMapper.getPostMemoCount(1L);

        assertEquals(3, totalCount);
    }
}