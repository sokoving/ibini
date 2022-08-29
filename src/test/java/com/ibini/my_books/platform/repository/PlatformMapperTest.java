package com.ibini.my_books.platform.repository;

import com.ibini.my_books.platform.domain.PlatformDomain;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PlatformMapperTest {

    @Autowired
    PlatformMapper platformMapper;
    
    @Test
    @DisplayName("플랫폼 이름이 추가되야 한다")
    void savePlatformTest(){
        PlatformDomain pd = new PlatformDomain();
        pd.setPlatformName("봄툰");
        pd.setAccount("ibini");
//        pd.setPlatformBgColor("");
//        pd.setPlatformFontColor("");
//        pd.setPlatformBgColor("#ed1c24");
//        pd.setPlatformFontColor("#121212");

        System.out.println("pd = " + pd);
        boolean savePlatform = platformMapper.savePlatform(pd);
        assertTrue(savePlatform);
    }
    
    @Test
    @DisplayName("플랫폼을 하나 조회할 수 있어야한다")
    void findOnePlatformTest(){
        int platformid = 2;

        PlatformDomain platform = platformMapper.findOnePlatform(platformid);

        System.out.println(platform);

    }
    
    @Test
    @DisplayName("선택한 플랫폼을 삭제할 수 있어야 한다")
    void deletePlatformTest(){
        int platformId = 1;
        PlatformDomain onePlatform = platformMapper.findOnePlatform(platformId);
        boolean b = platformMapper.deletePlatform(onePlatform.getPlatformId());

        assertTrue(b);
    }
    
    @Test
    @DisplayName("선택한 플랫폼의 값을 수정할 수 있어야한다")
    void modifyTest(){
        int platformId = 7;
        PlatformDomain onePlatform = platformMapper.findOnePlatform(platformId);
        onePlatform.setPlatformId(onePlatform.getPlatformId());
        onePlatform.setPlatformName("레진코믹스");
//        onePlatform.setPlatformBgColor("#ed1c24");
//        onePlatform.setPlatformFontColor("#121212");

        System.out.println("onePlatform = " + onePlatform);
        boolean b = platformMapper.modifyPlatform(onePlatform);

        assertTrue(b);
    }

    @Test
    @DisplayName("저장된 모든 플랫폼의 이름을 조회할 수 있어야 한다")
    void findAllTest(){
        String account = "ibini";
        platformMapper.findAllPlatform(account).forEach(System.out::println);

    }

    @Test
    @DisplayName("계정에 있는 모든 플랫폼의 수를 조회한다")
    void getTotalCountTest(){
        String account = "ibini";
        int result = platformMapper.getTotalCount(account);
        assertEquals(6, result);
    }
}