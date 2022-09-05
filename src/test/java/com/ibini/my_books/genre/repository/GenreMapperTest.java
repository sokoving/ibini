package com.ibini.my_books.genre.repository;

import com.ibini.my_books.genre.domain.Genre;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class GenreMapperTest {

    @Autowired
    GenreMapper mapper;

    @Test
    @DisplayName("새 장르가 DB에 저장돼야 한다")
    void saveTest(){
        Genre g = new Genre();
        g.setAccount("test");
        g.setGenreName("현대판타지");

        boolean flag = mapper.save(g);

        assertTrue(flag);
    }

    @Test
    @DisplayName("주어진 계정명에 속한 모든 장르가 리스트에 담겨 리턴된다")
    void findAllGenre(){
        String account = "test";
        List<Genre> gl = mapper.findAllGenre(account);
        for (Genre g : gl) {
            System.out.println(g);
        }

        assertEquals(4, gl.size());
    }

    @Test
    @DisplayName("장르 아이디로 장르 객체 리턴한다")
    void fineOneGenreByGenreIdTest(){
        int genreId = 2;
        Genre g = mapper.fineOneGenreByGenreId(genreId);
        System.out.println("g = " + g);
        assertEquals("로맨스", g.getGenreName());
    }

    @Test
    @Transactional
    @Rollback
    @DisplayName("장르 데이터가 DB에서 삭제돼야 한다")
    void removeTest(){
        int genreId = 3;
        boolean flag = mapper.remove(genreId);
        assertTrue(flag);
    }

    @Test
    @DisplayName("장르 데이터가 DB에서 수정돼야 한다")
    void modifyTest(){
        int genreId = 3;
        Genre g = mapper.fineOneGenreByGenreId(genreId);
        System.out.println("g = " + g);
        g.setGenreName("무협");
        boolean flag = mapper.modify(g);
        System.out.println("g = " + g);
        assertTrue(flag);
    }

    @Test
    @DisplayName("계정에 속한 장르 데이터의 수를 조회해야 한다")
    void getTotalCountTest(){
        String account = "test";
        int cnt = mapper.getTotalCount(account);
        System.out.println("cnt = " + cnt);

        assertEquals(4, cnt);
    }
}