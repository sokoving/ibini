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
    <link rel="stylesheet" href="/css/common.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <!-- custom js -->
    <script src="/js/common.js" defer></script>

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


        <section>
            <div>
                postNo : ${postNo}
                <br>
                account : ${p.account}
                <br>
                genreId : ${p.genreId} / genreName : ${p.genreName}
                <br>
                platformName : ${p.platformName}
                <br>
                caId : ${p.caId} / ${p.caName}
                <br>
                epId : ${p.epId} / ${p.epName}
                <br>
                title : ${p.postTitle}
                <br><br>
                <c:forEach var="t" items="${tagList}">
                    <span> #${t.tagName} </span>
                </c:forEach>

            </div>



        </section> <!-- // end section -->


    </div> <!-- end wrap -->



    <script>
        // start jQuery
        $(document).ready(function () {
            jQueryTagTest("h1", "태그 잡기 테스트");





        });
        // end jQuery
    </script>


</body>

</html>