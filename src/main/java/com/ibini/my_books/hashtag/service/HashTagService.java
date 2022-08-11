package com.ibini.my_books.hashtag.service;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.repository.HashtagMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
@Log4j2
@RequiredArgsConstructor
public class HashTagService {

    private final HashtagMapper hashtagMapper;

    // 저장
    public boolean saveHashTag(HashtagDomain hashtagDomain){
        log.info(" HashTagService save - {} ", hashtagDomain);
        // 저장하기 전에 쪼개주기
        String[] cutHashtag = cutHashtag(hashtagDomain);
        log.info(Arrays.toString(cutHashtag));
        boolean b = false;
        for (String tag : cutHashtag) {
            hashtagDomain.setTagName(tag);
            b = hashtagMapper.saveHashtag(hashtagDomain);
        }
//        System.out.println(b);
        return b;

    }

    public String[] cutHashtag(HashtagDomain hashtagDomain) {

        String hashTag = hashtagDomain.getTagName();
//        System.out.println(hashTag);
        hashTag = hashTag.substring(1);
        String[] hashTags = hashTag.split(" #");
//        System.out.println(Arrays.toString(hashTags));
        return hashTags;

    }


    // 삭제
    public void deleteHashTag(int tagNo){
        log.info(" HashTagService delete - {} ", tagNo);
        boolean b = hashtagMapper.deleteHashtag(tagNo);
        
    }
    
    // 하나만 조회
    public void findOneTag(int tagNo){
        log.info(" HashTagService findOne - {} ", tagNo);
        HashtagDomain oneTag = hashtagMapper.findOneTag(tagNo);
    }

    // 수정
    public void modiHashTag(HashtagDomain hashtagDomain){
        log.info("HashTagService/modihashTag - {}", hashtagDomain);
        boolean b = hashtagMapper.modifyHashtag(hashtagDomain);
        
    }
}
