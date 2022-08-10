package com.ibini.my_books.member.repository;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.ModifyDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.HashMap;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberMapperTest {

    @Autowired
    MemberMapper mapper;

    @Test
    @DisplayName("회원가입에 성공해야 한다.")
    void registerTest(){
        Member m = new Member();
        m.setAccount("테스트_account");
        m.setPassword("테스트_pw");
        m.setEmail("테스트@email");
        m.setUserName("테스트_이름");

        mapper.register(m);
    }

    @Test
    @DisplayName("비밀번호가 암호화 인코딩 되어야 한다.")
    void encodePasswordTest(){

        // 인코딩 전 비밀번호
        String rawPassword = "abcdef12345";

        // 인코딩을 위한 객체 생성
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // 인코딩 후 비밀번호
        String encodePassword = encoder.encode(rawPassword);

        System.out.println("rawPassWord = " + rawPassword);
        System.out.println("encodePassWord = " + encodePassword);

    }

    @Test
    @DisplayName("회원가입에 비밀번호가 인코딩된 상태로 성공해야 한다.")
    void registerPwEncodeTest(){
        Member m = new Member();
        m.setAccount("jaeyoung");
        m.setPassword(new BCryptPasswordEncoder().encode("jaeyoung12"));
        m.setEmail("yanbam@naver.com");
        m.setUserName("양재영");

        boolean flag = mapper.register(m);

        assertTrue(flag);
    }

    @Test
    @DisplayName("특정 계정명으로 회원을 조회해야 한다.")
    void findUserTest(){
        String account = "jaeyoug";

        Member member = mapper.findUser(account);

        System.out.println("member = " + member);
        assertNull(member);
    }

    @Test
    @DisplayName("중복된 아이디를 확인 해야 한다.")
    void checkAccountTest(){

        HashMap<String, Object> checkMap = new HashMap<>();
        checkMap.put("type","account");
        checkMap.put("value","jaeyoung");

        int flagNumber = mapper.isDuplicate(checkMap);

        assertTrue(flagNumber == 1);
    }

    @Test
    @DisplayName("회원의 비밀번호를 수정해야 한다.")
    void updatePwTest(){
        String account = "dlqlsl";
        String password = "dlqlsl!@#";
         Member m = mapper.findUser("jaeyoung");
        boolean flag = mapper.updatePw(account,password);

        assertTrue(flag);
    }

    @Test
    @DisplayName("회원의 이메일을 수정해야 한다.")
    void updateEmailTest() {
        String account = "wodud";
        String email = "jaeyoung@naver.com";
        boolean flag = mapper.updateEmail(account, email);

        assertTrue(flag);
    }



}