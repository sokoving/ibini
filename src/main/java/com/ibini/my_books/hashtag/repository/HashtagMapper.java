package com.ibini.my_books.hashtag.repository;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HashtagMapper {
    
    // 저장
    boolean saveHashtag(HashtagDomain hashtagDomain);
    // 수정
    boolean modifyHashtag(HashtagDomain hashtagDomain);
    // 삭제
    boolean deleteHashtag(int tagNo);

    // 하나조회
//    HashtagDomain findOneHasgtag(int postNo, int tagNo);

    // 하나의 게시글에 달린 여러가지 태그
    HashtagDomain findOneTag(int tagNo, String account);

    // 전체조회 -> account? postNo?
    List<HashtagDomain> findAllHashTag(String account);

    // 한 포스트에 달린 해시태그 전체 조회
    List<HashtagDomain> findAllHashTagByPostNo(Long postNo);

}