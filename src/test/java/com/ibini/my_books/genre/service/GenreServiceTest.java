package com.ibini.my_books.genre.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class GenreServiceTest {

    @Autowired GenreService genreService;

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
}