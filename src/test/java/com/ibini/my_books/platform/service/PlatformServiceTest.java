package com.ibini.my_books.platform.service;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.repository.PlatformMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PlatformServiceTest {

    @Autowired
    PlatformMapper platformMapper;
    
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
}