<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/static-head.jsp" %>

</head>

<body>


    <div id="wrap">
        <%@ include file="../include/header.jsp" %>


        <div id="content-wrap">
            <section>
                <div class="inner-section">


                    <!-- 이미지, 포스트 정보 영역 -->
                    <div id="img-post-wrap">
                        <!-- 이미지 영역 -->
                        <div id="img-wrap">

                            <!-- 썸네일 이미지 -->
                            <div id="thumb-img">
                                <img class="post-img"
                                    src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="썸네일 이미지">
                            </div>

                            <!-- 첨부 이미지 목록 -->
                            <div id="img-arr-wrap">
                                <button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous"
                                    role="button">
                                    <i class="fas fa-angle-up"></i>
                                </button>

                                <!-- 슬릭 이미지 목록 -->
                                <div class="img-box-wrap">
                                    <div class="img-box">
                                        <img class="post-img"
                                            src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img class="post-img"
                                            src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img class="post-img"
                                            src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                    </div>
                                    <div class="img-box img-half-down">
                                        <img class="post-img"
                                            src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                    </div>
                                </div>

                                <button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next"
                                    role="button" style="display: block;">
                                    <i class="fas fa-angle-down"></i>
                                </button>
                            </div>

                        </div> <!-- // end img-wrap -->

                        <!-- 포스트 정보 영역 -->
                        <div id="post-box">

                            <!-- top : 별점, 장르, 카테고리 -->
                            <div id="post-top">
                                <span class="top-span star-span"></span>
                                <span class="top-span">${p.genreId}</span>
                                <span class="top-span">${p.caName}</span>
                            </div> <!-- // end post-top -->

                            <!-- middle : 제목, 작가, 연재 정보 -->
                            <div id="post-middle">

                                <!-- 책 제목 -->
                                <div id="post-title">
                                    <h2 class="title-span">${p.postTitle}</h2>
                                </div>

                                <!-- 작가 이름 -->
                                <div id="post-writer">
                                    <span class="writer-span">${p.postWriter}</span>
                                </div>


                                <div id="publish-status">
                                    <table class="middle-table">

                                        <!-- 연재 상태 -->
                                        <tr>
                                            <td class="first-td">${p.platformId}</td>
                                            <c:choose>

                                                <c:when test="${empty p.publishCycle}">
                                                    <td class="last-td">-</td>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${p.publishStatus <= 1}">
                                                            <td class="last-td">${p.publishCycle}</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="last-td">${p.publishStatusName}</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>

                                            </c:choose>

                                        </tr>
                                        <tr class="empty-tr">
                                            <td colspan="2">-</td>
                                        </tr>
                                        <!-- 현재, 전체 페이지 -->
                                        <c:choose>
                                            <c:when test="${p.epId == 3}">
                                                <tr>
                                                    <td class="first-td cur-ep">진행도</td>
                                                    <fmt:parseNumber var="percent" value="${p.curEp/p.totalEp*100}" integerOnly="true" />
                                                    <td class="last-td tot-ep">${percent}%</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td class="first-td cur-ep">현재 ${p.epName}</td>
                                                    <td class="last-td tot-ep">전체 ${p.epName}</td>
                                                </tr>
                                                <tr>
                                                    <td class="first-td cur-ep">${p.curEp}${p.epName2}</td>
                                                    <td class="last-td tot-ep">${p.totalEp}${p.epName2}</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>

                                        <!-- 수정 버튼 -->
                                        <tr>
                                            <td colspan="2"><i class="modi-hotkey fas fa-toggle-off" title="바로 수정하기"></i>
                                            </td>
                                            <!-- <i class="fas fa-toggle-on"></i> -->
                                        </tr>
                                    </table>

                                </div>
                            </div> <!-- // end post-middle -->

                            <!-- bottom : 날짜, 수정삭제목록 버튼-->
                            <div id="post-bottom">
                                <div class="date-wrap">
                                    <span>등록일 ${p.shortDate.postRegDate}</span>
                                    |
                                    <span>수정일 ${p.shortDate.postUpdateDate}</span>
                                </div>
                                <div class="post-btn-wrap">
                                    <button class="post-btn" title="수정하기"><i class="fas fa-pencil-alt"></i></button>
                                    <button class="post-btn" title="삭제하기"><i class="far fa-trash-alt"></i></button>
                                    <button class="post-btn" title="목록으로"><i class="far fa-list-alt"></i></button>
                                </div>
                            </div> <!-- // end post-bottom -->

                        </div> <!-- // end post-box -->
                    </div><!-- // end img-post-wrap -->

                    <!-- 리모컨, 해시태그, 관련 링크 영역-->
                    <div id="remote-etc-wrap">
                        <!-- 사이드 리모컨 영역 -->
                        <div id="remote-controller">
                            <div id="inner-remote">
                                리모컨
                                <div id="go-to-controller">
                                    <!-- <select>
                                    <option value="">최상단</option>
                                    <option value="">해시태그</option>
                                    <option value="">관련 포스트</option>
                                    <option value="">포스트 노트</option>
                                    <option value="">최하단</option>
                                    <option value="">포스트 목록</option>
                                    <option value="">마이페이지</option>
                                </select> -->
                                    <button>이동</button>
                                </div>

                                <div id="search-controller">
                                    <!-- <input type="text" name="" id=""> -->
                                    <button>검색</button>
                                </div>
                            </div> <!-- // end inner-remote -->
                        </div> <!-- // end remote-conroller -->

                        <div id="etc-wrap">

                            <!-- 해시태그 영역 -->
                            <div id="hash-wrap">

                                <div class="h3-wrap">
                                    <h3>해시태그</h3>
                                    <i class="modi-hotkey fas fa-toggle-off" title="바로 수정하기"></i>
                                    <!-- <i class="fas fa-toggle-on"></i> -->
                                </div>

                                <div id="tag-container">
                                    <c:forEach var="t" items="${tagList}">
                                        <span class="hash-span" data-tag-no="${t.tagNo}">${t.tagName}</span>
                                    </c:forEach>

                                    <span class="hash-span tag-plus hide"><i class="far fa-plus-square"></i></span>
                                </div>
                            </div> <!-- // end hash-wrap -->

                            <!-- 연관 포스트 영역 -->
                            <div id="link-post-wrap">
                                <div class="h3-wrap">
                                    <h3>연관 포스트</h3>
                                    <i class="modi-hotkey fas fa-toggle-off" title="바로 수정하기"></i>
                                    <!-- <i class="fas fa-toggle-on"></i> -->
                                </div>

                                <div>
                                    <ul id="link-container">
                                        <li>
                                            <a class="link-a" href="#" title="신기방기1">
                                                <div class="link-ca">웹소설</div>

                                                <div class="link-post-info">
                                                    <div class="link-title">신기방기 뿡뿡방기 제목이 어디까지 어디까지 늘어나는 거에요?</div>
                                                    <div class="link-writer">윤정한 | <span>카카오페이지</span> <span>월, 금 10시</span>
                                                    </div>
                                                </div>

                                                <div class="link-post-date">
                                                    <span class="link-percent">100%</span>
                                                    <span class="link-date">2022.05.05</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="link-a" href="#" title="신기방기1">
                                                <div class="link-ca">웹소설</div>

                                                <div class="link-post-info">
                                                    <div class="link-title">신기방기 뿡뿡방기 제목이 어디까지 어디까지 늘어나는 거에요?</div>
                                                    <div class="link-writer">윤정한 | <span>카카오페이지</span> <span>월, 금 10시</span>
                                                    </div>
                                                </div>

                                                <div class="link-post-date">
                                                    <span class="link-percent">100%</span>
                                                    <span class="link-date">2022.05.05</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>


                            </div> <!-- // end post-link-wrap -->
                        </div><!-- // end etc-wrap -->


                    </div> <!-- // end remote-etc-wrap -->

                    <!-- 포스트 노트 영역 -->


                </div> <!-- // end inner-section -->
            </section> <!-- // end section -->
        </div>
    </div> <!-- end wrap -->

    <script src="/js/post-detail.js"></script>

    <script>
        // start jQuery
        $(document).ready(function () {
            // jQueryTagTest("태그 잡기 테스트", $('h1'));

            const star = '${p.starRate}'
            console.log(star);
            starRate(star);




        });
        // end jQuery
    </script>


</body>

</html>