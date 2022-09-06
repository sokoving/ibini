package com.ibini.my_books.member.service;

import com.ibini.my_books.genre.service.GenreService;
import com.ibini.my_books.member.common.paging.Page;
import com.ibini.my_books.member.domain.InquiryTable;
import com.ibini.my_books.member.domain.ManageMember;
import com.ibini.my_books.member.domain.Member;
import com.ibini.my_books.member.dto.*;
import com.ibini.my_books.member.repository.MemberMapper;
import com.ibini.my_books.platform.service.PlatformService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.ibini.my_books.member.service.LoginFlag.*;
import static com.ibini.my_books.util.LoginUtil.*;

@Service
@RequiredArgsConstructor
@Log4j2
public class MemberService {
    private final MemberMapper memberMapper;

    private final BCryptPasswordEncoder encoder;
    private final GenreService genreService;
    private final PlatformService platformService;

    //회원 가입 중간처리
    @Transactional
    public boolean signUp(Member member) {
        //비밀번호 인코딩
        member.setPassword(encoder.encode(member.getPassword()));
        boolean flag = memberMapper.register(member);
        if (flag) {
            // 새로 가입한 회원 계정을 가져와 기본 장르, 플랫폼 세팅
            String account = memberMapper.changeIdToAccount(member.getUserId());
            genreService.setGenreForNewMember(account);
            platformService.setPlatformForNewMember(account);

            return memberMapper.registerManageMember(member);
        }
        return false;
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
            , HttpServletResponse response) {
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
                if (inputData.isAutoLogin()) {
                    log.info("checked auto login user!!");
                    keepLogin(foundMember.getUserId(), session, response);
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
        int limitTime = 60 * 60 * 24 * 90;
        c.setMaxAge(limitTime);
        c.setPath("/");

        //3. 로컬에 쿠키 전송
        response.addCookie(c);

        //4.DB에 쿠키값과 수명 저장
        AutoLoginDTO dto = new AutoLoginDTO();
        dto.setSessionId(sessionId);

        //자동로그인 유지시간(초)를 날짜로 변환 (db에는 날짜형식으로 들어가야함.)
        long nowTime = System.currentTimeMillis();
        Date limitDate = new Date(nowTime + ((long) limitTime * 1000));
        // 밀리초에 1000을 곱해서 초로 바꾸고
        // 오늘로부터 90일 후의 시간을 구해서 limitTime에 초기화
        dto.setLimitTime(limitDate);

        dto.setUserId(userId);

        memberMapper.saveAutoLoginValue(dto);


    }

    // email-verification 변경
    public boolean verificationKakaoChange(String email){
        return memberMapper.verificationKakaoChange(email);
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

   // 회원 아이디 찾기 email로 조회
    public Member findUserId(String email){
        return memberMapper.findUserId(email);
    }

    // 회원 정보 닉네임 수정 기능
    public boolean updateName(String userId, String userName) {
        return memberMapper.updateName(userId, userName);
    }


    // 회원정보 비밀번호 수정 기능
    public boolean updatePw(String userId, String password) {//, HttpSession session) {
        //비밀번호 암호화
        String encodePw = encoder.encode(password);

//        //암호화된 비밀번호로 변경 하기
//        Member m = memberMapper.findUser(userId);
//        m.setPassword(encodePw);

        //DB에 변경된 정보 업데이트
        return memberMapper.updatePw(userId, encodePw);
    }

    // ========= 회원 탈퇴

    //회원 탈퇴사유 직접입력한 경우 내용 등록
    public boolean insertReason(String outReason){
        boolean flag = memberMapper.insertReason(outReason);
        log.info("직접입력 사유등록시 getcurrentReasonNum : {}",memberMapper.getCurrentReasonNum());
        return flag;

    }

    //회원 탈퇴 처리
    @Transactional
    public boolean memberDelete(String userId, String password,int reasonNum) {
//        탈퇴 회원의 계정으로 등록된 모든 장르 삭제
        String account = memberMapper.changeIdToAccount(userId);
        genreService.removeGenreForOutMember(account);
        platformService.removePlatformForOutMember(account);
//        탈퇴한 회원의 상태 변경
        memberMapper.changeCondition(userId);

        if(reasonNum <= 3){
            //탈퇴한 회원의 회원 탈퇴 사유 입력 {지정된 사유 입력시}
            memberMapper.insertReasonNum(userId,reasonNum);
        } else {
            reasonNum = memberMapper.getCurrentReasonNum();
            log.info("직접입력 회원정보 입력시 getcurrentReasonNum : {}",reasonNum);
            memberMapper.insertReasonNum(userId,reasonNum);
        }



        return memberMapper.memberDelete(userId, password);
    }

    public void autoLogout(String userId, HttpServletRequest request, HttpServletResponse response) {
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

        log.info("자동 로그인 - 로그아웃처리 쿠키 삭제후 쿠기 정보 {}:", dto);
    }


    //    ========== 회원관리 =============== //
//    ============= 문의글 관리하기================

    // 문의글 시간 포맷팅 메서드;
    private void convertDateFormat(InquiryTable inquiry) {
        Date inquiryDate = inquiry.getInquiryDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        //문의 등록 시간 포맷팅
        inquiry.setInquiryPrettierDate(sdf.format(inquiryDate));

        if (inquiry.getAnswerDate() == null){
            return;
        } else {
            //답변 등록 시간 포맷팅
            Date answerDate = inquiry.getAnswerDate();
            inquiry.setAnswerPrettierDate(sdf.format(answerDate));
        }
    }

    //문의글 등록하기
    public boolean inquiryRegister(InquiryDTO dto){
        return memberMapper.inquiryRegister(dto);
    }

    //답변 등록하기
    public boolean answerRegister(AnswerDTO dto){
        return memberMapper.answerRegister(dto);
    }

    // 문의내역 상세보기
    public InquiryTable findOneInquiry(String serialNumber){
        InquiryTable oneInquiry = memberMapper.findOneInquiry(serialNumber);
        convertDateFormat(oneInquiry);
        return oneInquiry;
    }

    //회원 마이페이지에서 회원의 문의내역 전체 조회하기
    public Map<String,Object> findMemberInquiry(String userId, Page page){
        HashMap<String, Object> findDataMap = new HashMap<>();
        List<InquiryTable> memberInquiry = memberMapper.findMemberInquiry(userId, page);
        for (InquiryTable inquiryTable : memberInquiry) {
            convertDateFormat(inquiryTable);
            checkNewInquiryArticle(inquiryTable);
        }

        findDataMap.put("oneList",memberInquiry);
        findDataMap.put("tc",memberMapper.getTotalMemberInquiry(userId));

        return findDataMap;
    };

    //관리자 페이지에서 문의내역 전체 조회하기
    public Map<String,Object> findAllInquiry(Page page){
        HashMap<String, Object> allFindDataMap = new HashMap<>();
        List<InquiryTable> allInquiry = memberMapper.findAllInquiry(page);
        for (InquiryTable inquiryTable : allInquiry) {
            convertDateFormat(inquiryTable);
            checkNewInquiryArticle(inquiryTable);
        }

        allFindDataMap.put("allList",allInquiry);
        allFindDataMap.put("tc",memberMapper.getTotalInquiry());
        return allFindDataMap;
    }

    // 문의글 수정
    public boolean inquiryModify(InquiryModifyDTO dto){
        return memberMapper.inquiryModify(dto);
    }

    // 문의글 삭제
    public boolean inquiryDelete(String serialNumber){
        return memberMapper.inquiryDelete(serialNumber);
    }

    // 새로 작성한 글 표시하기 위한 메서드
    private void checkNewInquiryArticle(InquiryTable i) {

        // 게시물의 작성일자와 현재 시간을 대조

        // 게시물의 작성일자 가져오기 16억 5초
        long regDateTime = i.getInquiryDate().getTime();

        // 현재 시간 얻기 (밀리초) 16억 10초
        long nowTime = System.currentTimeMillis();

        // 현재 시간 - 작성 시간
        long diff = nowTime - regDateTime;

        // 신규 게시물 제한 시간
        long limitTime = 60 * 60 * 1000; // 5분

        if (diff < limitTime) {
            i.setNewInquiryArticle(true);
        }

//        log.info("answerDate change confirm : {}",i.getAnswerDate());
//        log.info("newAnswerArticle change confirm : {}"());
        if(i.getAnswerDate() != null){
            // 게시물의 작성일자와 현재 시간을 대조
            log.info("newAnswerArticle change 메서드 confirm");

            // 게시물의 작성일자 가져오기 16억 5초
            long regDateTimeA = i.getAnswerDate().getTime();

            // 현재 시간 얻기 (밀리초) 16억 10초
            long nowTimeA = System.currentTimeMillis();

            // 현재 시간 - 작성 시간
            long diffA = nowTimeA - regDateTimeA;

            // 신규 게시물 제한 시간
            long limitTimeA = 60 * 60 * 1000; // 5분

            if (diffA < limitTimeA) {
                i.setNewAnswerArticle(true);
            }

        }
    }

//    ============== 관리자의 회원관리 =============
    public List<ManageMember> findAllManageMember(){
        return memberMapper.findAllManageMember();
    }

    public int[] currentInOutMember(){
        int inMember = memberMapper.getTotalCurrentMemberCount();
        int outMember = memberMapper.getTotalOutMemberCount();
        int [] memberArray = new int [2];
        memberArray[0] = inMember;
        memberArray[1] = outMember;
        return memberArray;
    }




}//end class


//
//    // 회원정보 이메일 수정 기능
//    public boolean updateEmail(String userId, String email) {
//
//        //DB에 변경된 정보 업데이트
//        boolean flag = memberMapper.updateEmail(userId, email);
//        return flag;
//    }



