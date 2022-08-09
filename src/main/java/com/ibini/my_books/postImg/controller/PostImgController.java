package com.ibini.my_books.postImg.controller;

import com.ibini.my_books.postImg.service.PostImgService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller // Model에 뷰를 넘겨줌
@Log4j2
@RequiredArgsConstructor // 의존성주입
@RequestMapping("my_books/post_img")
public class PostImgController {

    private final PostImgService postImgService;

    @GetMapping("/file/{postNo}")
    @ResponseBody // 비동기니까
    public ResponseEntity<List<String>> getFiles(@PathVariable Long postNo) {

        List<String> files = postImgService.getFiles(postNo);
        log.info("/post_img/{} GET! ASYNC - {}", postNo, files);


//        postImgService.getFiles(postNo);

        return new ResponseEntity<>(files, HttpStatus.OK);

    }

}
