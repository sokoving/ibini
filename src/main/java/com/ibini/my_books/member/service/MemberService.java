package com.ibini.my_books.member.service;

import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.AutoLoginDTO;
import com.ibini.my_books.member.dto.LoginDTO;
import com.ibini.my_books.member.repository.MemberMapper;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public Member getMember(String userId) {
        Member foundMember = memberMapper.findUser(userId);
        //날짜 포맷팅 후 세션으로 회원정보 넘기기
        Date date = foundMember.getJoinDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        foundMember.setPrettierDate(sdf.format(date));
        return foundMember;
    }

    //로그인 처리
    public LoginFlag login(LoginDTO inputData, HttpSession session
    ,HttpServletResponse response) {
        //0.회원가입 여부 확인
        Member foundMember = memberMapper.findUser(inputData.getUserId());

        if (foundMember == null) {
            return NO_ACC;
        }

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

                //자동 로그인 처리
                if(inputData.isAutoLogin()){
                    log.info("checked auto login user!!");
                    keepLogin(foundMember.getUserId(),session,response);
                }

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

    private void keepLogin(String userId, HttpSession session, HttpServletResponse response) {
        //1. 자동로그인 쿠키 생성 - 쿠키의 값으로 현재 세션의 아이디를 저장
        String sessionId = session.getId();
        Cookie c = new Cookie(LOGIN_COOKIE, sessionId);

        //2. 쿠키 설정(수명,사용 경로)
        int limitTime = 60*60*24*90;
        c.setMaxAge(limitTime);
        c.setPath("/");

        //3. 로컬에 쿠키 전송
        response.addCookie(c);

        //4.DB에 쿠키값과 수명 저장
        AutoLoginDTO dto = new AutoLoginDTO();
        dto.setSessionId(sessionId);

        //자동로그인 유지시간(초)를 날짜로 변환 (db에는 날짜형식으로 들어가야함.)
        long nowTime = System.currentTimeMillis();
        Date limitDate = new Date(nowTime +((long)limitTime*1000));
        // 밀리초에 1000을 곱해서 초로 바꾸고
        // 오늘로부터 90일 후의 시간을 구해서 limitTime에 초기화
        dto.setLimitTime(limitDate);

        dto.setUserId(userId);

        memberMapper.saveAutoLoginValue(dto);


    }

    // 비밀번호 일치 확인
    public boolean modifyPwCheck(String password, String userId) {
        Member member = memberMapper.findUser(userId);
        String dbPw = member.getPassword();

        if (encoder.matches(password, dbPw)) {
            return true;
        }
        return false;
    }

    // 회원 정보 닉네임 수정 기능
    public boolean updateName(String userId, String userName) {
        boolean flag = memberMapper.updateName(userId, userName);
        return flag;
    }


    // 회원정보 비밀번호 수정 기능
    public boolean updatePw(String userId, String password) {//, HttpSession session) {
        //비밀번호 암호화
        String encodePw = encoder.encode(password);

//        //암호화된 비밀번호로 변경 하기
//        Member m = memberMapper.findUser(userId);
//        m.setPassword(encodePw);

        //DB에 변경된 정보 업데이트
        boolean flag = memberMapper.updatePw(userId, encodePw);
        return flag;
    }

    //회원 탈퇴
    public boolean memberDelete(String userId, String password) {
        return memberMapper.memberDelete(userId, password);
    }

    public void autoLogout(String userId, HttpServletRequest request,HttpServletResponse response) {
        //1. 자동로그인 쿠키를 불러온 뒤 수명을 0초로 세팅해서 클라이언트에게 돌려보낸다.
        Cookie c = getAutoLoginCookie(request);
        if (c != null) {
            c.setMaxAge(0);
            response.addCookie(c);
        }
        //2.데이터베이스처리
        AutoLoginDTO dto = new AutoLoginDTO();
        dto.setSessionId("none");
        dto.setLimitTime(new Date());
        dto.setUserId(userId);
        memberMapper.saveAutoLoginValue(dto);

        log.info("자동 로그인 - 로그아웃처리 쿠키 삭제후 쿠기 정보 {}:",dto);
    }


    }


//
//    // 회원정보 이메일 수정 기능
//    public boolean updateEmail(String userId, String email) {
//
//        //DB에 변경된 정보 업데이트
//        boolean flag = memberMapper.updateEmail(userId, email);
//        return flag;
//    }



