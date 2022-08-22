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

    public List<String> getFiles(Long postNo) {

        return repository.findFileNames(postNo);

    }

    public List<PostImg> getPostImgList(Long postNo){
        return repository.findFiles(postNo);
    }

}
