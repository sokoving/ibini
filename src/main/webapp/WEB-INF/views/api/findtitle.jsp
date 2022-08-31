<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>apiTest</title>
    <style>

        #content-wrap #search {
            background: rgb(229, 173, 173);
            height: 50px;
        }

        #content-wrap #search #word{
            height: 50px;
            padding: 10px;
            margin-right: 10%;
            width: 40%;
        }
        #content-wrap #search #searchBtn{
            background-color: cornsilk;
            height: 40px;
            width: 100px;
        }


        #content-wrap #infoListMakeDom{
            background: rgb(247 247 247);
            display: flex;
            flex-wrap: wrap;
            
        }
        #content-wrap #infoListMakeDom .bookInfo{
            width: 100%;
            justify-content: space-evenly;
            margin: 10px;
            display: flex;
            /*border: 1px solid #000000;*/
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            line-height: 2.7;
            box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 2px 0px;

        }



        /* dom css */
        #content-wrap #infoListMakeDom .titleDiv{
            width: 45%;
            padding-left: 25px;
        }
        #content-wrap #infoListMakeDom .authorDiv{
            width: 20%;
        }
        #content-wrap #infoListMakeDom .publisherDiv{
            width: 20%;
        }
        #content-wrap #infoListMakeDom .publishPredateDiv{
            width: 15%;
        }



    </style>

    <%@ include file="../include/static-head.jsp" %>

</head>

<body>

    <div id="wrap">

        <%@ include file="../include/header.jsp" %>
    
        <div id="content-wrap">
            <h1>검색해서 책 등록하기</h1>
            <br>
            <div id="search">
                <input id="word" type="text" onkeyup="search(this);">
                <!-- keyup event -->
                <button type="button" id="searchBtn">검색</button>
            </div>

            <div class="api">
                <div id="infoListMakeDom">
                    <!-- dom생성할 위치 -->
                    
                </div>
                
            </div>

            <div id="moreInfo">
                <!-- 전체 조회수 초과할 경우 -->
            </div>
        </div>
        
    </div>



    <!-- js -->
    <script>

        

        function search(target) {


            var word = target.value;
            var encodeWord = encodeURI(word);
            console.log(word);
            // console.log(encodeWord);

            // 비동기 GET
            let url = "https://www.nl.go.kr/seoji/SearchApi.do?" +
                "cert_key=4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5" +
                "&result_style=json&page_no=1&page_size=30" +
                "&title=" + word;

            // console.log('url : ', url);

            // 비동기 GET 요철 Header
            fetch(url)
                .then((response) => response.json())
                .then((data) =>{ 
                    makeSearchDom(data);

                });

                // 1. 전체길이
                // 2. 페이지번호
                // 3. 작가
                // 4. 제목
                // 5. 출판사

        }

        // dom 생성하는 함수
        function makeSearchDom(data){

            // console.log(data);
            let docs = data.docs;
            let searchTotal = data.TOTAL_COUNT;
            let pageNo = data.PAGE_NO;
            console.log('searchTotal:', searchTotal);
            // console.log('docs : ', docs);

            const infoListMakeDom = document.querySelector('#infoListMakeDom');
        
            // 잡아서 배열에 저장하기?
            let tag = '';
            for(let i in docs){

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
                
                // 제목 자르기
                if(title.length >= 25){
                    titleSplit = title.substr(0, 25).concat("..");
                } else {
                    titleSplit = title;
                }


                // 작가 이름 자르기 -> 넘길때 authorSplit으로 넘기기
                if(author.includes('저자 : ')){
                    authorSplit = author.split('저자 : ').join("");
                } else if(author.includes('저자: ')){
                    authorSplit = author.split('저자: ').join("");
                } else if(author.includes('지은이:')){
                    authorSplit = author.split('지은이:').join("");
                } else if(author.includes('지은이: ')){
                    authorSplit = author.split('지은이: ').join("");
                } else if(author.includes('지음')){
                    authorSplit = author.split('지음').join("");
                } else {
                    //변수 바꿔 담기
                    authorSplit = author;
                }

                // 작가 이름 길이 자르기
                if(authorSplit.length >= 9){
                    authorSplitLength = author.substr(0, 9).concat("..");
                } else {
                    // 변수 바꿔담기
                    authorSplitLength = authorSplit;
                }


                // 출판사 이름 자르기 
                if(publisher.length >= 10){
                    publisherSplit = publisher.substr(0, 9).concat("..");
                } else {
                    publisherSplit = publisher;
                }


                // 돔 생성 ==============================================================
                tag += `
                <div class="bookInfo">
                    <div class="titleDiv">
                        <input class="hiddenTitle" type="hidden" value="`+ title +`">
                        <span class="title">`+ titleSplit +`</span>
                    </div>
                    <div class="authorDiv">
                        <input type="hidden" value="`+ authorSplit +`">
                        <span class="author">`+ authorSplitLength +`</span>
                    </div>
                    <div class="publisherDiv">
                        <input type="hidden" value="`+ publisher +`">
                        <span class="publisher">` + publisherSplit +`</span>
                    </div>
                    <div class="publishPredateDiv">
                        <span class="publishPredate">` + docs[i].PUBLISH_PREDATE +`</span>
                    </div>
                </div>
                `;
                
            }
            infoListMakeDom.innerHTML = tag;

            const moreInfo = document.querySelector('#moreInfo');

            let btntag = ``;
            if(searchTotal == 0 ){
                moreInfo.innerHTML = '';
                btntag = `<span>검색 결과가 없습니다</span>`

            } else if(searchTotal >= 30){
                moreInfo.innerHTML = '';
                btntag = `<button type="button" id="moreBtn" onclick ="location.href ='#'">더보기</button>`;
            }
             
            moreInfo.innerHTML = btntag;

        }

        const infoListMakeDom = document.getElementById('infoListMakeDom');
        

        infoListMakeDom.onclick = e =>{

            let target = e.target

            if(target.matches('.titleDiv')){
                
                // form에 넘길거
                let titleDiv = target.firstElementChild.value;
                let authorDiv = target.parentElement.firstChild.nextElementSibling.nextElementSibling.firstElementChild.value;
                
                console.log('titleDiv : ', titleDiv);
                console.log('authorDiv : ', authorDiv);

                if(confirm( authorDiv + ' 작가의 ' + titleDiv + '작품을 선택하셨나요?')){
                    // 맞으면 전송 보내기
                    
                }


            } else if(target.matches('.title')){
                // title - span / author - span from에 넘기는 값
                let spanTitle = target.previousElementSibling.value;
                let spanAuthor = target.parentElement.parentElement.firstChild.nextElementSibling.nextElementSibling.innerText;
                console.log('spanTitle : ', spanTitle);
                console.log('spanAuthor : ', spanAuthor);

                if(confirm( spanAuthor + ' 작가의 ' + spanTitle + '작품을 선택하셨나요?')){
                    // 맞으면 전송 보내기

                }
                
            }
            

        }


    </script>




</body>

</html>