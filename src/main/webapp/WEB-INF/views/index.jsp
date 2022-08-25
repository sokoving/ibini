<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <%@ include file="./include/static-head.jsp" %>

 <style>
        h1 {
            font-size: 50px;
            margin: 0 auto 0;
            margin: 50px auto 0px;
            /* background: gray; */
            width: 80%;
            text-align: center;
        }

        .login-menu {
            width: 200px;
            height: 200px;
            margin: 100px auto;
        }

        a {
            font-size: 50px;
            background: yellow;
        }
    </style>
</head>


<body>
  <div id="wrap">
    <%@ include file="./include/header.jsp" %>
  </div>

  <h1> Welcome~ This is ibini's index page!! </h1>

              <a href="/list">포스트 전체 목록</a> <br>
              <a href="/post/write/${account}">새 포스트 쓰기</a> <br>



  <script>
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