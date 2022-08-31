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

    private static final String KEYCODE = "4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5";

    private final NationalSearchService nationalSearchService;
    // findAll -> 랜더링
    // 리스트 값 중 하나를 클릭하면 form에 값을 넣어줌?
    // 페이징 기능

    @GetMapping("/findtitle")
    public String findData(
                           Model model){
//        log.info("pageNum-{}", pageNum);
        // 검색하면 조회된 검색결과의 1page를 랜더링 해주는 함수
//        ArrayList<Map<String, Object>> serviceFirstPage = nationalSearchService.findFirstPage(searchTitle);

//        model.addAttribute("api", serviceFirstPage);
//        model.addAttribute("info", serviceFirstPage);

        return "api/findtitle";

    }


}
