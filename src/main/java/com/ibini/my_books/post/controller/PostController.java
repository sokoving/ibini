package com.ibini.my_books.post.controller;


import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {

    private final PostService postService;

    /*
        포스트 등록 폼 요청   get    /post/write
        포스트 등록 요청      post   /post/write
        포스트 수정 폼 요청   get    /post/modify
        포스트 수정 요청      post   /post/modify
        포스트 삭제 요청      get    /post/delete
        포스트 상세 조회 요청  get   /post/detail
     */

//    포스트 등록 폼 요청   get    /post/write
    @GetMapping("/write")
    public String postWriteForm(){
        log.info("PostController /post/write  GET 요청!!");
        return "post/post-reg";
    }

//    포스트 등록 요청      post   /post/write
    @PostMapping("/write")
    public String postWrite(Post post){
        log.info("PostController /post/write POST 요청!! - {}", post);
        boolean flag = postService.saveService(post);
        log.info("save flag : {}", flag);

        return "redirect:/post/write";
    }

}
