package com.ibini.my_books;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/myPage")
public class MyPageController {

    // http://localhost:8383/myPage/platform
    // account 정보 추가하기

    @GetMapping("")
    public String showMyPage(){
        return "myPage/myPage";
    }
    @GetMapping("/platform")
    public String showPlatform(){

        return "myPage/myPage-platform";
    }

    @GetMapping("/genre")
    public String showGenre(){
        return "myPage/myPage-genre";
    }


}
