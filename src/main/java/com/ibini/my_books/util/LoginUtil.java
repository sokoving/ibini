package com.ibini.my_books.util;

import com.ibini.my_books.member.domain.Member;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtil {
    public static final String LOGIN_FLAG ="loginUser";
    public static final String LOGIN_COOKIE = "autoLoginCookie";
    public static final String LOGIN_FROM = "loginMethod";

    // 로그인 했는지 알려주기
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_FLAG) != null;
    }

    //로그인한 사용자 계정 가져오기
    public static String getCurrentMemberAccount(HttpSession session){
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getAccount();
    }
    //로그인한 사용자 패스워드 가져오기
    public static String getCurrentMemberPassword(HttpSession session){
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getPassword();
    }


    //로그인한 사용자 권한 가져오기
    public static String getCurrentMemberAuth(HttpSession session){
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getAuth().toString();
    }

    // 자동 로그인 쿠키 가져오기
    public static Cookie getAutoLoginCookie(HttpServletRequest request) {
        return WebUtils.getCookie(request, LOGIN_COOKIE);
    }


    // 자동 로그인 쿠키가 있는지 여부 확인
    public static boolean hasAutoLoginCookie(HttpServletRequest request){
        return WebUtils.getCookie(request,LOGIN_COOKIE) != null;
    }

    //


}
