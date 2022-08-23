package com.ibini.my_books.post.controller;

import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postImg.service.PostImgService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/list")
public class ListController {
    private final PostImgService imgService;
    private final PostService postService;
    private final HashTagService hashTagService;

//    포스트 전체 리스트 요청   get    /list

    @GetMapping
    public String postDetail(Model model) {
        log.info("ListController /list  GET 요청!!");

        model.addAttribute("pl", postService.finaAllPostWithNameService()); //  List<PostWithName>
//        postWithName 필드로 private 태그 맵 넣기
//        model.addAttribute("tagList", hashTagService.findAllByPostNo()); // List<HashtagDomain>
//        model.addAttribute("imgList", imgService.getPostImgList(postNo));  // List<PostImg>
//        model.addAttribute("date", postService.convertDate(postService.findOnePostService(postNo)));

        return "post/post-list";
    }

}
