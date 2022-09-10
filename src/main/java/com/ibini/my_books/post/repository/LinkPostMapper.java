package com.ibini.my_books.post.repository;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.dto.PostWithName;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LinkPostMapper {

    // 링크 연결하기(데이터 저장)
    boolean connectPost(LinkPost linkPost);

    // 링크 해제하기(데이터 삭제)
    boolean disconnectPost(String linkId);

    // 루트 포스트에 연결된 링크 포스트 전체 조회(post_no만)
    List<LinkPost> getLinkList(Long rootPostNo);
    // 루트 포스트에 연결된 링크 포스트 전체 조회(PostWithName이)
    List<PostWithName> getLinkDTOList(Long rootPostNo);

    // 루트 포스트에 연결된 포스트 수 조회
    int getCount(Long rootPostNo);

    // 중복 링크인지 확인 (중복이면 true, 아니면 false)
    int isLinked(LinkPost linkPost);

    //  연관 포스트 등록을 위한 검색 결과 조회
    List<PostWithName> getSearchList(SearchPost searchPost);

    // 루트 포스트가 들어가 있는 모든 LinkPost 불러오기(포스트 삭제 시 같이 삭제 해 준다)
    List<LinkPost> getLinkForRemove(Long rootPostNo);

}