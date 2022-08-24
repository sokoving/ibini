package com.ibini.my_books;

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
@RequestMapping("/myPage")
public class MyPageController {

    // http://localhost:8383/myPage/platform
    // account 정보 추가하기!!!
    // http://localhost:8383/myPage/{account}/platform

    @GetMapping("/{account}")
    public String showMyPage(@PathVariable String account, Model model){
        // account 정보
        model.addAttribute("account", account);
        return "myPage/myPage";
    }
    @GetMapping("/{account}/platform")
    public String showPlatform(@PathVariable String account, Model model){
        model.addAttribute("account", account);
        return "myPage/myPage-platform";
    }

    @GetMapping("/{account}/genre")
    public String showGenre(@PathVariable String account, Model model){
        model.addAttribute("account", account);
        return "myPage/myPage-genre";
    }


}
