package com.ibini.my_books.member.controller;

import com.ibini.my_books.member.domain.KakaoUserInfoDTO;
import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.service.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

import static com.ibini.my_books.member.domain.OauthValue.*;
import static com.ibini.my_books.member.domain.SNSLogin.*;
import static com.ibini.my_books.util.LoginUtil.*;

@Controller
@Log4j2
@RequiredArgsConstructor
public class KakaoController {

    private final KakaoService kakaoService;

    @GetMapping("kakao-test")
    public void kakaoTest(Model model){
        log.info("forwarding to kakao-test.jsp!");

        model.addAttribute("appKey", KAKAO_APP_KEY);
        model.addAttribute("redirectUri",KAKAO_REDIRECT_URI);
    }

    //카카오 인증서가 보내준 인가코드를 받아서 처리할 메서드
    @GetMapping(KAKAO_REDIRECT_URI)
    public String kakologin(String code, HttpSession session) throws Exception {
        log.info("{} GET !! code - {}", KAKAO_REDIRECT_URI, code);

        // 인가코드를 통해 액세스토큰 발급받기
        // 우리서버에서 카카오서버로 통신을 해야함.
        String accessToken = kakaoService.getAccessToken(code);

        // 액세스 토큰을 통해 사용자 정보 요청(닉네임, 이메일)
        KakaoUserInfoDTO userInfo = kakaoService.getkakaoUserInfo(accessToken);

        //로그인 처리
        if (userInfo != null){
            Member member = new Member();
            member.setAccount(userInfo.getEmail());
            member.setUserName(userInfo.getNickName());
            member.setEmail(userInfo.getEmail());

            session.setAttribute(LOGIN_FLAG,member);
            session.setAttribute(LOGIN_FROM, KAKAO);
            session.setAttribute("accessToken",accessToken);

            return "redirect:/";
        }

        return "redirect:/member/sign-in";
    }

    // 카카오 로그아웃
    @GetMapping("/kakao/logout") // 내가 정한 url
    public String kakaoLogout(HttpSession session) throws Exception{

        //카카오 로그아웃 처리
        kakaoService.logout((String) session.getAttribute("accessToken"));

        //우리 서비스 로그아웃
        session.invalidate();

        return "redirect:/kakao-test";
    }
}
