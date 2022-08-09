package com.ibini.my_books.genre.repository;

import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.domain.PostWithName;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GenreMapper {


    // 새 장르 등록 기능
    boolean save(Genre genre);

    /**
     * 개별 계정(account)에 속한 장르 리스트 리턴
     * @param - String account
     * @return - List<Genre>
     */
    List<Genre> findAllGenre(String account);

    /**
     * 장르 아이디(genreId)로 장르 리턴
     * @param - int genreId
     * @return - Genre
     */
    Genre fineOneGenreByGenreId(int genreId);

    /**
     * 장르 아이디(genreId)로 장르 삭제
     * @param - int genreId
     * @return - boolean
     */
    boolean remove(int genreId);

    /**
     * 장르 아이디(genreId)로 장르 삭제
     * @param - int genreId
     * @return - boolean
     */
    boolean modify(Genre genre);

    /**
     * 개별 계정(account)에 속한 장르의 수 리턴
     * @param - String account
     * @return - int
     */
    int getTotalCount(String account);
//    int getTotalCount2(Search search);

}
