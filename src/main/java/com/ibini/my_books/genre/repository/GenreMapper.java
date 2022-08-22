package com.ibini.my_books.genre.repository;

import com.ibini.my_books.genre.domain.Genre;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GenreMapper {


    // 새 장르 등록 기능
    boolean save(Genre genre);

    /**
      * 개별 계정(account)에 속한 장르 리스트 리턴
      * @return 장르를 리스트에 담아 리턴
     */

    List<Genre> findAllGenre(String account);

    /**
     * 장르 아이디(genreId)로 장르 리턴
     * @param genreId : 찾을 장르의 int 타입 genreId
     * @return - Genre
     */
    Genre fineOneGenreByGenreId(int genreId);

    /**
     * 장르 아이디(genreId)로 장르 삭제
     * @param genreId - 삭제할 장르의 int 타입 genreId
     * @return - boolean
     */
    boolean remove(int genreId);

    /**
     * 장르 아이디(genreId)로 장르 수정
     * @param genre - 수정할 Genre 객체
     * @return - boolean
     */
    boolean modify(Genre genre);

    /**
     * 개별 계정(account)에 속한 장르의 수 리턴
     * @param account - String 타입의 계정명
     * @return - int
     */
    int getTotalCount(String account);
//    int getTotalCount2(Search search);

}
