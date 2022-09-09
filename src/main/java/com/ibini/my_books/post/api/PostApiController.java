package com.ibini.my_books.post.api;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
    public ResponseEntity<List<PostWithName>> searchPost(SearchPost searchPost){
        log.info("PostApiController : /post/api/searchPost GET! - {}", searchPost);
        List<PostWithName> pl = postService.searchAllPostWithNameService(searchPost);
        return new ResponseEntity<>(pl, HttpStatus.OK);
    }




}
