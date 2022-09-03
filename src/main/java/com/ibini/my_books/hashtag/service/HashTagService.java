package com.ibini.my_books.hashtag.service;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.repository.HashtagMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class HashTagService {

    private final HashtagMapper hashtagMapper;

    // 저장
    @Transactional
    public boolean saveHashTag(HashtagDomain hashtagDomain) {
        log.info(" HashTagService save - {} ", hashtagDomain);
        boolean b = false;

        String tagName = hashtagDomain.getTagName();
        if (tagName.trim().isEmpty()) {
            return b;
        }
        // 저장하기 전에 쪼개주기
        String[] cutHashtag = cutHashtag(hashtagDomain);
        log.info(Arrays.toString(cutHashtag));

        for (String tag : cutHashtag) {
            hashtagDomain.setTagName(tag.trim());
            b = hashtagMapper.saveHashtag(hashtagDomain);
//        System.out.println(b);
        }
        return b;


    }

    public String[] cutHashtag(HashtagDomain hashtagDomain) {

        String hashTag = hashtagDomain.getTagName();
//        System.out.println(hashTag);
        hashTag = hashTag.substring(1);
        String[] hashTags = hashTag.split("#");
//        System.out.println(Arrays.toString(hashTags));
        return hashTags;

    }


    // 태그 하나만 삭제
    public void deleteHashTag(int tagNo) {
        log.info(" HashTagService delete - {} ", tagNo);
        boolean b = hashtagMapper.deleteHashtag(tagNo);

    }

    // 태그 하나만 조회
    public void findOneTag(int tagNo, String account) {
        log.info(" HashTagService findOne - {} ", tagNo);
        HashtagDomain oneTag = hashtagMapper.findOneTag(tagNo, account);
    }

    // 태그 하나만 수정
    public void modiHashTag(HashtagDomain hashtagDomain) {
        log.info("HashTagService/modihashTag - {}", hashtagDomain);
        boolean b = hashtagMapper.modifyHashtag(hashtagDomain);

    }


    // 게시글 수정 시 해시태그 수정 처리
    public void modifyService(HashtagDomain hashtagDomain) {
        log.info("HashTagService/modiHashTag - {}", hashtagDomain);

        // 이전 포스트 해시태그 전부 삭제
        if (hashtagMapper.findAllHashTagByPostNo(hashtagDomain.getPostNo()).size() != 0) {
            hashtagMapper.removeTagOnPost(hashtagDomain.getPostNo());
        }
        // 다시 저장
        saveHashTag(hashtagDomain);
    }


    // 포스트에 달린 해시태그 전부 조회
    public List<HashtagDomain> findAllByPostNo(Long postNo) {
        log.info("HashTagService findAllByPostNo call ");
        return hashtagMapper.findAllHashTagByPostNo(postNo);
    }

    // 포스트에 달린 해시태그를 전부 조회해서 한 줄로 만들기
    public String mergeTag(Long postNo) {
        List<HashtagDomain> tagList = findAllByPostNo(postNo);
        int size = tagList.size();

        // 포스트의 모든 해시태그를 한 줄로 저장힐 변수
        StringBuilder mergeTag = new StringBuilder();

        for (int i = 0; i < size; i++) {
            mergeTag.append("#");
            mergeTag.append(tagList.get(i).getTagName());
            if (i < size - 1) {
                mergeTag.append(" ");
            }
        }
        return String.valueOf(mergeTag);
    }

    //    포스트 삭제 시 포스트에 등록된 해시태그 전부 삭제
    @Transactional
    public boolean removeTagOnPost(Long postNo) {
        log.info("HashTag Service : removeTagOnPost call - {}", postNo);
        return hashtagMapper.removeTagOnPost(postNo);
    }


}
