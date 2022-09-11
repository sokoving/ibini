<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
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
    <script src="js/post-list.js" defer></script>


</head>

<body>


    <div id="wrap">

        <%@ include file="../include/header.jsp" %>

        <div id="content-wrap">
            <!-- 새 포스트 등록 섹션 -->
            <section id="reg-sec">
                <div class="inner-section">

                    <!-- 새 글 등록 버튼 -->
                    <a href="/post/write">
                        <div class="new-post">
                            <div class="reg-btn">
                                <span class="fas fa-plus"></span>
                                <h2>새 포스트를 등록해 보세요</h2>
                            </div>
                        </div>
                    </a>
                    <!-- 새 글 등록 메뉴 -->
                    <div class="reg-menu on">
                        <ul>
                            <li>직접 입력해서 등록하기</li>
                            <li>검색해서 등록하기</li>
                        </ul>
                    </div>
                </div> <!-- // end reg-sec -->
            </section> <!-- // end section -->


            <!-- 포스트 리스트 섹션 -->
            <section id="list-sec">
                <div class="inner-section">
                    <!-- 포스트 목록 필터링 제목 -->
                    <div class="section-h2">
                        <h2>전체 포스트</h2>
                    </div>

                    <c:forEach var="p" items="${pl}">
                        <%-- 포스트 개별 영역 --%>
                        <div class="item-wrap hover">
                            <%-- left : 표지, 즐겨찾기 --%>
                            <div class="item-left">
                                <div class="thumb-box">
                                    <c:if test="${p.thumbImg != null}">
                                        <img class="post-img" src="/loadFile?fileName=${p.thumbImg}" alt="포스트 썸네일">
                                    </c:if>
                                </div>
                                <div class="favorite-btn">즐겨찾기 <span class="fas fa-plus"></span> </div>
                            </div> <%-- // end item-left --%>

                            <%-- right : 상세정보 --%>
                            <div class="item-right">

                                <%-- right-1 : 별점, 장르 --%>
                                <div class="right-1">
                                    <%-- 별점 --%>
                                    <div class="star-rate" data-star-rate=${p.starRate}></div>
                                    <%-- 장르 --%>
                                    <div class="genre-name" data-genre-id="${p.genreId}">${p.genreName}</div>
                                </div> <%-- // end right-1 --%>

                                <%-- right-2 : 제목, 작가 --%>
                                <div class="right-2">
                                    <div class="right2-1">
                                        <%-- 작가 --%>
                                        <div class="post-writer">${p.postWriter}</div>
                                        <%-- 제목 --%>
                                        <div class="post-title">
                                            <a href="/post/detail/${p.postNo}">
                                                <h3>${p.postTitle}</h3>
                                            </a>
                                        </div>
                                        <div class="pl-pu-wrap">
                                            <%-- 플랫폼 --%>
                                            <span class="plat-name" data-platform-id="${p.platformId}"
                                                style="background-color: ${p.platformBgColor}; color:${p.platformFontColor}">
                                                ${p.platformName}
                                            </span>
                                            <%-- 연재주기 or 연재상태 --%>
                                            <span class="pu-cycle">
                                                <c:choose>
                                                    <c:when test="${empty p.publishCycle}">${p.publishStatusName}
                                                    </c:when>
                                                    <c:otherwise>${p.publishCycle}</c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div> <%-- // end pl-pu-wrap --%>
                                    </div>

                                    <div class="right2-2">
                                        <%-- 진행도 --%>
                                        <div class="read-percent">
                                            <fmt:parseNumber var="percent" value="${p.curEp/p.totalEp*100}"
                                                integerOnly="true" />
                                            ${percent}%
                                        </div>
                                    </div>
                                </div> <%-- // end right-2 --%>

                                <%-- 해시태그 --%>
                                <div class="right-3">
                                    <div class="tag-one-line">${p.oneLineTag}</div>
                                </div> <%-- // end right-3 --%>
                            </div> <%-- // end item-right --%>
                        </div> <%-- // end item-wrap --%>
                    </c:forEach>



                </div> <!-- // end  inner-section-->
            </section> <!-- // end section -->
        </div>

    </div> <!-- end wrap -->



    <script>
        let oneLineTag;
        // 별 특수문자 채우는 함수
        function drawStarsAtList() {
            const $stars = document.querySelectorAll('.star-rate');
            //    console.log($stars);

            for (let i = 0; i < $stars.length; i++) {
                const num = $stars[i].dataset.starRate;
                //    console.log(num);
                let msg = '';
                for (let j = 0; j < num; j++) {
                    msg += '⭐';
                }
                $stars[i].textContent = msg;
            }

        }

        // start jQuery
        $(document).ready(function () {
            // jQueryTagTest("태그 잡기 테스트", $('h1'));

            // 별점에 따른 별 찍기
            drawStarsAtList();



        });
        // end jQuery
    </script>


</body>

</html>