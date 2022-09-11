<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

  <%@ include file="./include/static-head.jsp" %>
</head>


<body>
  <!-- header -->
    <%@ include file="./include/change-header.jsp" %>
    <div id="wrap">
          <div id="header-wrap">

          </div>
        <div id="content-wrap">
            <h1> Welcome~ This is ibini's index page!! </h1>

            <a href="/list">포스트 전체 목록</a> <br>
            <a href="/post/write/${account}">새 포스트 쓰기</a> <br>
            <a href="/upload-form">파일 업로드 테스트</a> <br>
            <a href="/api/findtitle">검색및 기능등록 테스트</a>
        </div>
    </div>


  



    <script>
      const auth = '${loginUser.auth}';
      console.log(auth);

      

        const msg = '${msg}';
        if (msg === 'join-out-success') {
            alert('회원탈퇴가 정상적으로 처리 되었습니다.');
            }

        if (msg === 'modify-success') {
        alert('비밀번호 변경 완료');
        }

        if (msg === 'modify-fail') {
        alert('비밀번호 변경 실패');
        }


    </script>

</body>

</html>