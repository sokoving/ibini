package com.ibini.my_books.member.service;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.LoginDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.convert.DataSizeUnit;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberServiceTest {

    @Autowired
    MemberService service;

    @Test
    @DisplayName("평문 비밀번호로 회원가입하면 암호화되어 저장된다.")
    void signUpTest(){
        Member m = new Member();
        m.setAccount("grape");
        m.setPassword("grape!2");
        m.setUserName("포도");
        m.setEmail("grape@naver.com");

        service.signUp(m);
    }

    @Test
    @DisplayName("중복된 아이디를 전달하면 true가 나와야 한다.")
    void checkAccountServiceTest(){
        String account = "jaeyoung";
        boolean flag = service.checkSignUpValue("account",account);
        assertTrue(flag);
    }


    @Test
    @DisplayName("로그인을 검증해야 한다.")
    void signTest(){
        LoginDTO loginDTO = new LoginDTO();
        Member foundMember = service.getMember("jaeyoung");
        loginDTO.setAccount(foundMember.getAccount());
        loginDTO.setPassword(foundMember.getPassword());

        HttpSession session = null;
        LoginFlag flag = service.login(loginDTO,session);

        System.out.println(flag);

    }


}