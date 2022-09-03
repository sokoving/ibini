package com.ibini.my_books.post.repository;

import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.dto.LinkDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LinkPostMapper {

    // 링크 연결하기(데이터 저장)
    boolean connectPost(LinkPost linkPost);

    // 링크 해제하기(데이터 삭제)
    boolean disconnectPost(String linkId);

    // 루트 포스트에 연결된 링크 포스트 전체 조회
    List<LinkPost> getLinkLIst(Long rootPostNo);

    // 루트 포스트에 연결된 포스트 수 조회
    int getCount(Long rootPostNo);

    // 중복 링크인지 확인 (중복이면 true, 아니면 false)
    int isLinked(LinkPost linkPost);
}