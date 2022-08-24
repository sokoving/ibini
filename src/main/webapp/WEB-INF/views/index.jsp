<%@ page contentType="text/html; charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <%@ include file="./include/static-head.jsp" %>

</head>


<body>
  <div id="wrap">
    <%@ include file="./include/header.jsp" %>
  </div>

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