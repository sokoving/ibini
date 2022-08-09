package com.ibini.my_books.postmark.controller;

import com.ibini.my_books.postmark.domain.PostMark;
import com.ibini.my_books.postmark.service.PostMarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostMarkController {

    private PostMarkService postMarkService;

    // 마크 등록
    @PostMapping("")
    @ResponseBody
    public ResponseEntity<String> createMark(@RequestBody PostMark postMark) {
        log.info("/mark POST! - {}", postMark);

        boolean flag = postMarkService.save(postMark);

        return flag ? new ResponseEntity<>("insert-success", HttpStatus.OK)
                : new ResponseEntity<>("insert-fail", HttpStatus.INTERNAL_SERVER_ERROR);
        // BAD_REQUEST : 400, INTERNAL_SERVER_ERROR : 500
    }







}
