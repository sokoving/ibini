package com.ibini.my_books.postnote.service;

import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.repository.PostMarkMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    // 마크 전체 조회 요청 중간 처리 // 페이징 처리 추후 추가 예정
    public List<PostMark> findAll(Long postNo) {
        return postMarkMapper.findAll(postNo);
    }

    // 마크 개별 조회 요청 중간 처리
    public PostMark findOne(Long markNo) {
        return postMarkMapper.findOne(markNo);
    }

    // 전체 마크 수 조회 요청 중간 처리
    public int getPostMarkCount(Long postNo) {
        return postMarkMapper.getPostMarkCount(postNo);
    }
}
