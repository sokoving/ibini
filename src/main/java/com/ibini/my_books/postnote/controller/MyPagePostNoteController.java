package com.ibini.my_books.postnote.controller;

import com.ibini.my_books.postnote.service.PostMarkService;
import com.ibini.my_books.postnote.service.PostMemoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/mypostnote")
public class MyPagePostNoteController {

    private final PostMarkService postMarkService;
    private final PostMemoService postMemoService;


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
