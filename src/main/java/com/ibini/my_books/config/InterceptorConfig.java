package com.ibini.my_books.config;

import com.ibini.my_books.interceptor.AfterLoginInterceptor;
import com.ibini.my_books.interceptor.AutoLoginInterceptor;
import com.ibini.my_books.interceptor.MemberInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 다양한 인터셉터들을 관리하는 설정 클래스
@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {

    private final MemberInterceptor memberInterceptor;
    private final AfterLoginInterceptor afterLoginInterceptor;
    private final AutoLoginInterceptor autoLoginInterceptor;

    //인터셉터 설정 추가 메서드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //member 인터셉터 설정
        registry.addInterceptor(memberInterceptor)
                .addPathPatterns("/member/*","/list/**", "/post/**")
                .excludePathPatterns("/member/sign-up","/member/sign-in","/member/check",
                        "/member/findpw","/member/checkcode","/member/change-password");

        //after 로그인 인터셉터 설정
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/member/sign-in","/member/sign-up");

        //자동로그인 인터셉터 설정
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**"); // 모든 경로 처리
    }
}
