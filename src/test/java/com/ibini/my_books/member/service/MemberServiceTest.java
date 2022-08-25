package com.ibini.my_books.member.service;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.LoginDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.convert.DataSizeUnit;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberServiceTest {

    @Autowired
    MemberService service;


    @Test
    @DisplayName("account가 시퀀스로 생성된 일련번호로 등록 되어야 한다.")
    void insertMemberTest(){
        Member m = new Member();
        m.setPassword("gkskenftpt!");
        m.setUserName("하나둘셋");
        m.setEmail("yanbamb@naver.com");

        service.signUp(m);

    }
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
        HttpServletResponse response = null;
        LoginFlag flag = service.login(loginDTO,session, response);

        System.out.println(flag);

    }

    @Test
    @DisplayName("회원의 패스워드가 암호화되어 수정되어야 한다.")
    void updatePwTest(){
        String account = "wldus";
        String password = "wldus!@#";

        boolean flag = service.updatePw(account, password);

        Member member = service.getMember(account);

        System.out.println(member.getPassword());

        assertTrue(flag);

    }

    @Test
    @DisplayName("가입된 회원의 정보가 삭제 되어야 한다.")
    void deleteMemberTest(){
        String account = "wldus";
        String password = "$2a$10$Anr8kInQpqkrHo1pS4vih.mpwZakB4DO0TlXyOCTS3tspNu/gNf9O";

        boolean flag = service.memberDelete(account, password);

        assertTrue(flag);

    }
}