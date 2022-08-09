package com.ibini.my_books.platform.Controller;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.service.PlatformService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/platform/c1")
public class PlatformController {

    private final PlatformService platformService;

    // 플랫폼 목록 요청
    @GetMapping("")
    public List<PlatformDomain> list(@RequestParam String account){
        log.info("PlatformController - GET! account -{}", account);
        List<PlatformDomain> domainList = platformService.findAllPlatform(account);
        log.info("domainList - {}", domainList);
        return domainList;
    }

    
    // 수정 - **수정사항이 디비로 안넘어감 -> 해결
    /*
        수정 patload
            {
                "account" : "ibini",
                "platformName" : "naverWebtoon",
                "platformBgColor" : "#00d564",
                "platformFontColor" : "#fff"
            }
     */
    @PutMapping("/{platformId}")
    public String modify(@PathVariable int platformId
            ,@RequestBody PlatformDomain platformDomain){

        platformDomain.setPlatformId(platformId);
        log.info("platformId- {}", platformId);

        log.info("PlatformController put! platformDo - {}", platformDomain);

        boolean b = platformService.modifyPlatform(platformDomain);

        return b ? "modi-success" : "modi-fail";
    }
    
    // 삭제
    @DeleteMapping("/{platformId}")
    public void delete(){

    }
    
    // 등록 - 비동기?
    /*
        등록시 사용한 페이로드
        {
            "account" : "ibini",
            "platformName" : "alradin",
            "platformBgColor" : "#6c757d",
            "platformFontColor" : "#fff"
        }
     */
    @PostMapping("")
    public String savaPlatform(@RequestBody PlatformDomain platformDomain){
        log.info("PlatformController : POST - {}", platformDomain);
        boolean flag = platformService.savePlatform(platformDomain);

        return flag ? "insert-success" : "insert-fail";
    }


}
