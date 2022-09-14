package com.ibini.my_books.post.service;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.util.FileUtils;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import static org.junit.jupiter.api.Assertions.*;
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

    @Test
    @DisplayName("원본명이 추출돼야 한다")
    void extractOriginFileNameTest(){
        String s = FileUtils.extractOriginFileName("/2022/08/29/b11670db-c24f-47fb-9f25-0c17cc0a0b56_KakaoTalk_20220829_104917435_08.jpg");
        System.out.println("s = " + s);
    }

    @Test
    @DisplayName("검색이 적용되고, 연재 상태가 세팅된 List<PostWithName>가 조회돼야 한다")
    void searchAllPostWithNameServiceTest(){
        SearchPost sp = new SearchPost();
        sp.setAccount("2209080001");
        sp.setSTitle("세븐틴");
        sp.setPageNum(2);
//        sp.setAmount(2);
        System.out.println("sp = " + sp);

        Map<String, Object> searchMap = postService.searchAllPostWithNameService(sp);
        Object pl = searchMap.get("pl");
        System.out.println("-------------------------- pl");
        System.out.println(pl);

        System.out.println("-------------------------- tc");
        Object tc = searchMap.get("tc");
        System.out.println(tc);
    }

    @Test
    @DisplayName("긴 글자는 잘라서 shot 필드에 담는다")
    void cutCharTest(){

        PostWithName p = postService.fineOnePostWithName(10L);
    }

    @Test
    @DisplayName("중복된 제목을 전달하면 true가 나와야 한다.")
    void checkAccountServiceTest() {

        //given
        String title = "ㅇㅇ";

        //when
        boolean flag = postService.checkSignUpValue("title", title);

        //then
        assertTrue(flag);

    }


}