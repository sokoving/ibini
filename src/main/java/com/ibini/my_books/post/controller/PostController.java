package com.ibini.my_books.post.controller;


import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.genre.service.GenreService;
import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.platform.service.PlatformService;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postImg.domain.PostImg;
import com.ibini.my_books.postImg.dto.ThumbImgDTO;
import com.ibini.my_books.postImg.service.PostImgService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {


    private final PostImgService imgService;
    private final PostService postService;
    private final HashTagService hashTagService;
    private final GenreService genreService;
    private final PlatformService platformService;

    /*
        포스트 등록 폼 요청   get    /post/write
        포스트 등록 요청      post   /post/write
        포스트 수정 폼 요청   get    /post/modify
        포스트 수정 요청      post   /post/modify
        포스트 삭제 폼 요청  get    /post/delete
        포스트 삭제 요청  post    /post/delete
        포스트 상세 조회 요청  get   /post/detail
     */


    //    포스트 등록 폼 요청   get    /post/write
    @GetMapping("/write")
    public String postWriteForm(Model model, HttpSession session) {
        log.info("PostController /post/write  GET 요청!!");

        // 현재 로그인한 유저의 account 가져오기
        String account = LoginUtil.getCurrentMemberAccountForDB(session);

        model.addAttribute("account", account);
        return "post/post-reg";
    }


    //    포스트 등록 요청      post   /post/write
    // @RequestBody Post 제거해서
    @Transactional
    @PostMapping("/write")
    public String postWrite(Post post, HashtagDomain tag, ThumbImgDTO thumbImgDTO
    ) {
        log.info("PostController /post/write POST 요청!!");
        log.info("/post/write - post: {}", post);
        log.info("/post/write - hashtag: {}", tag);
        log.info("/post/write - thumbImgDTO : {}", thumbImgDTO);

        // tbl_post 저장
        boolean postFlag = postService.saveService(post);
        log.info("post flag : {}", postFlag);

        // PRJ_HASHTAG 저장
        boolean tagFlag = hashTagService.saveHashTag(tag);
        log.info("tag flag : {}", tagFlag);

        // tbl_post_img 저장
        imgService.postRegService(thumbImgDTO);

        return "redirect:/list/";
    }

    //    포스트 수정 폼 요청   get    /post/modify
    @GetMapping("/modify/{postNo}")
    public String modify(@PathVariable Long postNo, Model model, HttpSession session) {
        log.info("PostController /post/modify  GET 요청!! - {}", postNo);
        // 현재 로그인한 유저의 account
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        model.addAttribute("account", account);
//        수정할 포스트 정보
        model.addAttribute("p", postService.fineOnePostWithName(postNo));
//        계정의 장르 목록
        model.addAttribute("genreList", genreService.findAllService(account));
//        계정의 플랫폼 목록
        model.addAttribute("platformList", platformService.findAllPlatform(account));
//        포스트의 이미지 리스트
        model.addAttribute("imgList", imgService.getPostImgList(postNo));

        return "post/post-modify";
    }

    //    포스트 수정 요청      post   /post/modify
    @PostMapping("/modify")
    public String modify(Post post, HashtagDomain tag, ThumbImgDTO thumbImgDTO) {
        log.info("PostController /post/modify  POST CALL!! - {}", post);
        log.info("/post/modify - hashtag: {}", tag);
        log.info("/post/modify - thumbImgDTO : {}", thumbImgDTO);

        // tbl_post 수정
        boolean postFlag = postService.modifyService(post);
        log.info("post flag : {}", postFlag);

        // PRJ_HASHTAG 수정
        hashTagService.modifyService(tag);

//         tbl_post_img 수정
        imgService.modifyService(thumbImgDTO);

        return "redirect:/post/detail/"+ post.getPostNo();
    }

    // 포스트 삭제 폼 요청      get    /post/delete
    @GetMapping("/delete")
    public String delete(@ModelAttribute("postNo") Long postNo, Model model) {
        log.info("PostController /post/delete  GET 요청!! - {}", postNo);

        return "post/process-delete";
    }

    //    포스트 삭제 요청  post    /post/delete
    @Transactional
    @PostMapping("/delete")
    public String delete(Long postNo, RedirectAttributes ra) {
        log.info("PostController /post/delete  POST 요청!! - {}", postNo);

        boolean flag = postService.removeService(postNo);

        if (flag) {
            ra.addFlashAttribute("del-msg", "del-success");
        } else {
            ra.addFlashAttribute("del-msg", "del-fail");
        }
        return "redirect:/list";
    }


    //    포스트 상세 조회 요청  get   /post/detail

    @GetMapping("/detail/{postNo}")
    public String postDetail(@PathVariable Long postNo, Model model) {
        log.info("PostController /post/detail/{}  GET 요청!!", postNo);

        PostWithName postWithName = postService.fineOnePostWithName(postNo);
        model.addAttribute("p", postWithName);

        List<HashtagDomain> tagList = hashTagService.findAllByPostNo(postNo);
        model.addAttribute("tagList", tagList);

        List<PostImg> imgList = imgService.getPostImgList(postNo);
        model.addAttribute("imgList", imgList);

        return "post/post-detail";
    }


}