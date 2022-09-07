package com.ibini.my_books.hashtag.api;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.service.HashTagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/hashtag/api/v1/")
public class HashtagApiController {

    private final HashTagService hashTagService;



    // 저장시 넘어가는거 ! post_no, tag_name, account

    @GetMapping("/{account}/{postNo}")
    public List<HashtagDomain> allTaglist(@PathVariable String account,
                                          @PathVariable Long postNo,
                                          Model model){
        log.info("HashtagApiController allTaglist - {} -{}", account, postNo);
        List<HashtagDomain> hashtagList = hashTagService.findAllByPostNo(postNo);
        model.addAttribute("hashtagList", hashtagList);

        return hashtagList;
    }

    @PostMapping("/{account}/{postNo}")
    public String addTag(@PathVariable String account
                       , @RequestBody HashtagDomain hashtagDomain
                       ){
        log.info("HashtagApiController addTag ! - {} - {}", account, hashtagDomain);

        boolean b = hashTagService.saveHashTag(hashtagDomain);

        return b ? "insert-success" : "insert-fail";
    }

    @DeleteMapping("/{account}/{postNo}/{tagNo}")
    public String deleteTag(@PathVariable String account,
                            @PathVariable int postNo ,
                            @PathVariable int tagNo){
        log.info("HashtagApiController delete Tag ! - {} - {} - {}", account, postNo ,tagNo);

        boolean b = hashTagService.deleteHashTag(account, tagNo);
        return b ? "del-success" : "del-fail";
    }


}
