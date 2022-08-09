package com.ibini.my_books.postmark.repository;

import com.ibini.my_books.postmark.domain.PostMark;
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
    List<PostMark> findAll(Long postNo); // 페이징 처리 추후 추가 예정

    // 마크 개별 조회 기능
    PostMark findOne(Long markNo);

    // 전체 마크 수 조회
    int getPostMarkCount(Long postNo);
}
