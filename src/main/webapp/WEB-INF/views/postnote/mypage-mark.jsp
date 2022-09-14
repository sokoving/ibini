<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>

    <%@ include file="../include/static-head.jsp" %>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/mypage-mark.css">
    <link rel="stylesheet" href="/css/myPageSetting.css" />
</head>

<body>
    <!-- 최상단 wrap 영역 -->
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

        <section class="noselect">
            <div class="header-wrapper">

                <!-- 검색 영역 -->
                <div class="search-wrapper">
                    <div name="mark">
                        <div class="search-mark">
                            <select name="type" id="search-option">
                                <option value="postTitle" ${search.type == 'postTitle' ? 'selected="selected"' : '' }>책 제목</option>
                                <option value="content" ${search.type == 'content' ? 'selected="selected"' : '' }>마크 내용</option>
                                <option value="episodeNo" ${search.type == 'episodeNo' ? 'selected="selected"' : '' }>회차</option>
                            </select>
                           
                            <input id="searchText" type="text" name="keyword" value="${search.keyword}" onkeyup="enterkey()" placeholder="검색어를 입력하세요" autocomplete="off">

                            <button id="submit" class="search-button" type="button" onclick="search()">
                                검색
                            </button>
                        </div>
                    </div> <!-- end mark -->
                </div> <!-- end search-wrapper -->

                <!-- LIST 영역 -->
                <div class="list-wrapper">
                    <div class="list-button">
                        <span>MARK LIST</span>
                    </div>
                </div> <!-- end list-wrapper -->
            </div> <!-- end header-wrapper -->
            
            
            <!-- body 영역 -->
            <div class="body-wrapper scroll-bar">
                <!-- content 영역 -->
                <div class="content-wrapper" name="mark">
                    <c:if test="${empty myPageMarkList}">
                        <ul class="blank-page">
                            <li><strong>'${search.keyword}'</strong>에 대한 검색결과가 없습니다.</li>
                            <li>* 입력하신 값이 정확한지 확인해 보세요.</li>
                            <li>* 검색 옵션을 변경해서 다시 검색해 보세요.</li>
                        </ul>
                    </c:if>
                    <c:forEach var="p" items="${myPageMarkList}">
                        <div class="content" id="${p.postNo}">
                            <div class="book-wrapper flex-fs">
                                <%-- 책 이미지 --%>
                                <c:choose>
                                    <c:when test="${p.thumbImg != null}">
                                        <div class="book-image w30 noselect">
                                            <img class="book-image" src="/loadFile?fileName=${p.thumbImg}" alt="book image">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="book-image w30 noselect">
                                            <img class="book-image" src="/img/ppp111.png" alt="썸네일 이미지">
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                
                                <%-- 책 정보 --%>
                                <div class="book-info w70">
                                    <%-- 책 제목 --%>
                                    <div class="book-title">
                                        <a href="/post/detail/${p.postNo}" title="${p.postTitle}">${p.shortPostTitle}</a>
                                    </div>
                                    <div class="mark-wrapper">
                                        <%-- MARK 내용 --%>
                                        <div class="mark-list">
                                            <c:forEach var="m" items="${p.markList}" end="1">
                                                <div id="${m.markNo}" class="my-text">
                                                    <div class="episode-no">
                                                        <c:choose>
                                                            <c:when test="${p.epId == 0}">
                                                                <span id="${p.epId}" class="marking type1">${m.episodeNo}</span>
                                                            </c:when>
                                                            <c:when test="${p.epId == 1}">
                                                                <span id="${p.epId}" class="marking type2">${m.episodeNo}</span>
                                                            </c:when>
                                                            <c:when test="${p.epId == 2}">
                                                                <span id="${p.epId}" class="marking type3">${m.episodeNo}</span>
                                                            </c:when>
                                                            <c:when test="${p.epId == 3}">
                                                                <span id="${p.epId}" class="marking type4">${m.episodeNo}</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <textarea class="w100" spellcheck="false" readonly >${m.content}</textarea>
                                                    <%-- MARK 날짜 --%>
                                                    <div class="meta-data">
                                                        <span>${m.modDatetime}</span>
                                                    </div>
                                                    <hr>
                                                </div> <%-- end my-text --%> 
                                            </c:forEach>
                                        </div>    
                                        <c:if test="${p.markList.size() > 2}">
                                            <div class="view-more">
                                                <a class="noselect" onclick="click_viewMore(this)">더보기</a>
                                            </div>
                                        </c:if>
                                    </div>
                                </div> <%-- end book-info --%>
                            </div> <%-- end book-wrapper --%>
                        </div> <%-- end content --%>
                    </c:forEach>
                </div> <%-- end content-wrapper name="mark" --%>
        </section>
    </div> <!-- end wrap -->

    <script>
        /*======================================================================
            이벤트 영역
        ========================================================================*/
        function resize_textarea() {
            const $textAreaList = [...document.querySelectorAll('.my-text textarea')];

            for ($textArea of $textAreaList) {
                $textArea.style.height = "1px";
                $textArea.style.height = (2 + $textArea.scrollHeight) + "px";
            }
        }
        resize_textarea();
        
        // enter keyup Event
        function enterkey() {
            if (window.event.keyCode == 13) {
                search();
            }
        }

        // 검색 Event
        function search() {
            const $keyword = $("#searchText").val();

            if ($("#search-option option:selected").val() == 'postTitle') {     
                if ($keyword.trim() === '') {
                    alert('검색어를 입력하세요.')
                    // location.href = '/myPage/marklist?type=postTitle&keyword=';
                    return;
                }                       
                location.href = '/myPage/marklist?type=postTitle' + '&keyword=' + encodeURIComponent($keyword);

            } else if ($("#search-option option:selected").val() == 'content') {     
                if ($keyword.trim() === '') {
                    alert('검색어를 입력하세요.')
                    return;
                }                       
                location.href = '/myPage/marklist?type=content' + '&keyword=' + encodeURIComponent($keyword);

            } else if ($("#search-option option:selected").val() == 'episodeNo') {        
                if ($keyword.trim() === '') {
                    alert('검색어를 입력하세요.')
                    return;
                } 
                if (!$.isNumeric($keyword)) {
                    alert('숫자만 입력하세요.');
                    return;
                }   
                location.href = '/myPage/marklist?type=episodeNo' + '&keyword=' + $keyword;
            } 
        };

        // 옵션이 바뀌면 검색창 / 내용창 메시지를 초기화시켜주는 Event
        $("#search-option").on("change",function(){
            // $("#searchText").val('');   
            $('.blank-page li').text('');
        });

        // ... 더보기 클릭 Event
        function click_viewMore($eventTag) {
            findMarkList($eventTag);
            $($eventTag).closest('.view-more').css('display', 'none');
        }

        /*======================================================================
            함수 영역
        ========================================================================*/
        // 마크 목록 가져오기
        function findMarkList($eventTag) {

            let epId = $($eventTag).parent().siblings('.mark-list').find('.marking').attr('id');

            let postNo = $($eventTag).closest('.content').attr('id');
            let keyword = '';
            let $keyword = $("#searchText").val();

            if ($("#search-option option:selected").val() == 'content') {
                keyword = '&type=content' + '&keyword=' + encodeURIComponent($keyword);
            } 

            fetch('/myPage/viewMore/marklist/?postNo=' + postNo + keyword)
                .then(response => response.json())
                .then(markList => {

                    let markInfoList = '';
                    for (mark of markList) {
                        markInfoList +=  '<div id="' + mark.markNo + '" class="my-text">';
                        markInfoList += '    <div class="episode-no">';
           
                            if (epId == 0) {
                                markInfoList += '       <span class="marking type1">' + mark.episodeNo + '</span>';
                            } else if (epId == 1) {
                                markInfoList += '       <span class="marking type2">' + mark.episodeNo + '</span>';
                            } else if (epId == 2) {
                                markInfoList += '       <span class="marking type3">' + mark.episodeNo + '</span>';
                            } else if (epId == 3) {
                                markInfoList += '       <span class="marking type4">' + mark.episodeNo + '</span>';
                            }

                        markInfoList += '   </div>';
                        markInfoList += '   <textarea class="w100" spellcheck="false" readonly>' + mark.content + '</textarea>' +
                                        '       <div class="meta-data">' +
                                        '           <span>' + mark.modDatetime + '</span>' +
                                        '       </div>' +
                                        '       <hr>' +
                                        '   </div>';
                    }

                    $($eventTag).parent().siblings('.mark-list').append(markInfoList);
                    resize_textarea();
                });
        }
    </script>
</body>
</html>