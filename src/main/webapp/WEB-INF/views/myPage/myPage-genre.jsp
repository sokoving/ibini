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
<link rel="stylesheet" href="/css/myPageGenre.css" />

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<!-- js -->
<script src="/js/myPage-genre.js" defer></script>

<title>MYPAGE</title>
</head>
<body>

    <!-- main -->
        <%@ include file="../include/change-header.jsp" %>
        <div id="wrap">
            <div id="sideBar">
                <h2>MyPage</h2>
                <a href="/myPage">User-Info</a>
                <a href="/member/inquiry?userId=${loginUser.userId}">Help</a>
                <h3>Setting</h3>
                <a href="/myPage/platform">Platform</a>
                <a href="/myPage/genre">Genre</a>
                <a href="/myPage/marklist">BookMark</a>
                <a href="/myPage/memolist">BookMemo</a>
            </div>
            <div class="myPage-wrap">
                <h1>MyPage</h1>
                    <div class="genre-wrap">
                        <h2>Genre Setting</h2>

                        <div id="genreSetting">
                            <!-- dom 생성해서 넣어주기 -->
                            <!-- <div id="genList">
                                <div class="genreNo" id="genreNo">
                                    <span>genreNo</span>
                                </div>
                                <div class="genreName" id="genreName">
                                    <span>genreName</span>
                                </div>
                                <div class="modiNdel">
                                    <button class="genModi">수정</button>
                                    <button class="gendel">삭제</button>
                                </div>
                            </div> -->
                        </div>


                    </div>
            </div>
        </div>
    

    <script>
        
        const account = '${account}';
        const url = "/genre/c1/" + account;
        const delModiURL = "/genre/c1/" + account;
        
        

    </script>
</body>
</html>