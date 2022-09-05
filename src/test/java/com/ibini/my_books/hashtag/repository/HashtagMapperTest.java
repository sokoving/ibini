package com.ibini.my_books.hashtag.repository;

import com.ibini.my_books.hashtag.domain.HashtagDomain;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class HashtagMapperTest {

    @Autowired
    HashtagMapper hashtagMapper;

    @Test
    @DisplayName("해시태그를 등록할 수 있어야 한다")
    void saveHashtagTeat(){

        HashtagDomain ht = new HashtagDomain();
        ht.setAccount("ibini");
        ht.setPostNo(1L);
        ht.setTagName("아포칼립스");

        boolean b = hashtagMapper.saveHashtag(ht);

        assertTrue(b);

    }
    
    @Test
    @DisplayName("선택한 하나의 해시태그를 삭제할 수 있어야 한다")
    void deleteHashtagTest(){
        int tagNo = 1;

        boolean b = hashtagMapper.deleteHashtag(tagNo);

        assertTrue(b);
        
    }
    
    @Test
    @DisplayName("선택한 하나의 해시태그를 찾을 수 있어야한다")
    void findOneHashTest(){
        int tagNo = 2;
        String account = "ibini";
        HashtagDomain onePost = hashtagMapper.findOneTag(tagNo, account);
        System.out.println(onePost);
    }

    @Test
    @DisplayName("선택한 하나의 해시태그를 수정할 수 있어야한다")
    void ModifyHashtagTest(){
        int tagNo = 2;
        String account = "ibini";
        HashtagDomain onePost = hashtagMapper.findOneTag(tagNo, account);
        onePost.setTagName("아카데미물");
        System.out.println(onePost);

        boolean b = hashtagMapper.modifyHashtag(onePost);

        assertTrue(b);

    }
    
    @Test
    @DisplayName("계정에 저장된 모든 해시태그를 조회해야 한다")
    void findAllT(){
        hashtagMapper.findAllHashTag("ibini").forEach(System.out::println);
    }

    @Test
    @DisplayName("한 포스트에 등록된 모든 해시태그를 조회해야 한다")
    void findAllByPostNoT(){
        Long postNo = 1L;

        System.out.println("check here");
        List<HashtagDomain> hl = hashtagMapper.findAllHashTagByPostNo(postNo);
        for (HashtagDomain hashtagDomain : hl) {
            System.out.println(hashtagDomain);
        }

        assertEquals(2, hl.size());
    }

    @Test
    @DisplayName("한 포스트에 등록된 모드 해시태그가 삭제된다")
    void removeTagOnPostTest(){
        Long postNo = 3L;
        boolean flag = hashtagMapper.removeTagOnPost(postNo);
        List<HashtagDomain> hl = hashtagMapper.findAllHashTagByPostNo(postNo);
        System.out.println("hl.size() = " + hl.size());
        assertEquals(0, hl.size());
    }


}