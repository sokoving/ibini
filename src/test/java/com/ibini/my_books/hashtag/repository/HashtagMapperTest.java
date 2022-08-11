package com.ibini.my_books.hashtag.repository;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class HashtagMapperTest {

    @Autowired
    HashtagMapper hashtagMapper;

    @Test
    @DisplayName("해시태그를 등록할 수 있어야 한다")
    void saveHashtagTeat(){

        HashtagDomain ht = new HashtagDomain();
        ht.setAccount("ibini");
        ht.setPostNo(220811001);
        ht.setTagName("서양배경");

        boolean b = hashtagMapper.saveHashtag(ht);

        assertTrue(b);

    }
    
    @Test
    @DisplayName("선택한 하나의 해시태그를 삭제할 수 있어야 한다")
    void deleteHashtagTest(){
        int tagNo = 5;

        boolean b = hashtagMapper.deleteHashtag(tagNo);

        assertTrue(b);
        
    }
    
    @Test
    @DisplayName("선택한 하나의 해시태그를 찾을 수 있어야한다")
    void findOneHashTest(){
        int tagNo = 8;
        HashtagDomain onePost = hashtagMapper.findOneTag(tagNo);
        System.out.println(onePost);
    }

    @Test
    @DisplayName("선택한 하나의 해시태그를 수정할 수 있어야한다")
    void ModifyHashtagTest(){
        int tagNo = 7;
        HashtagDomain onePost = hashtagMapper.findOneTag(tagNo);
        onePost.setTagName("아카데미물");
        System.out.println(onePost);

        boolean b = hashtagMapper.modifyHashtag(onePost);

        assertTrue(b);

    }

}