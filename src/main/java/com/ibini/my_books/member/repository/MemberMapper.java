package com.ibini.my_books.member.repository;

import com.ibini.my_books.member.common.paging.Page;
import com.ibini.my_books.member.domain.InquiryTable;
import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapper {

    //회원 가입 기능
    boolean register (Member member);

    /*
    * 체크타입 : 계정 or 이메일
    * 체크값 : 중복검사대상 값
    *
    */ //중복체크 기능
    int isDuplicate(Map<String,Object> checkMap);

    //회원정보 조회 기능
    Member findUser(String userId);

    // 닉네임 수정 기능 (회원정보 수정)
    boolean updateName(String userId, String userName);

    // 비밀번호 수정 기능 (회원정보 수정)
    boolean updatePw(String userId, String password);

    // 이메일 수정 기능 (회원정보 수정)
    boolean updateEmail(String userId, String email);

    // 회원탈퇴 기능
    boolean memberDelete(String userId,String password);

    //자동로그인 쿠키정보 저장
    void saveAutoLoginValue(AutoLoginDTO dto);

    //쿠키값(세션아이디)을 가지고 있는 회원정보 조회
    Member findMemberBysessionId(String sessionId);

    //userId로 account 가져오기
    String changIdToAccount(String userId);

//    ========== 회원관리 =============== //

    //회원관리 테이블에 회원 등록
    boolean registerManageMember(Member member);

   //문의사항 등록하기
    boolean inquiryRegister(InquiryDTO dto);

    //답변 등록하기
    boolean answerRegister(AnswerDTO dto);

    //문의내역 상세보기 (시리얼 넘버로 찾는다.)
    InquiryTable findOneInquiry(String serialNumber);

    //회원 마이페이지에서 회원의 문의내역 전체 조회하기
    List<InquiryTable> findMemberInquiry(@RequestParam("userID") String userId,
                                         @RequestParam("page")Page page);

    //관리자 페이지에서 문의내역 전체 조회하기
     List<InquiryTable> findAllInquiry(@RequestParam("page") Page page);

     //문의글 수정
    boolean inquiryModify(InquiryModifyDTO dto);

    // 문의글 삭제
    boolean inquiryDelete(String serialNumber);

    // 회원 로그인 상태 - 총 문의글 수 구하기 (페이지 처리)
    int getTotalMemberInquiry(String userId);

    // 관리자 로그인 상태 - 총 문의글 수 구하기 (페이지 처리)
    int getTotalInquiry();



}
