package com.ibini.my_books.hashtag.service;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import com.ibini.my_books.hashtag.repository.HashtagMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;

@SpringBootTest
class HashTagServiceTest {

    @Autowired
    HashTagService hashTagService;

    @Autowired
    HashtagMapper hashtagMapper;

    @Test
    @DisplayName("해시태그 위지 가져오기")
    void cutTagTest(){

        HashtagDomain oneTag = hashtagMapper.findOneTag(9);
        System.out.println(oneTag);
        String tagName = oneTag.getTagName();
        System.out.println(tagName);

    }

    @Test
    @DisplayName("해시태그 분해하기")
    void splitHashTag() {
        HashtagDomain hashtagDomain = new HashtagDomain();
        hashtagDomain.setPostNo(1L);
        hashtagDomain.setAccount("ibini");
        hashtagDomain.setTagName("#로맨스 #판타지 #서양배경 #성장물");


        String hashTag = hashtagDomain.getTagName();
        System.out.println(hashTag);
        hashTag = hashTag.substring(1);
        String[] hashTags = hashTag.split(" #");
        System.out.println(Arrays.toString(hashTags));
        
        // hashtag[] => DB에 하나씩 넣어주기
        for (String tag : hashTags) {
            System.out.println(tag);
            hashtagDomain.setTagName(tag);
            hashtagMapper.saveHashtag(hashtagDomain);
            // domain
        }
        
    }
    
    @Test
    @DisplayName("hashtag의 배열을 분리해서 저장할 수 있어야 한다")
    void savehashtag(){
        HashtagDomain hd = new HashtagDomain();
        hd.setAccount("ibini");
        hd.setPostNo(1L);
        hd.setTagName("#삼각로맨스 #신분차이 #남장/여장물 #왕족귀족");
        hashTagService.saveHashTag(hd);

    }
}