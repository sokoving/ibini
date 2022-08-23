package com.ibini.my_books.member.controller;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.domain.SNSLogin;
import com.ibini.my_books.member.dto.LoginDTO;
import com.ibini.my_books.member.service.KakaoService;
import com.ibini.my_books.member.service.LoginFlag;
import com.ibini.my_books.member.service.MemberService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.ibini.my_books.member.domain.OauthValue.*;
import static com.ibini.my_books.member.service.LoginFlag.*;
import static com.ibini.my_books.util.LoginUtil.LOGIN_FROM;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;
    private final KakaoService kakaoService;

    //회원가입 양식 띄우기
    @GetMapping("/sign-up")
    public void signUp() {
        log.info("/member/sign-up GET 요청 - forwarding to sign-up.jsp");
    }

    //회원가입 처리 요청
    @PostMapping("sign-up")
    public String signUp(Member member, RedirectAttributes ra) {
        log.info("/member/sign-up POST ! - {}", member);
        boolean flag = memberService.signUp(member);
        ra.addFlashAttribute("msg", "reg-success");
        return flag ? "redirect:/" : "redirect:/member/sign-up";
    }

    //아이디, 이메일 중복확인 비동기 요청 처리
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<Boolean> check(String type, String value) {
        log.info("/member/check?type={}&value{} GET !! ASYNC", type, value);
        boolean flag = memberService.checkSignUpValue(type, value);
        return new ResponseEntity<>(flag, HttpStatus.OK);
    }

    //로그인 화면을 열어주는 요청처리
    @GetMapping("/sign-in")
    public void signIn(@ModelAttribute("message") String message, HttpServletRequest request, Model model) {
        log.info("/member/sign-in GET - forwarding to sign-in.jsp");

        String referer = request.getHeader("Referer");
        log.info("referer : {}", referer);
        request.getSession().setAttribute("redirectURI", referer);

        model.addAttribute("kakaoAppKey", KAKAO_APP_KEY);
        model.addAttribute("kakaoRedirect", KAKAO_REDIRECT_URI);
    }


    //로그인 요청 처리
    @PostMapping("/sign-in")
    public String signIn(LoginDTO inputData, RedirectAttributes ra,
                         HttpSession session, HttpServletResponse response) {
        log.info("/member/sign-in POST - {}", inputData);
        log.info("session timeout{}", session.getMaxInactiveInterval());

        // 로그인 서비스 호출
        LoginFlag flag = memberService.login(inputData, session, response);

        if (flag == SUCCESS) {
            log.info("login success!");
            return "redirect:/";
        }
        ra.addFlashAttribute("loginMsg", flag);
        return "redirect:/member/sign-in";
    }


    //로그아웃
    @GetMapping("/sign-out")
    public String signOut(HttpServletRequest request, HttpServletResponse response , RedirectAttributes ra) throws Exception {
        HttpSession session = request.getSession();
        //만약 자동 로그인 상태라면 해제한다. = 쿠키가 있다면
        if (LoginUtil.hasAutoLoginCookie(request)) {
            memberService.autoLogout(LoginUtil.getCurrentMemberAccount(session), request, response);
        }
        log.info("session : {}", session);
        //sns로그인 상태라면 해당 sns 로그아웃처리를 진행
        SNSLogin from = (SNSLogin) session.getAttribute(LOGIN_FROM);
        log.info("from:{}", from);

        if (from != null) {
            switch (from) {
                case KAKAO:
                    kakaoService.logout((String) session.getAttribute("accessToken"));
                    break;
                case NAVER:
                    break;
                case GOOGLE:
                    break;
            }
        }

        //로그인한 사람에게만 적용
        if (session.getAttribute("loginUser") != null) {
            //1.세션에 정보를 삭제한다.
            session.removeAttribute("loginUser");

            //2. 세션을 무효화 한다.
            session.invalidate();
            return "redirect:/";
        }
        return "redirect:/member/sign-in";
    }

    // 회원탈퇴시 로그아웃 처리
    @GetMapping("/join-sign-out")
    public String joinSignOut(HttpServletRequest request, HttpServletResponse response , RedirectAttributes ra) throws Exception {
        HttpSession session = request.getSession();
        //만약 자동 로그인 상태라면 해제한다. = 쿠키가 있다면
        if (LoginUtil.hasAutoLoginCookie(request)) {
            memberService.autoLogout(LoginUtil.getCurrentMemberAccount(session), request, response);
        }
        log.info("session : {}", session);
        //sns로그인 상태라면 해당 sns 로그아웃처리를 진행
        SNSLogin from = (SNSLogin) session.getAttribute(LOGIN_FROM);
        log.info("from:{}", from);

        if (from != null) {
            switch (from) {
                case KAKAO:
                    kakaoService.logout((String) session.getAttribute("accessToken"));
                    break;
                case NAVER:
                    break;
                case GOOGLE:
                    break;
            }
        }

        //로그인한 사람에게만 적용
        if (session.getAttribute("loginUser") != null) {
            //1.세션에 정보를 삭제한다.
            session.removeAttribute("loginUser");

            //2. 세션을 무효화 한다.
            session.invalidate();
            ra.addFlashAttribute("msg","join-out-success");
            return "redirect:/";
        }
        return "redirect:/member/sign-in";
    }

    //My Page
    @GetMapping("/my-page")
    public void myPage() {
        log.info("/member/my-page GET!! forwarding to my-page.jsp");
    }

    //내 정보
    @GetMapping("/my-info")
    public void myInfo() {
        log.info("/member/my-info GET!! forwarding to my-info.jsp");
    }

    //닉네임 수정
    @GetMapping("/modifyNick-check")
    public void modifyNickCheck() {
        log.info("/member/modifyNick-check GET!! forwarding to modifyNick-check");
    }

    @PostMapping("modifyNick-check")
    public String modifyNickCheck(String account, String userName,
                                  RedirectAttributes ra, HttpSession session) {
        log.info("/member/modifyNick-check POST - account : {}, userName : {}", account, userName);

        boolean flag = memberService.updateName(account, userName);

        //세션에 변경된 사용자 정보기록 저장
        Member foundMember = memberService.getMember(account);
        log.info(foundMember);
        session.setAttribute("loginUser", foundMember);

        if (flag) {
            ra.addFlashAttribute("msg", "nickModify-success");
            ra.addFlashAttribute("modifyUserName", userName);
            return "redirect:/member/my-info";
        }
        ra.addFlashAttribute("msg", "nickModify-fail");
        return "redirect:/member/modifyNick-check";

    }


    //비밀번호 수정 화면 요청
    @GetMapping("/modifyPw-check")
    public void modifyCheck() {
        log.info("/member/modify-check GET!! forwarding modify-check.jsp");
    }


    //비밀번호 수정
    @PostMapping("/modifyPw-check")
    public String modifyCheck(String account, String originPassword, String password, Model model,
                              RedirectAttributes ra) {
        log.info("/member/modify-check POST! originPassword - {}, password - {}, account - {}", originPassword, password, account);

        //기존 비밀번호 입력값과 DB 비밀번호값 일치 여부 확인
        boolean checkFlag = memberService.modifyPwCheck(originPassword, account);

        // 기존 비밀번호가 일치하면 비밀번호 변경 실행
        if (checkFlag) {
            boolean modifyFlag = memberService.updatePw(account, password);

            //비밀번호 변경 성공 하면 회원정보 출력창으로 이동
            if (modifyFlag) {
                log.info("기존 비밀번호 일치, 비밀번호 변경 성공!");
                ra.addFlashAttribute("msg", "modify-success");
                return "redirect:/member/my-info";

                //실패하면 수정창으로 보내고, 실패 메시지 전송
            } else ra.addFlashAttribute("msg", "modify-fail");
            log.info("기존 비밀번호 일치, 비밀번호 변경 실패!");
            return "redirect:/member/modifyPw-check";

            //기존 비밀번호 일치 하지 않으면 수정창으로 보내고 실패 메시지 전송
        } else {
            log.info("기존 비밀번호 확인 실패");
            ra.addFlashAttribute("msg", "discord");
            return "redirect:/member/modifyPw-check";

        }
    }

    //회원 탈퇴하기
    @GetMapping("/join-out")
    public void joinOut() {
        log.info("/member/join-out GET!! /member/join-out.jsp");
    }

    @PostMapping("join-out")
    public String joinOut(String account, String password, RedirectAttributes ra) {
        log.info("/member/join-out POST !! account : {}, password : {}", account, password);

        // 입력된 비밀번호와 db 비밀번호 일치 확인
        boolean pwCheckFlag = memberService.modifyPwCheck(password, account);

        if (pwCheckFlag) {
            ra.addFlashAttribute("msg", "success");
            memberService.memberDelete(account, password);

            return "redirect:/member/join-sign-out";
        }
        ra.addFlashAttribute("msg", "fail");
        return "redirect:/member/join-out";


    }


//    @PutMapping("modify-email")
//    @ResponseBody
//    public ResponseEntity<String> modifyEmail(String account, String email){
//        log.info("/member/modify POST !! - email:{}, account:{} ", email,account);
//        boolean flag = memberService.updateEmail(account, email);
//
//        return flag? new ResponseEntity<>("modify-email-success",HttpStatus.OK)
//                : new ResponseEntity<>("modify-fail",HttpStatus.BAD_REQUEST);
//
//    }


}
