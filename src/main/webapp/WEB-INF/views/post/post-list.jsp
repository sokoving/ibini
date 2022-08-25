<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ibini books</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- linear icons -->
    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">


    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- custom css -->
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/post-list.css">

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- custom js -->
    <script src="/js/common.js" defer></script>


</head>

<body>


    <div id="wrap">

        <%@ include file="../include/header.jsp" %>

        <!-- 새 포스트 등록 섹션 -->
        <section>
            <div class="inner-section reg-sec">

                <!-- 새 글 등록 버튼 -->
                <div class="new-post">
                    <div class="reg-btn">
                        <span class="fas fa-plus"></span>
                        <span>새 포스트를 등록해 보세요!</span>
                    </div>
                </div>
                <!-- 새 글 등록 메뉴 -->
                <div class="reg-menu on">
                    <ul>
                        <li>직접 입력해 등록하기</li>
                        <li>검색해 등록하기</li>
                    </ul>
                </div>
            </div> <!-- // end reg-sec -->
        </section> <!-- // end section -->


        <!-- 포스트 리스트 섹션 -->
        <section>
            <div class="inner-section list-sec">


                <c:forEach var="p" items="${pl}">
                    <a href="/post/detail/${p.postNo}">제목 : ${p.postTitle} </a>
                    <br>
                    작가 : ${postWriter} <br>
                    카테고리 이름 : ${p.caName} <br>
                    현재 ${p.epName} : ${p.curEp}${p.epName2} <br>
                    총 ${p.epName} : ${p.totalEp}${p.epName2} <br>
                    장르 : ${p.genreName} <br>
                    플랫폼 : ${p.platformName} <br>
                    등록일 : ${p.shortDate.postRegDate} <br>
                    수정일 : ${p.shortDate.postUpdateDate} <br>
                    해시태그 : ${p.oneLineTag} <br>
                    <img src="${p.thumbImg}" alt="">

                </c:forEach>

            </div> <!-- // end list-sec -->
        </section> <!-- // end section -->

    </div> <!-- end wrap -->



    <script>
        // start jQuery
        $(document).ready(function () {
            // jQueryTagTest("태그 잡기 테스트", $('h1'));




        });
        // end jQuery
    </script>


</body>

</html>