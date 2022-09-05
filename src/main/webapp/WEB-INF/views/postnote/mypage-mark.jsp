<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script> -->

    <!-- jQuery 기본 js파일 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/mypage-mark.css">
</head>

<body>
    <!-- 최상단 wrap 영역 -->
    <div id="wrap">
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
            <div class="body-wrapper">
                <!-- content 영역 -->
                <div class="content-wrapper" name="mark">
                    <c:if test="${empty myPageMarkList}">
                        <ul class="blank-page" style="margin: 2rem;">
                            <li style="margin-bottom: 1rem;"><strong style="color: red; font-size: 1.3em;">'${search.keyword}'</strong>에 대한 검색결과가 없습니다.</li>
                            <li>* 입력하신 값이 정확한지 확인해 보세요.</li>
                            <li>* 검색 옵션을 변경해서 다시 검색해 보세요.</li>
                        </ul>
                    </c:if>
                    <c:forEach var="p" items="${myPageMarkList}">
                        <div class="content">
                            <div class="book-wrapper flex-fs">
                                <!-- 책 이미지 -->
                                <c:choose>
                                    <c:when test="${p.thumbImg != null}">
                                        <div class="book-image w30 noselect">
                                            <img class="book-image" src="/loadFile?fileName=${p.thumbImg}" alt="book image">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="book-image w30 noselect"></div>
                                    </c:otherwise>
                                </c:choose>
                            
                                
                                <!-- epId (0:회차 1:페이지 2:권수 3:퍼센트) -->
                                <span id="epId" class="hidden">${p.epId}</span>
                                
                                <!-- 책 정보 -->
                                <div class="book-info w70">
                                    <!-- 책 제목 -->
                                    <div class="book-title">
                                        <span>${p.postTitle}</span>
                                    </div>
                                    <!-- MARK 내용 -->
                                    <c:forEach var="m" items="${p.markList}" end="1">
                                        <div id="mark-info" class="my-text">
                                            <div class="episode-no">
                                                <c:choose>
                                                    <c:when test="${p.epId == 0}">
                                                        <span class="marking-type1">${m.episodeNo}</span>
                                                    </c:when>
                                                    <c:when test="${p.epId == 1}">
                                                        <span class="marking-type2">${m.episodeNo}</span>
                                                    </c:when>
                                                    <c:when test="${p.epId == 2}">
                                                        <span class="marking-type3">${m.episodeNo}</span>
                                                    </c:when>
                                                    <c:when test="${p.epId == 3}">
                                                        <span class="marking-type4">${m.episodeNo}</span>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                            <textarea class="w100" spellcheck="false" readonly >${m.content}</textarea>
                                            <!-- Mark 날짜 -->
                                            <div class="meta-data">
                                                <span>${m.modDatetime}</span>
                                            </div>
                                            <hr>
                                        </div> <!-- end my-text -->
                                    </c:forEach>    
                                    <c:if test="${p.markList.size() > 2}">
                                        <div class="view-more">
                                            <a class="noselect" onclick="click_viewMore(this)">... 더보기</a>
                                        </div>
                                        <!-- 포스트 번호 -->
                                        <span id="postNo" style="display: none;">${p.postNo}</span>
                                    </c:if>
                                </div> <!-- end book-info -->
                            </div> <!-- end book-wrapper -->
                        </div> <!-- end content -->
                    </c:forEach>
                </div> <!-- end content-wrapper name="mark" -->
        </section>
    </div> <!-- end wrap -->

    <script>
        /*======================================================================
            이벤트 영역
        ========================================================================*/
        function resize_textarea() {
            const $textAreaList = [...document.querySelectorAll('.my-text textarea')];

            for ($textArea of $textAreaList) {
                // console.log($textArea.value);
                $textArea.style.height = "1px";
                $textArea.style.height = (12 + $textArea.scrollHeight) + "px";
            }
        }

        resize_textarea();

        // ... 더보기 클릭
        function click_viewMore($eventTag) {

            const $postNo = $eventTag.parentElement.nextElementSibling.textContent;
            console.log($postNo);
            // fetch() 사용하여 팝업페이지 호출 및 책/회차 등의 변수값 전달
            // 지금은 샘플html이니 redirect 처리를 하도록 한다.
            location.href = '/test/page2/'+ $postNo;
        }
        
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
                    alert('검색어를 입력하세요')
                    // location.href = '/mypostnote/marklist?type=postTitle&keyword=';
                    return;
                }                       
                location.href = '/mypostnote/marklist?type=postTitle' + '&keyword=' + $keyword;

            } else if ($("#search-option option:selected").val() == 'content') {     
                if ($keyword.trim() === '') {
                    alert('검색어를 입력하세요')
                    return;
                }                       
                location.href = '/mypostnote/marklist?type=content' + '&keyword=' + $keyword;

            } else if ($("#search-option option:selected").val() == 'episodeNo') {        
                if ($keyword.trim() === '') {
                    alert('검색어를 입력하세요')
                    return;
                } 
                if (!$.isNumeric($keyword)) {
                    alert('숫자만 입력하세요');
                    return;
                }   
                location.href = '/mypostnote/marklist?type=episodeNo' + '&keyword=' + $keyword;
            } 
        };

        // 옵션이 바뀌면 검색창 / 내용창 메시지를 초기화시켜주는 Event
        $("#search-option").on("change",function(){
            $("#searchText").val('');   
            $('.blank li').text('');
        });

        /*======================================================================
            함수 영역
        ========================================================================*/
        $(document).ready(function(){
            
        });
    </script>
</body>
</html>