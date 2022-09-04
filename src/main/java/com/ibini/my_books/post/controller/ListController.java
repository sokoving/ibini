package com.ibini.my_books.post.controller;

import com.ibini.my_books.genre.service.GenreService;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.platform.service.PlatformService;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postImg.service.PostImgService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/list")
public class ListController {
    private final PostImgService imgService;
    private final PostService postService;
    private final HashTagService hashTagService;
    private final GenreService genreService;
    private final PlatformService platformService;

//    포스트 전체 리스트 요청   get    /list

    @GetMapping()
    public String postList(Model model, HttpSession session) {
        log.info("ListController /list  GET!!");

        String account = LoginUtil.getCurrentMemberAccountForDB(session);

        model.addAttribute("pl", postService.finaAllPostWithNameService(account)); //  List<PostWithName>
        model.addAttribute("gl", genreService.findAllService(account));
        model.addAttribute("pfl", platformService.findAllPlatform(account));

        return "post/post-list";
    }
    //    포스트 전체 리스트를 비동기로 보내줌
    @GetMapping("/api/allPost")
    @ResponseBody
    public ResponseEntity<List<PostWithName>> getApiList(
//            HttpSession session
    ){
        log.info("ListController /api/allPost GET!!");
//        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        String account = "2209030021";
        List<PostWithName> postList = postService.finaAllPostWithNameService(account);
        return new ResponseEntity<>(postList, HttpStatus.OK);
    }

}
