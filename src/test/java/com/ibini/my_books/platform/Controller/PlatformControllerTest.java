package com.ibini.my_books.platform.Controller;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.service.PlatformService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PlatformControllerTest {

    @Autowired
    PlatformService platformService;
    
    @Test
    @DisplayName("선택한 플랫폼 아이디의 값을 수정해야 한다")
    void controllerModiTest(){
        String account = "ibini";
        int platformId = 7;
        PlatformDomain onePlatform = platformService.findOnePlatform(platformId);
        onePlatform.setPlatformId(onePlatform.getPlatformId());
        onePlatform.setPlatformName("hahaha");
        onePlatform.setPlatformFontColor("#000");
        onePlatform.setPlatformBgColor("#fff");
        onePlatform.setAccount(account);

        System.out.println("onePlatform = " + onePlatform);

        boolean b = platformService.modifyPlatform(onePlatform);
        assertTrue(b);
    }
}