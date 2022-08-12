package com.ibini.my_books.member.repository;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.AutoLoginDTO;
import org.apache.ibatis.annotations.Mapper;

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
    Member findUser(String account);

    // 닉네임 수정 기능 (회원정보 수정)
    boolean updateName(String account, String userName);

    // 비밀번호 수정 기능 (회원정보 수정)
    boolean updatePw(String account, String password);

    // 이메일 수정 기능 (회원정보 수정)
    boolean updateEmail(String account, String email);

    // 회원탈퇴 기능
    boolean memberDelete(String account,String password);

    //자동로그인 쿠키정보 저장
    void saveAutoLoginValue(AutoLoginDTO dto);

    //쿠키값(세션아이디)을 가지고 있는 회원정보 조회
    Member findMemberBysessionId(String sessionId);

}
