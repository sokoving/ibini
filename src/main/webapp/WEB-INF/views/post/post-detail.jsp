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
                                <c:if test="${p.thumbImg != null}">
                                    <img class="post-img" src="/loadFile?fileName=${p.thumbImg}" alt="썸네일 이미지">
                                </c:if>
                            </div>


                            <!-- 첨부 이미지 목록 -->
                            <div class="img-box-wrap">
                                <c:if test="${imgList != null}">
                                    <c:forEach var="img" items="${imgList}">
                                        <c:choose>
                                            <c:when test="${img.thumbnail}">
                                                <div class="img-box post-thumb">
                                                    <img class="post-img" src="/loadFile?fileName=${img.fileName}"
                                                        alt="표지 이미지" title="${img.originalFileName}">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="img-box">
                                                    <img class="post-img" src="/loadFile?fileName=${img.fileName}"
                                                        alt="첨부 이미지" title="${img.originalFileName}">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div> <!-- // end img-wrap -->

                        <!-- 포스트 정보 영역 -->
                        <div id="post-box">

                            <!-- top : 별점, 제목, 작가, 장르-->
                            <div id="post-top">
                                <span class="top-span star-span"></span>
                                <!-- 책 제목 -->
                                <div id="post-title">
                                    <h2 class="title-span">${p.postTitle}</h2>
                                </div>
                                <!-- 작가 이름 | 장르 이름 -->
                                <div id="post-writer">
                                    <span class="writer-span">${p.postWriter} | ${p.genreName}</span>
                                </div>
                            </div> <!-- // end post-top -->

                            <!-- middle : 장르, 플랫폼, 연재 상태, 연재 일시, 페이지 정보 -->
                            <div id="post-middle">






                                <div id="publish-status">
                                    <table class="middle-table">

                                        <!-- 연재 상태 -->
                                        <tr>
                                            <td class="first-td">${p.platformName}</td>
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
                                        </tr>
                                        <tr class="empty-tr">
                                            <td colspan="2">-</td>
                                        </tr>
                                        <!-- 현재, 전체 페이지 -->
                                        <c:choose>
                                            <c:when test="${p.epId == 3}">
                                                <tr>
                                                    <td class="first-td cur-ep">진행도</td>
                                                    <fmt:parseNumber var="percent" value="${p.curEp/p.totalEp*100}"
                                                        integerOnly="true" />
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
                                            <td colspan="2">
                                                <div class="toggle-box">
                                                    <i class="fas fa-lock i-lock-close" title="편집모드 잠김"></i>
                                                    <i class="fas fa-toggle-off i-toggle-off" title="편집모드 열기"></i>
                                                    <i class="fas fa-toggle-on i-toggle-on hide" title="편집모드 닫기"></i>
                                                    <i class="fas fa-lock-open i-lock-close fff" title="편집모드 열림"></i>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div> <!-- // end post-middle -->
                        </div> <!-- // end post-box -->
                    </div><!-- // end img-post-wrap -->
                    <!-- bottom : 날짜, 수정삭제목록 버튼-->
                    <div id="post-bottom">
                        <div class="date-wrap">
                            <span>등록일 ${p.shortDate.postRegDate}</span>
                            |
                            <span>수정일 ${p.shortDate.postUpdateDate}</span>
                        </div>
                        <div class="post-btn-wrap">
                            <button class="post-btn post-modi-btn" title="수정하기">
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                            <button class="post-btn post-list-btn" title="목록으로">
                                <i class="far fa-list-alt"></i>
                            </button>
                            <button class="post-btn post-del-btn" title="삭제하기">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </div>
                    </div> <!-- // end post-bottom -->


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
                                    <div class="toggle-box">
                                        <i class="fas fa-lock i-lock-close" title="편집모드 잠김"></i>
                                        <i class="fas fa-toggle-off i-toggle-off" title="편집모드 열기"></i>
                                        <i class="fas fa-toggle-on i-toggle-on hide" title="편집모드 닫기"></i>
                                        <i class="fas fa-lock-open i-lock-close fff" title="편집모드 열림"></i>
                                    </div>
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
                                    <div class="toggle-box">
                                        <i class="fas fa-lock i-lock-close" title="편집모드 잠김"></i>
                                        <i class="fas fa-toggle-off i-toggle-off" title="편집모드 열기"></i>
                                        <i class="fas fa-toggle-on i-toggle-on hide" title="편집모드 닫기"></i>
                                        <i class="fas fa-lock-open i-lock-close fff" title="편집모드 열림"></i>
                                    </div>
                                </div>

                                <div>
                                    <!-- 연관 포스트 목록 영역 -->
                                    <ul id="link-container"></ul>
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
            // 포스트 번호
            const postNo = '${p.postNo}';
            console.log(postNo);

            // 연관 포스트 토글 노드 리스트
            const $postToggles = $('#link-post-wrap .toggle-box').children();

            // 연관 포스트 목록(검색창, 목록 포함)
            const $linkUl = document.getElementById('link-container');
            /* ------------------ 연관 포스트 -------------------------- */
            // 요청 URL
            const linkURL = '/post/api/links';
            // 연관 포스트 목록 보여주기
            showLinklist(linkURL, postNo);

            // 연관포스트 목록을 요청하는 함수
            function showLinklist(linkURL, postNo) {
                fetch(linkURL + '/' + postNo)
                    .then(res => res.json())
                    .then(linkMap => {
                        makeLinkListDom(linkMap);
                    })
            }

            // 연관 포스트 목록 초기 상태
            function makeLinkListDom({
                linkList,
                linkSize
            }) {
                // ul 태그 비우기
                $linkUl.innerHTML = '';

                // 편집모드일 때 
                if (isToggleOn()) {
                    makeSearchLi(); // 검색창 만들기
                    makeLinkLi(linkList, linkSize); // 목록 만들기
                    toggleDelBtn(); // 삭제 버튼 보여주기
                }
                // 잠금모드일 때
                else {
                    if (linkSize <= 0) {
                        // 연관포스트가 없다면 
                        makeSearchLi(); // 검색창 만들기
                    } else {
                        // 연관포스트가 있다면 
                        makeLinkLi(linkList, linkSize); // 목록 만들기
                    }
                }
            }

            //검색창이 존재하는지 확인하는 함수
            function isSearchLi() {
                // 검색창이 존재하면 true, 없으면 false
                const flag = $linkUl.children.length > 0 && $linkUl.firstElementChild.classList.contains(
                    'link-zero-box');
                // console.log(flag + "(true - 검색창 있음, false - 검색창 없음)");
                return flag;
            }

            // 잠금모드면 false, 편집모드면 true
            function isToggleOn() {
                return $postToggles[1].classList.contains('hide');
            }


            // 포스트 검색창 만들기
            function makeSearchLi() {
                // 검색창이 이미 있거나 잠금 모드라면 
                // 만들지 않음 새로 만들기 않음
                if (isSearchLi()) {
                    return;
                }

                // 모두 감쌀 li
                const $linkZeroBox = document.createElement('li');
                $linkZeroBox.classList.add('link-zero-box');

                // 설명창
                const $searchMsg = document.createElement('div');
                $searchMsg.classList.add('search-msg');
                $searchMsg.innerHTML = '연관 포스트를 저장해 보세요. <br> 바로가기 링크가 생깁니다.';

                // 검색창을 감쌀 div
                const $searchWrap = document.createElement('div');
                $searchWrap.classList.add('search-wrap');
                let tag = '';

                tag += "<select class='form-select' id='linkSearchType'>" +
                    "<option value='sTitle' selected>제목</option>" +
                    "<option value='sWriter'>작가</option>" +
                    "</select>" +
                    "<input class='form-control' list='datalistOptions' id='postSearchList' placeholder='포스트를 검색해 링크를 추가해 보세요'>" +
                    "<datalist id='datalistOptions'>" +
                    "<option data-link-post-no='0' value='스페이스바를 누르면 등록된 포스트를 제외한 모든 포스트가 검색됩니다.'>" +
                    "</datalist>" +
                    "<button type='button' class='link-reg-btn btn btn-secondary'>저장</button>";

                $searchWrap.innerHTML = tag;

                // 어펜드
                $linkZeroBox.append($searchMsg);
                $linkZeroBox.append($searchWrap);
                $linkUl.prepend($linkZeroBox);
            }


            // 연관포스트 li 태그
            function makeLinkLi(linkList, linkSize) {

                // 연관 포스트 목록이 없다면 안 만듦
                if (linkSize <= 0) {
                    return;
                }

                // 있다면 linkList를 반복문 돌려서 문자열에 저장
                let liTags = '';
                for (let l of linkList) {

                    // 연재 주기가 빈문자라면 연재 상태 띄우기
                    let cycle = l.publishCycle === '' ? l.publishStatusName : l.publishCycle;
                    // 진행도 퍼센트로
                    let epPercent = Math.round(l.curEp / l.totalEp * 100)

                    // 연관 포스트 내용
                    let tag = '';
                    tag += "<li>" +
                        "<a class='link-a' href='/post/detail/" + l.postNo + "'>" +
                        "<div class='link-percent' style='background-color:" + l.platformBgColor +
                        "; color:" + l.platformFontColor + "'>" + epPercent + "%</div>" +
                        "<div class='link-post-info'>" +
                        "<div class='link-title'>" + l.postTitle + "</div>" +
                        "<div class='link-writer'>" + l.postWriter + " | " + l.platformName +
                        " - " + cycle + "</div>" +
                        "</div>" +
                        "<div class='link-post-date'>" +
                        "<span class='link-date'>수정일</span>" +
                        "<span class='link-date'>" + l.shortDate.postUpdateDate + "</span>" +
                        "</div>" +
                        "<i data-del-post-no='" + l.postNo +
                        "' class='fas fa-times-circle link-remove-btn hide'></i>" +
                        "</a>" +
                        "</li>";

                    liTags += tag;
                }

                // ul에 태그를 넣어 화면에 표시
                $linkUl.innerHTML += liTags;
            }



            // 연관 포스트 수정 모드 진입하는 함수
            function setLinkEditMod() {
                switchToggle($postToggles); // 아이콘 바꾸기
                // 잠금모드가 풀릴 때 > 검색창 생성, 삭제 버튼 생성
                if (isToggleOn()) {
                    makeSearchLi();
                    toggleDelBtn();
                    $('#postSearchList').focus();
                }
                // 잠금모드가 잠길 때
                else {
                    // 연관 목록이 있다면 잠금 모드 삭제, 삭제 버튼 숨기기
                    if ($linkUl.children.length > 1 && isSearchLi()) {
                        $linkUl.children[0].remove();
                        toggleDelBtn();
                    }
                }

            }


            // 토글, 자물쇠 아이콘, 삭제 버튼 스위치하는 함수
            function switchToggle($toggleIcons) {
                $toggleIcons[0].classList.toggle('fff');
                $toggleIcons[1].classList.toggle('hide');
                $toggleIcons[2].classList.toggle('hide');
                $toggleIcons[3].classList.toggle('fff');
            }

            function toggleDelBtn() {
                // 삭제 버튼 표시
                const $removeBtnList = $('.link-remove-btn');
                for (let $btn of $removeBtnList) {
                    $btn.classList.toggle('hide')
                }
            }

            // 연관 포스트 편집모드 열기
            $postToggles[1].onclick = setLinkEditMod;
            // 연관 포스트 편집모드 닫기
            $postToggles[2].onclick = setLinkEditMod;



            // 검색창에 입력한 포스트 제목을 포스트 번호로 바꿔 리턴하는 함수
            // 0 이하의 수를 리턴하면 없는 포스트
            function changeTitleToNum() {
                let linkPostNo = -1;

                // 인풋 입력값(포스트 제목)
                const inputValue = $('#postSearchList').val();
                // console.log(inputValue);
                const $options = $('datalist[id=datalistOptions]').children()
                for (let i = 0; i < $options.length; i++) {
                    if (inputValue === $options[i].value) {
                        return $options[i].dataset.linkPostNo
                    }
                }
                return linkPostNo;
            }

            // 연관 포스트 등록 요청하는 함수
            function connectPost(linkPostNo) {
                fetch(linkURL, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "rootPostNo": postNo,
                            "linkPostNo": linkPostNo
                        })
                    })
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'connect-success') {
                            showLinklist(linkURL, postNo);
                            const flag = confirm('연관 포스트가 등록되었습니다. \n연관 포스트 섹션 편집을 계속하시겠습니까?');
                            if (flag) {
                                // 잠금모드라면 풀기
                                if (!isToggleOn()) {
                                    setLinkEditMod();
                                }
                            } else {
                                // 편집모드라면 잠그기
                                if (isToggleOn()) {
                                    setLinkEditMod();
                                }
                            }
                        } else {
                            alert('연관 포스트 등록에 실패했습니다.');
                        }
                    })
            }


            // 연관 포스트 목록 이벤트
            $('#link-container').on({
                click: function (e) {
                    e.preventDefault();
                    // console.log(e.target);

                    // 연관포스트 등록(저장) 
                    if (e.target.matches('.link-reg-btn')) {
                        let linkPostNo = -1;

                        // 작가로 검색했을 때
                        if ($('#linkSearchType').val() === 'sWriter') {
                            // 새로 검색 요청 보내기
                            const keyword = $('#postSearchList').val();
                            const url = linkURL + '/searchPost?rootPostNo=' + postNo + "&sTitle=" +
                                keyword;
                            fetch(url)
                                .then(res => res.json())
                                .then(searchList => {
                                    // 검색 결과가 있다면 키워드와 일치하는 제목의 포스트 번호로 등록 요청 보내기
                                    if (searchList.length > 0) {
                                        for (let s of searchList) {
                                            if (s.postTitle === keyword) {
                                                linkPostNo = s.postNo;
                                                break;
                                            }
                                        }
                                    }
                                    if (linkPostNo > 0) {
                                        connectPost(linkPostNo);
                                    } else {
                                        alert("존재하지 않는 포스트입니다. ");
                                        return;
                                    }
                                })
                        }
                        // 제목으로 검색했을 때
                        else {
                            linkPostNo = changeTitleToNum();
                            if (linkPostNo > 0) {
                                connectPost(linkPostNo);
                            } else {
                                alert("존재하지 않는 포스트입니다. ");
                                return;
                            }
                        }
                    }

                    // 삭제 버튼 클릭  > 삭제 요청
                    else if (e.target.matches('.link-remove-btn')) {
                        // 다시 확인받기
                        const title = e.target.previousElementSibling.previousElementSibling
                            .firstElementChild.textContent;
                        const flag = confirm("[" + title + "] 바로가기 링크를 삭제하시겠습니까?");
                        if (!flag) {
                            return;
                        }

                        // linkId 구하기
                        const linkPostNo = e.target.dataset.delPostNo;
                        const linkId = postNo + "_" + linkPostNo;
                        console.log("link id : " + linkId);

                        // 삭제 요청 보내기
                        fetch(linkURL + "/" + linkId, {
                                method: 'DELETE'
                            })
                            .then(res => res.text())
                            .then(msg => {
                                if (msg === 'disconnect-success') {
                                    alert("연관 포스트가 삭제되었습니다.");
                                    showLinklist(linkURL, postNo);
                                } else if (msg === 'disconnect-fail') {
                                    alert("연관 포스트 삭제에 실패하였습니다.");
                                }
                            })
                    }

                    // 삭제버튼이 아닌 곳 클릭 > 링크 이동
                    else if (e.target.parentElement.parentElement.matches('.link-a')) {
                        location.href = e.target.parentElement.parentElement;
                    }
                },
                keyup: function (e) {

                    // 포스트 검색 이벤트
                    if (e.target.matches('.form-control')) {
                        // 타입과 키워드
                        const type = e.target.previousElementSibling.value;
                        // console.log(type);
                        const keyword = e.target.value;
                        // console.log(keyword);

                        // 검색 요청 보내고 결과로 option 만들기
                        const searchUrl = linkURL + '/searchPost?rootPostNo=' + postNo + "&" +
                            type + "=" + keyword;
                        fetch(searchUrl)
                            .then(res => res.json())
                            .then(searchList => {
                                makeDatalist(searchList, keyword);
                            })
                    }
                }
            });


            // 포스트 검색 결과 datalist의 옵션으로 넣는 함수
            function makeDatalist(searchList, keyword) {
                // 포스트 검생창 데이터리스트 노드
                const $searchDatalist = document.getElementById('datalistOptions');

                const len = searchList.length;
                // console.log("검색 결과 수 : " + len);

                // 데이터리스트 노드의 innterHTML 저장할 변수
                let tag = '';

                // 검색 결과가 없으면 없다고 하기
                if (len <= 0) {
                    tag = "<option data-link-post-no='0' value='" + keyword + "'> 검색 결과가 없습니다."
                }
                // 검색 결과 있으면 찾은 거 옵션에 넣어주기
                else {
                    for (let s of searchList) {
                        tag += "<option data-link-post-no='" + s.postNo +
                            "' value='" + s.postTitle + "'> " +
                            s.platformName + " | " + s.postWriter
                    }

                }

                // 데이터리스트에 태그 넣기
                $searchDatalist.innerHTML = tag;
            }



            /* ------------------ // end 연관 포스트 -------------------------- */


            // 별 찍기
            function drawStarsAtDetail(star) {
                // console.log("starRate 함수 시작!");
                // console.log(star);

                const $star = $('.star-span');
                let text = '';

                // 별점이 0일 경우
                if (star <= 0 || star === null) {
                    $star.removeClass('top-span')
                    return;
                } else {
                    // 별점이 1보다 큰 경우
                    for (let i = 0; i < star; i++) {
                        text += '⭐';
                    }
                    $star.text(text);
                }
            }

            const star = '${p.starRate}'
            drawStarsAtDetail(star);

            // 포스트 수정, 삭제, 목록 버튼 이벤트
            $('.post-btn-wrap').click(function (e) {
                clickPostBtn(e.target, postNo)
            })


        });
        // end jQuery
    </script>


</body>

</html>