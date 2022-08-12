package com.ibini.my_books.member.service;

//sns 로그인 통신처리 담당[구글,네이버,카카오 모두 사용]
public interface OauthService {

    //액세스토큰 발급 메서드

    /**
     * 액세스토큰 발급 메서드
     * @param authCode - 인승서버가 발급한 인가코드
     * @return 액세스 토큰
     * @throws Exception - 통신에러
     */
    String getAccessToken(String authCode) throws Exception;
}
