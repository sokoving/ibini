package com.ibini.my_books.hashtag.controller;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.PostService;
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

    @Autowired
    PostService postService;

    @GetMapping("/{tagName}")
    public String findTagName(HttpSession session,
                              Model model,
                              @PathVariable String tagName ){

        // 로그인 정보 가져오기
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        log.info("HashTag Controller tagNmae - {}, account - {}", account, tagName);

        // hashtag List 가져오기
        String searchTag = tagName;
        List<HashtagDomain> oneTagName = hashTagService.findOneTagName(tagName, account);
        log.info("oneTagName - {}", oneTagName);


        // total hashtag
        int total = hashTagService.totalHashtag(account);

        // total hashtagName
        int hashtagName = hashTagService.totalHashtagName(account, tagName);

        model.addAttribute("tagName", oneTagName);
        model.addAttribute("searchTag", searchTag);

        model.addAttribute("total", total);
        model.addAttribute("hashtagName", hashtagName);
        // post 정보 가져오기?
//        PostWithName postWithName = postService.fineOnePostWithName(postNo);
//        model.addAttribute("pw", postWithName);

        return "hashtag/find-hashtag";
    }


}
