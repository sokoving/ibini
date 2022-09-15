package com.ibini.my_books.post.repository;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {

    // 중복체크 기능
    // 체크타입: 계정 or 이메일
    // 체크값: 중복검사대상 값
    int isDuplicate(Map<String, Object> checkMap);

    // 게시글 쓰기 기능
    boolean save(Post post);

    // 게시글 전체 조회 (tbl_post만 조회)
    List<Post> findAllPost(String account);
    List<PostWithName> findAllPostWithName(String account);

//     게시글 전체 조회 with searching
    List<PostWithName> searchAllPostWithName(SearchPost searchPost);

    // 게시글 상세 조회
    Post findOnePost(Long postNo);
    PostWithName fineOnePostWithName(Long postNo);


    // 게시글 삭제
    boolean remove(Long postNo);

    // 게시글 수정
    boolean modify(Post post);

    // 전체 게시물 수 조회
    int getTotalCount(String account);
    int getTotalCountWithSearch(SearchPost searchPost);

    // 특정 장르 아이디를 가진 포스트의 post_no 모두 조회
    List<Post> getPostByGenreId(int genreId);
    // 장르 카운트
    int getPostByGenreIdTotal(int genreId, String account);

    // 특정 플랫폼 아이디를 가진 포스트의 post_no 모두 조회
    List<Post> getPostByPlateId(int platformId);
    // 플랫폼 카운트
    int getPostByPlateIdUseplat(int platformId, String account);

    // 즐겨찾기 등록
    boolean regFavorite(Long postNo, String account);

    //즐겨찾기 삭제
    boolean resetFavorite(Long PostNo);


}
