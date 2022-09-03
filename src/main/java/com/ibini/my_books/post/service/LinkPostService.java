package com.ibini.my_books.post.service;

import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.repository.LinkPostMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class LinkPostService {

    private final LinkPostMapper mapper;


    // 링크 연결하기(데이터 저장)
    public boolean connectPost(LinkPost linkPost){
        return mapper.connectPost(linkPost);
    }

    // 링크 해제하기(데이터 삭제)
    public boolean disconnectPost(String linkId){
        return mapper.disconnectPost(linkId);
    }

    // 루트 포스트에 연결된 링크 포스트 전체 조회
    public List<LinkPost> getLinkLIst(Long rootPostNo){
        return mapper.getLinkLIst(rootPostNo);
    }

    // 루트 포스트에 연결된 포스트 수 조회
    public int getCount(Long rootPostNo){
        return mapper.getCount(rootPostNo);
    }

    // 중복 링크인지 확인 (중복이면 true, 아니면 false)
    public boolean isLinked(LinkPost linkPost){
        return mapper.isLinked(linkPost) >= 1;
    }
}
