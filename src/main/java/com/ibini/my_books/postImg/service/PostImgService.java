package com.ibini.my_books.postImg.service;

import com.ibini.my_books.postImg.domain.PostImg;
import com.ibini.my_books.postImg.repository.PostImgMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PostImgService {

    private final PostImgMapper repository;

    public boolean saveService(PostImg postImg) {
        log.info("PostImgService saveService Call - {}", postImg);
        return repository.addFile(postImg);
    }

    public List<String> getFiles(Long postNo) {
        return repository.findFileNames(postNo);
    }

    public List<PostImg> getPostImgList(Long postNo) {
        return repository.findFiles(postNo);
    }

    //    썸네일 리스트 조회
    public List<PostImg> getThumbs() {
        return repository.findThumbs();
    }


    // fileName 으로 postImg DB에서 삭제
    public boolean removeByName(String fileName){
        return repository.removeByName(fileName);
    }

    //    post_no으로 postImg DB에서 삭제
    public boolean removeByPostNo(Long postNo){
        return repository.removeByPostNo(postNo);
    }

}
