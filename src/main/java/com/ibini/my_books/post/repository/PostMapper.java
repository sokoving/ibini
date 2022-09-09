package com.ibini.my_books.post.repository;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {


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


}
