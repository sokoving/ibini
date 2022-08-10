package com.ibini.my_books.postnote.service;

import com.ibini.my_books.postnote.domain.PostMemo;
import com.ibini.my_books.postnote.repository.PostMemoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    // 메모 전체 조회 요청 중간 처리 // 페이징 처리 추후 추가 예정
    public List<PostMemo> findAll(Long postNo) {
        return postMemoMapper.findAll(postNo);
    }

    // 메모 개별 조회 요청 중간 처리
    public PostMemo findOne(Long memoNo) {
        return postMemoMapper.findOne(memoNo);
    }

    // 전체 메모 수 조회 요청 중간 처리
    public int getPostMarkCount(Long postNo) {
        return postMemoMapper.getPostMemoCount(postNo);
    }
}
