package com.ibini.my_books.postnote.repository;

import com.ibini.my_books.postnote.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.domain.PostMemo;
import com.ibini.my_books.postnote.dto.MyPagePostDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PostMarkMapper {

    // 마크 저장 기능
    boolean save(PostMark postMark);

    // 마크 수정 기능
    boolean modify(PostMark postMark);

    // 마크 삭제 기능
    boolean remove(Long markNo);

    // 마크 전체 삭제 (포스트에 달린 모든 마크 삭제)
    boolean removeAll(Long postNo);

    // 마크 전체 조회 기능
    List<PostMark> findAll(Long postNo);

    // 마크 전체 조회 기능 With Search
    List<PostMark> findAllWithSearch(@Param("postNo") Long postNo, @Param("search") Search search);

    // 마크 전체 조회 기능 Except 2 rows
    List<PostMark> findAllWithSearch2(@Param("postNo") Long postNo, @Param("search") Search search);

    // 마크 개별 조회 기능
    PostMark findOne(Long markNo);

    // 전체 마크 수 조회
    int getPostMarkCount(Long postNo);

    // MyPagePostDTO post 조회(썸네일 포함)
    List<MyPagePostDTO> findAllPostWithImg(@Param("account") String account, @Param("search") Search search);
}
