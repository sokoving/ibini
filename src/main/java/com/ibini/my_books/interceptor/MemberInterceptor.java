package com.ibini.my_books.interceptor;


import com.ibini.my_books.util.LoginUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.ibini.my_books.util.LoginUtil.*;

@Configuration
@Log4j2
public class MemberInterceptor implements HandlerInterceptor {

    /*
    인터셉터의 전처리 메서드, 리턴값이 true일 경우 컨트롤러 진입을 허용하고,
    false일 경우 진입을 허용하지 않는다.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();

        //forwarding 으로 로그인 하지 않고 접근했을때 회원가입창으로 보내기
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/sign-up.jsp");


        if(!isLogin(session)) {
            log.info("this request deny!! 집에가!!");

//            dispatcher.forward(request,response);

            response.sendRedirect("/member/sign-in?message=no-login");
            return false;
        }

        return true;

    }
}
