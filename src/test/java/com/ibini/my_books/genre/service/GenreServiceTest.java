package com.ibini.my_books.genre.service;

import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.service.PostService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class GenreServiceTest {

    @Autowired GenreService genreService;
    @Autowired PostService postService;

    @Test
    @DisplayName("기본 장르를 세팅한다")
    void setGenreForNewMemberTest(){
        String account = "newMem";
        boolean flag = genreService.setGenreForNewMember(account);
        assertTrue(flag);
    }

    @Test
    @DisplayName("계정에 있는 모든 장르 데이터를 삭제한다")
    void removeGenreForOutMemberTest(){
        String account = "newMem";
        boolean flag = genreService.removeGenreForOutMember(account);
        assertTrue(flag);
    }

    @Test
    @DisplayName("특정 장르를 삭제할 때 해당 아이디를 가진 포스트를 모두 조회회 미분류(account = admin)로 변경한다 ")
    void genreRemoveTest(){
        int genreId = 5;
        boolean flag = genreService.removeService(genreId);
        assertTrue(flag);


////        특정 장르 아이디를 가진 post 조회
//        List<Post> pl = postService.getPostByGenreId(genreId);
////        account = admin인 장르 조회
//        String account = "admin";
//        List<Genre> gl = genreService.findAllService(account);
//        for (Genre genre : gl) {
//            // pl의 genre_id를  gl의 genre_name = "미분류"의  genre_id로 일관 수정
//            if(genre.getGenreName().equals("미분류")){
//                for (Post p : pl) {
//                    p.setGenreId(genre.getGenreId());
//                    postService.modifyService(p);
//                }
//            return;
//            }
//        }
    }
}