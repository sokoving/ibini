package com.ibini.my_books.post.api;

import com.ibini.my_books.common.paging.Page;
import com.ibini.my_books.common.paging.PageMaker;
import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post/api")
//@RequestMapping("/api")
public class PostApiController {

    private final PostService postService;

 /*
        - 검색이 적용된 포스트 조회 요청 : /post/api/searchPost - GET
  */
    @GetMapping("/searchPost")
    public ResponseEntity<Map<String, Object>> searchPost(SearchPost searchPost, HttpSession session){
        // 사용자 계정 세팅
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        searchPost.setAccount(account);
        log.info("PostApiController : /post/api/searchPost GET! - {}", searchPost);

        Map<String, Object> postMap = postService.searchAllPostWithNameService(searchPost);
        log.info("postMap - {}", postMap);

        // 페이지 정보 생성
        PageMaker pm = new PageMaker(
                new Page(searchPost.getPageNum(), searchPost.getAmount())
                , (Integer) postMap.get("tc")
        );
        log.info("pm : {}", pm);
        postMap.put("pm", pm);

        // "pl" - List<PostWithName> / "tc" - 총 게시물 수 / "pm" - 페이지 정보
        return new ResponseEntity<>(postMap, HttpStatus.OK);
    }




}
