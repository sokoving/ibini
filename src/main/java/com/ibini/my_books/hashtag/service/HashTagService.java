package com.ibini.my_books.hashtag.service;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.repository.HashtagMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

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


    // 포스트에 달린 해시태그 전부 조회
    public List<HashtagDomain> findAllByPostNo(Long postNo){
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


}
