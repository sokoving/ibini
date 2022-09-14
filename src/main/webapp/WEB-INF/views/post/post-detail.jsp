<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/static-head.jsp" %>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

    <!-- post-note CSS -->
    <link rel="stylesheet" href="/css/post-note.css">

    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
</head>

<body>
    <!-- header -->
    <a name="go-top"></a>
    <%@ include file="../include/change-header.jsp" %>

    <div id="wrap">

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
                                        <c:if test="${img.thumbnail eq false}">
                                            <div class="img-box">
                                                <img class="post-img" src="/loadFile?fileName=${img.fileName}"
                                                    alt="첨부 이미지" title="${img.originalFileName}">
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div> <!-- // end img-wrap -->

                        <!-- 포스트 정보 영역 -->
                        <div id="post-box">

                            <!-- top : 별점, 제목, 작가-->
                            <div id="post-top">
                                <span class="star-rate" data-key="${p.starRate}" title="별 ${p.starRate}개"></span>
                                <!-- 책 제목 -->
                                <div id="post-title">
                                    <h2 class="title-span">${p.postTitle}</h2>
                                </div>
                                <!-- 작가 이름 | 장르 이름 -->
                                <div id="post-writer">
                                    <span class="writer-span">${p.postWriter}</span>
                                </div>
                            </div> <!-- // end post-top -->

                            <!-- middle : 장르, 플랫폼, 연재 상태, 연재 일시, 페이지 정보 -->
                            <div id="post-middle">

                                <div class="m-tr tr-down">
                                    <!-- 플랫폼 -->
                                    <div class="l-td plat-span">
                                        <span
                                            style="background-color: ${p.platformBgColor}; color:${p.platformFontColor}">${p.platformName}</span>
                                    </div>
                                    <!-- 장르 -->
                                    <div class="r-td genre-span"><span>${p.genreName}</span></div>
                                </div>

                                <!-- 연재 상태 / 연재 일시 -->
                                <div class="m-tr tr-down colspan-2">
                                    <c:choose>
                                        <c:when test="${empty p.publishCycle}">${p.publishStatusName}
                                        </c:when>
                                        <c:otherwise>${p.shortCycle}</c:otherwise>
                                    </c:choose>
                                </div>

                                <!-- 현재, 전체 페이지 -->
                                <c:choose>
                                    <c:when test="${p.epId == 3}">
                                        <div class="m-tr">
                                            <fmt:parseNumber var="percent" value="${p.curEp/p.totalEp*100}"
                                                integerOnly="true" />
                                            <div class="l-td">진행도</div>
                                            <div class="r-td">${percent}%</div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="m-tr">
                                            <div class="l-td">현재 ${p.epName}</div>
                                            <div class="r-td">전체 ${p.epName}</div>
                                        </div>
                                        <div class="m-tr tr-down">
                                            <div class="l-td">${p.curEp}${p.epName2}</div>
                                            <div class="r-td">${p.totalEp}${p.epName2}</div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

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
                            <div class="remote-title">리모컨</div>
                            <div id="go-to-controller">
                                <select id="select-remote-option">
                                    <option value="#hash-tag">해시태그</option>
                                    <option value="#link-post">연관 포스트</option>
                                    <option value="#post-note">포스트 노트</option>
                                </select>
                                <button id="move-scroll-btn">이동</button>
                            </div>
                            <div id="go-down-list">
                                <a href="#go-top" class="go-top"><i class="fas fa-arrow-up"></i>위로</a>
                                <a href="#go-down" class="go-down"><i class="fas fa-arrow-down"></i>아래로</a>
                                <a href="/list" class="go-list"><i class="fas fa-list"></i>목록</a>
                            </div>
                            <!-- <div id="search-controller">
                                    <input type="text" name="" id="">
                                    <button>검색</button>
                                </div> -->
                        </div> <!-- // end inner-remote -->
                    </div> <!-- // end remote-conroller -->

                    <div id="etc-wrap">

                        <!-- 해시태그 영역 -->
                        <a name="hash-tag"></a>
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
                            <div class="inputHashtag hide">
                                <div class="label">
                                    <label id="InfoText">해시태그를 추가로 글에 추가할 수 있습니다.</label>
                                    <label id="InfoText">예시) #태그 #해시태그 </label>
                                </div>
                                <div id="tagInputAndBtn">
                                    <input type="text" id="hashtagInput">
                                    <button type="button" id="hashtagInputBtn">저장</button>
                                </div>

                            </div>

                            <div id="tag-container">
                                <c:forEach var="t" items="${tagList}">
                                    <span class="hash-span" data-tag-no="${t.tagNo}">${t.tagName}</span>
                                </c:forEach>
                                <!-- onclick="location.href='/hashtag/${t.tagName}'" -->

                                <span class="hash-span tag-plus hide"><i class="far fa-plus-square"></i></span>
                            </div>
                        </div> <!-- // end hash-wrap -->

                        <!-- 연관 포스트 영역 -->
                        <a name="link-post"></a>
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

                        <!-- 포스트 노트 영역 -->
                        <a name="post-note"></a>
                        <div class="h3-wrap">
                            <h3>포스트 노트</h3>
                        </div>
                        <%@ include file="../postnote/post-detail-note.jsp" %>

                    </div><!-- // end etc-wrap -->
                </div> <!-- // end remote-etc-wrap -->


        </div> <!-- // end inner-section -->
        </section> <!-- // end section -->
    </div>
    <a name="go-down"></a>
    </div> <!-- end wrap -->

    <script src="/js/post-detail.js"></script>
    <script src="/js/post-note.js" defer></script>

    <script>
        // post-note.js
        const account = '${p.account}';
        const postNo = '${p.postNo}';
    </script>

    <script>
        // start jQuery
        $(document).ready(function () {
            // 포스트 번호
            const postNo = '${p.postNo}';
            console.log(postNo);

            let tagContainer = document.querySelector('#tag-container');

            // 첫화면에서 클릭이벤트 작동
            console.log('tagContainer : ', tagContainer);
            tagContainer.onclick = e => {

                console.log(e.target);
                console.log(e.target.innerText);
                let tagSpace = e.target.innerText;
                url = '/hashtag/' + tagSpace;
                console.log(url);
                window.location.href = url;


            }


            // ===================== hashtag ============================
            // hashtag 편집모드 열기 이벤트
            const $hashtoggles = $('#hash-wrap .toggle-box').children();
            // 편집모드 열기
            $hashtoggles[1].onclick = e => {
                // toggles 열기
                sethashtagEditMod();

                const account = '${p.account}';
                const postNo = '${p.postNo}';
                console.log(account);
                console.log(postNo);

                let tagUrl = 'http://localhost:8383/hashtag/api/v1/' + account + '/' + postNo;
                console.log(tagUrl);



                // tag click 막기
                tagContainer.onclick = e => {
                    console.log('tagContainer onclick');
                    e.preventDefault();
                    console.log(e.target.dataset.tagNo);

                    console.log(e.target);
                    console.log('dataset : ', e.target.dataset.tagNo);
                    //data-set 잡아오기 -> 비동기 삭제 처리 -> 비동기 랜더링
                    let dataset = e.target.dataset.tagNo;

                    console.log('장르 삭제 - genreId : ', dataset);

                    if (!confirm('선택하신 장르를 삭제하시겠습니까?')) return;

                    fetch(tagUrl + '/' + dataset, {
                            method: 'DELETE'
                        })
                        .then(res => res.text())
                        .then(msg => {
                            if (msg === 'del-success') {
                                alert('삭제 성공!');
                                showHashtagDom();
                                console.log('delete - hashtag');
                            } else {
                                alert('삭제 실패!!');
                            }
                        });


                }

                const hashtagInput = document.getElementById('hashtagInput');
                const hashtagInputBtn = document.getElementById('hashtagInputBtn');

                hashtagInputBtn.onclick = e => {
                    // 클릭이벤트
                    let addTag = hashtagInput.value;
                    console.log(addTag);

                    // 비동기 통신 전송 - account 정보 + postNo 정보
                    const platformData = {

                        "postNo": postNo,
                        "account": account,
                        "tagName": addTag
                    }
                    console.log('platformData : ', platformData);

                    // POST 요청정보 객체
                    const reqInfo = {
                        method: "POST",
                        headers: {
                            'content-type': 'application/json'
                        },
                        body: JSON.stringify(platformData)

                    };
                    console.log('reqInfo : ', reqInfo);


                    fetch(tagUrl, reqInfo)
                        .then(res => res.text())
                        .then(msg => {
                            if (msg === "insert-success") {
                                alert('새로운 해시태그가 등록되었습니다.');
                                // 비워주기
                                hashtagInput.value = '';
                                showHashtagDom();

                            } else {
                                alert('새로운 해시태그 저장을 실패하였습니다.');
                            }
                        })



                }

                function showHashtagDom() {
                    console.log(tagUrl);

                    fetch(tagUrl)
                        .then(res => res.json())
                        .then(hashtagList => {
                            console.log(hashtagList);
                            makeHashtagDom(hashtagList);
                        });


                }


            }
            //닫기
            $hashtoggles[2].onclick = e => {
                sethashtagEditMod();
                // click event 작동하기
                e.preventDefault();
                tagContainer.onclick = e => {

                    console.log(e.target);
                    console.log(e.target.innerText);
                    let tagSpace = e.target.innerText;
                    url = '/hashtag/' + tagSpace;
                    console.log(url);
                    window.location.href = url;


                }
                // console.log('preventDefaul');
            }

            function sethashtagEditMod() {
                console.log('sethashtagEditMod');
                switchToggle($hashtoggles);
                $('.inputHashtag').toggleClass('hide');
                console.log('sethashtagEditMod');
                // $('#tag-container').css("cursor", "url(../img/cursor.cur) 20 30, url(../img/cursor.cur) 20 30, auto" );

            }

            function setLinkEditMod() {
                switchToggle($postToggles); // 아이콘 바꾸기
                $('.search-wrap').toggleClass('hide') // 검색창 표시
                const $removeBtnList = $('.link-remove-btn');
                for (let $btn of $removeBtnList) {
                    $btn.classList.toggle('hide')
                }
            }

            // DOM 생성!!!!!
            function makeHashtagDom(hashtagList) {

                console.log('makeHashtagDom');

                const tagContainer = document.getElementById('tag-container');
                let tag = '';
                tagContainer.innerHTML = tag;
                for (let loop in hashtagList) {

                    console.log(hashtagList);


                    tagNo = hashtagList[loop].tagNo;
                    tagName = hashtagList[loop].tagName;
                    console.log(tagNo);
                    console.log(tagName);

                    tag += `
                        <span class="hash-span" data-tag-no="` + tagNo + `">` + tagName + `</span>
                    `;

                }
                tagContainer.innerHTML = tag;

            }


            /* ------------------ 연관 포스트 -------------------------- */
            // 요청 URL
            const linkURL = '/post/api/links';
            /* ------------------ 연관 포스트 -------------------------- */

            // 연관 포스트 토글 노드 리스트
            const $postToggles = $('#link-post-wrap .toggle-box').children();
            // 연관 포스트 목록(검색창, 목록 포함)
            const $linkUl = document.getElementById('link-container');

            // detail 페이지 초기화 - 연관 포스트 목록 보여주기
            showLinklist(linkURL, postNo);

            // 연관 포스트 편집모드 열기
            $postToggles[1].onclick = setLinkEditMod;
            // 연관 포스트 편집모드 닫기
            $postToggles[2].onclick = setLinkEditMod;

            // 연관 포스트 목록 관련 이벤트
            $('#link-container').on({
                click: function (e) {
                    e.preventDefault();
                    // console.log(e.target);

                    // 연관포스트 등록(저장)
                    if (e.target.matches('.link-reg-btn')) {
                        makeLinkPostNo(postNo);
                    }
                    // 삭제 버튼 클릭  > 삭제 요청
                    else if (e.target.matches('.link-remove-btn')) {
                        sendLinkDelete(e, postNo);
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
                        const keyword = e.target.value;

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

            // 연관 포스트 토글 온오프 관련 랜더링
            function setLinkEditMod() {
                console.log("토글 클릭, setLinkEditMod start");
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
            /* ------------------ // end 연관 포스트 -------------------------- */

            const star = '${p.starRate}'
            drawStarsAtList();

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


            // 포스트 수정, 삭제, 목록 버튼 이벤트
            $('.post-btn-wrap').click(function (e) {
                clickPostBtn(e.target, postNo)
            })


            // 리모컨 이벤트
            $('#move-scroll-btn').click(function () {
                // 현재 선택된 select box
                let selectOption = $("#select-remote-option option:selected").val();
                location.href = selectOption;
            })

            $(function () {
                $('#remote-controller').draggable({
                    'cancel': '#go-to-controller, #go-down-list',
                    containment: 'body',
                    scroll: false
                });
            });
        });
        // end jQuery
    </script>


</body>

</html>