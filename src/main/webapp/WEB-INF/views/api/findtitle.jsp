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

        #search {
            background: rgb(229, 173, 173);
        }

        #infoList{
            background: rgb(171, 217, 209);
            display: flex;
            flex-wrap: wrap;
            
        }
        #infoList #infoID{
            width: 100%;
            justify-content: space-evenly;
        }
        #infoList .title{
            width: 50%;
            margin: 30px;
        }
        #infoList .author{
            width: 50%;
        }



    </style>

    <%@ include file="../include/static-head.jsp" %>

</head>

<body>

    <div class="wrap">
        <h1>hi</h1>
        <div id="search">
            <input id="word" type="text" onkeyup="search(this);">
            <!-- keyup event -->
            <button type="button" id="searchBtn">검색</button>
        </div>
        <div class="api">
            <br>
            <div id="infoList">
                <c:forEach var="infoMap" items="${info}" >
                    <div id="infoID">
                        <span class="test">${infoMap.num}</span>
                        <span class="title">${infoMap.title}</span>
                        <span class="author">${infoMap.author}</span>
                    </div>
                    
                </c:forEach>
                <ul id="List"></ul>
            </div>
        </div>

        <div id="moreInfo">
            <button type="button" id="moreBtn" onclick ="location.href ='#'">더보기</button>
        </div>

        <script>

        function search(target) {


            var word = target.value;
            var encodeWord = encodeURI(word);
            console.log(word);
            console.log(encodeWord);

            // 비동기 GET
            let url = "https://www.nl.go.kr/seoji/SearchApi.do?" +
                "cert_key=4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5" +
                "&result_style=json&page_no=1&page_size=30" +
                "&title=" + word;

            console.log('url : ', url);

            // 비동기 GET 요철 Header
            fetch(url)
                .then((response) => response.json())
                .then((data) =>{
                    console.log(data);
                    let docs = data.docs;
                    let searchTotal = data.TOTAL_COUNT;
                    console.log('searchTotal:', searchTotal);
                    console.log('docs : ', docs);

                    // docs 안에 있는 거 잡기
                    let title = docs.TITLE;
                    let author = docs.AUTHOR;
                    let publisher = docs.PUBLISHER;
                    console.log("t - a - p : ", title);


                }); // then end
                // 1. 전체길이

                // 2. 페이지번호
                // 3. 작가
                // 4. 제목
                // 5. 출판사



        }
    




        </script>

    </div>



</body>

</html>