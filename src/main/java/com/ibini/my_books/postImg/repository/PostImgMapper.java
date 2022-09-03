package com.ibini.my_books.postImg.repository;

import com.ibini.my_books.postImg.domain.PostImg;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostImgMapper {

    // DB post_img 테이블에 저장
    boolean addFile(PostImg postImg);

    // 게시물 번호로 PostImg 객체 리스트 전부 조회
    List<PostImg> findFiles(Long postNo);

    // fileName 으로 postImg DB에서 삭제
    boolean removeByName(String fileName);

    //    post_no으로 postImg DB에서 삭제
    boolean removeByPostNo(Long postNo);

    // 포스트에 썸네일이 있으면 수정, 없으면 새로 저장
    boolean mergeThumb(PostImg postImg);

    //  썸네일 true 포스트이미지 리스트 조회
    List<PostImg> findThumbs();

    // 게시물에 붙어있는 첨부파일경로명 전부 조회
    List<String> findFileNames(Long postNo);


//    //    포스트의 썸네일 삭제
//    boolean cleanThumb(Long postNo);
}
