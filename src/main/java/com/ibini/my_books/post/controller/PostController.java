package com.ibini.my_books.post.controller;


import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.domain.PostWithName;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postImg.domain.PostImg;
import com.ibini.my_books.postImg.service.PostImgService;
import com.ibini.my_books.util.CategoryUtil;
import com.ibini.my_books.util.EpIdUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {


    private final PostImgService imgService;
    private final PostService postService;
    private final HashTagService hashTagService;

    /*
        포스트 등록 폼 요청   get    /post/write
        포스트 등록 요청      post   /post/write
        포스트 수정 폼 요청   get    /post/modify
        포스트 수정 요청      post   /post/modify
        포스트 삭제 요청      get    /post/delete
        포스트 상세 조회 요청  get   /post/detail
     */

    //    포스트 상세 조회 요청  get   /post/detail
    @GetMapping("/detail/{postNo}")
    public String postDetail(@PathVariable Long postNo, Model model) {
        log.info("PostController /post/detail/{}  GET 요청!!", postNo);

        model.addAttribute("p", postService.fineOnePostWithName(postNo)); //  PostWithName
        model.addAttribute("tagList", hashTagService.findAllByPostNo(postNo)); // List<HashtagDomain>
        model.addAttribute("imgList", imgService.getPostImgList(postNo));  // List<PostImg>

        return "post/post-detail";
    }


    //    포스트 등록 폼 요청   get    /post/write
    @GetMapping("/write")
    public String postWriteForm() {
        log.info("PostController /post/write  GET 요청!!");
//        return "/upload/upload-form";
        return "post/post-reg";
    }


    //    포스트 등록 요청      post   /post/write
    @PostMapping("/write")
    public String postWrite(Post post, PostImg postImg) {
        log.info("PostController /post/write POST 요청!! - {}", post);

        // tbl_post 저장
        boolean postFlag = postService.saveService(post);

        // prj_post_img 저장

//        imgService.add(postImgList);

        log.info("save flag : {}", postFlag);

        return "redirect:/post/write";
    }


}