-------------- Maria DB ----------------
------ cmd로 ibini database 만들기 ------
-- 폴더 이동
cd "C:\Program Files\MariaDB 10.7\bin"
-- mysql 구동, 패스워드 입력
Enter password: mariadb
-- 성공 메세지
Welcome to the MariaDb monitor.
-- ibini DATABASE 만들기
create database ibini;
-- 생성 확인 (ibini 확인)
show databases;

------ cmd로 root 패스워드 변경 ------
-- mysql 구동, 패스워드 입력 후\
-- 데이터베이스를 mysql로 변경
use mysql
-- 비밀번호 변경
MariaDB [mysql]> set password=password('mariadb');
-- 종료
exit;


--------------- 오라클--------------------
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
