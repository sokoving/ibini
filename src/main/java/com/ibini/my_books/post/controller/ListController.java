package com.ibini.my_books.post.controller;

import com.ibini.my_books.genre.service.GenreService;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postImg.service.PostImgService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/list")
public class ListController {
    private final PostImgService imgService;
    private final PostService postService;
    private final HashTagService hashTagService;
    private final GenreService genreService;

//    포스트 전체 리스트 요청   get    /list

    @GetMapping()
    public String postList(Model model) {
        log.info("ListController /list  GET 요청!!");
        String account = "ibini";

        model.addAttribute("pl", postService.finaAllPostWithNameService()); //  List<PostWithName>
        model.addAttribute("gl", genreService.findAllService(account));

        return "post/post-list";
    }

}
