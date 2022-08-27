package com.ibini.my_books.platform.service;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.repository.PlatformMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PlatformServiceTest {

    @Autowired
    PlatformMapper platformMapper;
    @Autowired
    PlatformService platformService;
    
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
}