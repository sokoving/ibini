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
<div class="include-Header">
    <!-- header -->
    <%@ include file="../include/change-header.jsp" %>

    <div id="wrap">


        <div id="content-wrap">
            <!-- 새 포스트 등록 섹션 -->
            <section id="reg-sec">
                <div class="inner-section">
                    <h2>새 글 등록하기</h2>
                    <div class="post-write-Btn">

                        <!-- 새 글 등록 버튼 -->
                        <a href="/post/write">
                            <div class="new-post">
                                <div class="reg-btn">
                                    <span class="fas fa-plus"></span>
                                    <h2>직접 입력해서 등록하기</h2>
                                </div>
                            </div>
                        </a>

                        <a href="/api/findtitle">
                            <div class="new-post">
                                <div class="reg-btn">
                                    <span class="fas fa-plus"></span>
                                    <h2>검색해서 등록하기</h2>
                                </div>
                            </div>
                        </a>
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
                                <c:choose>
                                    <c:when test="${p.thumbImg != null}">
                                        <div class="thumb-box">
                                            <img class="thumb-img hover" src="/loadFile?fileName=${p.thumbImg}"
                                                alt="포스트 썸네일">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="thumb-box"></div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="favorite-btn">즐겨찾기 <span class="fas fa-plus"></span> </div>
                            </div> <%-- // end item-left --%>

                            <%-- center : 상세정보 --%>
                            <div class="item-center">
                                <div class="center-top">
                                    <%-- 별점 --%>
                                    <div class="star-rate" data-star-rate=${p.starRate}></div>
                                    <%-- 제목 --%>
                                    <div class="post-title">
                                        <a href="/post/detail/${p.postNo}">
                                            <h3>${p.postTitle}</h3>
                                        </a>
                                    </div>
                                    <%-- 작가 --%>
                                    <div class="post-writer">${p.postWriter}</div>
                                </div>

                                <div class="pl-pu-warp">
                                    <%-- 플랫폼 --%>
                                    <c:set var="bg" value="${p.platformBgColor}" />
                                    <c:set var="color" value="${p.platformFontColor}" />
                                    <span class="plat-name hover"
                                        style="background-color: ${p.platformBgColor}; color:${p.platformFontColor}">${p.platformName}</span>

                                        <c:choose>
                                            <c:when test="${p.publishStatus <= 1}">
                                                <c:choose>
                                                    <c:when test="${empty p.publishCycle}">
                                                        <td class="last-td">${p.publishStatusName}</td>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <td class="last-td">${p.publishCycle}</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="last-td">${p.publishStatusName}</td>
                                            </c:otherwise>
                                        </c:choose>

                                </div> <%-- // end pl-pu-wrap --%>

                                <%-- 해시태그 --%>
                                <div class="tag-one-line">${p.oneLineTag}</div>
                            </div> <%-- // end item-center --%>

                            <%-- right : 분류, 진행도, 날짜 --%>
                            <div class="item-right">
                                <div class="ca-ge-wrap">
                                    <%-- 카테고리 --%>
                                    <div class="ca-name">${p.caName}</div>
                                    <%-- 장르 --%>
                                    <div class="genre-name">${p.genreName}</div>
                                </div>
                                <%-- 진행도 --%>
                                <div class="read-percent">
                                    <fmt:parseNumber var="percent" value="${p.curEp/p.totalEp*100}"
                                        integerOnly="true" />
                                    ${percent}%
                                </div>
                                <div class="date-wrap">
                                    <%-- 포스트 수정일 --%>
                                    <div class="post-reg-date">갱신 ${p.shortDate.postUpdateDate}</div>
                                    <%-- 포스트 등록일 --%>
                                    <div class="post-reg-date">작성 ${p.shortDate.postRegDate}</div>
                                </div>
                            </div> <%-- // end item-right --%>
                        </div> <%-- // end item-wrap --%>
                    </c:forEach>



                </div> <!-- // end  inner-section-->
            </section> <!-- // end section -->
        </div>

    </div> <!-- end wrap -->
</div>


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