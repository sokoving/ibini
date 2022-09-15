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
                        <div class="section-h2">
                            <h2>새 글 등록하기</h2>
                        </div>

                        <div class="post-write-Btn">
                            <!-- 새 글 등록 버튼 -->
                            <a href="/post/write">
                                <div class="new-post">
                                    <div class="reg-btn">
                                        <span class="fas fa-plus"></span>
                                        <h2>직접 입력해서 <br> 등록하기</h2>
                                    </div>
                                </div>
                            </a>

                            <a href="/api/findtitle">
                                <div class="new-post">
                                    <div class="reg-btn">
                                        <span class="fas fa-plus"></span>
                                        <h2>검색해서 <br> 등록하기</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div> <!-- // end reg-sec -->
                </section> <!-- // end section -->


                <!-- 포스트 리스트 섹션 -->
                <section id="list-sec">
                    <div class="inner-section">
                        <!-- 포스트 목록 제목 -->
                        <a name="list-title"></a>
                        <div class="section-h2">
                            <h2>전체 포스트(총 ${pm.totalCount}건)</h2>
                        </div>
                        <!-- 포스트 리스트 영역 -->
                        <div class="post-list-box">
                            <c:forEach var="p" items="${pl}">
                                <%-- 포스트 개별 영역 --%>
                                <div class="item-wrap hover" data-post-no="${p.postNo}">
                                    <%-- left : 표지, 즐겨찾기 --%>
                                    <div class="item-left">
                                        <div class="thumb-box">
                                            <c:choose>
                                                <c:when test="${p.thumbImg != null}">
                                                    <img class="post-img" src="/loadFile?fileName=${p.thumbImg}"
                                                        alt="썸네일 이미지">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="post-img" src="/img/ppp111.png" alt="썸네일 이미지">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="favorite-btn">즐겨찾기 <span class="fas fa-plus"></span> </div>
                                    </div> <%-- // end item-left --%>

                                    <%-- right : 상세정보 --%>
                                    <div class="item-right">

                                        <%-- right-1 : 장르, 플랫폼, 연재 정보 --%>
                                        <div class="right-1">
                                            <%-- 장르 --%>
                                            <div class="genre-name" data-type="sGenre" data-key="${p.genreId}"
                                                title="${p.genreName}">
                                                ${p.shortGenre}
                                            </div>

                                            <div class="pl-pu-wrap">
                                                <%-- 플랫폼 --%>
                                                <span class="plat-name" data-type="sPlatform" data-key="${p.platformId}"
                                                    style="background-color: ${p.platformBgColor}; color:${p.platformFontColor}"
                                                    title="${p.platformName}">
                                                    ${p.shortPlatform}
                                                </span>
                                                <%-- 연재주기 or 연재상태 --%>
                                                <span class="pu-cycle" data-type="sPublishStatus"
                                                    data-key="${p.publishStatus}" title="${p.publishStatusName}">
                                                    <c:choose>
                                                        <c:when test="${empty p.publishCycle}">${p.publishStatusName}
                                                        </c:when>
                                                        <c:otherwise>${p.shortCycle}</c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div> <%-- // end pl-pu-wrap --%>
                                        </div> <%-- // end right-1 --%>

                                        <%-- right-2-1 : 제목, 작가, 별점 / right 2-2 : 진행도 --%>
                                        <div class="right-2">
                                            <div class="right2-1">
                                                <%-- 제목 --%>
                                                <div class="post-title">
                                                    <h3 data-key="${p.postNo}" title="${p.postTitle}">${p.shortTitle}
                                                    </h3>
                                                </div>
                                                <%-- 작가 --%>
                                                <div class="post-writer" data-type="sWriter" data-key="${p.postWriter}"
                                                    title="${p.postWriter}">
                                                    ${p.shortWriter}</div> <br>
                                                <%-- 별점 --%>
                                                <div class="star-rate" data-type="sStarRate" data-key="${p.starRate}"
                                                    title="별 ${p.starRate}개"></div>
                                            </div>

                                            <div class="right2-2">
                                                <%-- 진행도 --%>
                                                <div class="read-percent" data-cur="${p.curEp}"
                                                    data-total="${p.totalEp}" data-name="${p.epName2}">
                                                    <fmt:parseNumber var="percent" value="${p.curEp/p.totalEp*100}"
                                                        integerOnly="true" />
                                                    ${percent}%
                                                </div>
                                            </div>
                                        </div> <%-- // end right-2 --%>

                                        <%-- 해시태그 --%>
                                        <div class="right-3">
                                            <div class="tag-one-line" title="${p.oneLineTag}">
                                                <c:choose>
                                                    <c:when test="${empty p.oneLineTag}">#등록된 해시태그가 없습니다.
                                                    </c:when>
                                                    <c:otherwise>${p.oneLineTag}</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div> <%-- // end right-3 --%>
                                    </div> <%-- // end item-right --%>
                                </div> <%-- // end item-wrap --%>
                            </c:forEach>
                        </div> <!-- // end post-list-box -->

                        <!-- 포스트 목록 하단부(페이징) -->
                        <div class="list-bottom">
                            <div class="show-more" data-page-num="1">더보기</div>
                            <div class="list-end"></div>
                        </div>

                    </div> <!-- // end  inner-section-->
                </section> <!-- // end section -->
            </div>

        </div> <!-- end wrap -->
    </div>


    <script>
        // 전역변수
        const $h2 = $('#list-sec .section-h2');
        const apiURL = "/post/api/searchPost?"
        let searchURL = "";
        let pageNum = "${pm.beginPage}";
        let endPage = "${pm.endPage}";

        let oneLineTag;

        // start jQuery
        $(document).ready(function () {

            // --------------------- 기본 세팅 ------------------- //
            setting(); // list 페이지 초기 로딩 시 세팅

            function setting() {
                drawStarsAtList(); // 별점에 따라 별 찍기
                setShortTag(); // 해시태그 자르기
                makeListBottom(); // 리스트 하단부 페이징 영역 세팅
            }

            // 별 특수문자 채우기
            function drawStarsAtList() {
                const $stars = document.querySelectorAll('.star-rate');
                //    console.log($stars);

                for (let i = 0; i < $stars.length; i++) {
                    const num = $stars[i].dataset.key;
                    // console.log(num);
                    let msg = '⭐';
                    if (num === '0') {
                        msg = '😎😎😎'
                    }
                    for (let j = 1; j < num; j++) {
                        msg += '⭐';
                    }
                    $stars[i].textContent = msg;
                }
            }

            // 해시태그 글자 자르기
            function setShortTag() {
                const tagList = $('.tag-one-line');
                // console.log(tagList);
                for (let tag of tagList) {
                    let text = tag.textContent.trim();
                    // console.log(text);
                    if (text.length > 30) {
                        tag.textContent = text.substr(0, 30) + "...";
                        // console.log("자름 : " + text);
                    }
                }
            }

            // 목록 하단부 갱신하기
            function makeListBottom() {
                // 마지막 포스트까지 보여줬다면 더보기 감추기
                const $showBtn = $('.show-more')[0];
                // console.log("하단부 갱신");
                // console.log(pageNum + " / " + endPage);
                if (pageNum >= endPage) {
                    if (!$showBtn.classList.contains('hide')) {
                        $showBtn.classList.add('hide');
                    }
                } else {
                    if ($showBtn.classList.contains('hide')) {
                        $showBtn.classList.remove('hide');
                    }
                }

                // list-end 텍스트 수정
                const $listEnd = $('.list-end')[0];
                const str = pageNum + "/" + endPage +
                    "<a href='#list-title'><i class='fas fa-arrow-up'></i></a>";
                $listEnd.innerHTML = str;
            }

            // 목록 상단부 갱신하기
            // 검색 : text(size건)
            function makeSectionH2(text, size) {
                // console.log("makeSectionH2 호출 text : " + text + "/ size : " + size);
                let tag =
                    "<h2 class='h2-search'>검색 : " + text + "(" + size + "건)</h2>" +
                    "<span class='h2-icon list-reset'>" +
                    "<i class='fas fa-undo-alt' title='검색 초기화'></i>" +
                    "</span>";
                $h2[0].innerHTML = tag;
            }



            // --------------------- 요청 클릭 이벤트 ------------------- //

            // 전체 포스트에서 더보기 요청
            $('.show-more').off().click(function (e) {
                // 요청 url 만들기
                // 1. section-h2에서 기존 url 가져오기
                let url = apiURL;
                console.log("1. url : " + url);

                // 2. 타깃(show-more)에서 페이지번호 가져와 url에 붙이기
                // page-num 하나 올려주기
                pageNum++;

                url += (searchURL === "") ? "pageNum=" + pageNum : searchURL + "&pageNum=" +
                    pageNum;
                console.log("2. url : " + url);

                // 다음 페이지 조회 요청 보내기
                fetch(url)
                    .then(res => res.json())
                    .then(resList => {
                        console.log("----------------------");
                        // 추가로 받아온 포스트 넣어주기
                        makeSearchedList(resList, false);
                        makeListBottom();
                    })

            })


            // 검색 초기화
            $h2.off().click(function (e) {
                if (e.target.matches('.fa-undo-alt')) {
                    fetch("/post/api/searchPost")
                        .then(res => res.json())
                        .then(resList => {
                            $h2[0].innerHTML = "<h2>전체 포스트</h2>";
                            makeSearchedList(resList);
                            searchURL = "";
                            pageNum = "${pm.beginPage}";
                            endPage = "${pm.endPage}";
                            makeListBottom();

                            alert("검색이 초기화됩니다.");
                        })
                }
            })


            // 항목 클릭으로 검색 / 상세 페이지 이동
            $('.post-list-box').off().click(function (e) {
                e.preventDefault();
                // console.log(e.target.classList.contains('item-wrap'));

                // 포스트 목록 내부 클릭으로 검색
                const type = e.target.dataset.type;
                const key = e.target.dataset.key;

                // 선택한 노드에 data-type과 data-key 값이 모두 있다면 검색해서 재정렬
                if (type != undefined && key != undefined) {

                    // 검색 url 만들기
                    // console.log("변경전 searchURl : " + searchURL);
                    searchURL = type + '=' + key;
                    let url = apiURL + searchURL;
                    console.log("포스트 클릭 검색 url : " + url);

                    // alet과 h2에 띄워줄 text 만들기
                    let text;
                    switch (type) {
                        case 'sPublishStatus':
                            if (key === '1') {
                                text = "연재";
                            } else if (key === '2') {
                                text = "휴재";
                            } else {
                                text = "완결";
                            }
                            break;
                        case 'sStarRate':
                            text = e.target.getAttribute('title').trim();
                            break;
                        default:
                            text = e.target.textContent.trim();
                            break;
                    }
                    console.log("보내줄 text : " + text);

                    // 검색, 돔 생성 함수 호출
                    searchAndMakeList(url, text);
                }

                // 검색 영역이 아니라면 해당 상세 페이지로 이동
                else {
                    extractPostNoAndGo(e.target);
                }
            });


            // data-post-no를 탐색해서 상세 페이지로 이동하는 함수
            function extractPostNoAndGo($node) {
                let flag = $node.classList.contains('item-wrap');
                if (flag) {
                    const postNo = $node.dataset.postNo;
                    location.href = '/post/detail/' + postNo;
                } else {
                    extractPostNoAndGo($node.parentElement);
                }
            }



            // 검색 요청 보낸 후 돔 만드는 함수 호출
            function searchAndMakeList(url, text) {
                fetch(url)
                    .then(res => res.json())
                    .then(resList => {
                        console.log("---------- 검색 요청 ------------");
                        // 상단부 세팅
                        makeSectionH2(text, resList.tc);

                        // 포스트 목록 부분 세팅
                        makeSearchedList(resList);

                        // 하단부 세팅
                        pageNum = "1";
                        endPage = resList.pm.finalPage;
                        makeListBottom();

                        // 알람
                        if (text != undefined) {
                            alert("키워드 " + text + "로 " + resList.tc + "건이 검색되었습니다.");
                        }

                    })
            }



            // flag = true > 포스트 영역 비우고 새로 만들기
            // flag = false > 기존 있는 포스트 영역 밑에 더 붙여 만들기
            function makeSearchedList(list, flag = true) {
                console.log(list);
                if (list.length <= 0) {
                    alert("검색된 포스트가 없습니다.");
                    return
                }

                let tag = '';
                for (let l of list.pl) {
                    // 썸네일 
                    const thumb = l.thumbImg === null || l.thumbImg === '' ?
                        "<img class='post-img' src='/img/ppp111.png' alt='썸네일 이미지'>" :
                        "<img class='post-img' src='/loadFile?fileName=" + l.thumbImg + "' alt='포스트 썸네일'>";

                    // 연재 주기
                    const cycle = l.publishCycle === null || l.publishCycle === '' ?l.publishStatusName : l.shortCycle;

                    // 진행도
                    const epPercent = Math.round(l.curEp / l.totalEp * 100)

                    // 해시태그
                    const hashtag = l.oneLineTag == null || l.oneLineTag == '' ? "#등록된 해시태그가 없습니다." : l
                        .oneLineTag;

                    tag += "<div class='item-wrap hover' data-post-no='" + l.postNo + "'>" +
                        "<div class='item-left'>" +
                        "<div class='thumb-box'>" + thumb + "</div>" +
                        "<div class='favorite-btn'>즐겨찾기 <span class='fas fa-plus'></span> </div>" +
                        "</div>" +
                        "<div class='item-right'>" +
                        "<div class='right-1'>" +
                        "<div class='genre-name' data-type='sGenre' data-key='" + l.genreId +
                        "' title='" + l.genreName + "'>" +
                        l.shortGenre +
                        "</div>" +
                        "<div class='pl-pu-wrap'>" +
                        "<span class='plat-name' data-type='sPlatform' data-key='" + l.platformId + "'" +
                        "style='background-color: " + l.platformBgColor + "; color:" + l.platformFontColor +
                        "' title='" + l.platformName + "'>" +
                        l.shortPlatform +
                        "</span>" +
                        "<span class='pu-cycle' data-type='sPublishStatus' data-key='" + l.publishStatus +
                        "' title='" + l.publishStatusName + "'>" +
                        cycle + "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='right-2'>" +
                        "<div class='right2-1'>" +
                        "<div class='post-title'>" +
                        "<h3 data-key='" + l.postNo + "' title='" + l.postTitle + "'>" + l.shortTitle +
                        "</h3>" +
                        "</div>" +
                        "<div class='post-writer' data-type='sWriter' data-key='" + l.postWriter +
                        "' + title='" + l.postWriter + "'>" + l.shortWriter + "</div> <br>" +
                        "<div class='star-rate' data-type='sStarRate' data-key='" + l.starRate +
                        "' title='별 " + l.starRate + "개'></div>" +
                        "</div>" +
                        "<div class='right2-2'>" +
                        "<div class='read-percent' data-cur='" + l.curEp + "' data-total='" + l.totalEp + "'" +
                        "data-name='" + l.epName2 + "'>" + epPercent + "%</div>" +
                        "</div>" +
                        "</div>" +
                        "<div class='right-3'>" +
                        "<div class='tag-one-line' title='" + hashtag + "'>" + hashtag +
                        "</div></div></div></div>";
                }
                if (flag) {
                    document.querySelector(".post-list-box").innerHTML = tag;
                } else {
                    document.querySelector(".post-list-box").innerHTML += tag;
                }
                drawStarsAtList();
                setShortTag();
            }





        });
        // end jQuery
    </script>


</body>

</html>