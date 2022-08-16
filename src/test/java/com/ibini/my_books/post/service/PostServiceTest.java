package com.ibini.my_books.post.service;

import com.ibini.my_books.post.domain.PostWithName;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.aggregator.AggregateWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PostServiceTest {

    @Autowired
    PostService postService;

    @Test
    @DisplayName("epName과 ca이 세팅된 postWithName 객체가 조회되어야 한다")
    void fineOnePostWithNameTest(){
        Long postNo = 1L;
        PostWithName p = postService.fineOnePostWithName(postNo);
        System.out.println("p = " + p);
    }

}