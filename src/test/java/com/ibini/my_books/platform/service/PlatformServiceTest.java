package com.ibini.my_books.platform.service;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.repository.PlatformMapper;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.service.PostService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PlatformServiceTest {

    @Autowired
    PlatformMapper platformMapper;
    @Autowired
    PlatformService platformService;
    @Autowired
    PostService postService;
    
    @Test
    @DisplayName("수정이 성공해야 한다")
    void serviceModiTest(){

        int platformId = 7;
        String account = "ibini";
        PlatformDomain onePlatform = platformMapper.findOnePlatform(platformId);
        onePlatform.setAccount(account);
        onePlatform.setPlatformId(onePlatform.getPlatformId());
        onePlatform.setPlatformName("네이버웹툰");
        onePlatform.setPlatformBgColor("#000");
        onePlatform.setPlatformFontColor("#eee");
        boolean b = platformMapper.modifyPlatform(onePlatform);

        System.out.println("onePlatform = " + onePlatform);

        assertTrue(b);

    }

    @Test
    @DisplayName("기본 플랫폼이 세팅돼야 한다(이름, 배경색, 글자색 포함)")
    void setPlatformForNewMemberTest(){
        String account = "2208260002";
        boolean flag = platformService.setPlatformForNewMember(account);
        assertTrue(flag);
    }

    @Test
    @DisplayName("탈퇴할 회원의 모든 플랫폼 데이터가 삭제돼야 한다")
    void removePlatformForOutMemberTest(){
        String account = "2208260002";
        boolean flag = platformService.removePlatformForOutMember(account);
        assertTrue(flag);
    }

    @Test
    @DisplayName("플랫폼이 삭제되기 전 해당 플랫폼아이디를 가진 포스트의 플랫폼 아이디를 변경한다")
    void removeTest(){
        int platId = 3;
        boolean flag = platformService.deletePlatform(platId);
        assertTrue(flag);

//        //        특정 장르 아이디를 가진 post 조회
//        List<Post> pl = postService.getPostByPlateId(platId);
////        account = admin인 장르 조회
//        String account = "admin";
//        List<PlatformDomain> pfl = platformService.findAllPlatform(account);
//        for (PlatformDomain p : pfl) {
//            if(p.getPlatformName().equals("미분류")){
//                for (Post post : pl) {
//                    post.setPlatformId(p.getPlatformId());
//                    postService.modifyService(post);
//                }
//            }
//        }
    }
}