package com.ibini.my_books.platform.api;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.service.PlatformService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/platform/c1")
public class PlatformApiController {

    private final PlatformService platformService;

    /*
                POST write url
                http://localhost:8383/post/write/ibini
                GET POST URL
                const account = '${account}';
                // 나중에 꼭 수정해주기
                const url = "http://localhost:8383/platform/c1?account=" + account;

                const genreURL = "http://localhost:8383/genre/c1?account=" + account;
     */

    @GetMapping("")
    public List<PlatformDomain> list(HttpSession session, Model model){
        // 로그인 정보 가져오기
        String account = LoginUtil.getCurrentMemberAccountForDB(session);
        log.info("HashTag Controller account - {}", account);

        log.info("PlatformController - GET! account -{}", account);
        List<PlatformDomain> domainList = platformService.findAllPlatform(account);
        log.info("domainList - {}", domainList);

        model.addAttribute("account", account);
        return domainList;
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
    @PostMapping("/{account}")
    public String savaPlatform(@PathVariable String account,
                               @RequestBody PlatformDomain platformDomain){
        log.info("PlatformController : POST - {}", platformDomain);
        boolean flag = platformService.savePlatform(platformDomain);

        return flag ? "insert-success" : "insert-fail";
    }

    
    // 수정 - **수정사항이 디비로 안넘어감 -> 해결
    /*
        수정 patload
        {
                "account" : "ibini",
                "platformName" : "kakaoPage2",
                "platformBgColor" : "#00d564",
                "platformFontColor" : "#eee"
        }
     */
    @PutMapping("/{account}/{platformId}")
    public String modify(
            @PathVariable String account
            , @PathVariable int platformId
            ,@RequestBody PlatformDomain platformDomain){

        log.info("/platform/c1/{}/{} PUT!", account, platformId);
        platformDomain.setPlatformId(platformId);
        log.info("platformId- {}", platformId);

        log.info("PlatformController put! platformDo - {}", platformDomain);

        boolean b = platformService.modifyPlatform(platformDomain);

        return b ? "modi-success" : "modi-fail";
    }
    
    // 삭제
    @DeleteMapping("/{account}/{platformId}")
    public String delete(@PathVariable String account,
            @PathVariable int platformId){
        log.info("PlatformController delete! - platform account {} ", account);
        log.info("PlatformController delete! - platformId {} ", platformId);

        boolean deletePlatform = platformService.deletePlatform(platformId);
        return deletePlatform ? "del-success" : "del-fail";
    }
    



}
