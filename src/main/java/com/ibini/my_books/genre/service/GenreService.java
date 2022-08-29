package com.ibini.my_books.genre.service;

import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.genre.repository.GenreMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GenreService {

    private final GenreMapper genreMapper;

    public boolean saveService(Genre genre){
        log.info("Genre Service : saveService call - {}", genre);
        return genreMapper.save(genre);
    }

    public List<Genre> findAllService(String account){
        log.info("Genre Service : findAllService call - {}", account);
        return genreMapper.findAllGenre(account);
    }

    public Genre findOneService(int genreId){
        log.info("Genre Service : findOneService call - {} ", genreId);
        return genreMapper.fineOneGenreByGenreId(genreId);
    }

    public boolean modifyService(Genre genre){
        log.info("Genre Service : modifyService call - {}", genre);
        return genreMapper.modify(genre);
    }

    public int getTotalCountService(String account){
        log.info("Genre Service : getTotalCountService call - {}", account);
        return genreMapper.getTotalCount(account);
    }
    public boolean removeService(int genreId){
        log.info("Genre Service : removeService call - {}", genreId);
        return genreMapper.remove(genreId);
    }

//    새 회원 가입할 때 기본 장르 세팅
    @Transactional
    public boolean setGenreForNewMember(String account){
        log.info("Genre Service : setGenreForNewMember call - {}", account);
        String[] basicGenre = {"미분류", "판타지", "로맨스", "무협", "아이돌"};

        for (String s : basicGenre) {
            Genre g = new Genre();
            g.setAccount(account);
            g.setGenreName(s);
            genreMapper.save(g);
        }

        return genreMapper.getTotalCount(account) == basicGenre.length;
    }

//    회원 탈퇴 시 계정 내 모든 장르 삭제
    @Transactional
    public boolean removeGenreForOutMember(String account){
        log.info("Genre Service : removeGenreForOutMember call - {}", account);

        List<Genre> gl = genreMapper.findAllGenre(account);
        for (Genre g : gl) {
            int id = g.getGenreId();
            genreMapper.remove(id);
        }

        return genreMapper.getTotalCount(account) == 0;

    }

}
