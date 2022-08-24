package com.ibini.my_books;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
public class HomeController {

    @GetMapping("/{account}")
    public String home(@PathVariable String account, Model model, HttpSession session) {
        log.info("welcome page open!");
        log.info("hi");

        model.addAttribute("account", account);

        return "index";
    }



}
