package com.ibini.my_books.post.service;

import com.ibini.my_books.post.domain.LinkPost;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.repository.LinkPostMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class LinkPostService {

    private final LinkPostMapper mapper;


    // 링크 등록하기(데이터 저장)
    public boolean connectPostService(LinkPost linkPost) {
        log.info("LinkPostMapper connectPostService call - {}", linkPost);
        // 중복이면 등록 안 함
        if (isLinked(linkPost)) {
            log.info("isLinked - {}", true);
            return false;
        }
        return mapper.connectPost(linkPost);
    }

    // 링크 해제하기(데이터 삭제)
    public boolean disconnectPostService(String linkId) {
        log.info("LinkPostMapper disconnectPostService call - {}", linkId);
        // 중복이면 해제 진행
        if (isLinked(LinkPost.getLinkPost(linkId))) {
            log.info("isLinked - {}", true);
            return mapper.disconnectPost(linkId);
        }
        return false;
    }

    // 루트 포스트에 연결된 링크 포스트 전체 조회
    public List<LinkPost> getLinkLIst(Long rootPostNo) {
        return mapper.getLinkList(rootPostNo);
    }

    // 루트 포스트에 연결된 링크 포스트의 WithName 객체 전체 조회
    public Map<String, Object> getLinkListService(Long rootPostNo) {
        log.info("LinkPostService getLinkListService CALL - {} ", rootPostNo);

//        System.out.println("------------------------------------------");
        List<PostWithName> linkList = mapper.getLinkDTOList(rootPostNo);
        for (PostWithName pn : linkList) {
            pn.setting();
//            System.out.println(pn);
        }

        Map<String, Object> linkMap = new HashMap<>();
        linkMap.put("rootPostNo", rootPostNo);
        linkMap.put("linkSize", linkList.size());
        linkMap.put("linkList", linkList);

        return linkMap;
    }


    // 루트 포스트에 연결된 포스트 수 조회
    public int getCount(Long rootPostNo) {
        return mapper.getCount(rootPostNo);
    }

    // 중복 링크인지 확인 (중복이면 true, 아니면 false)
    public boolean isLinked(LinkPost linkPost) {
        return mapper.isLinked(linkPost) >= 1;
    }
}