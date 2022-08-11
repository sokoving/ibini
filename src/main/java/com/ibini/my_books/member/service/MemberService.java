package com.ibini.my_books.member.service;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.LoginDTO;
import com.ibini.my_books.member.dto.ModifyDTO;
import com.ibini.my_books.member.repository.MemberMapper;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import static com.ibini.my_books.member.service.LoginFlag.*;
import static com.ibini.my_books.util.LoginUtil.*;

@Service
@RequiredArgsConstructor
@Log4j2
public class MemberService {
    private final MemberMapper memberMapper;

    private final BCryptPasswordEncoder encoder;

    //회원 가입 중간처리
    public boolean signUp(Member member) {
        //비밀번호 인코딩
        member.setPassword(encoder.encode(member.getPassword()));

        return memberMapper.register(member);
    }


    // 중복확인 중간처리
    public boolean checkSignUpValue(String type, String value) {
        HashMap<String, Object> checkMap = new HashMap<>();
        checkMap.put("type", type);
        checkMap.put("value", value);

        return memberMapper.isDuplicate(checkMap) == 1;
    }

    // 회원 정보 조회 중간 처리;
    public Member getMember(String account) {
        Member foundMember = memberMapper.findUser(account);
        //날짜 포맷팅 후 세션으로 회원정보 넘기기
        Date date = foundMember.getJoinDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        foundMember.setPrettierDate(sdf.format(date));
        return foundMember;
    }

    //로그인 처리
    public LoginFlag login(LoginDTO inputData, HttpSession session) {
        //0.회원가입 여부 확인
        Member foundMember = memberMapper.findUser(inputData.getAccount());

        //날짜 포맷팅 후 세션으로 회원정보 넘기기
        Date date = foundMember.getJoinDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        foundMember.setPrettierDate(sdf.format(date));

        if (foundMember != null) {
            if (encoder.matches(inputData.getPassword(), foundMember.getPassword())) {
                //로그인 성공
                //세션에 사용자 정보기록 저장
                session.setAttribute("loginUser", foundMember);
                //세션 타임아웃 설정
                session.setMaxInactiveInterval(60 * 60); // 1시간 설정
                return SUCCESS;
            } else {
                //비번 틀림
                return NO_PW;
            }
        } else {
            //아이디 없음
            return NO_ACC;
        }
    }

    // 비밀번호 일치 확인
    public boolean modifyPwCheck(String originPassword, String account) {
        Member member = memberMapper.findUser(account);
        String dbPw = member.getPassword();

        if (encoder.matches(originPassword, dbPw)) {
            return true;
        }
        return false;
    }

    // 회원 정보 닉네임 수정 기능
    public boolean updateName(String account, String userName) {
        boolean flag = memberMapper.updateName(account, userName);
        return flag;
    }


    // 회원정보 비밀번호 수정 기능
    public boolean updatePw(String account, String password) {//, HttpSession session) {
        //비밀번호 암호화
        String encodePw = encoder.encode(password);

//        //암호화된 비밀번호로 변경 하기
//        Member m = memberMapper.findUser(account);
//        m.setPassword(encodePw);

        //DB에 변경된 정보 업데이트
        boolean flag = memberMapper.updatePw(account, encodePw);
        return flag;
    }

    //회원 탈퇴
    public boolean memberDelete(String account, String password) {
        return memberMapper.memberDelete(account, password);
    }


//
//    // 회원정보 이메일 수정 기능
//    public boolean updateEmail(String account, String email) {
//
//        //DB에 변경된 정보 업데이트
//        boolean flag = memberMapper.updateEmail(account, email);
//        return flag;
//    }


}
