package com.ibini.my_books.postImg.repository;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostImgMapper {

    // 파일추가
    void addFile(String fileName);

    // 게시물에 붙어있는 첨부파일경로명 전부 조회
    List<String> findFileNames(Long postNo);
}
