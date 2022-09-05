package com.ibini.my_books.hashtag.controller;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/hashtag")
public class HashtagController {

    @Autowired
    HashTagService hashTagService;

    @GetMapping("/{tagName}")
    public String findTagName(HttpSession session,
                              Model model,
                              @PathVariable String tagName ){

        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        log.info("HashTag Controller account - {}, tagNmae - {}", account, tagName);
        List<HashtagDomain> oneTagName = hashTagService.findOneTagName(tagName, account);
        log.info("oneTagName - {}", oneTagName);

        model.addAttribute("tagName", oneTagName);

        return "hashtag/find-hashtag";
    }


}
