<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- linear icons -->
    <!-- https://linearicons.com/free#cdn -->
    <!-- <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css"> -->
    <!-- fontawesome css: https://fontawesome.com -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"> -->

    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <!-- custom css -->
    <link rel="stylesheet" href="/css/post-reg.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <!-- custom js -->
    <script src="/js/post-reg.js" defer></script>

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <style>


    </style>

</head>

<body>


    <div id="wrap">
        <header>
            <div class="inner-header">

                <h1><img src="/img/ibini_logo_4.png" alt=""></h1>

                <nav>
                    <div class="inner-nav">
                        <div> <a href="#">로그아웃</a> </div>
                        <div><a href="#">마이페이지</a></div>
                    </div>
                </nav>

            </div> <!-- end inner-header -->
        </header> <!-- end header -->


        <section id="reg-section">


            <div id="inner-reg-section">
                <div id="thumb-section">
                    <div id="thumb-img"></div>
                    <!-- 썸네일 이미지 뜨는 박스 -->
                </div>


                <div id="post-input-section">
                    <h2> 새 포스트 등록하기</h2>
                    <form id="post-reg-form" action="/post/write" method="post">
                        <input type="hidden" name="account" value="inibi" readonly>
                        <label>
                            <span>플랫폼</span><input type="number" name="platformId" id="">
                        </label>
                        <div>
                            <label>
                                <span>카테고리</span><input type="number" name="caId" id="">
                            </label>
                            <label>
                                <span>장르</span><input type="number" name="genreId" id="">
                            </label>
                        </div>
                        <label>
                            <span>책 제목</span><input type="text" name="postTitle" id="">
                        </label>
                        <label>
                            <span>작가</span><input type="text" name="postWriter" id="">
                        </label>
                        <label>
                            <span>회차 구분</span><input type="number" name="epId" id="">
                        </label>
                        <div>
                            <label>
                                <span>현재 회차</span><input type="text" name="curEp" id="">
                            </label>
                            <label>
                                <span>총 회차</span><input type="text" name="totalEp" id="">
                            </label>
                        </div>
                        <div>
                            <label>
                                <span>연재 상태</span><input type="number" name="publishStatus" id="">
                            </label>
                            <label>
                                <span>연재 주기</span><input type="text" name="publishCycle" id="">
                            </label>
                        </div>
                        <label>
                            <span>별점</span><input type="starRate" name="starRate" id="">
                        </label>
                        <div id="post-reg-btn">등록</div>
                    </form>
                </div> <!-- // end post-input-section -->
            </div> <!-- // end inner-section -->
        </section> <!-- // end reg-section -->
    </div> <!-- end wrap -->


    <script>
        // start jQuery
        $(document).ready(function () {
            jQueryTest("post-reg.html");

            // 포스트 입력 폼 제출 이벤트
            const $regBtn = $('#post-reg-btn');
            console.log("$regBtn : " + $regBtn);
            
            


        });
        // end jQuery
    </script>


</body>

</html>