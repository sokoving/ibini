<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/static-head.jsp" %>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

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
                            <div id="img-arr-wrap">
                                <button type="button" data-role="none" class="slick-prev slick-arrow"
                                    aria-label="Previous" role="button">
                                    <i class="fas fa-angle-up"></i>
                                </button>

                                <!-- 슬릭 이미지 목록 -->
                                <div class="img-box-wrap">

                                    <c:if test="${imgList != null}">
                                        <c:forEach var="img" items="${imgList}">
                                            <c:choose>
                                                <c:when test="${img.thumbnail}">
                                                    <div class="img-box post-thumb">
                                                        <img class="post-img" src="/loadFile?fileName=${img.fileName}"
                                                            alt="포스트 표지" title="${img.originalFileName}">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="img-box">
                                                        <img class="post-img" src="/loadFile?fileName=${img.fileName}"
                                                            alt="포스트 첨부 이미지" title="${img.originalFileName}">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:if>

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
                                <span class="top-span">${p.genreName}</span>
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
                            <div id="link-post-wrap">
                                <div class="h3-wrap">
                                    <h3>연관 포스트</h3>

                                    <!-- 등록할 포스트 검색하는 영역 -->
                                    <div class="search-wrap hide">
                                        <label class="form-label">
                                            <input class="form-control" id="linkTitle" list="titleOptionList"
                                                placeholder="제목 검색">
                                        </label>
                                        <!-- 검색 포스트 영역 -->
                                        <datalist id="titleOptionList">
                                            <option data-link-post-no="30" value="화산귀환 1권"> 네이버시리즈 | 비가
                                        </datalist>
                                        <i id="search-plus" class="far fa-plus-square" title="포스트 추가하기"></i>
                                    </div> <!-- // end search wrap -->


                                    <div class="toggle-box">
                                        <i class="fas fa-lock i-lock-close" title="편집모드 잠김"></i>
                                        <i class="fas fa-toggle-off i-toggle-off" title="편집모드 열기"></i>
                                        <i class="fas fa-toggle-on i-toggle-on hide" title="편집모드 닫기"></i>
                                        <i class="fas fa-lock-open i-lock-close fff" title="편집모드 열림"></i>
                                    </div>
                                </div>

                                <div>
                                    <!-- 연관 포스트 목록 영역 -->
                                    <ul id="link-container">
                                        <li>
                                            <a class="link-a" href="#">
                                                <div class="link-ca">웹소설</div>

                                                <div class="link-post-info">
                                                    <div class="link-title">신기방기 뿡뿡방기 제목이 어디까지 어디까지 늘어나는 거에요?</div>
                                                    <div class="link-writer">윤정한 | <span>카카오페이지</span> <span>월, 금
                                                            10시</span>
                                                    </div>
                                                </div>

                                                <div class="link-post-date">
                                                    <span class="link-percent">100%</span>
                                                    <span class="link-date">2022.05.05</span>
                                                </div>
                                                <i data-del-post-no="98"
                                                    class="fas fa-times-circle link-remove-btn hide"></i>
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
                                // showGenreList();
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
                                addTag = '';


                            } else {
                                alert('새로운 해시태그 저장을 실패하였습니다.');
                            }
                        })



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


            /* ------------------ 연관 포스트 -------------------------- */
            // 요청 URL
            const linkURL = '/post/api/links';
            // 연관 포스트 목록 보여주기
            showLinklist(linkURL, postNo);

            // 연관 포스트 편집모드 열기 이벤트
            const $postToggles = $('#link-post-wrap .toggle-box').children();
            $postToggles[1].onclick = e => {
                // 토글 아이콘 변경, 검색창, 삭제 버튼 띄우기
                setLinkEditMod();


            }


            // 연관 포스트 편집모드 닫기
            $postToggles[2].onclick = setLinkEditMod;


            // 연관 포스트 등록 요청 보내기
            $('#search-plus').click(function () {
                console.log(postNo);

                let linkPostNo = -1;
                // input 입력값을 -> data-link-post-no 값으로 바꾸기
                const inputValue = $('#linkTitle').val();
                console.log(inputValue);
                const $options = $('datalist[id=titleOptionList]').children()
                for (let i = 0; i < $options.length; i++) {
                    if (inputValue === $options[i].value) {
                        linkPostNo = $options[i].dataset.linkPostNo
                        console.log(linkPostNo);
                        break;
                    }
                }
                if (linkPostNo === -1) {
                    alert("검색 포스트가 없습니다.");
                    return;
                }
            });


            // 연관 포스트 목록 클릭 이벤트
            $('#link-container').click(function (e) {
                e.preventDefault();
                // 삭제버튼이 아닌 데 눌렀을 경우
                const rootPostNo = e.target.parentElement.parentElement.lastElementChild;

                // 연관 포스트 삭제 요청 보내기
                if (e.target.matches('.link-remove-btn')) {
                    const rootPostNo = e.target.dataset.delPostNo;
                    console.log("root post no : " + postNo);
                    console.log("link post no : " + rootPostNo);
                } else if (rootPostNo.matches('.link-remove-btn')) {
                    location.href = '/post/detail/' + rootPostNo.dataset.delPostNo;
                }

            });


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