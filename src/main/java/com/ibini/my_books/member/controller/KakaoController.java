package com.ibini.my_books.member.controller;

import com.ibini.my_books.member.dto.KakaoUserInfoDTO;
import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.LoginDTO;
import com.ibini.my_books.member.repository.MemberMapper;
import com.ibini.my_books.member.service.KakaoService;
import com.ibini.my_books.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.Date;

import static com.ibini.my_books.member.domain.OauthValue.*;
import static com.ibini.my_books.member.domain.SNSLogin.*;
import static com.ibini.my_books.util.LoginUtil.*;

@Controller
@Log4j2
@RequiredArgsConstructor
public class KakaoController {

    private final KakaoService kakaoService;
    private final MemberService memberService;
    private final MemberMapper memberMapper;

    @GetMapping("kakao-test")
    public void kakaoTest(Model model){
        log.info("forwarding to kakao-test.jsp!");

        model.addAttribute("appKey", KAKAO_APP_KEY);
        model.addAttribute("redirectUri",KAKAO_REDIRECT_URI);
    }

    //카카오 인증서가 보내준 인가코드를 받아서 처리할 메서드
    @GetMapping(KAKAO_REDIRECT_URI)
    public String kakologin(String code, HttpSession session, HttpServletResponse response, Model model) throws Exception {
        log.info("ibini kakao {} GET !! code - {}", KAKAO_REDIRECT_URI, code);

        // 인가코드를 통해 액세스토큰 발급받기
        // 우리서버에서 카카오서버로 통신을 해야함.
        String accessToken = kakaoService.getAccessToken(code);

        // 액세스 토큰을 통해 사용자 정보 요청(닉네임, 이메일)
        KakaoUserInfoDTO userInfo = kakaoService.getkakaoUserInfo(accessToken);

        // 로그인 처리 전 검증 (회원중에 연동된 카카오에 등록된 이메일 주소를 가진 회원이 있는지 확인)
        boolean flag = kakaoService.kakaoEmailConfirm(userInfo);

       // 상황1.  최초 카카오 로그인시 회원가입 처리 후 로그인처리
        if(!flag){
            // 회원가입
            Member member = new Member();
            member.setUserId(userInfo.getEmail());
            member.setPassword("ibini!2");
            member.setEmail(userInfo.getEmail());
            member.setUserName(userInfo.getNickName());
            memberService.signUp(member);
            memberMapper.verificationKakaoChange(member.getEmail());

            // 로그인 처리
            LoginDTO dto = new LoginDTO();
            dto.setUserId(member.getUserId());
            dto.setPassword("ibini!2");
            dto.setAccount(member.getAccount());

            memberService.login(dto,session,response);
            log.info("loginUser:{}", session.getAttribute("loginUser"));

            session.setAttribute(LOGIN_FROM, KAKAO);
            session.setAttribute("accessToken",accessToken);

            return "redirect:/";
        } else {
//            상황2. 카카오 계정으로 로그인한적이 있는 경우
            if(memberMapper.findVerificationKakao(userInfo.getEmail()) == 1){
                // 로그인 처리
                Member member = memberMapper.findUserId(userInfo.getEmail());

                //날짜 포맷팅 후 세션으로 회원정보 넘기기
                Date date = member.getJoinDate();
                SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
                member.setPrettierDate(sdf.format(date));

                //세션에 사용자 정보기록 저장
                session.setAttribute("loginUser", member);

                //세션 타임아웃 설정
                session.setMaxInactiveInterval(60 * 60); // 1시간 설정

                log.info("loginUser:{}", session.getAttribute("loginUser"));

                session.setAttribute(LOGIN_FROM, KAKAO);
                session.setAttribute("accessToken",accessToken);

                return "redirect:/";

//              상황3. ibini 사이트에 정상경로로 회원가입을 한뒤 처음으로 카카오 로그인 시도하여
//                    email이 중복된 경우
            } else {
//              카카오 이메일로 중복체크 이메일과 일치되는 회원정보와 메시지를 리턴 시킴
                Member member = memberService.findUserId(userInfo.getEmail());
                model.addAttribute("kakaoMsg","exist-userId-emailVerification-false");
                model.addAttribute("member",member);
                return "/member/sign-in";
            }
        }
    }

    // 카카오 로그인으로 회원가입 처리가 된 상태
    @PostMapping("/kakao/email-verification")
    public String emailVerification(String userId, String password,RedirectAttributes ra,Model model){
        Member member = memberService.getMember(userId);
        boolean flag = memberService.modifyPwCheck(password, userId);
        if (flag){
            boolean b = memberService.verificationKakaoChange(member.getEmail());
            log.info("이메일인증 상태 변경 확인 b : {}",b);
            ra.addFlashAttribute("msg","verification-success");
        return "redirect:/member/sign-in";
        } else {
            model.addAttribute("msg","verification-fail");
            return "/member/sign-in";
        }
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
