<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookSearch</title>
    <link rel="stylesheet" href="/css/findTitle.css">

    <%@ include file="../include/static-head.jsp" %>
    <script type ="text/javascript" src="/js/apikey.js"></script>
</head>

<body>
    <%@ include file="../include/change-header.jsp" %>

    <div id="wrap">

        <div id="content-wrap">
            <h1>검색해서 책 등록하기</h1>
            <h2>책 제목을 검색해서 원하는 책을 찾아보세요!</h2>
            <br>
            <div id="search">
                <!-- keyup event -->
                <input id="word" type="text" onkeyup="search(this);">

                <button type="button" id="searchBtn">검색</button>
            </div>

            <div class="api">
                <div id="infoListMakeDom">
                    <!-- dom생성할 위치 -->

                </div>

            </div>

            <!-- 조회수 버튼 -->
            <div id="moreInfo">
                <!-- 조회수 연괸 버튼 -->
            </div>

        </div>

    </div>



    <!-- js -->
    <script>
        // 페이지이이이ㅣ이이ㅣ

        const $word = document.getElementById('word');
        let pageNo = 1;

        const loadObject = {};
        const APP_KEY = config.apikey;

        function loadSearchData(url) {
            // 비동기 GET 요청 Header
            fetch(url)
                .then((response) => response.json())
                .then((data) => {
                    makeSearchDom(data);

                }); //fetch end
        }

        $word.onkeyup = ({
            target
        }) => {
            const keyCode = APP_KEY;
            var word = target.value;
            // var encodeWord = encodeURI(word);
            // console.log(word);
            // console.log(encodeWord);



            // 비동기 GET
            loadObject.url = "https://www.nl.go.kr/seoji/SearchApi.do?" +
                "cert_key=" + keyCode +
                "&result_style=json&page_no=" + pageNo + "&page_size=20" +
                "&title=" + word;

            loadObject.saveFrontUrl = "https://www.nl.go.kr/seoji/SearchApi.do?" +
                "cert_key=" + keyCode +
                "&result_style=json&page_no="
            loadObject.saveEndUrl = "&page_size=20&title=" + word;
            // console.log(pageNo);
            // console.log('loadObj:', loadObject);
            // console.log('url : ', url);

            loadSearchData(loadObject.url);



        };

        // dom 생성하는 함수
        function makeSearchDom(data) {

            // console.log(data);
            let docs = data.docs;
            let searchTotal = data.TOTAL_COUNT;
            let pageNo = data.PAGE_NO;
            console.log('searchTotal:', searchTotal);
            // console.log('pageNo: ', pageNo);
            // console.log('docs : ', docs);


            const infoListMakeDom = document.querySelector('#infoListMakeDom');

            // 잡아서 배열에 저장하기?
            let tag = '';
            for (let i in docs) {

                // 작가 이름 자르기 ====================================================

                let author = docs[i].AUTHOR;

                // DB에 넘어가는거 
                let publisher = docs[i].PUBLISHER;
                let title = docs[i].TITLE;
                let authorSplit = '';

                // 자르는 용도 변수
                let publisherSplit = '';
                let titleSplit = '';
                let authorSplitLength = '';

                // console.log(title)

                // 이상한 기호 [] 자르기
                if (title.includes('[연재]')) {
                    // console.log('연재')
                    // 이상하게 넘어가는거 잘라주기
                    title = title.split('[연재]').join("");
                }

                // 제목 [] 교체하기
                if (title.includes('[')){
                    title = title.replace('[','(')
                    // console.log('교체')
                }
                if (title.includes(']')){
                    title = title.replace(']',')')
                    // console.log('교체2')
                }

                // [] 교체하기
                if (title.includes('[') || title.includes(']')){
                    title = title.replace(/[[]]/g ,'');
                }


                // 제목 자르기
                if (title.length >= 25) {
                    titleSplit = title.substr(0, 25).concat("..");
                } else {
                    titleSplit = title;
                }

                // 작가 [] 기호 자르기
                if (author.includes('[')){
                    author = author.replace('[','(')
                }
                if (title.includes(']')){
                    author = author.replace('[',')')
                }


                // 작가 이름 자르기 -> 넘길때 authorSplit으로 넘기기
                if (author.includes('저자 : ')) {
                    authorSplit = author.split('저자 : ').join("");
                } else if (author.includes('저자: ')) {
                    authorSplit = author.split('저자: ').join("");
                } else if (author.includes('지은이:')) {
                    authorSplit = author.split('지은이:').join("");
                } else if (author.includes('지은이: ')) {
                    authorSplit = author.split('지은이: ').join("");
                } else if (author.includes('지음')) {
                    authorSplit = author.split('지음').join("");
                } else {
                    //변수 바꿔 담기
                    authorSplit = author;
                }

                // 작가 이름 길이 자르기
                if (authorSplit.length >= 9) {
                    authorSplitLength = author.substr(0, 9).concat("..");
                } else {
                    // 변수 바꿔담기
                    authorSplitLength = authorSplit;
                }

                // 출판사
                if (publisher.includes('[')){
                    publisher = publisher.replace('[','(')
                }
                if (title.includes(']')){
                    publisher = publisher.replace(']',')')
                }

                // 출판사 이름 자르기 
                if (publisher.length >= 10) {
                    publisherSplit = publisher.substr(0, 9).concat("..");
                } else {
                    // 변수 바꿔담기
                    publisherSplit = publisher;
                }


                // 돔 생성 ==============================================================
                tag += `
                <div class="bookInfo">
                    <div class="titleDiv">
                        <input class="hiddenTitle" type="hidden" value="` + title + `">
                        <span class="title">` + titleSplit + `</span>
                    </div>
                    <div class="authorDiv">
                        <input type="hidden" value="` + authorSplit + `">
                        <span class="author">` + authorSplitLength + `</span>
                    </div>
                    <div class="publisherDiv">
                        <input type="hidden" value="` + publisher + `">
                        <span class="publisher">` + publisherSplit + `</span>
                    </div>
                    <div class="publishPredateDiv">
                        <span class="publishPredate">` + docs[i].PUBLISH_PREDATE + `</span>
                    </div>
                </div>
                `;

            }
            infoListMakeDom.innerHTML = tag;

            const moreInfo = document.querySelector('#moreInfo');

            // 검색결과 찾기 ========================================================

            let btntag = ``;

            if (searchTotal == 0) {
                moreInfo.innerHTML = '';
                btntag = `
                    <div class="noResult" onclick="location.href='/post/write'">
                        <span>검색 결과가 없습니다 여기를 클릭해서 새로운 포스트를 등록해보세요!</span>
                    </div>`

            } else if (searchTotal >= 21) {
                moreInfo.innerHTML = '';
                btntag = `
                    <div id="PageBox">
                        <button type="button" id="beforeBtn">이전</button>
                        <button type="button" id="moreBtn">더보기</button>
                    </div>

                `;
                
            } else if (+searchTotal === 20){
                moreInfo.innerHTML = ``;
                btntag = `
                    <div class="noResult">
                        <span>마지막 검색결과 입니다.</span>
                    </div>
                `;

            }

            moreInfo.innerHTML = btntag;

            // 생성 후에 이벤트 -> 기존에 dom 아래에 넣어주기
            const $PageBox = document.querySelector('#PageBox');
            // const $more = document.querySelector('#moreBtn');
            // const $beforeBtn = document.querySelector('#beforeBtn');
            if ($PageBox !== null) {
                // console.log('더보기 클릭');
                const {
                    saveFrontUrl,
                    saveEndUrl
                } = loadObject;

                console.log('pageNo :', pageNo);

                let end = Math.ceil(+searchTotal / 20);
                console.log('end', end);

                $PageBox.addEventListener('click', function (e){
                    // console.log(e.target);
                    let where = e.target;
                    if (where.matches('#moreBtn')){
                        if (+pageNo >= end) {
                            e.preventDefault();
                            alert('마지막 페이지입니다.')
                        } else if (+pageNo <= end){
                            let changepageNo = +pageNo + 1;
                            let moreUrl = saveFrontUrl + changepageNo + saveEndUrl;
                            // console.log('changepageNo : ', changepageNo);
                            // console.log('saveFrontUrl + pageNo + saveEndUrl : ', saveFrontUrl + pageNo + saveEndUrl);
                            loadSearchData(moreUrl);
                            window.scrollTo(0,0);
                        }


                    } else if (where.matches('#beforeBtn')){
                        if (+pageNo <= 1) {
                            e.preventDefault();
                            alert('첫 페이지입니다.');

                        } else if (+pageNo >= 1) {

                            let savePageNo = +pageNo - 1;
                            let before = saveFrontUrl + savePageNo + saveEndUrl;
                            // console.log('before')
                            loadSearchData(before);
                            window.scrollTo(0,0);


                        }
                    }
                })



            }

        }

        const infoListMakeDom = document.getElementById('infoListMakeDom');


        infoListMakeDom.onclick = e => {

            let target = e.target

            if (target.matches('.titleDiv')) {

                // form에 넘길거
                let titleDiv = target.firstElementChild.value;
                let authorDiv = target.parentElement.firstChild.nextElementSibling.nextElementSibling
                    .firstElementChild.value;

                console.log('titleDiv : ', titleDiv);
                console.log('authorDiv : ', authorDiv);

                if (confirm(' [ ' + authorDiv + ' ] 작가님의 [ ' + titleDiv + ' ] 작품을 선택하셨나요?')) {
                    // 맞으면 /Post/write 전송 보내기
                    // /post/write/title/author -> /post/write
                    // 1. moda에 location href로 보내려고 했는데 모달이 작동 안함?
                    // console.log(titleDiv, authorDiv);

                    popup(titleDiv, authorDiv);

                }


            } else if (target.matches('.title')) {
                // title - span / author - span from에 넘기는 값
                let spanTitle = target.previousElementSibling.value;
                let spanAuthor = target.parentElement.parentElement.firstChild.nextElementSibling.nextElementSibling
                    .firstElementChild.value;
                // console.log('spanTitle : ', spanTitle);
                // console.log('spanAuthor : ', spanAuthor);

                if (confirm(' [ ' + spanAuthor + ' ] 작가의 [ ' + spanTitle + ' ] 작품을 선택하셨나요?')) {
                    // 맞으면 /Post/write 전송 보내기
                    popup(spanTitle, spanAuthor);
                }

            }


        }

        // /post/write 넘어가는 함수
        function popup(titleDiv, authorDiv) {

            var url = "/post/write?title=" + titleDiv + "&author=" + authorDiv;
            console.log(url);
            // 이동
            location.href=url;
            // window.open(url, '', 'top=100, left=100');

        }
    </script>




</body>

</html>