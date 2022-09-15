package com.ibini.my_books;

import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/myPage")
public class MyPageController {

    // /myPage/platform
    // account 정보 추가하기!!!
    // /myPage/{account}/platform

    @GetMapping("")
    public String showMyPage(HttpSession session, Model model){
        // account 정보
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        model.addAttribute("account", account);
        return "myPage/myPage";
    }
    @GetMapping("/platform")
    public String showPlatform(HttpSession session, Model model){
        // account 정보
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        model.addAttribute("account", account);
        return "myPage/myPage-platform";
    }

    @GetMapping("/genre")
    public String showGenre(HttpSession session, Model model){
        // account 정보
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        model.addAttribute("account", account);
        return "myPage/myPage-genre";
    }


}
