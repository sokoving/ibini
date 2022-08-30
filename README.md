# ibini books 소개

- 이비니 북스는 5명의 학생이 웹 프로그램 개발 공부 목적으로 만들고 있는 사이트입니다.
- 이비니 프로젝트는 여러 곳에서 여러 형태로 구독, 감상하고 있는 콘텐츠를 한 곳에 기록해서 효율적으로 관리해보고자 만들어진 비영리 학습용 웹 사이트입니다.
- 1차 목표로는 원하는 도서의 정보와 사용자가 읽고 있는 정보를 기록하고 조회하는 것으로 도서 검색 api를 적용해보고자 합니다.
- 깔쌈하게 멋진 프로그램 만들어보겠습니다 많관부!

--------------------------------------------------------------------------------------------------

# application.properties 설정

## 톰캣 포트

- server.port = 8383

## view resolver setting

- spring.mvc.view.prefix=/WEB-INF/views/
- spring.mvc.view.suffix=.jsp

------------------------------------------------------------

# 깃헙 작업 방법

## 푸시, 패치, 병합을 할 때는 모든 변경사항들이 커밋된 상태여야 합니다

- 만약 마스터에서 작업을 했다면 변경사항 롤백해 주시고 각자 브랜치에 다시 작업해 주세요

## 커밋 메시지는 통일해주세요

- 예시) [22.08.09 여운] 패키지 초기화

1. (개인) 개별 작업물 브랜치에 푸시하기
2. (개인) 팀장한테 브랜치에 푸시했으니 병합해달라고 하기
3. (팀장) 개별 작업물이 담긴 브랜치를 merge_master에 병합
4. (팀장) 버그가 없다면 master에 적용 후 푸시
5. (개인) 병합 완료되면 인텔리제이 git > 페치 클릭
6. (개인) 페치 끝나면 각자 브랜치에서 마스터를 병합

- 인텔리제이 git > 병합 > 마스터 선택

------------------------------------------------------------

# 알림
- 작업 중 다른 분들이 알아야 할 사항이 생긴다면 여기에 써주세요

## 4. (22.08.31) 새 글 등록할 때 첨부 이미지 로드가 안 될 때
- E:\ibiniImg\upload 이 경로로 폴더를 만들어 주세요

## 3. (22.08.29) insert into 안 해도 됩니다
- 웹에서 회원가입하면 기본 장르랑 플랫폼이 세팅됩니다
- /myPage에서 플랫폼과 장르 수정, 삭제 가능 (등록은 새 글 쓰기에서)

## 3.  (22.08.06)  현재 로그인한 유저의 account가 필요할 때
- 해당 요청 url을 처리하는 메서드에서 HttpSession session 파라메터 받고
- LoginUtil.getCurrentMemberAccountForDB(session); 
- LoginUtil.getCurrentMemberAccountForDB 메서드로 계정을 받을 수 있습니다 

## 2. (22.08.25) header.jsp 사용하기
- 전체 태그는 #wrap으로 감싸주고
- include file을 header-wrap으로 감싸주기
- content 구역은 content-wrap으로 감싸서 header랑 content-wrap 분리후 사용
- section 태그를 쓰면 list나 detail페이지의 회색 테두리선 쓸 수 있음
```html
        <body>
            <div id="wrap">
                <div id="header-wrap">
                    <%@ include file="./include/header.jsp" %>
                </div>
                <div id="content-wrap">
                    <section id="reg-sec">
                        <h2>HTML코드</h2>
                    </section>
                </div>
            </div>
        </body>
```

## 1. (22.08.06) create table SQL
- DB 테이블이 추가됐고 기존 테이블도 스펙이 바뀌었습니다.
- 새로 기존 테이블을 drop하고 다시 만들어 주세요
- 새로 회원가입을 하려면 새로 만든 테이블이 필요합니다
