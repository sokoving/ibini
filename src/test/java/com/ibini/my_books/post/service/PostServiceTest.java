package com.ibini.my_books.post.service;

import com.ibini.my_books.post.dto.PostWithName;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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