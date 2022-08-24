<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- RESET CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css -->
<link rel="stylesheet" href="/css/myPageSetting.css" />


<title>MYPAGE</title>
</head>
<body>

    <!-- sideBar account 정보 수정-->
    <!-- account 정보 넘기기 -->
    <div class="sidenav">
        <a href="http://localhost:8383/${account}/myPage">MY PAGE</a>
        <a href="#"></a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Clients</a>s
        <a href="#">Setting</a>
        <a href="http://localhost:8383/myPage/${account}/platform">Platform</a>
        <a href="http://localhost:8383/myPage/${account}/genre">Genre</a>
    </div>

    <div class="myPage-wrap">
        <h1>main page</h1>
    </div>


</body>
</html>