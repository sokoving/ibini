package com.ibini.my_books.postnote.controller;

import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.domain.PostMemo;
import com.ibini.my_books.postnote.service.PostMarkService;
import com.ibini.my_books.postnote.service.PostMemoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post/detail")
public class PostNoteController {

    private final PostMarkService postMarkService;
    private final PostMemoService postMemoService;

    // 마크 등록
    @PostMapping("/mark")
    public ResponseEntity<String> createMark(@RequestBody PostMark postMark) {
        log.info("/mark POST! - {}", postMark);

        boolean flag = postMarkService.save(postMark);

        return flag ? new ResponseEntity<>("insert-success", HttpStatus.OK)
                : new ResponseEntity<>("insert-fail", HttpStatus.INTERNAL_SERVER_ERROR);
        // BAD_REQUEST : 400, INTERNAL_SERVER_ERROR : 500
    }

    // 마크 수정
    @PutMapping("/mark/{markNo}")
    public ResponseEntity<String> modifyMark(@PathVariable Long markNo, @RequestBody PostMark postMark) {
        postMark.setMarkNo(markNo);

        log.info("/mark/{} PUT! - {}", markNo, postMark);

        boolean flag = postMarkService.modify(postMark);

        return flag ? new ResponseEntity<>("modify-success", HttpStatus.OK)
                : new ResponseEntity<>("modify-fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 마크 삭제
    @DeleteMapping("/mark/{markNo}")
    public ResponseEntity<String> deleteMark(@PathVariable Long markNo) {
        log.info("/mark/{} DELETE!", markNo);

        boolean flag = postMarkService.remove(markNo);

        return flag ? new ResponseEntity<>("delete-success", HttpStatus.OK)
                : new ResponseEntity<>("delete-fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 마크 전체 목록
    @GetMapping("/mark/{postNo}")
    public ResponseEntity<List<PostMark>> viewMarkList(@PathVariable Long postNo) {
        log.info("/mark/{} GET!", postNo);

        List<PostMark> postMarkList = postMarkService.findAll(postNo);

        return new ResponseEntity<>(postMarkList, HttpStatus.OK);
    }




    // 메모 등록
    @PostMapping("/memo")
    public ResponseEntity<String> createMemo(@RequestBody PostMemo postMemo) {
        log.info("/memo POST! - {}", postMemo);

        boolean flag = postMemoService.save(postMemo);

        return flag ? new ResponseEntity<>("insert-success", HttpStatus.OK)
                : new ResponseEntity<>("insert-fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 메모 수정
    @PutMapping("/memo/{memoNo}")
    public ResponseEntity<String> modifyMemo(@PathVariable Long memoNo, @RequestBody PostMemo postMemo) {
        postMemo.setMemoNo(memoNo);

        log.info("/memo/{} PUT! - {}", memoNo, postMemo);

        boolean flag = postMemoService.modify(postMemo);

        return flag ? new ResponseEntity<>("modify-success", HttpStatus.OK)
                : new ResponseEntity<>("modify-fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 메모 삭제
    @DeleteMapping("/memo/{memoNo}")
    public ResponseEntity<String> deleteMemo(@PathVariable Long memoNo) {
        log.info("/memo/{} DELETE!", memoNo);

        boolean flag = postMemoService.remove(memoNo);

        return flag ? new ResponseEntity<>("delete-success", HttpStatus.OK)
                : new ResponseEntity<>("delete-fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 메모 전체 목록
    @GetMapping("/memo/{postNo}")
    public ResponseEntity<List<PostMemo>> viewMemoList(@PathVariable Long postNo) {
        log.info("/mark/{} GET!", postNo);

        List<PostMemo> postMemoList = postMemoService.findAll(postNo);

        return new ResponseEntity<>(postMemoList, HttpStatus.OK);
    }
}
