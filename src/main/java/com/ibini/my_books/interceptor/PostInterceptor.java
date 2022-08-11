package com.ibini.my_books.interceptor;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Configuration
public class PostInterceptor implements HandlerInterceptor {

    /*
    인터셉터의 전처리 메서드, 리턴값이 true일 경우 컨트롤러 진입을 허용하고,
    false일 경우 진입을 허용하지 않는다.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {

        return false;

    }
}
