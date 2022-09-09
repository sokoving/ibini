package com.ibini.my_books.post.api;

import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.LinkPostService;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post/api/links")
//@RequestMapping("/api/links")
public class LInkPostAPIController {

    private final LinkPostService linkService;
    private final PostService postService;

    /*
        - 연결 등록 요청 : /post/api/links - POST
        - 연결 해제 요청 : /post/api/links/{linkId} - DELETE
        - 연결 목록 조회요청 : /post/api/links/{rootPostNo} - GET
     */


    //    연결 등록
    @PostMapping("")
    public ResponseEntity<String> connectPost(@RequestBody LinkPost linkPost) {
        log.info("LInkPostAPIController : /post/api/links POST! - {}", linkPost);

        return linkService.connectPostService(linkPost)
                ? new ResponseEntity<>("connect-success", HttpStatus.OK)
                : new ResponseEntity<>("connect-fail", HttpStatus.BAD_REQUEST);
    }

    // 연결 해제
    @DeleteMapping("/{linkId}")
    public ResponseEntity<String> disconnectPost(@PathVariable String linkId) {
        log.info("LInkPostAPIController : /post/api/links DELETE! - {}", linkId);

        return linkService.disconnectPostService(linkId)
                ? new ResponseEntity<>("disconnect-success", HttpStatus.OK)
                : new ResponseEntity<>("disconnect-fail", HttpStatus.BAD_REQUEST);
    }

    // 목록 조회
    @GetMapping("/{rootPostNo}")
    public ResponseEntity<Map<String, Object>> getList(@PathVariable Long rootPostNo) {
        log.info("LInkPostAPIController : /post/api/links GET! - {}", rootPostNo);
        Map<String, Object> linkMap = linkService.getLinkListService(rootPostNo);
        return new ResponseEntity<>(linkMap, HttpStatus.OK);
    }


}
