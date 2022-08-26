<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/static-head.jsp" %>

</head>

<body>

    <h1>post-modify.jsp</h1>
    <span>포스트 번호 : ${postNo}</span>
    <form action="/post/modify" method="post">
        포스트 번호 <input type="text" name="postNo" id="" value="${postNo}" readonly>
        제목 <input type="text" name="postTitle">
        <button type="submit">등록</button>
    </form>



</body>

</html>