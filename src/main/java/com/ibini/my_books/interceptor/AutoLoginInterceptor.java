package com.ibini.my_books.interceptor;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.repository.MemberMapper;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.ibini.my_books.util.LoginUtil.*;

@Configuration
@RequiredArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {
    private final MemberMapper memberMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1.자동로그인 쿠키 탐색
        Cookie c = WebUtils.getCookie(request, LOGIN_COOKIE);

        //2.자동로그인 쿠키가 발견될 경우 쿠키값을 읽어서 세션아이디를 확인
        if (c != null){
            String sessionId = c.getValue();

            //3.쿠키에 저장된 세션아이디와 같은 값을 가진 회원정보 조회
            Member member = memberMapper.findMemberBysessionId(sessionId);

            if(member != null) {
                //4.세션에 해당 회원정보를 저장
                request.getSession().setAttribute(LOGIN_FLAG,member);
            }
        }
        return true;
    }
}
