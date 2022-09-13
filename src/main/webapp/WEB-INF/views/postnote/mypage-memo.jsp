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

    <link rel="stylesheet" href="/css/mypage-memo.css">
</head>

<body>
    <!-- 최상단 wrap 영역 -->
    <div id="wrap">
        <%@ include file="../include/header.jsp" %>
        <section class="noselect">
            <div class="header-wrapper">

                <!-- 검색 영역 -->
                <div class="search-wrapper">
                    <div name="memo">
                        <div class="search-memo">
                            <select name="type" id="search-option">
                                <option value="postTitle" ${search.type == 'postTitle' ? 'selected="selected"' : '' }>책 제목</option>
                                <option value="content" ${search.type == 'content' ? 'selected="selected"' : '' }>메모 내용</option>
                            </select>
                           
                            <input id="searchText" type="text" name="keyword" value="${search.keyword}" onkeyup="enterkey()"placeholder="검색어를 입력하세요" autocomplete="off">

                            <button id="submit" class="search-button" type="button" onclick="search()">
                                검색
                            </button>
                        </div>
                    </div> <!-- end memo -->
                </div> <!-- end search-wrapper -->

                <!-- LIST 영역 -->
                <div class="list-wrapper">
                    <div class="list-button">
                        <span>MEMO LIST</span>
                    </div>
                </div> <!-- end list-wrapper -->
            </div> <!-- end header-wrapper -->
            
            
            <!-- body 영역 -->
            <div class="body-wrapper scroll-bar">
                <!-- content 영역 -->
                <div class="content-wrapper" name="memo">
               
                    <c:if test="${empty myPageMemoList}">
                        <ul class="blank-page">
                            <li><strong>'${search.keyword}'</strong>에 대한 검색결과가 없습니다.</li>
                            <li>* 입력하신 값이 정확한지 확인해 보세요.</li>
                            <li>* 검색 옵션을 변경해서 다시 검색해 보세요.</li>
                        </ul>
                    </c:if>
                   
                    <c:forEach var="p" items="${myPageMemoList}">
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
                                        <div class="book-image w30 noselect"></div>
                                    </c:otherwise>
                                </c:choose>
                            
                                <%-- 책 정보 --%>
                                <div class="book-info w70">
                                    <%-- 책 제목 --%>
                                    <div class="book-title">
                                        <a href="/post/detail/${p.postNo}" title="상세보기">${p.postTitle}</a>
                                    </div>
                                    <div class="memo-wrapper">
                                        <%-- MEMO 내용 --%>
                                        <div class="memo-list">
                                            <c:forEach var="m" items="${p.memoList}" end="1">
                                                <div id="${m.memoNo}" class="my-text">
                                                    <textarea class="w100" spellcheck="false" readonly>${m.content}</textarea>
                                                    <%-- MEMO 날짜 --%>
                                                    <div class="meta-data">
                                                        <span>${m.modDatetime}</span>
                                                    </div>
                                                    <hr>
                                                </div> <%-- end my-text --%>
                                            </c:forEach>    
                                        </div>
                                        <c:if test="${p.memoList.size() > 2}">
                                            <div class="view-more">
                                                <a class="noselect" onclick="click_viewMore(this)">더보기</a>
                                            </div>
                                        </c:if>
                                    </div>
                                </div> <%-- end book-info --%>
                            </div> <%-- end book-wrapper --%>
                        </div> <%-- end content --%>
                    </c:forEach>
                </div> <%-- end content-wrapper name="memo" --%>
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
                    return;
                }                       
                location.href = '/myPage/memolist?type=postTitle' + '&keyword=' + encodeURIComponent($keyword);

            } else if ($("#search-option option:selected").val() == 'content') {     
                if ($keyword.trim() === '') {
                    alert('검색어를 입력하세요.')
                    return;
                }                       
                location.href = '/myPage/memolist?type=content' + '&keyword=' + encodeURIComponent($keyword);

            }
        };

        // 옵션이 바뀌면 검색창 / 내용창 메시지를 초기화시켜주는 Event
        $("#search-option").on("change",function(){
            $("#searchText").val('');   
            $('.blank li').text('');
        });

         // ... 더보기 클릭 Event
        function click_viewMore($eventTag) {
            findMemoList($eventTag);
            $($eventTag).closest('.view-more').css('display', 'none');
        }

        /*======================================================================
            함수 영역
        ========================================================================*/
        // 메모 목록 가져오기
        function findMemoList($eventTag) {

            let postNo = $($eventTag).closest('.content').attr('id');
            let keyword = '';
            const $keyword = $("#searchText").val();

            if ($("#search-option option:selected").val() == 'content') {
                keyword = '&type=content' + '&keyword=' + encodeURIComponent($keyword);
            } 

            fetch('/myPage/viewMore/memolist/?postNo=' + postNo + keyword)
                .then(response => response.json())
                .then(memoList => {

                    let memoInfoList = '';
                    for( memo of memoList) {
                        memoInfoList += makeTag_memoInfo(memo);
                    }
                    $($eventTag).parent().siblings('.memo-list').append(memoInfoList);
                    resize_textarea();
                });
        }

        // 메모 내용 만들기
        function makeTag_memoInfo(data) {
            let context = '';
            context += '<div id="' + data.memoNo + '" class="my-text">';
            context += '    <textarea class="w100" spellcheck="false" readonly>' + data.content + '</textarea>';
            context += '    <div class="meta-data">';
            context += '	    <span>' + data.modDatetime + '</span>';
            context += '	</div>';
            context += '	<hr>';
            context += '</div>';
            return context;
        }
    </script>
</body>
</html>