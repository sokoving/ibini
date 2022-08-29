package com.ibini.my_books.post.service;

import com.ibini.my_books.post.dto.PostWithName;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class PostServiceTest {

    @Autowired
    PostService postService;

    @Test
    @DisplayName("모든 값이 세팅된 postWithName 객체가 하나 조회되어야 한다")
    void fineOnePostWithNameTest(){
        Long postNo = 27L;
        PostWithName p = postService.fineOnePostWithName(postNo);
        System.out.println("p = " + p);
    }

    @Test
    @DisplayName("모든 값이 세팅된 postWithName 객체가 모두 조회되어야 한다")
    void fineAllPostWithNameTest(){
        String account = "2208260002";

        List<PostWithName> pl = postService.finaAllPostWithNameService(account);

        for (PostWithName p : pl) {
            System.out.println(p);
        }
    }



}