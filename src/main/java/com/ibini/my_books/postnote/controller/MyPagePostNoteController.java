package com.ibini.my_books.postnote.controller;

import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postnote.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.dto.MyPageMark;
import com.ibini.my_books.postnote.service.PostMarkService;
import com.ibini.my_books.postnote.service.PostMemoService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/mypostnote")
public class MyPagePostNoteController {

    private final PostMarkService postMarkService;
    private final PostMemoService postMemoService;
    private final PostService postService;


    // 마이페이지 post, postMark 게시물 목록 요청
//    @GetMapping("/list")
//    public String viewPostList(Model model, HttpSession session, Search search) {
//        log.info("GET!");
//
//        String account = LoginUtil.getCurrentMemberAccountForDB(session);
//        List<PostWithName> postList = postService.finaAllPostWithNameService(account);
//        for (PostWithName post : postList) {
//            model.addAttribute("markList", postMarkService.findAll2(post.getPostNo()));
//        }
//
//        model.addAttribute("postList", postList);
//        return "postnote/mypage-note";
//    }

    @GetMapping("/list")
    public String viewPostList(Model model, HttpSession session, Post post, Search search) {
        log.info("GET!");
        Long postNo = post.getPostNo();
        String account = LoginUtil.getCurrentMemberAccountForDB(session);

        List<MyPageMark> myPageMarkList = postMarkService.findAllMyPage(account, postNo, search);
        model.addAttribute("myPageMarkList", myPageMarkList);
        return "postnote/mypage-note";
    }




























    // 게시물 목록 요청
//    @GetMapping("/list")
//    public String list(@ModelAttribute("s") Search search, Model model) {
//
//
//        Map<String, Object> boardMap = boardService.findAllWithSearchService(search);
//        log.debug("return data - {}", boardMap);
//
//        model.addAttribute("bList", boardMap.get("bList"));
//        model.addAttribute("pm", pm);
//
//        return "board/board-list";
//    }



}