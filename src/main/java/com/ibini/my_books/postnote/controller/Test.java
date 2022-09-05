package com.ibini.my_books.postnote.controller;

import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class Test {

    private final PostService postService;

    @GetMapping("/test/page")
    public String home() {


        return "postnote/post-note";
    }

    @GetMapping("/test/page2/{postNo}")
    public String homed(@PathVariable Long postNo, Model model, HttpSession session) {
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        model.addAttribute("account", account);
        model.addAttribute("p", postService.fineOnePostWithName(postNo));
        return "postnote/mypage-mark-detail";
    }

}
