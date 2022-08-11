package com.ibini.my_books.hashtag.service;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.repository.HashtagMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

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
        System.out.println(cutHashtag);
        // hashTags[] = "[로맨스, 판타지, 서양배경, 성장물]"
        boolean b = false;
        for (String tag : cutHashtag) {
            hashtagDomain.setTagName(tag);
            b = hashtagMapper.saveHashtag(hashtagDomain);
        }
        System.out.println(b);
        return b;

    }

    public String[] cutHashtag(HashtagDomain hashtagDomain) {
//        System.out.println("클라이언트에서 하나의 인풋창에 입력 -> #로맨스 #판타지 #서양배경 #성장물");
        // HashtagDomain(tagNo=8, postNo=220811001, tagName=#로맨스 #판타지 #서양배경 #성장물, account=ibini)
        /*
                HashtagDomain(tagNo=8, postNo=220811001, tagName=로맨스, account=ibini)
                HashtagDomain(tagNo=9, postNo=220811001, tagName=판타지, account=ibini)
                HashtagDomain(tagNo=10, postNo=220811001, tagName=서양배경, account=ibini)
                HashtagDomain(tagNo=11, postNo=220811001, tagName=성장물, account=ibini)
         */

        String hashTag = hashtagDomain.getTagName();
//        System.out.println(hashTag);
        hashTag = hashTag.substring(1);
        String[] hashTags = hashTag.split(" #");
//        System.out.println(Arrays.toString(hashTags));
        return hashTags;

//        // hashtag[] => DB에 하나씩 넣어주기
//        for (String tag : hashTags) {
//            System.out.println(tag);
//            hashtagDomain.setTagName(tag);
//            hashtagMapper.saveHashtag(hashtagDomain);
//            // domain
//        }
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
