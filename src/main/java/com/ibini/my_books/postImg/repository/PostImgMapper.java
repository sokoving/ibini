package com.ibini.my_books.postImg.repository;

import com.ibini.my_books.postImg.domain.PostImg;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostImgMapper {

    // 파일추가
    void addFile(PostImg postImg);

    // 게시물에 붙어있는 첨부파일경로명 전부 조회
    List<String> findFileNames(Long postNo);

    // 게시물 번호로 게시글 작성자의 계정명과 권한 가져오기
//    ValidateMemberDTO findMemberByBoardNo(Long boardNo);

    // 게시물 번호로 PostImg 객체 리스트 전부 조회
    List<PostImg> findFiles(Long postNo);

//    썸네일 true 포스트이미지 리스트 조회
    List<PostImg> findThumbs();

}