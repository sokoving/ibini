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
<link rel="stylesheet" href="/css/myPageGenre.css"

<title></title>
</head>
<body>

    <!-- sideBar menu -->
    <div class="sidenav">
        <h2>MY PAGE</h2>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Clients</a>
        <h2>Setting</h2>
        <a href="http://localhost:8383/myPage/platform">Platform</a>
        <a href="http://localhost:8383/myPage/genre">Genre</a>
    </div>



    <!-- main -->
    <div class="myPage-wrap">
        <h1>genre jsp</h1>
        <h1>MyPage</h1>
            <div class="genre-wrap">
                <h2>Genre Setting</h2>

                <div id="genreSetting">
                    <!-- dom 생성해서 넣어주기 -->
                    <div id="genList">
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
                    </div>
                </div>

            </div>
    </div>
    

    <script>
        const account = "ibini";
        const url = "http://localhost:8383/genre/c1?account=" + account;
        // 도메인 리스트 불러오기
        function showGenreList() {
            
            fetch(url)
            .then(res => res.json())
            .then(genreList => {
                console.log(genreList);
                // makeGenreDom(genreList);
            });

        }
    </script>
</body>
</html>