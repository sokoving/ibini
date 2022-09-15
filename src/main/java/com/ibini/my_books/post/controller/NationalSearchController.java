package com.ibini.my_books.post.controller;

import com.ibini.my_books.post.service.NationalSearchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api")
public class NationalSearchController {

    private final NationalSearchService nationalSearchService;
    // findAll -> 랜더링
    // 리스트 값 중 하나를 클릭하면 form에 값을 넣어줌?
    // 페이징 기능

    @GetMapping("/findtitle")
    public String findData(){

        return "api/findtitle";

    }


}
