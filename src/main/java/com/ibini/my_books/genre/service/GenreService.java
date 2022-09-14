package com.ibini.my_books.genre.service;

import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.genre.repository.GenreMapper;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GenreService {

    private final GenreMapper genreMapper;
    private final PostService postService;

    public boolean saveService(Genre genre) {
        log.info("Genre Service : saveService call - {}", genre);
        return genreMapper.save(genre);
    }

    public List<Genre> findAllService(String account) {
        log.info("Genre Service : findAllService call - {}", account);
        return genreMapper.findAllGenre(account);
    }

    public Genre findOneService(int genreId) {
        log.info("Genre Service : findOneService call - {} ", genreId);
        return genreMapper.fineOneGenreByGenreId(genreId);
    }

    public boolean modifyService(Genre genre) {
        log.info("Genre Service : modifyService call - {}", genre);
        return genreMapper.modify(genre);
    }

    public int getTotalCountService(String account) {
        log.info("Genre Service : getTotalCountService call - {}", account);
        return genreMapper.getTotalCount(account);
    }

    public boolean removeService(int genreId) {
        log.info("Genre Service : removeService call - {}", genreId);

        // 삭제 대항 genre_id를 가진 post 찾아 미분류로 변경
        List<Post> pl = postService.getPostByGenreId(genreId);

        // 미분류의 genre_id 찾기  (account = admin, genre_name="미분류")
        String account = "admin";
        List<Genre> gl = genreMapper.findAllGenre(account);
        for (Genre genre : gl) {
            // pl의 genre_id를  gl의 genre_name = "미분류"의  genre_id로 일관 수정
            if (genre.getGenreName().equals("미분류")) {
                for (Post p : pl) {
                    p.setGenreId(genre.getGenreId());
                    postService.modifyService(p);
                }
                break;
            }
        }

        return genreMapper.remove(genreId);
    }

    //    새 회원 가입할 때 기본 장르 세팅
    @Transactional
    public boolean setGenreForNewMember(String account) {
        log.info("Genre Service : setGenreForNewMember call - {}", account);
        String[] basicGenre = {"판타지", "로맨스", "무협", "퓨전", "아이돌"};

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
    public boolean removeGenreForOutMember(String account) {
        log.info("Genre Service : removeGenreForOutMember call - {}", account);

        List<Genre> gl = genreMapper.findAllGenre(account);
        for (Genre g : gl) {
            int id = g.getGenreId();
            genreMapper.remove(id);
        }

        return genreMapper.getTotalCount(account) == 0;

    }

    // total num 조회 추가
    public int findGenreTotalNum(int genreId, String account){
        log.info("Genre Service : findGenreTotalNum call genreId - {} account - {}", genreId, account);
        int genreIdTotal = postService.getPostByGenreIdTotal(genreId, account);
        return genreIdTotal;
    }

}
