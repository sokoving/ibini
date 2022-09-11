package com.ibini.my_books.postnote.controller;

import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.service.PostService;
import com.ibini.my_books.postnote.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.domain.PostMemo;
import com.ibini.my_books.postnote.dto.MyPageMark;
import com.ibini.my_books.postnote.dto.MyPageMemo;
import com.ibini.my_books.postnote.dto.MyPagePostDTO;
import com.ibini.my_books.postnote.service.PostMarkService;
import com.ibini.my_books.postnote.service.PostMemoService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/myPage")
public class MyPageNoteController {

    private final PostMarkService postMarkService;
    private final PostMemoService postMemoService;

    // 마이페이지 post, postMark 게시물 목록 요청
    @GetMapping("/marklist")
    public String viewPostWithMarkList(Model model, HttpSession session, @ModelAttribute("search") Search search) {
        log.info("/myPage/marklist GET!");
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        List<MyPagePostDTO> postList = postMarkService.findAllPostWithImg(account, search);

        List<MyPageMark> myPageMarkList = new ArrayList<>();

        for (MyPagePostDTO post : postList) {
            Long postNo = post.getPostNo();
            List<PostMark> markList = postMarkService.findAllWithSearch(postNo, search);

            List<MyPageMark.Mark> markDataList = new ArrayList<>();

            if (markList.size() != 0) {
                for (PostMark mark : markList) {
                    MyPageMark.Mark markObject = new MyPageMark.Mark();
                    markObject.setMarkNo(mark.getMarkNo());
                    markObject.setEpisodeNo(mark.getEpisodeNo());
                    markObject.setContent(mark.getContent());
                    markObject.setModDatetime(mark.getPrettierDate());

                    markDataList.add(markObject);
                }

            MyPageMark myPageMark = new MyPageMark();
            myPageMark.setPostNo(postNo);
            myPageMark.setAccount(account);
            myPageMark.setPostTitle(post.getPostTitle());
            myPageMark.setEpId(post.getEpId());
            myPageMark.setThumbImg(post.getThumbImg());
            myPageMark.setMarkList(markDataList);

            myPageMarkList.add(myPageMark);
            }
        }
        log.info(myPageMarkList);

        model.addAttribute("myPageMarkList", myPageMarkList);
        return "postnote/mypage-mark";
    }

    // 마이페이지 post, postMemo 게시물 목록 요청
    @GetMapping("/memolist")
    public String viewPostWithMemoList(Model model, HttpSession session, @ModelAttribute("search") Search search) {
        log.info("/myPage/memolist GET!");
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        List<MyPagePostDTO> postList = postMarkService.findAllPostWithImg(account, search);

        List<MyPageMemo> myPageMemoList = new ArrayList<>();

        for (MyPagePostDTO post : postList) {
            Long postNo = post.getPostNo();
            List<PostMemo> memoList = postMemoService.findAllWithSearch(postNo, search);

            List<MyPageMemo.Memo> memoDataList = new ArrayList<>();

            if (memoList.size() != 0) {
                for (PostMemo memo : memoList) {
                    MyPageMemo.Memo memoObject = new MyPageMemo.Memo();
                    memoObject.setMemoNo(memo.getMemoNo());
                    memoObject.setContent(memo.getContent());
                    memoObject.setModDatetime(memo.getPrettierDate());

                    memoDataList.add(memoObject);
                }

                MyPageMemo myPageMemo = new MyPageMemo();
                myPageMemo.setPostNo(postNo);
                myPageMemo.setAccount(account);
                myPageMemo.setPostTitle(post.getPostTitle());
                myPageMemo.setThumbImg(post.getThumbImg());
                myPageMemo.setMemoList(memoDataList);

                myPageMemoList.add(myPageMemo);
            }
        }
        log.info(myPageMemoList);

        model.addAttribute("myPageMemoList", myPageMemoList);
        return "postnote/mypage-memo";
    }

    // Mark 더보기 비동기
    @GetMapping("/plus/marklist")
    @ResponseBody
    public List<MyPageMark.Mark> viewPostWithMarkList2(@RequestParam(value="postNo") Long postNo, Search search) {
        log.info("/myPage/plus/marklist GET!");

        List<PostMark> markList = postMarkService.findAllWithSearchExcept2Rows(postNo, search);

        List<MyPageMark.Mark> markDataList = new ArrayList<>();

        if (markList.size() != 0) {
            for (PostMark mark : markList) {
                MyPageMark.Mark markObject = new MyPageMark.Mark();
                markObject.setMarkNo(mark.getMarkNo());
                markObject.setEpisodeNo(mark.getEpisodeNo());
                markObject.setContent(mark.getContent());
                markObject.setModDatetime(mark.getPrettierDate());

                markDataList.add(markObject);
            }
        }
        return markDataList;
    }

    // Memo 더보기 비동기
    @GetMapping("/plus/memolist")
    @ResponseBody
    public List<MyPageMemo.Memo> viewPostWithMemoList2(@RequestParam(value="postNo") Long postNo, Search search) {
        log.info("/myPage/plus/memolist GET!");

        List<PostMemo> memoList = postMemoService.findAllWithSearchExcept2Rows(postNo, search);

        List<MyPageMemo.Memo> memoDataList = new ArrayList<>();

        if (memoList.size() != 0) {
            for (PostMemo memo : memoList) {
                MyPageMemo.Memo memoObject = new MyPageMemo.Memo();
                memoObject.setMemoNo(memo.getMemoNo());
                memoObject.setContent(memo.getContent());
                memoObject.setModDatetime(memo.getPrettierDate());

                memoDataList.add(memoObject);
            }
        }
        return memoDataList;
    }
}
