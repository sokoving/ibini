-- 1. admin 계정에서 ibini 계정 생성, 권한 부여
CREATE USER ibini IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, DBA TO ibini;
commit;

-- 2. 창 왼쪽 접속 탭에서 녹색 + 버튼 클릭
--  Name : 알아보기 편한 이름 입력
-- 사용자 이름 : ibini
-- 비밀번호 : 1234
-- 테스트 클릭해서 성공하면 접속 클릭

-- 3. table start setting.sql 복붙해서 테이블 만들고 초기값 넣기
