package com.ibini.my_books.post.controller;

import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.service.LinkPostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@Log4j2
@RequiredArgsConstructor
//@RequestMapping("/post/api/links")
@RequestMapping("/api/links")
public class LInkPostAPIController {

    private final LinkPostService linkService;

    /*
        - 연결 등록 요청 : /post/api/links - POST
        - 연결 해제 요청 : /post/api/links/{linkId} - DELETE
        - 연결 목록 조회요청 : /post/api/links/{rootPostNo} - GET
     */


    //    연결 등록
    @PostMapping("")
    public ResponseEntity<String> connectPost(@RequestBody LinkPost linkPost) {
        log.info("/post/api/links POST! - {}", linkPost);

//        중복이면 true > 등록 안 함
        if (linkService.isLinked(linkPost)) {
            log.info("isLinked - {}", true);
            return new ResponseEntity<>("connect-fail", HttpStatus.METHOD_NOT_ALLOWED);
        }

        return linkService.connectPost(linkPost)
                ? new ResponseEntity<>("connect-success", HttpStatus.OK)
                : new ResponseEntity<>("connect-fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
