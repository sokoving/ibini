package com.ibini.my_books.postnote.service;

import com.ibini.my_books.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMemo;
import com.ibini.my_books.postnote.repository.PostMemoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostMemoService {

    private final PostMemoMapper postMemoMapper;

    // 메모 저장 요청 중간 처리
    public boolean save(PostMemo postMemo) {
        return postMemoMapper.save(postMemo);
    }

    // 메모 수정 요청 중간 처리
    public boolean modify(PostMemo postMemo) {
        return postMemoMapper.modify(postMemo);
    }

    // 메모 삭제 요청 중간 처리
    public boolean remove(Long memoNo) {
        return postMemoMapper.remove(memoNo);
    }

    // 메모 전체 삭제 요청 중간 처리
    public boolean removeAll(Long postNo) {
        return postMemoMapper.removeAll(postNo);
    }

    // 메모 전체 조회 요청 중간 처리
    public Map<String, Object> findAll(Long postNo) {

        Map<String, Object> memoMap = new HashMap<>();
        memoMap.put("memoList", postMemoMapper.findAll(postNo));
        memoMap.put("memoCnt", postMemoMapper.getPostMemoCount(postNo));

        return memoMap;
    }

    // 메모 개별 조회 요청 중간 처리
    public PostMemo findOne(Long memoNo) {
        return postMemoMapper.findOne(memoNo);
    }

    // 전체 메모 수 조회 요청 중간 처리
    public int getPostMarkCount(Long postNo) {
        return postMemoMapper.getPostMemoCount(postNo);
    }

    // 마크 전체 조회 With Search
    public List<PostMemo> findAllWithSearch(Long postNo, Search search) {
        List<PostMemo> memoList = postMemoMapper.findAllWithSearch(postNo, search);

        convertDateFormat(memoList);

        return memoList;
    }
    private void convertDateFormat(List<PostMemo> postMemo) {
        for (PostMemo m : postMemo) {
            Date date = m.getModDatetime();
            SimpleDateFormat newDate = new SimpleDateFormat("yyyy.MM.dd");

            m.setPrettierDate(newDate.format(date));
        }
    }
}
