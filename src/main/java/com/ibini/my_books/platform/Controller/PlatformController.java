package com.ibini.my_books.platform.Controller;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.service.PlatformService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/platform/c1")
public class PlatformController {

    private final PlatformService platformService;

    // 조회
    @GetMapping("")
    public List<PlatformDomain> list(String account){
        log.info("PlatformController - GET account -{}", account);
        List<PlatformDomain> domainList = platformService.findAllPlatform(account);

        return domainList;
    }

    
    // 수정
    
    // 삭제
    
    // 등록 - 비동기?
    @PostMapping("")
    public String savaPlatform(@RequestBody PlatformDomain platformDomain){
        log.info("PlatformController : POST - {}", platformDomain);
        boolean flag = platformService.savePlatform(platformDomain);

        return flag ? "insert-success" : "fail";
    }


}
