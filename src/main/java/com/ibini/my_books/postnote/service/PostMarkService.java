package com.ibini.my_books.postnote.service;

import com.ibini.my_books.postnote.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.dto.MyPageMark;
import com.ibini.my_books.postnote.repository.PostMarkMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostMarkService {

    private final PostMarkMapper postMarkMapper;
    
    // 마크 저장 요청 중간 처리
    public boolean save(PostMark postMark) { return postMarkMapper.save(postMark); }

    // 마크 수정 요청 중간 처리
    public boolean modify(PostMark postMark) {
        return postMarkMapper.modify(postMark);
    }

    // 마크 삭제 요청 중간 처리
    public boolean remove(Long markNo) {
        return postMarkMapper.remove(markNo);
    }

    // 마크 전체 삭제 요청 중간 처리
    public boolean removeAll(Long postNo) {
        return postMarkMapper.removeAll(postNo);
    }

    // 마크 전체 조회 요청 중간 처리
    public Map<String, Object> findAll(Long postNo) {

        Map<String, Object> markMap = new HashMap<>();
        markMap.put("markList", postMarkMapper.findAll(postNo));
        markMap.put("markCnt", postMarkMapper.getPostMarkCount(postNo));

        return markMap;
    }

    // 마크 개별 조회 요청 중간 처리
    public PostMark findOne(Long markNo) {
        return postMarkMapper.findOne(markNo);
    }

    // 전체 마크 수 조회 요청 중간 처리
    public int getPostMarkCount(Long postNo) {
        return postMarkMapper.getPostMarkCount(postNo);
    }

    public List<MyPageMark> findAllMyPage(String account, Long postNo, Search search) {
        List<MyPageMark> myPageNoteList = postMarkMapper.findAllMyPage(account, postNo, search);

        return myPageNoteList;
    }

    public List<PostMark> findAll2(Long postNo) {
        List<PostMark> findAll2List = postMarkMapper.findAll2(postNo);

        return findAll2List;
    }

}
