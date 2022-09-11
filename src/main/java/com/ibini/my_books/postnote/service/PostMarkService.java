package com.ibini.my_books.postnote.service;

import com.ibini.my_books.postnote.common.search.Search;
import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.domain.PostMemo;
import com.ibini.my_books.postnote.dto.MyPagePostDTO;
import com.ibini.my_books.postnote.repository.PostMarkMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
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

        List<PostMark> markList = postMarkMapper.findAll(postNo);
        convertDateFormat(markList);

        markMap.put("markList", markList);
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

    // 마크 전체 조회 With Search
    public List<PostMark> findAllWithSearch(Long postNo, Search search) {
        List<PostMark> markList = postMarkMapper.findAllWithSearch(postNo, search);
        convertDateFormat(markList);

        return markList;
    }

    // 마크 전체 조회 Except 2 rows
    public List<PostMark> findAllWithSearchExcept2Rows(Long postNo, Search search) {
        List<PostMark> markList = postMarkMapper.findAllWithSearchExcept2Rows(postNo, search);
        convertDateFormat(markList);

        return markList;
    }

    // 날짜 포맷팅 함수
    private void convertDateFormat(List<PostMark> postMark) {
        for (PostMark m : postMark) {
            Date date = m.getModDatetime();
            SimpleDateFormat newDate = new SimpleDateFormat("yyyy.MM.dd");

            m.setPrettierDate(newDate.format(date));
        }
    }


    // 마이페이지 post, img 조회
    public List<MyPagePostDTO> findAllPostWithImg(String account, Search search) {
        List<MyPagePostDTO> postWithImgList = postMarkMapper.findAllPostWithImg(account, search);

        return postWithImgList;
    }
}
