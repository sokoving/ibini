package com.ibini.my_books.interceptor;

import com.ibini.my_books.util.LoginUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.ibini.my_books.util.LoginUtil.*;

//로그인 한 사람이 들어가면 안되는 곳 제한 ex)로그인 페이지
@Configuration
public class AfterLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        if (isLogin(session)){
            response.sendRedirect("/");
            return false;
        }
        return true;
    }
}
