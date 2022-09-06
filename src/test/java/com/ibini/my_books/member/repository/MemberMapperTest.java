package com.ibini.my_books.member.repository;

import com.ibini.my_books.member.common.paging.Page;
import com.ibini.my_books.member.domain.InquiryTable;
import com.ibini.my_books.member.domain.ManageMember;
import com.ibini.my_books.member.domain.Member;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.HashMap;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class MemberMapperTest {
    @Autowired
    MemberMapper mapper;

    @Test
    @DisplayName("회원가입에 성공해야 한다.")
    void registerTest(){
        Member m = new Member();
//        m.setAccount("테스트_account1");
        m.setPassword("테스트_pw");
        m.setEmail("테스트@emai41");
        m.setUserName("테스트_이름");
        m.setUserId("test234");

        mapper.register(m);
    }

    @Test
    @DisplayName("회원관리테이블에 신규회원 아이디 등록")
    void registerManageMember(){
        Member test1 = mapper.findUser("test1");
        boolean b = mapper.registerManageMember(test1);
        System.out.println(b);

    }

    @Test
    @DisplayName("중복된 아이디를 확인 해야 한다.")
    void checkAccountTest(){

        HashMap<String, Object> checkMap = new HashMap<>();
        checkMap.put("type","userId");
        checkMap.put("value","test1");

        System.out.println(checkMap);

        int flagNumber = mapper.isDuplicate(checkMap);
        System.out.println(flagNumber);

//        assertTrue(flagNumber == 1);
    }

    @Test
    @DisplayName("이메일 수정하기")
    void updateEmailtest(){

        mapper.updateEmail("test1","testtest@test.test");

    }

    @Test
    @DisplayName("닉네임 수정하기")
    void updateNameTest(){

        mapper.updateName("test1","수정된이름");

    }

    @Test
    @DisplayName("비밀번호 수정하기")
    void updatePwTest1(){

        mapper.updatePw("test1","woduddlek!");

    }

    @Test
    @DisplayName("회원탈퇴")
    void deleteMemberTest(){

        mapper.updatePw("test234","테스트_pw");

    }

    @Test
    @DisplayName("회원 문의내역 조회")
    void findMemberInquiryTest1() {
        String userId = "userid1";
        Page page = new Page();
        List<InquiryTable> memberInquiry = mapper.findMemberInquiry(userId, page);
        for (InquiryTable inquiryTable : memberInquiry) {
            System.out.println(inquiryTable);
        }
    }

        @Test
        @DisplayName("관리자의 문의내역 조회")
        void findAllInquiryTest(){

            Page page = new Page();
            List<InquiryTable> memberInquiry = mapper.findAllInquiry(page);
            for (InquiryTable inquiryTable : memberInquiry) {
                System.out.println(inquiryTable);
            }


    }

//    현재 회원탈퇴관리 테이블의 마지막 reasonNum 구하기
    @Test
    @DisplayName("회원관리 테이블의 마지막 번호")
    void getReasonNum(){
        int currentReasonNum = mapper.getCurrentReasonNum();
        System.out.println(currentReasonNum);
    }

    @Test
    @DisplayName("관리자의 회원전체조회(탈퇴회원포함)")
    void findAllManageMember(){
        List<ManageMember> allManageMember = mapper.findAllManageMember();
        for (ManageMember manageMember : allManageMember) {
            System.out.println(manageMember);
        }
    }

    @Test
    @DisplayName("현재 가입한 회원의 수")
    void getTotalCurrentMemberCount(){

        int totalCurrentMemberCount = mapper.getTotalCurrentMemberCount();
        System.out.println(totalCurrentMemberCount);

    }

    @Test
    @DisplayName("현재 탈퇴한 회원 수")
    void getTotalOutMemberCount(){

        int totalOutMemberCount = mapper.getTotalOutMemberCount();
        System.out.println(totalOutMemberCount);

    }

    @Test
    @DisplayName("현재 탈퇴한 회원 수")
    void verificationKakaoChange(){
        String email = "rodrodzzang@naver.com";

        mapper.verificationKakaoChange(email);

    }

    @Test
    @DisplayName("암호화된 비밀번호 끼리 동등비교 가능여부 확인")
    void test(){
        Member rodrodzzang = mapper.findUserId("rodrodzzang");
        boolean b = rodrodzzang.getPassword().equals(rodrodzzang.getPassword());
        System.out.println(b);
    }


//    ==================================

    @Test
    @DisplayName("회원관리 테이블에 회원아이디가 등록 되어야 한다.")
    void registerManageMemberTest(){
        Member m = new Member();
        m.setUserId("vacation");
        m.setPassword("vacation!");
        m.setEmail("yanbam@naver.com");
        m.setUserName("메룽메룽");

        mapper.registerManageMember(m);

    }

    @Test
    @DisplayName("회원관리 테이블의 상태가 변경 되어야 한다.")
    void changeConditionTest(){
        String userId = "vacation";
        boolean b = mapper.changeCondition(userId);
        assertTrue(b);

    }

    @Test
    @DisplayName("탈퇴회원 아이디와 탈퇴사유가 입력 되어야 한다.")
    void insertReasonNumTest(){
        String userId = "test1";
        int reasonNum = 1;

        mapper.insertReasonNum(userId,reasonNum);
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

    @Test
    @DisplayName("userId로 account를 조회한다")
    void changIdToAccountTest(){
        String userId = "yeowoon";
        String account = mapper.changeIdToAccount(userId);
        System.out.println("account = " + account);
        assertEquals(account, "2208260002");
    }

    @Test
    @DisplayName("회원의 문의내역 상세조회")
    void findInquiry(){
        String userId = "userid1";
        mapper.findOneInquiry(userId);
    }

    @Test
    @DisplayName("회원의 문의내역 전체조회")
    void findMemberInquiryTest(){
        String userId = "userid1";
        Page page = new Page(1,10);

        mapper.findMemberInquiry(userId,page);
    }


}