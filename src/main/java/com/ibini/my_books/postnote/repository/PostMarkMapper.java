package com.ibini.my_books.postnote.repository;

import com.ibini.my_books.postnote.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.dto.MyPageMark;
import org.apache.ibatis.annotations.Mapper;

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
    List<PostMark> findAll2(Long postNo);

    // 마크 개별 조회 기능
    PostMark findOne(Long markNo);

    // 전체 마크 수 조회
    int getPostMarkCount(Long postNo);

    // 마이페이지 포스트, 썸네일 마크 조회
    List<MyPageMark> findAllMyPage(String account, Long postNo);
}
