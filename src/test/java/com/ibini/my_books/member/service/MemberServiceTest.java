package com.ibini.my_books.member.service;

import com.ibini.my_books.member.common.paging.Page;
import com.ibini.my_books.member.domain.InquiryTable;
import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.AnswerDTO;
import com.ibini.my_books.member.dto.InquiryDTO;
import com.ibini.my_books.member.dto.InquiryModifyDTO;
import com.ibini.my_books.member.dto.LoginDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.convert.DataSizeUnit;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

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
    @DisplayName("회원가입이 처리되면 회원관리테이블에 회원아이디가 등록 되어야 한다.")
    void insertMember1Test(){
        Member m = new Member();
        m.setUserId("vacation");
        m.setPassword("woduddlek!");
        m.setUserName("회원관리자");
        m.setEmail("yanbam@naver.com");

        service.signUp(m);
    }

    @Test
    @DisplayName("문의글이 등록 되어야 한다.")
    void inquiryRegisterTest(){
        Member m = service.getMember("vacation");
        InquiryDTO dto = new InquiryDTO();
        dto.setUserId(m.getUserId());
        dto.setInquiryTitle("3번째 문의글 제목");
        dto.setInquiry("3번째 문의 글입니다.");

        service.inquiryRegister(dto);
    }

    @Test
    @DisplayName("해당 문의글에 답글이 등록 되어야 한다.")
    void answerRegisterTest(){
        String answer = "회원님의 성원에 감사드립니다.";
        String serialNumber = "2208260001";
        AnswerDTO dto = new AnswerDTO();
        dto.setAnswer(answer);
        dto.setSerialNumber(serialNumber);
        System.out.println("dto.getAnswer() = " + dto.getAnswer());
        System.out.println("dto.getSerialNumber() = " + dto.getSerialNumber());
        service.answerRegister(dto);
    }

    @Test
    @DisplayName("시리얼넘버에 맞는 문의 내역이 조회 되어야 한다.")
    void findOneInquiryTest(){
        String serialNumber = "2208290021";
        InquiryTable i = service.findOneInquiry(serialNumber);
        System.out.println(i);
    }

//    @Test
//    @DisplayName("userId의 모든 문의글이 조회 되어야 한다.")
//    void findMemberInquiryTest(){
//       Page page = new Page();
//        String userId = "vacation";
//        List<InquiryTable> i = service.findMemberInquiry(userId,page);
//        for (InquiryTable y : i) {
//            System.out.println(y);
//        }
//    }


//    @Test
//    @DisplayName("모든 문의글을 조회 되어야 한다.")
//    void findAllInquiryTest(){
//        Page page = new Page();
//        List<InquiryTable> allInquiry = service.findAllInquiry(page);
//        for (InquiryTable i : allInquiry) {
//            System.out.println(i);
//        }
//    }

    @Test
    @DisplayName("시리얼넘버와 일치하는 문의글이 수정 되어야 한다.")
    void inquiryModifyTest(){
        String serialNumber = "2208260009";

        InquiryModifyDTO i = new InquiryModifyDTO();
        i.setSerialNumber(serialNumber);
        i.setInquiryTitle("수정된 문의글 제목");
        i.setInquiry("수정된 문의 내용");

        boolean flag = service.inquiryModify(i);

        assertTrue(flag);

    }

    @Test
    @DisplayName("시리얼 번호의 게시글이 삭제 되어야 한다.")
    void inquiryDeleteTest(){
        String serialNumber = "2208260001";
        boolean flag = service.inquiryDelete(serialNumber);
        assertTrue(flag);
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

//    @Test
//    @DisplayName("가입된 회원의 정보가 삭제 되어야 한다.")
//    void deleteMemberTest(){
//        String account = "wldus";
//        String password = "$2a$10$Anr8kInQpqkrHo1pS4vih.mpwZakB4DO0TlXyOCTS3tspNu/gNf9O";
//
//        boolean flag = service.memberDelete(account, password);
//
//        assertTrue(flag);
//
//    }
}