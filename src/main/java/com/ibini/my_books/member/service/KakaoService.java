package com.ibini.my_books.member.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibini.my_books.member.domain.KakaoUserInfoDTO;
import com.ibini.my_books.member.domain.OauthValue;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

@Service
@Log4j2
public class KakaoService implements OauthService, OauthValue {
    @Override
    public String getAccessToken(String authCode) throws Exception {
        //1. 액세스 토큰을 발급 요청할 URI
        String reqUri = "https://kauth.kakao.com/oauth/token";

        //2. server to server 요청
        //2-a. 문자타입의 URL을 객체로 포장
        URL url = new URL(reqUri);

        //2-b. 해당 요청을 연결하고 그 연결정보를 담을 Connection 객체 생성
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        //2-c. 요청 정보 설정
        conn.setRequestMethod("POST");//요청 방식 설정

        // 요청 헤더 설정
        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setDoOutput(true); // 응답결과를 받겠다.

        sendAccessTokenRequest(authCode, conn);

        // 3. 응답 데이터 받기
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

            //3-a. 응답데이터를 입력스트림으로부터 읽기
            String responseData = br.readLine();
            log.info("responseData - {}", responseData);

            //3-b. 응답받은 json을 gson 라이브러리를 사용하여 자바 객체로 파싱
            JsonParser parser = new JsonParser();

            //JsonElement는 자바로 변환된 JSON
            JsonElement element = parser.parse(responseData);

            //3-c. json 프로퍼티 키를 사용해서 필요한 데이터를 추출
            JsonObject object = element.getAsJsonObject();
            String accessToken = object.get("access_token").getAsString();

            log.info("accessToken - {}", accessToken);

            return accessToken;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    private void sendAccessTokenRequest(String authCode, HttpURLConnection conn) {
        //2-d. 요청 파라미터 추가
        try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {
            StringBuilder queryParam = new StringBuilder();
            queryParam
                    .append("grant_type=authorization_code")
                    .append("&client_id=" + KAKAO_APP_KEY)
                    .append("&redirect_uri=http://localhost:8383" + KAKAO_REDIRECT_URI)
                    .append("&code=" + authCode);

            // 출력 스트림을 이용해서 파라미터 전송
            bw.write(queryParam.toString());

            // 출력 버퍼 비우기
            bw.flush();

            // 응답 상태코드 확인
            int responseCode = conn.getResponseCode();
            log.info("response code - {}", responseCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public KakaoUserInfoDTO getkakaoUserInfo(String accessToken) throws Exception {
        String reqUri = "https://kapi.kakao.com/v2/user/me";

        URL url = new URL(reqUri);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");

        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        conn.setDoOutput(true); // 응답 결과를 받겠다.

        int responseCode = conn.getResponseCode();
        log.info("UserInfo res-code - {}", responseCode); // 통신확인

        // 응답 데이터 받기
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

            //3-a. 응답데이터를 입력스트림으로부터 읽기
            String responseData = br.readLine();
            log.info("responseData - {}", responseData);

            //3-b. 응답받은 json을 gson 라이브러리를 사용하여 자바 객체로 파싱
            JsonParser parser = new JsonParser();

            //JsonElement는 자바로 변환된 JSON
            JsonElement element = parser.parse(responseData);

            //3-c. json 프로퍼티 키를 사용해서 필요한 데이터를 추출
            JsonObject object = element.getAsJsonObject();
            JsonObject kakaoAccount = object.get("kakao_account").getAsJsonObject();

            JsonObject profile = (JsonObject) kakaoAccount.get("profile");
            String nickname = profile.get("nickname").getAsString();
            String email = kakaoAccount.get("email").getAsString();

            KakaoUserInfoDTO dto = new KakaoUserInfoDTO(nickname, email);
            log.info("카카오 유저 정보 - {}", dto);

            return dto;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    public void logout(String accessToken) throws Exception {
        String reqUri = "https://kapi.kakao.com/v1/user/logout";
        URL url = new URL(reqUri);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");

        conn.setRequestProperty("Authorization","Bearer " + accessToken);
        conn.setDoOutput(true);

        int responseCode = conn.getResponseCode();
        log.info("userInfo res-code - {}", responseCode);

        // 응답 데이터 받기
        try (BufferedReader br =
                     new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

            //3-a. 응답데이터를 입력스트림으로부터 읽기
            String responseData = br.readLine();
            log.info("responseData - {}", responseData);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

} // end serviceClass
