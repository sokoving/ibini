package com.ibini.my_books;

import com.ibini.my_books.util.LoginUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        log.info("welcome page open!");
        log.info("hi");


        // 현재 로그인한 유저의 account 가져오려면
        // 파라미터에 HttpSession session 넣고 아래 코드 추가할 것
//        String account = LoginUtil.getCurrentMemberAccountForDB(session);
//        model.addAttribute("account", account);

        return "index";
    }



}
