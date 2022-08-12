package com.ibini.my_books.postnote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class Test {

    @GetMapping("/test/detail")
    public String home() {


        return "postnote/post-mark";
    }

}
