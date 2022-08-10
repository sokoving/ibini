package com.ibini.my_books.member.Controller;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.LoginDTO;
import com.ibini.my_books.member.dto.ModifyDTO;
import com.ibini.my_books.member.service.LoginFlag;
import com.ibini.my_books.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.ibini.my_books.member.service.LoginFlag.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    //회원가입 양식 띄우기
    @GetMapping("/sign-up")
    public void signUp(){
        log.info("/member/sign-up GET 요청 - forwarding to sign-up.jsp");
    }

    //회원가입 처리 요청
    @PostMapping("sign-up")
    public String signUp(Member member, RedirectAttributes ra){
        log.info("/member/sign-up POST ! - {}", member);
        boolean flag = memberService.signUp(member);
        ra.addFlashAttribute("msg","reg-success");
        return flag? "redirect:/" : "redirect:/member/sign-up";
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
    public void signIn(){
        log.info("/member/sign-in GET - forwarding to sign-in.jsp");
    }


    //로그인 요청 처리
    @PostMapping("/sign-in")
    public String signIn(LoginDTO inputData, RedirectAttributes ra,
                         HttpSession session){
        log.info("/member/sign-in POST - {}",inputData);
        log.info("session timeout{}",session.getMaxInactiveInterval());

        // 로그인 서비스 호출
        LoginFlag flag = memberService.login(inputData, session);

        if (flag == SUCCESS) {
            log.info("login success!");
            return "redirect:/";
        }
        ra.addFlashAttribute("loginMsg", flag);
        return"redirect:/member/sign-in";
    }

    @GetMapping("/sign-out")
    public String signOut(HttpSession session){
        //로그인한 사람에게만 적용
        if (session.getAttribute("loginUser") != null){
            //1.세션에 정보를 삭제한다.
            session.removeAttribute("loginUser");

            //2. 세션을 무효화 한다.
            session.invalidate();
            return "redirect:/";
        }
        return "redirect:/member/sign-in";
    }

    //My Page
    @GetMapping("/my-page")
    public void myPage(){
        log.info("/member/my-page GET!! forwarding to my-page.jsp");
    }

    //내 정보
    @GetMapping("/my-info")
    public void myInfo(){
        log.info("/member/my-info GET!! forwarding to my-info.jsp");
    }


    //수정 전 패스워드 확인
    @GetMapping("/modify-check")
    public void modifyCheck(){
        log.info("/member/modify-check GET!! forwarding modify-check.jsp");
    }

    @PostMapping("/modify-check")
    public String modifyCheck(String password, HttpSession session, Model model){
        log.info("/member/modify-check POST! password - {}",password);
        boolean flag = memberService.modifyCheck(password, session);
        if (flag) {
            return "redirect:/member/modify";
        }
        model.addAttribute("msg","discord");
        return "/member/modify-check";

//        log.info("password1 : {}",password1);
    }

//    //수정하기
//    @GetMapping("/modify")
//    public String modify(){
//        log.info("/member/modify GET! account : {}");
//
//        return "member/my-modify";
//    }

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
